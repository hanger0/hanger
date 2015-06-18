package com.hanger.posting.review.controller;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hanger.common.controller.BaseController;
import com.hanger.item.dao.ItemListForReviewDao;
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
	
	public void setReviewShowDao(ReviewShowDao reviewShowDao){
		this.reviewShowDao = reviewShowDao;
	}
	
	public void setItemListForReviewDao(ItemListForReviewDao itemListForReviewDao) {
		this.itemListForReviewDao = itemListForReviewDao;
	}

	@RequestMapping(value = "/reviewWriteResult.hang", method = RequestMethod.POST)
	public String ReviewWriteForm(HttpServletRequest request,
			HttpSession session) throws IOException {

		System.out.println("reviewWriteResult.hang...");

		File dayFile = new File(
				"C:/workspace/hanger/Hanger/WebContent/upfile/posting/review/main");
		if (!dayFile.exists()) {
			dayFile.mkdirs();
		}
		String savePath = "upfile/posting/review/main";
		int sizeLimit = 1000 * 1024 * 1024;
		MultipartRequest mul = new MultipartRequest(
				request,
				"C:/workspace/hanger/Hanger/WebContent/upfile/posting/review/main",
				sizeLimit, "KSC5601", new DefaultFileRenamePolicy());

		ReviewVo review = new ReviewVo();

		String userCode = (String) session.getAttribute("myUserCode");
		String itemGroupCode = mul.getParameter("itemGroupCode");
		String reviewScore = mul.getParameter("reviewScore");
		String reviewTitle = mul.getParameter("reviewTitle");
		String reviewContent = mul.getParameter("reviewContent");
		String reviewMainPicPath = savePath;
		String reviewMainPicOrgName = mul.getOriginalFileName("reviewMainPic");
		String reviewMainPicSaveName = mul.getFilesystemName("reviewMainPic");
		String regId = (String)session.getAttribute("myUserId");
		String regIp = request.getRemoteAddr();
		String updId = (String)session.getAttribute("myUserId");
		String updIp = request.getRemoteAddr();
		int reviewMainPicSize = (int)dayFile.length();

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

		//��ϿϷ�
		
		//reviewShow�� �Ѿ�� ���� ��� �ۼ��� �� �ҷ���
		Object ok = (Object)reviewWriteDao.insertReview(review);
		if (ok==null) {
			ArrayList itemListForReview = (ArrayList)itemListForReviewDao.getItemListForReview(userCode);
			session.setAttribute("itemListForReview", itemListForReview);			
		}
		
		//��ü ���� ������ ���� �ҷ��ͼ� ���
		Double itemScoreAvg = reviewWriteDao.selectReviewScoreAvg(itemGroupCode);
		itemScoreAvg = Double.parseDouble(String.format("%.10f", itemScoreAvg));
		//����� ��������� ������Ʈ
		HashMap<String, Object> scoreMap = new HashMap<String, Object>();
		scoreMap.put("itemScoreAvg", itemScoreAvg);
		scoreMap.put("itemGroupCode", itemGroupCode);
		reviewWriteDao.updateItemScore(scoreMap);
		
		//��� �ۼ��� ���� ȭ������ �Ѿ��
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("myUserCode", userCode);
		map.put("itemGroupCode", itemGroupCode);
		
		List<ReviewShowVo> reviewList = reviewShowDao.getReviewNowShow(map);
		ReviewShowVo reviewShow = reviewList.get(0);
		
		int maxPrice = reviewShow.getItemSellPrice();
		int minPrice = reviewShow.getItemSellPrice();
		int price = 0;
		
		for(int i = 0; i < reviewList.size(); i++){
			reviewShow = reviewList.get(i);
			price = reviewShow.getItemSellPrice();
			if(maxPrice < price){
				maxPrice = price;
			}
			if(minPrice > price){
				minPrice = price;
			}
		}
		
		reviewShow.setItemMaxPrice(maxPrice);
		reviewShow.setItemMinPrice(minPrice);
		
		request.setAttribute("review", reviewShow);
		request.setAttribute("mainUrl", root + "posting/review/ReviewShow.jsp");
		
		return moveUrl;
	}
}
