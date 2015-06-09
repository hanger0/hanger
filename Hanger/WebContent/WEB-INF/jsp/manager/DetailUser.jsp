<%@ page contentType="text/html; charset=EUC-KR"%>

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
					alert("�̹��� ������ ���ε� �ϼ���");
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
		<span><h1>ȸ���� ����</h1></span> <br> <br> <br> <br>
		<TABLE class="table table-hover table-bordered">
			<TR>
				<TD width="100" bgcolor="#CFDDFA"><B>ȸ����ȣ</B></TD>
				<TD width="50">027A</TD>
			<TR>
				<TD width="85"><B><A
						href="/managerUserServlet.mo?func=managerUser_001&sort=ID">ID</A></B></TD>
				<TD width="85"><B>aaaa@naver.com</B></TD>
			</TR>
			<TR>
				<TD width="100"><B>ȸ�����</B></TD>
				<TD width="70"><B> ��ȸ��</B></TD>
			</TR>
			<TR>
				<TD width="100"><B>��ȭ��ȣ</B></TD>
				<TD width="70"><B> <input type="text" value=""></B></TD>
			</TR>
			<TR>
				<TD width="100"><B>�����ȣ</B></TD>
				<TD width="70"><B> <input type="text" maxlength="3"></B>
					<input type="text" maxlength="3"></B> <input type="button"
					value="�����ȣ ã��"></B></TD>
			</TR>
			<TR>
				<TD width="100"><B>�ּ�</B></TD>
				<TD width="70"><B> <input type="text" value="" size="50"></B></TD>
			</TR>

			<TR>
				<TD width="100"><B>�����ʻ���</B></TD>

				<TD><label for="image" class="col-sm-4 control-label">Image
						: </label> <input id="image" type="file" class="input_file" name="image"
					onchange="InputImage()">
					<div id="imagePreview"></div></TD>
			</TR>
			<TR>
				<TD width="100"><B>����</B></TD>
				<TD width="70"><B> <input type="text" value=""></B></TD>
			</TR>
			<TR>
				<TD width="100"><B>�亯</B></TD>
				<TD width="70"><B> <input type="text" value=""></B></TD>
			</TR>
			<TR>
				<TD width="100"><B>Skin Type</B></TD>
				<TD width="70"><B> <input type="text" value=""></B></TD>
			</TR>
			<TR>
				<TD width="100"><B>Skin Trouble</B></TD>
				<TD><label class="checkbox-inline"> <input
						type="checkbox" name="skinProblem" value="001"> ����
				</label> <label class="checkbox-inline"> <input type="checkbox"
						name="skinProblem" value="002"> ��������
				</label> <label class="checkbox-inline"> <input type="checkbox"
						name="skinProblem" value="003"> �ָ�����
				</label> <label class="checkbox-inline"> <input type="checkbox"
						name="skinProblem" value="004"> �Ǻι̹�
				</label> <label class="checkbox-inline"> <input type="checkbox"
						name="skinProblem" value="005"> �Ǻκ���
				</label> <label class="checkbox-inline"> <input type="checkbox"
						name="skinProblem" value="006"> ����
				</label></TD>
			</TR>
		</TABLE>
		<div class="form-group">
			<button type="button" class="btn pull-right" onclick="cancelBtn()">���</button>
			<INPUT type="button" value="�����Ϸ�" id="joinButton"
				style="cursor: pointer" class="btn pull-right" onclick="joinBtn()">
		</div>
	</CENTER>
</div>