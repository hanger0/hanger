function WriteReview() {
	var f = document.reviewForm;
	
	if(f.title.value == ""){
		alert("������ �ݵ�� �Է��ؾ� �մϴ�.");
		f.title.focus();
		return false;
	}
	
	f.content.value = $('.summernote').code();
	
	f.submit();
	alert("��ϵǾ����ϴ�.");
}
