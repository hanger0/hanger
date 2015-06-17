<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import = "com.hanger.item.vo.ItemViewVo"%>
<!DOCTYPE html>

<%
	ItemViewVo item = (ItemViewVo)request.getAttribute("item");
	int maxPrice = (Integer)request.getAttribute("maxPrice");
	int minPrice = (Integer)request.getAttribute("minPrice");
	
	String itemGroupCode = item.getItemGroupCode();
	String brandName = item.getBrandName();
	String itemName = item.getItemName();
	String itemPicPath = item.getItemPicPath();
	String itemPicSavename = item.getItemPicSavename();
	String itemSummaryInfo = item.getItemSummaryInfo();
	String itemDetailInfo = item.getItemDetailInfo();
%>
<html>

<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT src="/js/common/common.js"></SCRIPT>
<script src="/js/posting/review/review.js" type="text/javascript"></script>

<!-- include libries(jQuery, bootstrap, fontawesome) -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">

<!-- include summernote css/js-->
<link href="/css/posting/summernote.css" rel="stylesheet">
<script src="/js/posting/summernote.js"></script>

<!-- ���� ��ũ �� js , css -->

<head>
<title>Review Write Editor</title>
</head>

<script type="text/javascript">
   $(function() {
      $('.summernote').summernote({
      });
   });
</script>

<script>
    function resize(obj) {
      obj.style.height = "1px";
      obj.style.height = (20+obj.scrollHeight)+"px";
    }
</script>

<body style="background-color: #EBEBEB">
   <div class="container" style = "width:80%; background-color: #EBEBEB;margin-top:10%">
   
      <form id="reviewForm" name="reviewForm" action="/reviewWriteResult.hang" method="post" enctype="multipart/form-data">
      	 <INPUT type="hidden" id="itemGroupCode" name="itemGroupCode" value="<%=itemGroupCode%>"/>
         <INPUT type="hidden" id="content" name="content" value=""/>
         <INPUT type="hidden" id="ratingValue" name="rating" value=""/>
         <font size = "4" style = "margin-left:70px;"><b>�����ۼ�</b></font>
         <hr style = "border:2px solid white;width:87%"> 
         <div class = "reviewProduct" style = "width:87%;display:table;margin-left:auto;margin-right:auto">
            <img src = "<%=itemPicPath %>/<%=itemPicSavename %>" style = "width:220px;height:150px;" />
            <div class = "reviewProductinfo" style = "width:70%;float:right;">
               <font size = "3"><%=brandName %></font><p><P>
               <font size = "4"><b><%=itemName %></b></font>&nbsp;&nbsp;<font size = "3"><%=itemSummaryInfo %></font><p>
               <font size = "2"><%=itemDetailInfo %></font><p>
               <font size = "2">����&nbsp;&nbsp;</font><font size = "3">
               <b>
               <%
               		if(minPrice == maxPrice){
         		%>
         				<%=maxPrice %>��
         		<%
               		} else {
               %>
               			<%=minPrice %>�� ~ <%=maxPrice %>��
               <%
               		}
               %>
               
               </b></font><p>
            </div>   
         </div>
         <hr style = "border:1px solid white;width:87%"> 
         <div class = "reviewMainPic">
            <FONT SIZE = "3" style = "margin-left:70px;"><B>���λ���</B></FONT><BR>
            <dl>
               <dd style = "margin-left:70px;">
                  <input class="button" id="reviewMainPic" name="reviewMainPic" type="file"
                     onchange="InputReviewMainPic()">
                  <div id="reviewMainPicPreview"></div>
               </dd>
            </dl>
         </div>
         <hr style = "border:1px solid white;width:87%"> 
         <FONT SIZE = "3" style = "margin-left:70px;"><B>�����Է�</B></FONT><BR>
         
            <div class="thumbnail" style = "width:87%;display:table;margin-left:auto;margin-right:auto">
               <input type="text" id="reviewTitle" name="reviewTitle" placeholder="������ �Է��ϼ���." style = "width:100%;height:50px;border:0px">
            </div>
            
            <FONT SIZE = "3" style = "margin-left:70px"><B>����</B></FONT> 
            <div class="thumbnail" style = "background-color: white;width:200px;margin-left:70px">
				<span id="starForm">
					<select id="reviewScore" name="reviewScore" class="reviewScore" onchange="drawStar()">
						<option value="10" selected="1">10��</option>
						<option value="9">9��</option>
						<option value="8">8��</option>
						<option value="7">7��</option>
						<option value="6">6��</option>
						<option value="5">5��</option>
						<option value="4">4��</option>
						<option value="3">3��</option>
						<option value="2">2��</option>
						<option value="1">1��</option>
					</select>
					<img src='/images/icons/star/star.png' style='width:20px; height:20px; margin-left:2px; margin-bottom:5px'/>
					<img src='/images/icons/star/star.png' style='width:20px; height:20px; margin-left:2px; margin-bottom:5px'/>
					<img src='/images/icons/star/star.png' style='width:20px; height:20px; margin-left:2px; margin-bottom:5px'/>
					<img src='/images/icons/star/star.png' style='width:20px; height:20px; margin-left:2px; margin-bottom:5px'/>
					<img src='/images/icons/star/star.png' style='width:20px; height:20px; margin-left:2px; margin-bottom:5px'/>
				</span>
				
            </div>
            
            <hr style = "border:1px solid white;width:87%"> 
            
      <!-- summernote ���� -->
      <FONT SIZE = "3" style = "margin-left:70px"><B>�����ۼ�</B></FONT> 
      
      <div class="thumbnail"  style = "width:87%;display:table;margin-left:auto;margin-right:auto;">
         <textarea class="summernote" style = "width:300px;overflow:visible" onkeyup = "resize(this)"></textarea>
      </div>
      
         <INPUT type="button" class="btn btn-default" value="�ۼ��Ϸ�" style="cursor: pointer;display:table;margin-left:auto;margin-right:auto" onclick="WriteReview()"/>   
      <!-- summernote �� -->
      </form>
      
   </div>
   <BR><BR>
   <div class="btn-group dropup" style = "position: fixed;left: 20px;bottom:20px;">
  <button type="button" class="btn btn-default">�����ۼ�</button>
  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <ul class="dropdown-menu" role="menu">
    <img src = "images/14.jpg" style ="width:300px;height:120px" />
  </ul>
</div>

</body>
</html>