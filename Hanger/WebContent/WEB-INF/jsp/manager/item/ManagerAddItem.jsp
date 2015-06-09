<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="com.hanger.manager.item.vo.ManagerCategoryVo" %>
<%@ page import="com.hanger.manager.item.vo.ManagerFeatureVo" %>

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
	
	List<ManagerCategoryVo> category1List = (List<ManagerCategoryVo>)request.getAttribute("category1List");
	List<ManagerCategoryVo> category2List = (List<ManagerCategoryVo>)request.getAttribute("category2List");
	List<ManagerCategoryVo> category3List = (List<ManagerCategoryVo>)request.getAttribute("category3List");
	List<ManagerFeatureVo> feature1List = (List<ManagerFeatureVo>)request.getAttribute("feature1List");
	List<ManagerFeatureVo> feature2List = (List<ManagerFeatureVo>)request.getAttribute("feature2List");
%>

<html>
<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT src="/js/common/common.js"></SCRIPT>
<script src="/js/manager/item/managerItem1.js" type="text/javascript"></script>


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
						<label for="brand">�귣��:</label>
					</dt>
					<dd>
						<input class="text" name="brandName" id="brandName" size="60" onclick="searchBrand();" readonly/>
						<input type="hidden" id="brandCode" name="brandCode" value=""/>
						
						<INPUT class="button" type="button" value="�귣�� �˻�" style="cursor: pointer" onclick="searchBrand()"> 
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="name">��ǰ �̸�:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="name" maxlength="50">
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="size">�뷮:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="size" maxlength="10">
						(null�� ���, ml���� g���� ��� �������)
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="marketPrice">���尡:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="marketPrice" maxlength="20">��
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="sellPrice">�ǸŰ�:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="sellPrice" maxlength="20">��
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="purchasePrice">���԰�:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="purchasePrice"
							maxlength="20">��
					</dd>
					
				</dl>
				
				<dl>
					<dt>
						<label for="manufactureDate">��������:</label>
						(null��� ex-20150607)
					</dt>
					<dd>
						<INPUT type="hidden" name="manufactureDate" id="manufactureDate"/>
						<SELECT id="manufactureYear" name="manufactureYear">
							<option value="0000" selected="1">YEAR</option>
							<% 
								for(int i = cal.get(Calendar.YEAR); i > 1999; i--){
							%>
								<option value="<%=i%>"><%=i %>��</option>
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
										<option value="0<%=i%>"><%=i %>��</option>
							<%
									}
									else{
							%>
										<option value="<%=i%>"><%=i %>��</option>
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
										<option value="0<%=i%>"><%=i %>��</option>
							<%
									} 
									else {
							%>
										<option value="<%=i%>"><%=i %>��</option>
							<%
									}
								}
							%>
						</SELECT>
						<!-- <INPUT type="checkbox" id="manufactureCheck" onclick="manufactureDisable()"> ������ -->
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="expireDate">��ȿ����:</label>
						(null��� ex-20150607)
					</dt>
					<dd>
						
						<INPUT type="hidden" name="expireDate" id="expireDate"/>
						<SELECT id="expireYear" name="expireYear">
							<option value="0000" selected="1">YEAR</option>
							<% 
								for(int i = cal.get(Calendar.YEAR); i < 2025; i++){
							%>
								<option value="<%=i%>"><%=i %>��</option>
							<%
								}
							%>
						</SELECT>
						<SELECT id="expireMonth" name="expireMonth">
							<option value="00" selected="1">MONTH</option>
							<% 
								for(int i = 1; i < 13; i++){
									if(i < 10){
							%>
										<option value="0<%=i%>"><%=i %>��</option>
							<%
									}
									else{
							%>
										<option value="<%=i%>"><%=i %>��</option>
							<%
									}
								}
							%>
						</SELECT>
						<SELECT id="expireDay" name="expireDay">
							<option value="00" selected="1">DAY</option>
							<% 
								for(int i = 1; i < 32; i++){
									if(i < 10){
							%>
										<option value="0<%=i%>"><%=i %>��</option>
							<%
									} 
									else {
							%>
										<option value="<%=i%>"><%=i %>��</option>
							<%
									}
								}
							%>
						</SELECT>

					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="releaseDate">�߸�����:</label> (null��� ex-19920707)
					</dt>
					<dd>
					 	<INPUT type="hidden" name="releaseDate" id="releaseDate"/>
						<SELECT id="manufactureYear" name="releaseYear">
							<option value="0000" selected="1">YEAR</option>
							<% 
								for(int i = cal.get(Calendar.YEAR); i > 1979; i--){
							%>
								<option value="<%=i%>"><%=i %>��</option>
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
										<option value="0<%=i%>"><%=i %>��</option>
							<%
									}
									else{
							%>
										<option value="<%=i%>"><%=i %>��</option>
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
										<option value="0<%=i%>"><%=i %>��</option>
							<%
									} 
									else {
							%>
										<option value="<%=i%>"><%=i %>��</option>
							<%
									}
								}
							%>
						</SELECT>
						
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="summaryInfo">�����Ѽ���(null���):</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="summaryInfo">
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="detailInfo">���� ���� (null���):</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="detailInfo">
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="ingredient">���� (null���):</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="ingredient">
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="howToUse">���� (null���):</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="howToUse">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="sellMaxNum">�ִ��ǸŰ��ɰ���(default 999999):</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="sellMaxNum" maxlength="20"> ��
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="category">��ǰ����</label>
					</dt>
					<dd>
						<table border="1" width="1000">
							<tr align="center">
								<td width="150">1�� ī�װ�</td>
								<td width="200">2�� ī�װ�</td>
								<td width="600">3�� ī�װ�</td>
							</tr>
						<% 
							int rowCount = 0;
							int cate2Index = 0;
							int cate2IndexEnd = 0;
							for(int i = 0; i < category1List.size(); i++){
								for(int j = 0; j < category2List.size(); j++){
									if((category1List.get(i).getCategory1Code()).equals(category2List.get(j).getCategory1Code())){
										rowCount++;
									}
								}
								
								cate2IndexEnd += rowCount;
								
								for(int j = cate2Index; j < cate2IndexEnd; j++){
						%>
									<tr>
						<%
										if(rowCount != 0){
						%>
											<td align="center" rowspan="<%=rowCount%>"><%=category1List.get(i).getCategory1Name() %></td>
						<%
											rowCount = 0;
										}					
						%>				
										<td align="center"><%=category2List.get(j).getCategory2Name() %></td>
										<td>
						<%
											int cate3Count = 0;
											for(int k = 0; k < category3List.size(); k++){
												if((category3List.get(k).getCategory2Code()).equals(category2List.get(j).getCategory2Code())){
						%>
													<input type="checkbox" name="category" value="<%=category3List.get(k).getCategory3Code() %>">
														<%=category3List.get(k).getCategory3Name() %>
						<%							cate3Count++;
													if(cate3Count % 5 == 0){
						%>
														<br>
						<%
													}
												}
											}
						%>
										</td>
									</tr>
						<%
								}
								cate2Index = cate2IndexEnd;
						%>
						
						<%
							}
						%>
						</table>
