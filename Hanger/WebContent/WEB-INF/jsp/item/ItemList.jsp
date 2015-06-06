<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.item.vo.ItemSearchVo" %>
<%
	ArrayList itemList = (ArrayList)request.getAttribute("itemList");
	String itemSort = (String)request.getAttribute("itemSort");
	String cateCode = (String)request.getAttribute("cateCode");
	String keyWord = (String)request.getAttribute("keyWord");
	int pageNum = (Integer)request.getAttribute("pageNum");//사용자가 선택한 페이지 번호
	
	int articleTotalNum = (Integer)request.getAttribute("articleTotalNum");
	int articleStartNum = (Integer)request.getAttribute("articleStartNum");
	int articleEndNum = (Integer)request.getAttribute("articleEndNum");
	int pageTotalNum = (Integer)request.getAttribute("pageTotalNum");// 전체 페이지 번호
	int pageStartNum = (Integer)request.getAttribute("pageStartNum");// 시작페이지 번호
	int pageEndNum = (Integer)request.getAttribute("pageEndNum");// 끝페이지 번호	
	
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

		// 글보기
		$('.itemView').click(function(){
			var itemArticle = $(this);
			itemHit.val(itemArticle.attr('hit'));
			itemSeq.val(itemArticle.attr('itemCode'));
			itemFunc.val('item_004');
			itemForm.submit();
		});

		// 글쓰기 가기
		$('#goWriteBtn').click(function(){
			itemFunc.val('item_002');
			itemForm.submit();
		});

		// 검색
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
				window.alert("검색어를 입력하세요.");
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

		// 전체보기
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
	
	
   <!-- 페이지 시작 -->
        <div class="container" style = "width:100%;height:100%">
    <!-- left menu -->
	<div class ="leftmenu" style = "margin-left:50px;width:200px;height:200px;float:left">
	<input type="checkbox" id="css3menu-switcher" class="c3m-switch-input">
		<ul id="css3menu1" class="topmenu">
			<li class="switch"><label onclick="" for="css3menu-switcher"></label></li>
			<li class="topfirst"><a href="#" style="width:120px;"><span>전체보기</span></a>
			<hr>
			<li class="topfirst"><a href="#" style="width:120px;"><span>스킨케어</span></a>
		<ul>
		<li class="subfirst"><a href="#">클렌징</a></li>
		<li><a href="#">토너&로션&미스트</a></li>
		<li><a href="#">에센스&세럼</a></li>
		<li><a href="#">크림&오일</a></li>
		<li><a href="#">팩&패치</a></li>
		<li><a href="#">선케어</a></li>
		<li><a href="#">트러블케어</a></li>
		<li><a href="#">화이트닝</a></li>
		<li><a href="#">남성스킨케어</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="width:120px;"><span>메이크업</span></a>
	<ul>
		<li class="subfirst"><a href="#">립 메이크업</a></li>
		<li><a href="#">아이 메이크업</a></li>
		<li><a href="#">페이스 메이크업</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="width:120px;"><span>헤어&바디</span></a>
	<ul>
		<li class="subfirst"><a href="#">헤어</a></li>
		<li><a href="#">바디</a></li>
		<li><a href="#">핸드&풋</a></li>
		<li><a href="#">다이어트</a></li>
		<li><a href="#">생활뷰티</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="width:120px;"><span>향수</span></a>
	<ul>
		<li class="subfirst"><a href="#">여성향수</a></li>
		<li><a href="#">드레스 퍼퓸</a></li>
		<li><a href="#">캔들&디퓨저</a></li>
		<li><a href="#">남성향수</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="width:120px;"><span>도구&기기</span></a>
	<ul>
		<li class="subfirst"><a href="#">뷰티기기</a></li>
		<li><a href="#">바디기기</a></li>
		<li><a href="#">도구</a></li>
	</ul></li>
</ul>
	</div>

    <!-- 리뷰 작성 시작 -->
        <div class="thumbnail" style = "width:980px;height:1000px;float:right;margin-right:80px;">
        	<div class = "select" style = "margin-left:32px;margin-top:10px"><p>
        		<select>
        			<option value = "최신순">최신순</option><option value = "인기순">인기순</option><option value = "낮은가격순">낮은가격순</option>
        			<option value = "높은가격순">높은가격순</option><option value = "팔로잉초이스">팔로잉초이스</option>
        			<option value = "할인율">할인율</option><option value = "리뷰개수">리뷰개수</option><option value = "평점순">평점순</option>
        		</select>
        	</div>
				
			<!-- 인기상품 -->
				<div class="row hotitem" style = "margin-left:7px">
					<h4 class="titles" style = "margin-left:25px"><font size = "4"><b>최신상품</b></font></h4>
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
							<font size = "2"><b><%=brandName%>></b></font>
							<p>
							
							<A itemCode="<%=itemCode%>" class="itemView" style="cursor:pointer"><p><font size = "3"><font color = "orange"><b><%=itemName%></b></font></font></p></A>
							<p><%=itemScore%>
							<p>가격	&nbsp;&nbsp;<%=itemMarketPrice %>▶<%=itemSellPrice%>(<%=itemDiscount%>%)
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
				
    <!--  리뷰 작성 끝 -->
		
        </div>
        </div>
        
<%

	if(itemList.size()==0)
	{
%>
		<B>등록된 상품이 없습니다.</B>
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
  