package com.hanger.posting.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

//	@RequestMapping(value = "/reviewImageUpload.hang", method = RequestMethod.POST)
//	public void ReviewImageUpload(HttpServletRequest request,
//			HttpServletResponse response, @RequestParam MultipartFile upload) {
//		OutputStream out = null;
//		PrintWriter printWriter = null;
//		response.setCharacterEncoding("EUC-KR");
//		response.setContentType("text/html;charset=utf-8");
//
//		try {
//			String fileName = upload.getOriginalFilename();
//			byte[] bytes = upload.getBytes();
//			String uploadPath = "저장경로/" + fileName; // 저장경로
//
//			out = new FileOutputStream(new File(uploadPath));
//			out.write(bytes);
//			String callback = request.getParameter("CKEditorFuncNum");
//
//			printWriter = response.getWriter();
//			String fileUrl = "저장한 URL경로/" + fileName;// url경로
//
//			printWriter
//					.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
//							+ callback
//							+ ",'"
//							+ fileUrl
//							+ "','이미지를 업로드 하였습니다.'"
//							+ ")</script>");
//			printWriter.flush();
//
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (out != null) {
//					out.close();
//				}
//				if (printWriter != null) {
//					printWriter.close();
//				}
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//
//		return;
//	}

	@RequestMapping(value = "/reviewWriteResult.hang", method = RequestMethod.POST)
	public String ReviewWriteForm(HttpServletRequest request,
			HttpSession session) throws IOException {

		System.out.println("reviewWriteResult.hang...");

		File dayFile = new File(
				"C:\\workspace\\hanger\\Hanger\\WebContent\\upfile\\posting\\review");
		if (!dayFile.exists()) {
			dayFile.mkdirs();
		}
		String savePath = "upfile/posting/review";
		int sizeLimit = 1000 * 1024 * 1024;
		MultipartRequest mul = new MultipartRequest(
				request,
				"C:\\workspace\\hanger\\Hanger\\WebContent\\upfile\\posting\\review",
				sizeLimit, "KSC5601", new DefaultFileRenamePolicy());

		ReviewVo review = new ReviewVo();

		String userCode = (String) session.getAttribute("myUserCode");
		String itemGroupCode = mul.getParameter("itemGroupCode");
		String reviewScore = mul.getParameter("reviewScore");
		String reviewTitle = mul.getParameter("reviewTitle");
		String reviewContent = "";
		String reviewMainPicPath = savePath;
		String reviewMainPicOrgName = mul.getOriginalFileName("reviewMainPic");
		String reviewMainPicSaveName = mul.getFilesystemName("reviewMainPic");
		String regId = (String)session.getAttribute("myUserId");
		String regIp = request.getRemoteAddr();
		String updId = (String)session.getAttribute("myUserId");
		String updIp = request.getRemoteAddr();
		int reviewMainPicSize = 0;

		String ip = request.getRemoteAddr();

		String[] temp = (mul.getParameter("content")).split("\"");
		// quot
		for (int i = 0; i < (temp.length - 2); i++) {
			if ((temp[i].length() >= 4)
					&& (temp[i].substring(temp[i].length() - 4).equals("src="))) {
				temp[i + 1] = savePath; // path
				reviewContent += temp[i] + "\"";
			} else if (temp[i].equals(" data-filename=")) {
				reviewContent += "/";
			} else if (temp[i].equals(savePath)) {
				reviewContent += temp[i];
			} else {
				reviewContent += temp[i] + "\"";
			}
		}

		reviewContent += temp[temp.length - 2] + "\"" + temp[temp.length - 1];

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

		//등록완료
		
		//reviewShow로 넘어가기 위해 방금 작성한 것 불러옴
		Object ok = (Object)reviewWriteDao.insertReview(review);
		if (ok==null) {
			ArrayList itemListForReview = (ArrayList)itemListForReviewDao.getItemListForReview(userCode);
			session.setAttribute("itemListForReview", itemListForReview);			
		}
		
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
