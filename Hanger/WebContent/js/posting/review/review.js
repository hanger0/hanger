function WriteReview() {
	var f = document.reviewForm;
	
	if(f.title.value == ""){
		alert("제목을 반드시 입력해야 합니다.");
		f.title.focus();
		return false;
	}
	
	f.content.value = $('.summernote').code();
	
	f.submit();
	alert("등록되었습니다.");
}
