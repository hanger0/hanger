<%@ page contentType="text/html; charset=euc-kr"%>
<META charset="utf-8" />
<LINK rel="stylesheet" type="text/css" href="css/nav.css" />
<SCRIPT src="js/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT>
	$(function(){
		var naviListForm = $('#naviListForm');
		var func = naviListForm.find('input:hidden[name=func]');
		var keyWord = naviListForm.find('input:hidden[name=keyWord]');
		var keyType = naviListForm.find('input:hidden[name=keyType]');

		// 지역 클릭
		// 가산 검색
		$('#GasanSearch').click(function(){
			func.val("StoreList_001");
			keyWord.val("가산");
			keyType.val("location");
			naviListForm.submit();

		});
		// 종로 검색
		$('#JongroSearch').click(function(){
			func.val("StoreList_001");
			keyWord.val("종로");
			keyType.val("location");
			naviListForm.submit();

		});
		// 강남 검색
		$('#GangnamSearch').click(function(){
			func.val("StoreList_001");
			keyWord.val("강남");
			keyType.val("location");
			naviListForm.submit();

		});
		// 노원 검색
		$('#NowonSearch').click(function(){
			func.val("StoreList_001");
			keyWord.val("노원");
			keyType.val("location");
			naviListForm.submit();

		});
		/////////////////////////////
		// 테마 검색
		// 회식 검색
		$('#Togetherarty').click(function(){
			func.val("StoreList_001");
			keyWord.val("회식");
			keyType.val("theme");
			naviListForm.submit();

		});
		// 비오는날 검색
		$('#Rainday').click(function(){
			func.val("StoreList_001");
			keyWord.val("비오는날");
			keyType.val("theme");
			naviListForm.submit();

		});
		// 데이트 검색
		$('#Date').click(function(){
			func.val("StoreList_001");
			keyWord.val("데이트");
			keyType.val("theme");
			naviListForm.submit();

		});
		// TV맛집 검색
		$('#TVmatzip').click(function(){
			func.val("StoreList_001");
			keyWord.val("TV맛집");
			keyType.val("theme");
			naviListForm.submit();

		});
		///////////
		//음식 종류 별
		//  검색
		$('#Meat').click(function(){
			func.val("StoreList_001");
			keyWord.val("고기");
			keyType.val("type");
			naviListForm.submit();
	
		});
		//  검색
		$('#SeaFood').click(function(){
			func.val("StoreList_001");
			keyWord.val("해산물");
			keyType.val("type");
			naviListForm.submit();

		});
		//  검색
		$('#PizzaChicken').click(function(){
			func.val("StoreList_001");
			keyWord.val("피자치킨");
			keyType.val("type");
			naviListForm.submit();

		});
		//  검색
		$('#SoupFood').click(function(){
			func.val("StoreList_001");
			keyWord.val("국물요리");
			keyType.val("type");
			naviListForm.submit();

		});
		//  검색
		$('#Noddle').click(function(){
			func.val("StoreList_001");
			keyWord.val("면요리");
			keyType.val("type");
			naviListForm.submit();

		});
		//  검색
		$('#NightFood').click(function(){
			func.val("StoreList_001");
			keyWord.val("야식");
			keyType.val("type");
			naviListForm.submit();

		});


	});
</SCRIPT>
<FORM name="naviListForm" id="naviListForm" action="/storeList.cookpon" method="post">
	<INPUT type="hidden" name="func">
	<INPUT type="hidden" name="keyWord">
	<INPUT type="hidden" name="keyType">
</FORM>

<div id="menubar">
    <ul>       
        <li>
		
		<span class="title">
		<img src="image/nav1.JPG" border ="0" id="menu1" width="80">
        </span>
		<A id="GasanSearch" style="cursor:pointer"><span class="text">가산</span></a>
		<A id="JongroSearch" style="cursor:pointer"><span class="text">종로</span></a>
		<A id="GangnamSearch" style="cursor:pointer"><span class="text">강남</span></a>
		<A id="NowonSearch" style="cursor:pointer"><span class="text">노원</span></a>
	
       </li>
		 <img src="image/bar.JPG" border ="0" id="bar1" width="30">
		
		<li>	
		<span class="title">
		<img src="image/nav2.JPG" border ="0" id="menu2" width="80">
        </span>
		<A id="Togetherarty" style="cursor:pointer"><span class="text">회식</span></a>
		<A id="Rainday" style="cursor:pointer"><span class="text">비오는날</span></a>
		<A id="Date" style="cursor:pointer"><span class="text">데이트</span></a>
		<A id="TVmatzip" style="cursor:pointer"><span class="text">TV맛집</span></a>
		
       </li>

		 <img src="image/bar.JPG" border ="0" id="bar2" width="30">

	   <li>	
		<span class="title">
		<img src="image/nav3.JPG" border ="0" id="menu3" width="80">
        </span>
		<A id="Meat" style="cursor:pointer"><span class="text">고기</span></a>
		<A id="SeaFood" style="cursor:pointer"><span class="text">해산물</span></a>
		<A id="PizzaChicken" style="cursor:pointer"><span class="text">피자/치킨</span></a>
		<A id="SoupFood" style="cursor:pointer"><span class="text">국물요리</span></a>
		<A id="Noddle" style="cursor:pointer"><span class="text">면요리</span></a>
		<A id="NightFood" style="cursor:pointer"><span class="text">야식</span></a>


       </li>
    </ul>
</div>