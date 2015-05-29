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

		// ���� Ŭ��
		// ���� �˻�
		$('#GasanSearch').click(function(){
			func.val("StoreList_001");
			keyWord.val("����");
			keyType.val("location");
			naviListForm.submit();

		});
		// ���� �˻�
		$('#JongroSearch').click(function(){
			func.val("StoreList_001");
			keyWord.val("����");
			keyType.val("location");
			naviListForm.submit();

		});
		// ���� �˻�
		$('#GangnamSearch').click(function(){
			func.val("StoreList_001");
			keyWord.val("����");
			keyType.val("location");
			naviListForm.submit();

		});
		// ��� �˻�
		$('#NowonSearch').click(function(){
			func.val("StoreList_001");
			keyWord.val("���");
			keyType.val("location");
			naviListForm.submit();

		});
		/////////////////////////////
		// �׸� �˻�
		// ȸ�� �˻�
		$('#Togetherarty').click(function(){
			func.val("StoreList_001");
			keyWord.val("ȸ��");
			keyType.val("theme");
			naviListForm.submit();

		});
		// ����³� �˻�
		$('#Rainday').click(function(){
			func.val("StoreList_001");
			keyWord.val("����³�");
			keyType.val("theme");
			naviListForm.submit();

		});
		// ����Ʈ �˻�
		$('#Date').click(function(){
			func.val("StoreList_001");
			keyWord.val("����Ʈ");
			keyType.val("theme");
			naviListForm.submit();

		});
		// TV���� �˻�
		$('#TVmatzip').click(function(){
			func.val("StoreList_001");
			keyWord.val("TV����");
			keyType.val("theme");
			naviListForm.submit();

		});
		///////////
		//���� ���� ��
		//  �˻�
		$('#Meat').click(function(){
			func.val("StoreList_001");
			keyWord.val("���");
			keyType.val("type");
			naviListForm.submit();
	
		});
		//  �˻�
		$('#SeaFood').click(function(){
			func.val("StoreList_001");
			keyWord.val("�ػ깰");
			keyType.val("type");
			naviListForm.submit();

		});
		//  �˻�
		$('#PizzaChicken').click(function(){
			func.val("StoreList_001");
			keyWord.val("����ġŲ");
			keyType.val("type");
			naviListForm.submit();

		});
		//  �˻�
		$('#SoupFood').click(function(){
			func.val("StoreList_001");
			keyWord.val("�����丮");
			keyType.val("type");
			naviListForm.submit();

		});
		//  �˻�
		$('#Noddle').click(function(){
			func.val("StoreList_001");
			keyWord.val("��丮");
			keyType.val("type");
			naviListForm.submit();

		});
		//  �˻�
		$('#NightFood').click(function(){
			func.val("StoreList_001");
			keyWord.val("�߽�");
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
		<A id="GasanSearch" style="cursor:pointer"><span class="text">����</span></a>
		<A id="JongroSearch" style="cursor:pointer"><span class="text">����</span></a>
		<A id="GangnamSearch" style="cursor:pointer"><span class="text">����</span></a>
		<A id="NowonSearch" style="cursor:pointer"><span class="text">���</span></a>
	
       </li>
		 <img src="image/bar.JPG" border ="0" id="bar1" width="30">
		
		<li>	
		<span class="title">
		<img src="image/nav2.JPG" border ="0" id="menu2" width="80">
        </span>
		<A id="Togetherarty" style="cursor:pointer"><span class="text">ȸ��</span></a>
		<A id="Rainday" style="cursor:pointer"><span class="text">����³�</span></a>
		<A id="Date" style="cursor:pointer"><span class="text">����Ʈ</span></a>
		<A id="TVmatzip" style="cursor:pointer"><span class="text">TV����</span></a>
		
       </li>

		 <img src="image/bar.JPG" border ="0" id="bar2" width="30">

	   <li>	
		<span class="title">
		<img src="image/nav3.JPG" border ="0" id="menu3" width="80">
        </span>
		<A id="Meat" style="cursor:pointer"><span class="text">���</span></a>
		<A id="SeaFood" style="cursor:pointer"><span class="text">�ػ깰</span></a>
		<A id="PizzaChicken" style="cursor:pointer"><span class="text">����/ġŲ</span></a>
		<A id="SoupFood" style="cursor:pointer"><span class="text">�����丮</span></a>
		<A id="Noddle" style="cursor:pointer"><span class="text">��丮</span></a>
		<A id="NightFood" style="cursor:pointer"><span class="text">�߽�</span></a>


       </li>
    </ul>
</div>