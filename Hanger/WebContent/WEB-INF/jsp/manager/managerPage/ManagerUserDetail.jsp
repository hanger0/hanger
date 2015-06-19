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
      <span><h1>ȸ���� ����</h1></span> <br>
      <div class="form-group">
         <button type="button" class="btn pull-right" onclick="cancelBtn()"><B>ȸ������</B></button>
         
      </div>
      <TABLE class="table table-hover table-bordered">
         <TR>
            <TD width="100">ȸ����ȣ</TD> 
            <TD width="50">027A</TD>
         </TR>
         <TR>
            <TD width="100">��������</TD> 
            <TD width="50">2015-05-05</TD>
         </TR>
         <TR>
            <TD width="100">�̸�</TD>
            <TD width="50">�۸���</TD>
         </TR>
         <TR>
            <TD width="85">ID</TD>
            <TD width="85">aaaa@naver.com</TD>
         </TR>
         <TR>
            <TD width="100">PASSWORD</TD>
            <TD width="70">123721739821</TD>
         </TR>
         
         <TR>
            <TD width="100">�������</TD>
            <TD width="70">1989-06-22</TD>
         </TR>
         <TR>
            <TD width="100">����</TD>
            <TD width="70">MAN</TD>
         </TR>
         <TR>
            <TD width="100">�ڵ�����ȣ</TD>
            <TD width="70"><input type="text" value=""></TD>
         </TR>
         <TR>
            <TD width="100">�����ȣ</TD>
            <TD width="70"><input type="text" maxlength="3">
               <input type="text" maxlength="3"> <input type="button"
               value="�����ȣ ã��"></TD>
         </TR>
         <TR>
            <TD width="100">�ּ�</TD>
            <TD width="70"><input type="text" value="" size="50"></TD>
         </TR>

         <TR>
            <TD width="100">�����ʻ���</TD>

            <TD><label for="image" class="col-sm-4 control-label">Image
                  : </label> <input id="image" type="file" class="input_file" name="image"
               onchange="InputImage()">
               <div id="imagePreview"></div></TD>
         </TR>
         <TR>
            <TD width="100">����</TD>
            <TD width="70"><input type="text" value=""></TD>
         </TR>
         <TR>
            <TD width="100">�亯</TD>
            <TD width="70"><input type="text" value=""></TD>
         </TR>
         <TR>
            <TD width="100">Skin Type</TD>
            <TD width="70"><input type="text" value=""></TD>
         </TR>
         <TR>
            <TD width="100">���ϸ���</TD>
            <TD width="70"><input type="text" value=""></TD>
         </TR>
         <TR>
            <TD width="100">Skin Problem</TD>
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
         <TR>
            <TD width="100">Skin Tone</TD>
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
            <Br><Br><br>
            
         <span>*����</span><a href="/">//�����ϴ¹���//<span style="align:right;">�� ����</span></a>
      </div>
      <TABLE class="table table-hover table-bordered" style = "background-color:white;width:1100px;">
         <TR bgcolor="#CFDDFA" align="center">
            <TD width="40"><B>No.</B></TD>
            <TD width="150"><B>���̵�(�̸�)</B></TD>
            <TD width="150"><B>��ǰ �̸�</A></B></TD>
            <TD width="100"><B>���Ź��</A></B></TD>
            <TD width="100"><B>����</A></B></TD>
            <TD width="100"><B>���� ���ϸ���</A></B></TD>
         </TR>

         <%
            for (int i = 0; i < 5; i++) {
         %>

         <TR align="center">
            <TD><%= i+1 %></TD>
            <TD>id + �̸�</TD>
            <TD>���ʵ� 3����Ʈ</TD>
            <TD>ī��</TD>
            <TD>39,900 ��</TD>
            <TD>500</TD>
            <%
               }
            %>
      </TABLE>
      
      <br><br><br>
      <span>*���ϸ���</span>
      
      <TABLE class="table table-hover table-bordered" style = "background-color:white;width:1100px;">
         <TR bgcolor="#CFDDFA" align="center">
            <TD width="40"><B>No.</B></TD>
            <TD width="150"><B>�� ���ϸ���</B></TD>
            <TD width="150"><B>��� ���ϸ���</A></B></TD>
            <TD width="100"><B>���� ���ϸ���</A></B></TD>
            <TD width="100"><B>������ ���ϸ���</A></B></TD>
            <TD width="100"><B>��� ��¥ </A></B></TD>
         </TR>

         <%
            for (int i = 0; i < 5; i++) {
         %>

         <TR align="center">
            <TD><%= i+1 %></TD>
            <TD>�� ���ϸ���</TD>
            <TD>��� ���ϸ���</TD>
            <TD>���� ���ϸ���</TD>
            <TD>������ ���ϸ���</TD>
            <TD>��� ��¥</TD>
            
            <%
               }
            %>
      </TABLE>
   </CENTER>
</div>