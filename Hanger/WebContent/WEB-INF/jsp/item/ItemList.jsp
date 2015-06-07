<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.item.vo.ItemSearchVo" %>
<%
	ArrayList itemList = (ArrayList)request.getAttribute("itemList");
	String itemSort = (String)request.getAttribute("itemSort");
	String cateCode = (String)request.getAttribute("cateCode");
	String keyWord = (String)request.getAttribute("keyWord");
	int pageNum = (Integer)request.getAttribute("pageNum");//����ڰ� ������ ������ ��ȣ
	
	int articleTotalNum = (Integer)request.getAttribute("articleTotalNum");
	int articleStartNum = (Integer)request.getAttribute("articleStartNum");
	int articleEndNum = (Integer)request.getAttribute("articleEndNum");
	int pageTotalNum = (Integer)request.getAttribute("pageTotalNum");// ��ü ������ ��ȣ
	int pageStartNum = (Integer)request.getAttribute("pageStartNum");// ���������� ��ȣ
	int pageEndNum = (Integer)request.getAttribute("pageEndNum");// �������� ��ȣ	
	
	String message = "";
	if(request.getAttribute("message")!=null && ((String)request.getAttribute("message")).length()>0)
	{
		message = (String)request.getAttribute("message");
	}

	boolean loginYn = false;
	boolean adminYn = false;
	if(session != null && session.getAttribute("loginYn")!=null && ((String)session.getAttribute("loginYn")).equals("Y"))
	{
		loginYn = true;
	}
	if(loginYn && ((String)session.getAttribute("adminYn")).equals("Y"))
	{
		adminYn = true;
	}
%>
<FORM name="itemForm" id="itemForm" action="/itemServlet.mo" method="post">
	<INPUT type="hidden" name="func">
	<INPUT type="hidden" name="seq">
	<INPUT type="hidden" name="hit">
	<INPUT type="hidden" name="code" value="<%= cateCode%>">
	<INPUT type="hidden" name="section" value="<%= cateCode%>">
	<INPUT type="hidden" name="word" value="<%= cateCode%>">
	<INPUT type="hidden" name="pageNum" value="<%= pageNum%>">
	<INPUT type="hidden" name="wordCountYn" value='N'>
</FORM>

<SCRIPT>
	$(function(){
		var itemForm = $('#itemForm');
		var itemFunc = itemForm.find('input:hidden[name=func]');
		var itemSeq = itemForm.find('input:hidden[name=seq]');
		var itemHit = itemForm.find('input:hidden[name=hit]');
		var itemWord = itemForm.find('input:hidden[name=word]');
		var itemSection = itemForm.find('input:hidden[name=section]');
		var itemPageNum = itemForm.find('input:hidden[name=pageNum]');
		var itemWordCountYn = itemForm.find('input:hidden[name=wordCountYn]');

		// �ۺ���
		$('.itemView').click(function(){
			var itemArticle = $(this);
			itemHit.val(itemArticle.attr('hit'));
			itemSeq.val(itemArticle.attr('itemCode'));
			itemFunc.val('item_004');
			itemForm.submit();
		});
// �۾��� ����
		$('#goWriteBtn').click(function(){
			itemFunc.val('item_002');
			itemForm.submit();
		});

		// �˻�
		$('#searchBtn').click(function (){
			searchAction();
		});
		$('#searchWord').keypress(function (event){
			if(event.keyCode == 13)
			{
				searchAction();
				return false;
			}
		});
		function searchAction(){
			if(trim($('#searchWord').val()) === "")
			{
				window.alert("�˻�� �Է��ϼ���.");
				$('#searchWord').select();
				return false;
			}

			itemFunc.val("item_001");
			itemPageNum.val("1");
			itemWordCountYn.val("Y");
			itemSection.val($('#section').val());
			itemWord.val(trim($('#searchWord').val()));
			itemForm.submit();
		}
		// ��ü����
		$('#totalSearch').click(function(){
			itemFunc.val("item_001");
			itemPageNum.val("1");
			itemSection.val("TC");
			itemWord.val("");
			itemForm.submit();
		});
	});
