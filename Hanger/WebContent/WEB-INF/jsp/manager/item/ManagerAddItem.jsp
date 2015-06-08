<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Calendar"%>

<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" />

<%
	Calendar cal = Calendar.getInstance();

	if (inputTable != null && inputTable.size() != 0) {
		ArrayList uploadFileList = (ArrayList) inputTable
				.get("uploadFile");
		Hashtable uploadTable = (Hashtable) uploadFileList.get(0);
		String path = (String) uploadTable.get("savePath");
		//System.out.println(path);	
	}
%>

<html>
<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT src="/js/common/common.js"></SCRIPT>
<script src="/js/manager/item/managerItems.js" type="text/javascript"></script>


<head>
<title>Manager Add Item</title>

<link rel="stylesheet" type="text/css" media="all"
	href="/css/niceforms-default.css">
<STYLE>
.button {
	background: #167ac6;
	border-bottom: transparent 1px solid;
	border-bottom-color: #167ac6;
	border-left: transparent 1px solid;
	border-left-color: #167ac6;
	border-right: transparent 1px solid;
	border-right-color: #167ac6;
	border-top: transparent 1px solid;
	border-top-color: #167ac6;
	box-shadow: 1px 1px 2px #333;
	color: #fff;
	cursor: pointer;
	display: inline-block;
	font-family: arial, sans-serif;
	font-size: 11px;
	font-weight: bold;
	height: 20px;
	line-height: normal;
	margin: 0px;
	outline-color: invert;
	outline-style: none;
	outline-width: 0px;
	padding-bottom: 0px;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 0px;
	text-align: left;
	text-decoration: none;
	vertical-align: middle;
	white-space: nowrap;
}

.text {
	background: white;
	border-bottom: transparent 1px solid;
	border-bottom-color: #167ac6;
	border-left: transparent 1px solid;
	border-left-color: #167ac6;
	border-right: transparent 1px solid;
	border-right-color: #167ac6;
	border-top: transparent 1px solid;
	border-top-color: #167ac6;
	color: #167ac6;
	display: inline-block;
	font-family: arial, sans-serif;
	font-size: 11px;
	font-weight: bold;
	height: 20px;
	line-height: normal;
	margin: 0px;
	padding-bottom: 0px;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 0px;
	text-align: left;
	text-decoration: none;
	vertical-align: middle;
	white-space: nowrap;
}
</STYLE>

</head>

