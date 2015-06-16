var InputMainPic = (function loadImageFile() {
   if (window.FileReader) {
      var ImagePre;
      var ImgReader = new window.FileReader();
      var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;

      ImgReader.onload = function(Event) {
         if (!ImagePre) {
            var newPreview = document.getElementById("mainPicPreview");
            ImagePre = new Image();
            ImagePre.style.width = "150px";
            ImagePre.style.height = "180px";
            newPreview.appendChild(ImagePre);
         }
         ImagePre.src = Event.target.result;

      };

      return function() {

         var img = document.getElementById("mainPic").files;

         if (!fileType.test(img[0].type)) {
            alert("이미지 파일을 업로드 하세요");
            return;
         }
         ImgReader.readAsDataURL(img[0]);
      }
   }
   document.getElementById("mainPicPreview").src = document.getElementById("mainPic").value;
})();

function home() {
   alert("${pageContext.request.contextPath}");
}

function searchBrand() {
   window.open(
            "/managerBrand.hang",
            "브랜드 등록",
            "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=420, height=500");
}

//function manufactureDisable(){
//   alert("dddd");
//   var f = document.addItemForm;
//   
//   if(f.manufactureCheck.checked == true){
//      //체크 안되어있다가 체크함
//      f.manufactureYear.disabled = true;
//      f.manufactureMonth.disabled = true;
//      f.manufactureDay.disabled = true;
//   }
//   else{
//      f.manufactureYear.disabled = false;
//      f.manufactureMonth.disabled = false;
//      f.manufactureDay.disabled = false;
//   }
//}

$(function(){
   var f = document.addItemForm;
   var sizeCnt = f.sizeCnt.value;
   var today = new Date();
   var year = today.getYear() + 1900;
   

   $("#sizeAddBtn").click(function(){
      
      $("#sizeForm").append("<input type='text' style = 'width:215px;height:21px;margin-right:10px;' id='size"+sizeCnt+"' name='size"+sizeCnt+"'>");
      $("#marketPriceForm").append("<input type='text' style = 'width:215px;height:21px;margin-right:10px;' id='marketPrice"+sizeCnt+"' name='marketPrice"+sizeCnt+"'>");
      $("#sellPriceForm").append("<input type='text' style = 'width:215px;height:21px;margin-right:10px;' id='sellPrice"+sizeCnt+"' name='sellPrice"+sizeCnt+"'>");
      $("#purchasePriceForm").append("<input type='text' style = 'width:215px;height:21px;margin-right:10px;' id='purchasePrice"+sizeCnt+"' name='purchasePrice"+sizeCnt+"'>");
      $("#sellMaxNumForm").append("<input type='text' style = 'width:215px;height:21px;margin-right:10px;' id='sellMaxNum"+sizeCnt+"' name='sellMaxNum"+sizeCnt+"'>");
      $("#stockAmountForm").append("<input type='text' style = 'width:215px;height:21px;margin-right:10px;' id='stockAmount"+sizeCnt+"' name='stockAmount"+sizeCnt+"'>");
      
      ////////////////////////////////////////////////Manufacture
      $("#manufactureDateForm").append("<SELECT style = 'margin-right:4px' id='manufactureYear"+ sizeCnt +"' name='manufactureYear"+ sizeCnt + "'>");
      $("#manufactureYear"+ sizeCnt).append("<option value='0000' selected='1'>YEAR</option>");
      for(var i = year; i > 2000; i--){
         $("#manufactureYear"+ sizeCnt +"").append("<option value='"+ i +"'>"+ i +"년</option>");
      }
      $("#manufactureDateForm").append("</SELECT>");
      $("#manufactureDateForm").append("<SELECT style = 'margin-right:4px' id='manufactureMonth"+ sizeCnt +"' name='manufactureMonth"+ sizeCnt + "'>");
      $("#manufactureMonth"+ sizeCnt).append("<option value='00' selected='1'>MONTH</option>");
      for(var i = 1; i < 13; i++){
         if(i < 10){
            $("#manufactureMonth"+ sizeCnt).append("<option value='0"+ i +"'>"+ i +"월</option>");
         }else{
            $("#manufactureMonth"+ sizeCnt).append("<option value='"+ i +"'>"+ i +"월</option>");
         }
      }
      $("#manufactureDateForm").append("</SELECT>");
      $("#manufactureDateForm").append("<SELECT style = 'margin-right:10px' id='manufactureDay"+ sizeCnt +"' name='manufactureDay"+ sizeCnt + "'>");
      $("#manufactureDay"+ sizeCnt).append("<option value='00' selected='1'>DAY</option>");
      for(var i = 1; i < 32; i++){
         if(i < 10){
            $("#manufactureDay"+ sizeCnt).append("<option value='0"+ i +"'>"+ i +"일</option>");
         }
         else{
            $("#manufactureDay"+ sizeCnt).append("<option value='"+ i +"'>"+ i +"일</option>");
         }
      }   
      $("#manufactureDateForm").append("</SELECT>");
      
      ///////////////////////////////////////////////////////////////Expire
      $("#expireDateForm").append("<SELECT style = 'margin-right:4px' id='expireYear"+ sizeCnt +"' name='expireYear"+ sizeCnt + "'>");
      $("#expireYear"+ sizeCnt).append("<option value='0000' selected='1'>YEAR</option>");
      for(var i = year; i < 2025; i++){
         $("#expireYear"+ sizeCnt).append("<option value='"+ i +"'>"+ i +"년</option>");
      }
      $("#expireDateForm").append("</SELECT>");
      $("#expireDateForm").append("<SELECT style = 'margin-right:4px' id='expireMonth"+ sizeCnt +"' name='expireMonth"+ sizeCnt + "'>");
      $("#expireMonth"+ sizeCnt).append("<option value='00' selected='1'>MONTH</option>");
      for(var i = 1; i < 13; i++){
         if(i < 10){
            $("#expireMonth"+ sizeCnt).append("<option value='0"+ i +"'>"+ i +"월</option>");
         }else{
            $("#expireMonth"+ sizeCnt).append("<option value='"+ i +"'>"+ i +"월</option>");
         }
      }
      $("#expireDateForm").append("</SELECT>");
      $("#expireDateForm").append("<SELECT style = 'margin-right:10px' id='expireDay"+ sizeCnt +"' name='expireDay"+ sizeCnt + "'>");
      $("#expireDay"+ sizeCnt).append("<option value='00' selected='1'>DAY</option>");
      for(var i = 1; i < 32; i++){
         if(i < 10){
            $("#expireDay"+ sizeCnt).append("<option value='0"+ i +"'>"+ i +"일</option>");
         }
         else{
            $("#expireDay"+ sizeCnt).append("<option value='"+ i +"'>"+ i +"일</option>");
         }
      }   
      $("#expireDateForm").append("</SELECT>");
      
      sizeCnt++;
      f.sizeCnt.value = sizeCnt;
      return false;
   });
   
   $("#sizeDeleteBtn").click(function(){
      if(sizeCnt > 1){
         sizeCnt--;
         $("#sizeForm").children().eq(sizeCnt).remove();
         $("#marketPriceForm").children().eq(sizeCnt).remove();
         $("#sellPriceForm").children().eq(sizeCnt).remove();
         $("#purchasePriceForm").children().eq(sizeCnt).remove();
         $("#sellMaxNumForm").children().eq(sizeCnt).remove();
         $("#stockAmountForm").children().eq(sizeCnt).remove();
         $("#manufactureDateForm").children().eq(3*sizeCnt).remove();
         $("#manufactureDateForm").children().eq(3*sizeCnt).remove();
         $("#manufactureDateForm").children().eq(3*sizeCnt).remove();
         $("#expireDateForm").children().eq(3*sizeCnt).remove();
         $("#expireDateForm").children().eq(3*sizeCnt).remove();
         $("#expireDateForm").children().eq(3*sizeCnt).remove();
         
      } else {
         alert("적어도 하나의 필드는 존재해야 합니다.");
      }
      f.sizeCnt.value = sizeCnt;
      return false;
   });
});

