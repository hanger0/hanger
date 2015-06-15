var InputReviewMainPic = (function loadImageFile() {
   if (window.FileReader) {
      var ImagePre;
      var ImgReader = new window.FileReader();
      var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;

      ImgReader.onload = function(Event) {
         if (!ImagePre) {
            var newPreview = document.getElementById("reviewMainPicPreview");
            ImagePre = new Image();
            newPreview.appendChild(ImagePre);
         }
         ImagePre.src = Event.target.result;
      };

      return function() {

         var img = document.getElementById("reviewMainPic").files;

         if (!fileType.test(img[0].type)) {
            alert("���ϵ�Ͻ���");
            return;
         }
         ImgReader.readAsDataURL(img[0]);
      }
   }
   document.getElementById("reviewMainPicPreview").src = document
         .getElementById("reviewMainPic").value;
})();

function WriteReview() {
	var f = document.reviewForm;
	
	if(f.title.value == ""){
		alert("������ �Է����ּ���.");
		f.title.focus();
		return false;
	}
	
	f.content.value = $('.summernote').code();
	
	f.submit();
	alert("���䰡 ��ϵǾ����ϴ�.");
}

function drawStar(){
	var reviewScore = document.reviewForm.reviewScore.value;
	var fullStarNum = parseInt(reviewScore / 2);
	var halfStarNum = 0;
	var emptyStarNum = 5 - fullStarNum;
	if(reviewScore % 2 != 0){ //odd
		halfStarNum = 1;
		emptyStarNum--;
	}

	$("#starForm").children().eq(1).remove();
	$("#starForm").children().eq(1).remove();
	$("#starForm").children().eq(1).remove();
	$("#starForm").children().eq(1).remove();
	$("#starForm").children().eq(1).remove();
	$("#starForm").children().eq(1).remove();
	
	for(var i = 0; i < fullStarNum; i++){
		$("#starForm").append("<img src='/images/icons/star/star.png' style='width:20px; height:20px; margin-left:2px; margin-bottom:5px'/>");
	}
	for(var i = 0; i < halfStarNum; i++){
		$("#starForm").append("<img src='/images/icons/star/star-half.png' style='width:20px; height:20px; margin-left:2px; margin-bottom:5px'/>");
	}
	for(var i = 0; i < emptyStarNum; i++){
		$("#starForm").append("<img src='/images/icons/star/star-empty.png' style='width:20px; height:20px; margin-left:2px; margin-bottom:5px'/>");
	}
	
}



