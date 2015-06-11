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
<FORM name="itemForm1" id="itemForm1" action="" method="get">
	<INPUT type="hidden" name="itemCode">
	<INPUT type="hidden" name="itemSizeYn">
	<INPUT type="hidden" name="hit">
	<INPUT type="hidden" name="code" value="<%= cateCode%>">
	<INPUT type="hidden" name="section" value="<%= cateCode%>">
	<INPUT type="hidden" name="word" value="<%= cateCode%>">
	<INPUT type="hidden" name="pageNum" value="<%= pageNum%>">
	<INPUT type="hidden" name="wordCountYn" value='N'>
</FORM>

<FORM name="itemForm" id="itemForm" action="/itemView.hang" method="get">
	<INPUT type="hidden" name="itemGroupCode">
</FORM>

<SCRIPT>
	$(function(){
		var itemForm = $('#itemForm');
		var itemFunc = itemForm.find('input:hidden[name=func]');
		var itemCode = itemForm.find('input:hidden[name=itemCode]');
		var itemGroupCode = itemForm.find('input:hidden[name=itemGroupCode]');
		var itemSizeYn = itemForm.find('input:hidden[name=itemSizeYn]');
		var itemHit = itemForm.find('input:hidden[name=hit]');
		var itemWord = itemForm.find('input:hidden[name=word]');
		var itemSection = itemForm.find('input:hidden[name=section]');
		var itemPageNum = itemForm.find('input:hidden[name=pageNum]');
		var itemWordCountYn = itemForm.find('input:hidden[name=wordCountYn]');

		// �ۺ���
		$('.itemView').click(function(){
			var itemArticle = $(this);
			itemHit.val(itemArticle.attr('hit'));
			itemGroupCode.val(itemArticle.attr('itemGroupCode'));
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
    <body style = "background-color:#EBEBEB">
	
	<!-- ���� -->
	<p><br><BR>

   <!-- ������ ���� -->
        <div class="container" style = "width:100%;">
    <!-- left menu -->
	<div class ="thumbnail" style = "width:16%;float:left;margin-left:3%;">
		<div class = "leftmenu" style = "width:100%;">
		<div class = "productname">
		<span style = "margin-bottom:5px;"><font size = "1"><b>A ~ Z > Olive Young</b></font></span>
			<hr style = "border:solid 1px;margin-bottom:5px;">
				<font size = "3">��� �����ֱ�</font>
			<hr style = "border:solid 1px;margin-top:5px;">
		</div>
		
		<hr>
				
<%
	for(int i = 0; i < 5; i++){
%>	
		<div class = "dc1" style = "margin-top:-7%;">
			<font size = "3" style = "margin-left:3%"><b>1�� </b></font><p>
<%
				for(int j = 0 ; j < 5; j++) {
%>
				<!-- ���� �������� üũ�Ϸ��� ������ for �̸��� üũ�ڽ� id,name�� ���ƾ� ����� 
				<label for = "face<%= j%>" style = "width:100%">
		        </label>
		       	-->
		       	<label style = "width:100%;">
		        	<input type = "checkbox" id = "face" name = "face" value ="���̽� ����ũ��" style = "margin-left:3%">
		        	&nbsp;<font size = "2">2��</font><br>
		        </label>
<%
				}
%>
        	<hr style = "margin-top:-1%">
        </div>
<%
	}
%>
		</div>
	</div>
	<!-- left menu �� -->
	
    <!-- ���� �ۼ� ���� -->
        <div class="thumbnail" style = "width:75%;float:right;margin-right:4%;"><br>
        	<div class = "select" style = "margin-left:3%;margin-top:10px"><p>
        		<span class = "glyphicon glyphicon-home">&nbsp;HOME&nbsp;</span>>&nbsp;
        		<select>
        			<option value = "�ֽż�">�ֽż�</option><option value = "�α��">�α��</option><option value = "�������ݼ�">�������ݼ�</option>
        			<option value = "�������ݼ�">�������ݼ�</option><option value = "�ȷ������̽�">�ȷ������̽�</option>
        			<option value = "������">������</option><option value = "���䰳��">���䰳��</option><option value = "������">������</option>
        		</select>
<!-- ���� ��� -->					
        		<div class = "dc3" style = "background-color:#EBEBEB;width:96%">
					<table style = "width:100%;height:100px;display:table;margin-left:auto;margin-right:auto;">
						<tr>
						<td><a href = "#">- ��ü����</a></td>
<%
							for(int i = 0;  i < 20 ;  i ++) {
%>
							<td><a href = "#">- Ŭ��¡ ��</a></td>
<%
								if(i==5) {
%>
												</tr><tr>
<%
								}
								else if(i>6&&i==12){
%>
										</tr><tr>		
<%									
								}
							}
%>
					</tr>
					</table>
				</div>
<!-- ���� ��� ��-->	
        	</div>
			<!-- ���� -->
			<hr>
			<!-- �α��ǰ -->
				<div class="row hotitem" style = "margin-left:1%">
<%
			for (int i = 0; i < itemList.size(); i++) {
				ItemSearchVo isv =(ItemSearchVo)itemList.get(i);
				
				String itemCode = isv.getItemCode();						
				String itemGroupCode = isv.getItemGroupCode();						
				String itemSizeYn = isv.getItemSizeYn();						
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
							<A itemGroupCode="<%=itemGroupCode%>" class="itemView" style="cursor:pointer"><p><font size = "3"><font color = "orange"><b><%=itemName%></b></font></font></p></A>
							<p><%=itemScore%>
							<p>����	&nbsp;&nbsp;<%=itemMarketPrice %>��<%=itemSellPrice%>(<%=itemDiscount%>%)
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
    <!--  ���� �ۼ� �� -->
				</div>
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
    </body>