function addItemAction() {
   var f = document.addItemForm;
   var d = document;
//   f.manufactureDate.value = f.manufactureYear.value + f.manufactureMonth.value + f.manufactureDay.value;
//   f.releaseDate.value = f.releaseYear.value + f.releaseMonth.value + f.releaseDay.value;
//   f.expireDate.value = f.expireYear.value + f.expireMonth.value + f.expireDay.value;
   
   f.totalInfo.value = $('.summernote').code();
   
   if (f.brandCode.value == ""){
      window.alert("브랜드를 반드시 선택해야 합니다.");
      return false;
   }
   
   if (f.name.value == "") {
      window.alert("상품명을 반드시 입력해야 합니다.");
      f.name.focus();
      return false;
   }
   
   for(var i = 0; i < f.sizeCnt.value; i++){
      if (d.getElementsByName("marketPrice"+i)[0].value == ""){
         window.alert("시장가를 반드시 입력해야 합니다.");
         d.getElementsByName("marketPrice"+i)[0].focus();
         return false;
      }
      
      if ((d.getElementsByName("marketPrice"+i)[0].value * 0) != 0){
         window.alert("시장가는 숫자만 입력 가능합니다.");
         d.getElementsByName("marketPrice"+i)[0].focus();
         d.getElementsByName("marketPrice"+i)[0].select();
         return false;
      }
   }
   
   for(var i = 0; i < f.sizeCnt.value; i++){
      if (d.getElementsByName("sellPrice"+i)[0].value == "") {
         window.alert("판매가를 반드시 입력해야 합니다.");
         d.getElementsByName("sellPrice"+i)[0].focus();
         return false;
      }
      if ((d.getElementsByName("sellPrice"+i)[0].value * 0) != 0){
         window.alert("판매가는 숫자만 입력 가능합니다.");
         d.getElementsByName("sellPrice"+i)[0].focus();
         d.getElementsByName("sellPrice"+i)[0].select();
         return false;
      }
   }
   
   for(var i = 0; i < f.sizeCnt.value; i++){
      if (d.getElementsByName("purchasePrice"+i)[0].value == "") {
         window.alert("매입가를 반드시 입력해야 합니다.");
         d.getElementsByName("purchasePrice"+i)[0].focus();
         return false;
      }
      
      if ((d.getElementsByName("purchasePrice"+i)[0].value * 0) != 0){
         window.alert("매입가는 숫자만 입력 가능합니다.");
         d.getElementsByName("purchasePrice"+i)[0].focus();
         d.getElementsByName("purchasePrice"+i)[0].select();
         return false;
      }
   }
      
   for(var i = 0; i < f.sizeCnt.value; i++){
      if ((d.getElementsByName("sellMaxNum"+i)[0].value * 0) != 0){
         window.alert("최대판매가능개수는 숫자만 입력 가능합니다.");
         d.getElementsByName("sellMaxNum"+i)[0].focus();
         d.getElementsByName("sellMaxNum"+i)[0].select();
         return false;
      }
   }
   
   window.alert("상품이 정상적으로 등록되었습니다");

   f.submit();
}
