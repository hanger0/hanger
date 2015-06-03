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
<SCRIPT type="text/JavaScript"
	src="${pageContext.request.contextPath}/js/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT type="text/JavaScript"
	src="${pageContext.request.contextPath}/js/common.js"></SCRIPT>
<SCRIPT type="text/JavaScript"
	src="${pageContext.request.contextPath}/js/join.js"></SCRIPT>

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

<script type="text/javascript">

	var InputImage = (function loadImageFile() {
		if (window.FileReader) {
			var ImagePre;
			var ImgReader = new window.FileReader();
			var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;

			ImgReader.onload = function(Event) {
				if (!ImagePre) {
					var newPreview = document.getElementById("imagePreview");
					ImagePre = new Image();
					ImagePre.style.width = "150px";
					ImagePre.style.height = "180px";
					newPreview.appendChild(ImagePre);
				}
				ImagePre.src = Event.target.result;

			};

			return function() {

				var img = document.getElementById("image").files;

				if (!fileType.test(img[0].type)) {
					alert("이미지 파일을 업로드 하세요");
					return;
				}
				ImgReader.readAsDataURL(img[0]);
			}
		}
		document.getElementById("imagePreview").src = document
				.getElementById("image").value;
	})();

	function addItemAction()
	{
		var f = document.addItemForm;
		if(f.name.value == "")
		{
			window.alert("상품명을 반드시 입력해야 합니다.");
			f.name.focus();
			return false;
		}
		
		f.submit();
	}

	function home() {
		alert("${pageContext.request.contextPath}");
	}
	
	function searchBrand()
	{
		window.open("/brand.hang", "브랜드 등록", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=420, height=500");
	}
</SCRIPT>
</head>

<body>
	<form id="addItemForm" name="addItemForm" action="/addItemResult.hang"
		method="post" enctype="multipart/form-data">
		<div id="container">
			<fieldset>
				<legend>Item Info</legend>
				<dl>
					<dt>
						<label for="brand">브랜드:</label>
					</dt>
					<dd>
						<select class="text" name="brand" id="brand" size="1">
							<option value="0" selected="1">브랜드선택</option>
							<option value="B0001">HERA</option>
							<option value="B0002">MAC</option>
							<option value="B0003">DIOR</option>
							<option value="B0004">CHANEL</option>
							<option value="B0005">IOPE</option>
							<option value="B0006">MISHA</option>
						</select>
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
						<label for="marketPrice">시장가:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="marketPrice" maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="sellPrice">판매가:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="sellPrice" maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="purchasePrice">매입가:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="purchasePrice"
							maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="summary">간단한설명(메인사진옆에붙을):</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="summary" maxlength="500">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="sellMaxNum">최대판매가능개수:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="sellMaxNum" maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="option1Title">옵션1제목:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="option1Title" maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="option1Content">옵션1내용:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="option1Content"
							maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="option2Title">옵션2제목:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="option2Title" maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="option2Content">옵션2내용:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="option2Content"
							maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="option3Title">옵션3제목:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="option3Title" maxlength="20">
					</dd>
				</dl>

				<dl>
					<dt>
						<label for="option3Content">옵션3내용:</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="option3Content"
							maxlength="20">

					</dd>
				</dl>

				<dl>
					<dt>
						<label for="kind">상품종류</label>
					</dt>
					<dd>
						<INPUT class="text" type="text" name="kind" maxlength="20">
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
				<legend>UpLoad File</legend>
				<dl>
					<dt>
						<label for="test">Uploaded Image:</label>
					</dt>
					<dd>
						<input class="button" id="image" name="image" type="file"
							onchange="InputImage()">
						<div id="imagePreview"></div>
					</dd>
				</dl>
			</fieldset>

			<fieldset class="action">
				<INPUT class="button" type="button" value="등록"
					name="ManagerAddItemForm" style="cursor: pointer" onclick="addItemAction()"> 
				<INPUT class="button" type="button" value="취소" name="cancelBtn" 
					style="cursor: pointer" name="test" onClick="home()">
			</fieldset>
			
			<fieldset class="action">
				<INPUT class="button" type="button" value="브랜드 등록"
					style="cursor: pointer" onclick="searchBrand()"> 
			</fieldset>
		</div>
	</form>
</body>
</html>
