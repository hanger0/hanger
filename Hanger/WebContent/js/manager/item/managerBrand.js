$(function(){
	var f = document.brandForm;

	$("input:text[name=brandName]").keyup(function(key){
		// 브랜드 이름 체크
		var inputBrand = trim(f.brandName.value);
		$.ajax({
			type: "POST", 
			url: "/managerSearchBrand.hang",
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
		window.alert("브랜드명을 반드시 입력해야 합니다.");
		f.brandName.focus();
		return false;
	}
		
	f.submit();
}

function brandSelectAction(brandCode, brandName)
{
	opener.addItemForm.brandCode.value = brandCode;
	opener.addItemForm.brandName.value = brandName;

	window.self.close();
}