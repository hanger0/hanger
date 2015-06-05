<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="java.util.*"%>

<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" />

<%
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
<script src="/js/manager/item/managerItem.js" type="text/javascript"></script>

<head>
<title>Manager Add Item</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
						<select class="text" name="brand" id="brand" size="1">
							<option value="0" selected="1">�귣�弱��</option>
							<option value="B0001">HERA</option>
							<option value="B0002">MAC</option>
							<option value="B0003">DIOR</option>
							<option value="B0004">CHANEL</option>
							<option value="B0005">IOPE</option>
							<option value="B0006">MISHA</option>
						</select>
						
						<INPUT class="button" type="button" value="�귣�� ���"
						style="cursor: pointer" onclick="searchBrand()"> 
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
						<label for="marketPrice">���尡:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="marketPrice" maxlength="20">
					</dd>
					��
				</dl>

				<dl>
					<dt>
						<label for="sellPrice">�ǸŰ�:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="sellPrice" maxlength="20">
					</dd>
					��
				</dl>

				<dl>
					<dt>
						<label for="purchasePrice">���԰�:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="purchasePrice"
							maxlength="20">
					</dd>
					��
				</dl>
				
				<dl>
					<dt>
						<label for="manufactureDate">��������:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="manufactureDate"
							maxlength="8">
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="expireDate">��ȿ�Ⱓ:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="expireDate"
							maxlength="20">
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="releaseDate">�߸�����:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="releaseDate"
							maxlength="8">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="summary">�����Ѽ���(���λ�����������):</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="summary" maxlength="500">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="sellMaxNum">�ִ��ǸŰ��ɰ���:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="sellMaxNum" maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="option1Title">�ɼ�1����:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="option1Title" maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="option1Content">�ɼ�1����:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="option1Content"
							maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="option2Title">�ɼ�2����:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="option2Title" maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="option2Content">�ɼ�2����:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="option2Content"
							maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="option3Title">�ɼ�3����:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="option3Title" maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="option3Content">�ɼ�3����:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="option3Content"
							maxlength="20">

					</dd>
				</dl>

				<dl>
					<dt>
						<label for="category">��ǰ����</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="category" maxlength="20">
					</dd>
				</dl>
				
				<dl>
					<dt>
						<label for="feature">��ǰƯ¡</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="feature" maxlength="20">
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