<!-- --------------------------------------------------------------------------------------------------- 
						<SELECT id="category1ListView" name="category1ListView">
							<option value="0" selected="1">1�� ī�װ�</option>
							<% 
								for(int i = 1; i < category1List.size(); i++){
							%>
									<option value="<%= category1List.get(i).getCategory1Code()%>" >
										<%=category1List.get(i).getCategory1Name() %>
									</option>
							<%
								}
							%>
						</SELECT>
						<INPUT type="button" name="addCategoryBtn" style="cursor: pointer" onclick="addCategoryAction()"/>
-->						
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="feature">��ǰƯ¡</label>
					</dt>
					<dd>
						<table border="1">
							<tr align="center">
								<td width="50">�з�</td>
								<td	width="300">����</td>
							</tr>
						<%
							for(int i = 0; i < feature1List.size(); i++){
						%>
								<tr>
									<td align="center"><%=feature1List.get(i).getFeature1Name() %></td>
									<td>
						<%
										for(int j = 0; j < feature2List.size(); j++){
											if((feature2List.get(j).getFeature1Code()).equals(feature1List.get(i).getFeature1Code())){
						%>
												<input type="checkbox" name="feature" value="<%=feature2List.get(j).getFeature2Code() %>">
														<%=feature2List.get(j).getFeature2Name() %>
						<% 
											}
										}
						%>
									</td>
								<tr>
						<%
							}
							
						%>
						</table>
					</dd>
				</dl>
				

				<dl>
					<dt>
						<label for="stockAmount">���</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="stockAmount" maxlength="20">
					</dd>
				</dl>
			</fieldset>

			<fieldset>
				<legend>��ǰ �����̹���</legend>
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
				<legend>��ǰ ���� �̹���1</legend>
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
				<legend>��ǰ ���� �̹���2</legend>
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
				<legend>��ǰ ���� �̹���3</legend>
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
				<legend>��ǰ ���� �̹���4</legend>
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
				<legend>��ǰ ���� �̹���5</legend>
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
				<INPUT class="button" type="button" value="���"
					name="ManagerAddItemForm" style="cursor: pointer" onclick="addItemAction()"> 
				<INPUT class="button" type="button" value="���" name="cancelBtn" 
					style="cursor: pointer" name="test" onClick="home()">
			</fieldset>
			
			
		</div>
	</form>
</body>
</html>
