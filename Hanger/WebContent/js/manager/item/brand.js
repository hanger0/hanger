$(function(){
	var f = document.brandForm;

	$("input:text[name=brandName]").keyup(function(key){
		// �귣�� �̸� üũ
		var inputBrand = trim(f.brandName.value);
		$.ajax({
			type: "POST", 
			url: "/searchBrand.hang",
			dataType: "text",
			data: "inputBrand=" + inputBrand, 
			success: function(text){
				var brandResult = text;
				$('#brandList').html(brandResult);
			}
		});
	});
});

function addBrand(){
	var f = document.brandForm;
	
	if(f.brandName.value == "")
	{
		window.alert("�귣����� �ݵ�� �Է��ؾ� �մϴ�.");
		f.brandName.focus();
		return false;
	}
		
	f.submit();
}