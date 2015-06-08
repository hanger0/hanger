<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>WisiList</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>
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
</script>
<div class="container">
	<CENTER>
		<span><h1>회원상세 정보</h1></span> <br> <br> <br> <br>
		<TABLE class="table table-hover table-bordered">
			<TR>
				<TD width="100" bgcolor="#CFDDFA"><B>회원번호</B></TD>
				<TD width="50">027A</TD>
			<TR>
				<TD width="85"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=ID">ID</A></B></TD>
				<TD width="85"><B>aaaa@naver.com</B></TD>
			</TR>
			<TR>
				<TD width="100"><B>회원등급</B></TD>
				<TD width="70"><B> 준회원</B></TD>
			</TR>
			<TR>
				<TD width="100"><B>전화번호</B></TD>
				<TD width="70"><B> <input type="text" value=""></B></TD>
			</TR>
			<TR>
				<TD width="100"><B>우편번호</B></TD>
				<TD width="70"><B> <input type="text" maxlength="3"></B>
					<input type="text" maxlength="3"></B> <input type="button"
					value="우편번호 찾기"></B></TD>
			</TR>
			<TR>
				<TD width="100"><B>주소</B></TD>
				<TD width="70"><B> <input type="text" value="" size="50"></B></TD>
			</TR>

			<TR>
				<TD width="100"><B>프로필사진</B></TD>

				<TD><label for="image" class="col-sm-4 control-label">Image
						: </label> <input id="image" type="file" class="input_file" name="image"
					onchange="InputImage()">
					<div id="imagePreview"></div></TD>
			</TR>
			<TR>
				<TD width="100"><B>질문</B></TD>
				<TD width="70"><B> <input type="text" value=""></B></TD>
			</TR>
			<TR>
				<TD width="100"><B>답변</B></TD>
				<TD width="70"><B> <input type="text" value=""></B></TD>
			</TR>
			<TR>
				<TD width="100"><B>Skin Type</B></TD>
				<TD width="70"><B> <input type="text" value=""></B></TD>
			</TR>
			<TR>
				<TD width="100"><B>Skin Trouble</B></TD>
				<TD><label class="checkbox-inline"> <input
						type="checkbox" name="skinProblem" value="001"> 피지
				</label> <label class="checkbox-inline"> <input type="checkbox"
						name="skinProblem" value="002"> 각질제거
				</label> <label class="checkbox-inline"> <input type="checkbox"
						name="skinProblem" value="003"> 주름개선
				</label> <label class="checkbox-inline"> <input type="checkbox"
						name="skinProblem" value="004"> 피부미백
				</label> <label class="checkbox-inline"> <input type="checkbox"
						name="skinProblem" value="005"> 피부보습
				</label> <label class="checkbox-inline"> <input type="checkbox"
						name="skinProblem" value="006"> 보습
				</label></TD>
			</TR>
		</TABLE>
		<div class="form-group">
			<button type="button" class="btn pull-right" onclick="cancelBtn()">취소</button>
			<INPUT type="button" value="수정완료" id="joinButton"
				style="cursor: pointer" class="btn pull-right" onclick="joinBtn()">
		</div>
	</CENTER>
</div>