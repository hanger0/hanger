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
      <span><h1>회원상세 정보</h1></span> <br>
      <div class="form-group">
         <button type="button" class="btn pull-right" onclick="cancelBtn()"><B>회원삭제</B></button>
         
      </div>
      <TABLE class="table table-hover table-bordered">
         <TR>
            <TD width="100">회원번호</TD> 
            <TD width="50">027A</TD>
         </TR>
         <TR>
            <TD width="100">가입일자</TD> 
            <TD width="50">2015-05-05</TD>
         </TR>
         <TR>
            <TD width="100">이름</TD>
            <TD width="50">멍멍이</TD>
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
            <TD width="100">생년월일</TD>
            <TD width="70">1989-06-22</TD>
         </TR>
         <TR>
            <TD width="100">성별</TD>
            <TD width="70">MAN</TD>
         </TR>
         <TR>
            <TD width="100">핸드폰번호</TD>
            <TD width="70"><input type="text" value=""></TD>
         </TR>
         <TR>
            <TD width="100">우편번호</TD>
            <TD width="70"><input type="text" maxlength="3">
               <input type="text" maxlength="3"> <input type="button"
               value="우편번호 찾기"></TD>
         </TR>
         <TR>
            <TD width="100">주소</TD>
            <TD width="70"><input type="text" value="" size="50"></TD>
         </TR>

         <TR>
            <TD width="100">프로필사진</TD>

            <TD><label for="image" class="col-sm-4 control-label">Image
                  : </label> <input id="image" type="file" class="input_file" name="image"
               onchange="InputImage()">
               <div id="imagePreview"></div></TD>
         </TR>
         <TR>
            <TD width="100">질문</TD>
            <TD width="70"><input type="text" value=""></TD>
         </TR>
         <TR>
            <TD width="100">답변</TD>
            <TD width="70"><input type="text" value=""></TD>
         </TR>
         <TR>
            <TD width="100">Skin Type</TD>
            <TD width="70"><input type="text" value=""></TD>
         </TR>
         <TR>
            <TD width="100">마일리지</TD>
            <TD width="70"><input type="text" value=""></TD>
         </TR>
         <TR>
            <TD width="100">Skin Problem</TD>
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
         <TR>
            <TD width="100">Skin Tone</TD>
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
            <Br><Br><br>
            
         <span>*오더</span><a href="/">//띄어쓰기하는법좀//<span style="align:right;">더 보기</span></a>
      </div>
      <TABLE class="table table-hover table-bordered" style = "background-color:white;width:1100px;">
         <TR bgcolor="#CFDDFA" align="center">
            <TD width="40"><B>No.</B></TD>
            <TD width="150"><B>아이디(이름)</B></TD>
            <TD width="150"><B>상품 이름</A></B></TD>
            <TD width="100"><B>구매방법</A></B></TD>
            <TD width="100"><B>가격</A></B></TD>
            <TD width="100"><B>적용 마일리지</A></B></TD>
         </TR>

         <%
            for (int i = 0; i < 5; i++) {
         %>

         <TR align="center">
            <TD><%= i+1 %></TD>
            <TD>id + 이름</TD>
            <TD>잭필드 3종세트</TD>
            <TD>카드</TD>
            <TD>39,900 원</TD>
            <TD>500</TD>
            <%
               }
            %>
      </TABLE>
      
      <br><br><br>
      <span>*마일리지</span>
      
      <TABLE class="table table-hover table-bordered" style = "background-color:white;width:1100px;">
         <TR bgcolor="#CFDDFA" align="center">
            <TD width="40"><B>No.</B></TD>
            <TD width="150"><B>총 마일리지</B></TD>
            <TD width="150"><B>사용 마일리지</A></B></TD>
            <TD width="100"><B>남은 마일리지</A></B></TD>
            <TD width="100"><B>적립된 마일리지</A></B></TD>
            <TD width="100"><B>사용 날짜 </A></B></TD>
         </TR>

         <%
            for (int i = 0; i < 5; i++) {
         %>

         <TR align="center">
            <TD><%= i+1 %></TD>
            <TD>총 마일리지</TD>
            <TD>사용 마일리지</TD>
            <TD>남은 마일리지</TD>
            <TD>적립된 마일리지</TD>
            <TD>사용 날짜</TD>
            
            <%
               }
            %>
      </TABLE>
   </CENTER>
</div>