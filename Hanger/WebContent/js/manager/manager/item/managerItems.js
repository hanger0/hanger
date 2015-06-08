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
	document.getElementById("mainPicPreview").src = document
			.getElementById("mainPic").value;
})();

var InputDetailPic1 = (function loadImageFile() {
	if (window.FileReader) {
		var ImagePre;
		var ImgReader = new window.FileReader();
		var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;

		ImgReader.onload = function(Event) {
			if (!ImagePre) {
				var newPreview = document.getElementById("detailPic1Preview");
				ImagePre = new Image();
				ImagePre.style.width = "150px";
				ImagePre.style.height = "180px";
				newPreview.appendChild(ImagePre);
			}
			ImagePre.src = Event.target.result;

		};

		return function() {

			var img = document.getElementById("detailPic1").files;

			if (!fileType.test(img[0].type)) {
				alert("이미지 파일을 업로드 하세요");
				return;
			}
			ImgReader.readAsDataURL(img[0]);
		}
	}
	document.getElementById("detailPic1Preview").src = document
			.getElementById("detailPic1").value;
})();

var InputDetailPic2 = (function loadImageFile() {
	if (window.FileReader) {
		var ImagePre;
		var ImgReader = new window.FileReader();
		var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;

		ImgReader.onload = function(Event) {
			if (!ImagePre) {
				var newPreview = document.getElementById("detailPic2Preview");
				ImagePre = new Image();
				ImagePre.style.width = "150px";
				ImagePre.style.height = "180px";
				newPreview.appendChild(ImagePre);
			}
			ImagePre.src = Event.target.result;

		};

		return function() {

			var img = document.getElementById("detailPic2").files;

			if (!fileType.test(img[0].type)) {
				alert("이미지 파일을 업로드 하세요");
				return;
			}
			ImgReader.readAsDataURL(img[0]);
		}
	}
	document.getElementById("detailPic2Preview").src = document
			.getElementById("detailPic2").value;
})();

var InputDetailPic3 = (function loadImageFile() {
	if (window.FileReader) {
		var ImagePre;
		var ImgReader = new window.FileReader();
		var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;

		ImgReader.onload = function(Event) {
			if (!ImagePre) {
				var newPreview = document.getElementById("detailPic3Preview");
				ImagePre = new Image();
				ImagePre.style.width = "150px";
				ImagePre.style.height = "180px";
				newPreview.appendChild(ImagePre);
			}
			ImagePre.src = Event.target.result;

		};

		return function() {

			var img = document.getElementById("detailPic3").files;

			if (!fileType.test(img[0].type)) {
				alert("이미지 파일을 업로드 하세요");
				return;
			}
			ImgReader.readAsDataURL(img[0]);
		}
	}
	document.getElementById("detailPic3Preview").src = document
			.getElementById("detailPic3").value;
})();

var InputDetailPic4 = (function loadImageFile() {
	if (window.FileReader) {
		var ImagePre;
		var ImgReader = new window.FileReader();
		var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;

		ImgReader.onload = function(Event) {
			if (!ImagePre) {
				var newPreview = document.getElementById("detailPic4Preview");
				ImagePre = new Image();
				ImagePre.style.width = "150px";
				ImagePre.style.height = "180px";
				newPreview.appendChild(ImagePre);
			}
			ImagePre.src = Event.target.result;

		};

		return function() {

			var img = document.getElementById("detailPic4").files;

			if (!fileType.test(img[0].type)) {
				alert("이미지 파일을 업로드 하세요");
				return;
			}
			ImgReader.readAsDataURL(img[0]);
		}
	}
	document.getElementById("detailPic4Preview").src = document
			.getElementById("detailPic4").value;
})();

var InputDetailPic5 = (function loadImageFile() {
	if (window.FileReader) {
		var ImagePre;
		var ImgReader = new window.FileReader();
		var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;

		ImgReader.onload = function(Event) {
			if (!ImagePre) {
				var newPreview = document.getElementById("detailPic5Preview");
				ImagePre = new Image();
				ImagePre.style.width = "150px";
				ImagePre.style.height = "180px";
				newPreview.appendChild(ImagePre);
			}
			ImagePre.src = Event.target.result;
		};

		return function() {

			var img = document.getElementById("detailPic5").files;

			if (!fileType.test(img[0].type)) {
				alert("이미지 파일을 업로드 하세요");
				return;
			}
			ImgReader.readAsDataURL(img[0]);
		}
	}
	document.getElementById("detailPic5Preview").src = document
			.getElementById("detailPic5").value;
})();

function home() {
	alert("${pageContext.request.contextPath}");
}

function searchBrand() {
	window
			.open(
					"/managerBrand.hang",
					"브랜드 등록",
					"toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=420, height=500");
}

function addItemAction() {
	var f = document.addItemForm;
	
	f.manufactureDate.value = f.manufactureYear.value + f.manufactureMonth.value + f.manufactureDay.value;
	f.releaseDate.value = f.releaseYear.value + f.releaseMonth.value + f.releaseDay.value;
	
	if (f.brandCode.value == ""){
		window.alert("브랜드를 반드시 선택해야 합니다.");
		return false;
	}
	
	if (f.name.value == "") {
		window.alert("상품명을 반드시 입력해야 합니다.");
		f.name.focus();
		return false;
	}
	
	if (f.marketPrice.value == ""){
		window.alert("시장가를 반드시 입력해야 합니다.");
		f.marketPrice.focus();
		return false;
	}
	
	if ((f.marketPrice.value * 0) != 0){
		window.alert("시장가는 숫자만 입력 가능합니다.");
		f.marketPrice.focus();
		f.marketPrice.select();
		return false;
	}
	
	if (f.sellPrice.value == "") {
		window.alert("판매가를 반드시 입력해야 합니다.");
		f.sellPrice.focus();
		return false;
	}
	
	if ((f.sellPrice.value * 0) != 0){
		window.alert("판매가는 숫자만 입력 가능합니다.");
		f.sellPrice.focus();
		f.sellPrice.select();
		return false;
	}
	
	if (f.purchasePrice.value == "") {
		window.alert("매입가를 반드시 입력해야 합니다.");
		f.purchasePrice.focus();
		return false;
	}
	
	if ((f.purchasePrice.value * 0) != 0){
		window.alert("매입가는 숫자만 입력 가능합니다.");
		f.purchasePrice.focus();
		f.purchasePrice.select();
		return false;
	}

	if ((f.sellMaxNum.value * 0) != 0){
		window.alert("최대판매가능개수는 숫자만 입력 가능합니다.");
		f.sellMaxNum.focus();
		f.sellMaxNum.select();
		return false;
	}
	
	if (f.stockAmount.value == "") {
		window.alert("매입가를 반드시 입력해야 합니다.");
		f.stockAmount.focus();
		return false;
	}
	
	if ((f.stockAmount.value * 0) != 0){
		window.alert("매입가는 숫자만 입력 가능합니다.");
		f.stockAmount.focus();
		f.stockAmount.select();
		return false;
	}
	
	window.alert("상품이 정상적으로 등록되었습니다");

	f.submit();
}