</SCRIPT>
	<link rel="stylesheet" href="css/LeftMenu/style.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
   <!-- ������ ���� -->
        <div class="container" style = "width:100%;height:100%">
    <!-- left menu -->
	<div class ="leftmenu" style = "margin-left:50px;width:200px;height:200px;float:left">
	<input type="checkbox" id="css3menu-switcher" class="c3m-switch-input">
		<ul id="css3menu1" class="topmenu">
			<li class="switch"><label onclick="" for="css3menu-switcher"></label></li>
			<li class="topfirst"><a href="#" style="width:120px;"><span>��ü����</span></a>
			<hr>
			<li class="topfirst"><a href="#" style="width:120px;"><span>��Ų�ɾ�</span></a>
		<ul>
		<li class="subfirst"><a href="#">Ŭ��¡</a></li>
		<li><a href="#">���&�μ�&�̽�Ʈ</a></li>
		<li><a href="#">������&����</a></li>
		<li><a href="#">ũ��&����</a></li>
		<li><a href="#">��&��ġ</a></li>
		<li><a href="#">���ɾ�</a></li>
		<li><a href="#">Ʈ�����ɾ�</a></li>
		<li><a href="#">ȭ��Ʈ��</a></li>
		<li><a href="#">������Ų�ɾ�</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="width:120px;"><span>����ũ��</span></a>
	<ul>
		<li class="subfirst"><a href="#">�� ����ũ��</a></li>
		<li><a href="#">���� ����ũ��</a></li>
		<li><a href="#">���̽� ����ũ��</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="width:120px;"><span>���&�ٵ�</span></a>
	<ul>
		<li class="subfirst"><a href="#">���</a></li>
		<li><a href="#">�ٵ�</a></li>
		<li><a href="#">�ڵ�&ǲ</a></li>
		<li><a href="#">���̾�Ʈ</a></li>
		<li><a href="#">��Ȱ��Ƽ</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="width:120px;"><span>���</span></a>
	<ul>
		<li class="subfirst"><a href="#">�������</a></li>
		<li><a href="#">�巹�� ��Ǿ</a></li>
		<li><a href="#">ĵ��&��ǻ��</a></li>
		<li><a href="#">�������</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="width:120px;"><span>����&���</span></a>
	<ul>
		<li class="subfirst"><a href="#">��Ƽ���</a></li>
		<li><a href="#">�ٵ���</a></li>
		<li><a href="#">����</a></li>
	</ul></li>
</ul>
	</div>
	<!-- ���� �ۼ� ���� -->
		<div class="thumbnail" style = "width:980px;height:1000px;float:right;margin-right:80px;">
        	<div class = "select" style = "margin-left:32px;margin-top:10px"><p>
        		<select>
        			<option value = "�ֽż�">�ֽż�</option><option value = "�α��">�α��</option><option value = "�������ݼ�">�������ݼ�</option>
        			<option value = "�������ݼ�">�������ݼ�</option><option value = "�ȷ������̽�">�ȷ������̽�</option>
        			<option value = "������">������</option><option value = "���䰳��">���䰳��</option><option value = "������">������</option>
        		</select>
        	</div>
        	<!-- �α��ǰ -->
				<div class="row hotitem" style = "margin-left:7px">
					<h4 class="titles" style = "margin-left:25px"><font size = "4"><b>�ֽŻ�ǰ</b></font></h4>
				<%
					for (int i = 0; i < itemList.size(); i++) {
						ItemSearchVo isv =(ItemSearchVo)itemList.get(i);
						
						String itemCode = isv.getItemCode();						
						String itemName = isv.getItemName();
						String brandName = isv.getBrandName();
												
						String itemMarketPrice = isv.getItemMarketPrice();
						String itemSellPrice = isv.getItemSellPrice();
						String itemDiscount = isv.getItemDiscount();
												
						String itemPicPath = isv.getItemPicPath();
						String itemSavename = isv.getItemPicSavename();
						
						String itemStatus = isv.getItemStatus();
						String itemScore = isv.getItemScore();
						String itemReviewCnt = isv.getReviewCnt();
				%>
				<div class="col-sm-6 col-md-2" style="display:table;margin-left:3px;">
					<div class="thumbnail" style = " width:205px">
						<img src="images/wonbin.PNG">
						<div class="caption">
							<font size = "2"><b><%=brandName%></b></font>
							<p>
							
							<A itemCode="<%=itemCode%>" class="itemView" style="cursor:pointer"><p><font size = "3"><font color = "orange"><b><%=itemName%></b></font></font></p></A>
							<p><%=itemScore%>
							<p>����	&nbsp;&nbsp;<%=itemMarketPrice %><%=itemSellPrice%>(<%=itemDiscount%>%)
							<hr style="margin-bottom: 3px">
							<div style="display: table; margin-left: auto; margin-right: auto;">
							
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span><span class="badge"><%=itemReviewCnt%></span>
								
							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>
				</div>
				 <!--  ���� �ۼ� �� -->
		
        </div>
        </div>
        
<%

	if(itemList.size()==0)
	{
%>
		<B>��ϵ� ��ǰ�� �����ϴ�.</B>
<%
	}
%>
	</TABLE>

	<TABLE cellspacing="0" cellpadding="0" width="750">
		<TR><TD height="10"></TD></TR>
		<TR>
			<TD width="750">
				<jsp:include page="ItemPageNumber.jsp" flush="true" />
			</TD>
		</TR>
		<TR><TD height="30"></TD></TR>
	</TABLE>
</CENTER>
  