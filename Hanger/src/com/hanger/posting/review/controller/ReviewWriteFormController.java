package com.hanger.posting.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hanger.common.controller.BaseController;
import com.hanger.item.dao.ItemListForReviewDao;
import com.hanger.item.vo.ItemListForReviewVo;
import com.hanger.posting.review.dao.ReviewShowDao;
import com.hanger.posting.review.dao.ReviewWriteDao;
import com.hanger.posting.review.vo.ReviewShowVo;
import com.hanger.posting.review.vo.ReviewVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class ReviewWriteFormController extends BaseController {
	private ReviewWriteDao reviewWriteDao;
	private ReviewShowDao reviewShowDao;
	private ItemListForReviewDao itemListForReviewDao;

	public void setReviewWriteDao(ReviewWriteDao reviewWriteDao) {
		this.reviewWriteDao = reviewWriteDao;
	}

	public void setReviewShowDao(ReviewShowDao reviewShowDao) {
		this.reviewShowDao = reviewShowDao;
	}

	public void setItemListForReviewDao(
			ItemListForReviewDao itemListForReviewDao) {
		this.itemListForReviewDao = itemListForReviewDao;
	}

	@RequestMapping(value = "/reviewWriteResult.hang", method = RequestMethod.POST)
	public String ReviewWriteForm(HttpServletRequest req)
			throws IOException {
		//
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("loginYn") == null
				|| ((String) session.getAttribute("loginYn")).equals("N")) {
			req.setAttribute("message", "로그인 후 이용해 주세요.");
			req.setAttribute("mainUrl", mainUrl);
			return moveUrl;
		}

		File dayFile = new File(
				"C:/workspace/hanger/Hanger/WebContent/upfile/posting/review/main");
		if (!dayFile.exists()) {
			dayFile.mkdirs();
		}
		String savePath = "upfile/posting/review/main";
		int sizeLimit = 1000 * 1024 * 1024;
		MultipartRequest mul = new MultipartRequest(
				req,
				"C:/workspace/hanger/Hanger/WebContent/upfile/posting/review/main",
				sizeLimit, "KSC5601", new DefaultFileRenamePolicy());

		ReviewVo review = new ReviewVo();

		// 중복 작성 방지
		ArrayList<ItemListForReviewVo> itemListForReview = (ArrayList<ItemListForReviewVo>) session.getAttribute("itemListForReview");
		String itemGroupCode = mul.getParameter("itemGroupCode");
		int dup = 0;

		if (itemListForReview.size() == 0) {
			req.setAttribute("message", "리뷰는 구매한 상품에 한해서 한번만 작성이 가능합니다.");
			dup = 1;
		} else {
			for (int i = 0; i < itemListForReview.size(); i++) {
				if (!(itemListForReview.get(i).getItemGroupCode())
						.equals(itemGroupCode)) {
					req.setAttribute("message",
							"리뷰는 구매한 상품에 한해서 한번만 작성이 가능합니다.");
					dup = 1;
				}
			}
		}

		// 이미 썼던 상품이였는지 아닌지
		if (dup == 0) {
			System.out.println("reviewWriteResult.hang...");

			Enumeration formNames = mul.getFileNames();
			String fileFormName = (String) formNames.nextElement();
			String userCode = (String) session.getAttribute("myUserCode");
			String reviewScore = mul.getParameter("reviewScore");
			String reviewTitle = mul.getParameter("reviewTitle");
			String reviewContent = mul.getParameter("reviewContent");
			String reviewMainPicPath = savePath;
			String reviewMainPicOrgName = mul.getOriginalFileName(fileFormName);
			String reviewMainPicSaveName = mul.getFilesystemName(fileFormName);
			int reviewMainPicSize = 150430; // default이미지값 size
			if (reviewMainPicSaveName == null || reviewMainPicOrgName == null) {
				reviewMainPicOrgName = "review_main_deault.jpg";
				reviewMainPicSaveName = "review_main_deault.jpg";
			} else {
				reviewMainPicSize = (int) mul.getFile(fileFormName).length();
			}

			String regId = (String) session.getAttribute("myUserId");
			String regIp = req.getRemoteAddr();
			String updId = (String) session.getAttribute("myUserId");
			String updIp = req.getRemoteAddr();
			// int reviewMainPicSize = (int)dayFile.length();

			review.setUserCode(userCode);
			review.setItemGroupCode(itemGroupCode);
			review.setReviewScore(reviewScore);
			review.setReviewTitle(reviewTitle);
			review.setReviewContent(reviewContent);
			review.setReviewMainPicPath(reviewMainPicPath);
			review.setReviewMainPicOrgName(reviewMainPicOrgName);
			review.setReviewMainPicSaveName(reviewMainPicSaveName);
			review.setReviewMainPicSize(reviewMainPicSize);
			review.setRegId(regId);
			review.setRegIp(regIp);
			review.setUpdId(updId);
			review.setUpdIp(updIp);

			// 등록완료

			Object ok = (Object) reviewWriteDao.insertReview(review);
			if (ok == null) {
				itemListForReview = (ArrayList) itemListForReviewDao
						.getItemListForReview(userCode);
				session.setAttribute("itemListForReview", itemListForReview);
			}

			// 전체 리뷰 아이템 점수 불러와서 계산
			Double itemScoreAvg = reviewWriteDao
					.selectReviewScoreAvg(itemGroupCode);
			itemScoreAvg = Double.parseDouble(String.format("%.10f",
					itemScoreAvg));
			// 계산한 평균점수를 업데이트
			HashMap<String, Object> scoreMap = new HashMap<String, Object>();
			scoreMap.put("itemScoreAvg", itemScoreAvg);
			scoreMap.put("itemGroupCode", itemGroupCode);
			reviewWriteDao.updateItemScore(scoreMap);

			// 방금 작성한 리뷰 화면으로 넘어가기
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("myUserCode", userCode);
			map.put("itemGroupCode", itemGroupCode);

			List<ReviewShowVo> reviewList = reviewShowDao.getReviewNowShow(map);
			ReviewShowVo reviewShow = reviewList.get(0);

			int maxPrice = reviewShow.getItemSellPrice();
			int minPrice = reviewShow.getItemSellPrice();
			int price = 0;

			for (int i = 0; i < reviewList.size(); i++) {
				reviewShow = reviewList.get(i);
				price = reviewShow.getItemSellPrice();
				if (maxPrice < price) {
					maxPrice = price;
				}
				if (minPrice > price) {
					minPrice = price;
				}
			}

			req.setAttribute("maxPrice", maxPrice);
			req.setAttribute("minPrice", minPrice);
			
			req.setAttribute("reviewList", reviewList);
			req.setAttribute("mainUrl", root
					+ "posting/review/ReviewShow.jsp");

		} else if (dup == 1) {
			// 썼던 상품이면 index로 보내버림
			req.setAttribute("mainUrl", mainUrl);
		}

		return moveUrl;

	}
}