<body>
	<form id="addItemForm" name="addItemForm" action="/managerAddItemResult.hang"
		method="post" enctype="multipart/form-data">
		<div id="container">
			<fieldset>
				<legend>Item Info</legend>
				<dl>
					<dt>
						<label for="brand">브랜드:</label>
					</dt>
					<dd>
						<input class="text" name="brandName" id="brandName" size="60" onclick="searchBrand();" readonly/>
						<input type="hidden" id="brandCode" name="brandCode" value=""/>
						
						<INPUT class="button" type="button" value="브랜드 검색" style="cursor: pointer" onclick="searchBrand()"> 
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="name">상품 이름:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="name" maxlength="50">
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="size">용량:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="size" maxlength="10">
						(null값 허용, ml인지 g인지 등등 적어야함)
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="marketPrice">시장가:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="marketPrice" maxlength="20">원
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="sellPrice">판매가:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="sellPrice" maxlength="20">원
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="purchasePrice">매입가:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="purchasePrice"
							maxlength="20">원
					</dd>
					
				</dl>
				
				<dl>
					<dt>
						<label for="manufactureDate">제조일자:</label>
						(null허용 ex-20150607)
					</dt>
					<dd>
						<INPUT type="hidden" name="manufactureDate" id="manufactureDate"/>
						<SELECT id="manufactureYear" name="manufactureYear">
							<option value="0000" selected="1">YEAR</option>
							<% 
								for(int i = cal.get(Calendar.YEAR); i > 1949; i--){
							%>
								<option value="<%=i%>"><%=i %>년</option>
							<%
								}
							%>
						</SELECT>
						<SELECT id="manufactureMonth" name="manufactureMonth">
							<option value="00" selected="1">MONTH</option>
							<% 
								for(int i = 1; i < 13; i++){
									if(i < 10){
							%>
										<option value="0<%=i%>"><%=i %>월</option>
							<%
									}
									else{
							%>
										<option value="<%=i%>"><%=i %>월</option>
							<%
									}
								}
							%>
						</SELECT>
						<SELECT id="manufactureDay" name="manufactureDay">
							<option value="00" selected="1">DAY</option>
							<% 
								for(int i = 1; i < 32; i++){
									if(i < 10){
							%>
										<option value="0<%=i%>"><%=i %>일</option>
							<%
									} 
									else {
							%>
										<option value="<%=i%>"><%=i %>일</option>
							<%
									}
								}
							%>
						</SELECT>
						
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="expireDate">유효기간:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="expireDate"
							maxlength="20"> 
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="releaseDate">발매일자:</label> (null허용 ex-19920707)
					</dt>
					<dd>
						<INPUT type="hidden" name="releaseDate" id="releaseDate"/>
						<SELECT id="releaseYear" name="releaseYear">
							<option value="0000" selected="1">YEAR</option>
							<% 
								for(int i = cal.get(Calendar.YEAR); i > 1949; i--){
							%>
								<option value="<%=i%>"><%=i %>년</option>
							<%
								}
							%>
						</SELECT>
						<SELECT id="releaseMonth" name="releaseMonth">
							<option value="0" selected="1">MONTH</option>
							<% 
								for(int i = 1; i < 13; i++){
									if(i < 10){
							%>
										<option value="0<%=i%>"><%=i %>월</option>
							<%
									}
									else{
							%>
										<option value="<%=i%>"><%=i %>월</option>
							<%
									}
								}
							%>
						</SELECT>
						<SELECT id="releaseDay" name="releaseDay">
							<option value="0" selected="1">DAY</option>
							<% 
								for(int i = 1; i < 32; i++){
									if(i < 10){
							%>
										<option value="0<%=i%>"><%=i %>일</option>
							<%
									} 
									else {
							%>
										<option value="<%=i%>"><%=i %>일</option>
							<%
									}
								}
							%>
						</SELECT>
						
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="summaryInfo">간단한설명(null허용):</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="summaryInfo">
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="detailInfo">상세한 설명 (null허용):</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="detailInfo">
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="ingredient">성분 (null허용):</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="ingredient">
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="howToUse">사용법 (null허용):</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="howToUse">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="sellMaxNum">최대판매가능개수(default 999999):</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="sellMaxNum" maxlength="20"> 개
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="category">상품종류</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="category" maxlength="20">
						(슬래시 / 로 구분. ITEM_CATEGORY TABLE에 따로 들어감)
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="feature">상품특징</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="feature" maxlength="20">
						(슬래시 / 로 구분)
					</dd>
				</dl>
				

				<dl>
					<dt>
						<label for="stockAmount">재고</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="stockAmount" maxlength="20">
					</dd>
				</dl>
			</fieldset>

			<fieldset>
				<legend>상품 메인이미지</legend>
				<dl>
					<dt>
						<label for="test">Uploaded Image:</label>
					</dt>
					<dd>
						<input class="button" id="mainPic" name="mainPic" type="file"
							onchange="InputMainPic()">
						<div id="mainPicPreview"></div>
					</dd>
				</dl>
			</fieldset>
			
			<fieldset>
				<legend>상품 설명 이미지1</legend>
				<dl>
					<dt>
						<label for="test">Uploaded Image:</label>
					</dt>
					<dd>
						<input class="button" id="detailPic1" name="detailPic1" type="file"
							onchange="InputDetailPic1()">
						<div id="detailPic1Preview"></div>
					</dd>
				</dl>
			</fieldset>
			
			<fieldset>
				<legend>상품 설명 이미지2</legend>
				<dl>
					<dt>
						<label for="test">Uploaded Image:</label>
					</dt>
					<dd>
						<input class="button" id="detailPic2" name="detailPic2" type="file"
							onchange="InputDetailPic2()">
						<div id="detailPic2Preview"></div>
					</dd>
				</dl>
			</fieldset>
			
			<fieldset>
				<legend>상품 설명 이미지3</legend>
				<dl>
					<dt>
						<label for="test">Uploaded Image:</label>
					</dt>
					<dd>
						<input class="button" id="detailPic3" name="detailPic3" type="file"
							onchange="InputDetailPic3()">
						<div id="detailPic3Preview"></div>
					</dd>
				</dl>
			</fieldset>
			
			<fieldset>
				<legend>상품 설명 이미지4</legend>
				<dl>
					<dt>
						<label for="test">Uploaded Image:</label>
					</dt>
					<dd>
						<input class="button" id="detailPic4" name="detailPic4" type="file"
							onchange="InputDetailPic4()">
						<div id="detailPic4Preview"></div>
					</dd>
				</dl>
			</fieldset>
			
			<fieldset>
				<legend>상품 설명 이미지5</legend>
				<dl>
					<dt>
						<label for="test">Uploaded Image:</label>
					</dt>
					<dd>
						<input class="button" id="detailPic5" name="detailPic5" type="file"
							onchange="InputDetailPic5()">
						<div id="detailPic5Preview"></div>
					</dd>
				</dl>
			</fieldset>

			<fieldset class="action">
				<INPUT class="button" type="button" value="등록"
					name="ManagerAddItemForm" style="cursor: pointer" onclick="addItemAction()"> 
				<INPUT class="button" type="button" value="취소" name="cancelBtn" 
					style="cursor: pointer" name="test" onClick="home()">
			</fieldset>
			
			
		</div>
	</form>
</body>
</html>
