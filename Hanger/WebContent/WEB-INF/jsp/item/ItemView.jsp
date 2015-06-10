<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hanger.item.vo.ItemViewVo" %>
<%
	ArrayList itemViewList = (ArrayList)request.getAttribute("itemViewList");
	
	int listSize = itemViewList.size();
	
	String itemGroupCode = ((ItemViewVo)itemViewList.get(0)).getItemGroupCode();
	String itemName = ((ItemViewVo)itemViewList.get(0)).getItemName();
	String itemSizeYn = ((ItemViewVo)itemViewList.get(0)).getItemSizeYn();
	String itemScore = ((ItemViewVo)itemViewList.get(0)).getItemScore();
	String itemSummaryInfo = ((ItemViewVo)itemViewList.get(0)).getItemSummaryInfo();
	String itemDetailInfo = ((ItemViewVo)itemViewList.get(0)).getItemDetailInfo();
	String itemIngredient = ((ItemViewVo)itemViewList.get(0)).getItemIngredient();
	String itemHowToUse = ((ItemViewVo)itemViewList.get(0)).getItemHowToUse();
	String brandName = ((ItemViewVo)itemViewList.get(0)).getBrandName();
	
	String[] marketPrice=new String[listSize];
	String[] sellPrice=new String[listSize];
	String[] purchasePrice=new String[listSize];
	String[] itemSize=new String[listSize];
	String[] itemCode = new String[listSize];
	String[] itemStockAmount = new String[listSize];
	String[] stockCode = new String[listSize];
	String[] itemSellMaxnum = new String[listSize];
	String[] itemStatus = new String[listSize];
	String[] itemPicPath = new String[listSize];
	String[] itemPicSavename = new String[listSize];
	
	for(int i=0; i<listSize; i++)
	{
		itemCode[i] = ((ItemViewVo)itemViewList.get(i)).getItemCode();
		marketPrice[i]=((ItemViewVo)itemViewList.get(i)).getItemMarketPrice();
		purchasePrice[i]=((ItemViewVo)itemViewList.get(i)).getItemPurchasePrice();
		sellPrice[i]=((ItemViewVo)itemViewList.get(i)).getItemSellPrice();
		itemSize[i]=((ItemViewVo)itemViewList.get(i)).getItemSize();
		itemStockAmount[i] = ((ItemViewVo)itemViewList.get(i)).getItemStockAmount();
		stockCode[i] = ((ItemViewVo)itemViewList.get(i)).getStockCode();
		itemSellMaxnum[i] = ((ItemViewVo)itemViewList.get(i)).getItemSellMaxnum();
		itemStatus[i] = ((ItemViewVo)itemViewList.get(i)).getItemStatus();
		itemPicPath[i] = ((ItemViewVo)itemViewList.get(i)).getItemPicPath();
		itemPicSavename[i] = ((ItemViewVo)itemViewList.get(i)).getItemPicSavename();
	}
%>

<Script>
   $(function(){
         var cartForm = $('#cartForm');
      $('#goCartBtn').click(function(){
         cartForm.submit();
      });
   });
   function selectSize()
   {
	   var index = $('.itemSize option:selected').val();
	   if(index==0)
		{
		   $('#marketPrice1').text(<%=marketPrice[0]%>);
		   $('#sellPrice1').text(<%=sellPrice[0]%>);
		   $('#marketPrice').val(<%=marketPrice[0]%>);
		   $('#sellPrice').val(<%=sellPrice[0]%>);
		   $('#itemCode').val(<%=itemCode[0]%>);
		   $('#stockCode').val(<%=stockCode[0]%>);
		}
   }
</Script>
    <body class="ourBody" style = "background-color:#EBEBEB">
    
        <div class="container">
          <BR><BR><BR>
          <FORM name="cartForm" id="cartForm" action="/cart.hang" method="post">          	
			<INPUT type="hidden" name="itemGroupCode" id="itemGroupCode" value="<%=itemGroupCode%>">
			<INPUT type="hidden" name="itemCode" id="itemCode">
			<INPUT type="hidden" name="stockCode" id="stockCode">
			<INPUT type="hidden" name="itemPurchasePrice" id="itemPurchasePrice">
			<INPUT type="hidden" name="marketPrice" id="marketPrice">
			<INPUT type="hidden" name="sellPrice" id="sellPrice">
          <div class="thumbnail">
          <div class="header" style = "width:980px;height:500px;margin-left:80px">
              <div class="product-info" style = "background-color:white;width:980px;height:500px;border:1px gray">
               <div class = "product" 
               style = "width:460px;height:460px;background-image:url(/assets/images/hanger.png);float:left;margin-left:20px;margin-top:20px">
               </div>
               <div class = "product-subject" style = "width:447px;height:460px;float:right">
                  <div class = "subTitle"><p><h5><%=brandName %></h5></p>
                  </div>
               <div class = "titleFW"><p><h3><%=itemName %></h3></p>
               </div>
               
               <ul class="nav nav-pills">
              <a> <li role="presentation" class="btn btn-default" >������</li></a>
              <a> <li role="presentation" class="btn btn-default" >��ü���</li></a>
            </ul>
               
               <HR style="border: 1px solid gray">
               <TABLE>
               	  <TR>
                     <TD style = "width:108px;height:30px">������ ����</TD>
                     <TD>
                     	<SELECT name="itemSize" id="itemSize" class="itemSize" onChange="selectSize()">
                     	<option selected>������ ����</option>
                     	<%
                     		for(int j=0; j<listSize; j++)
                     		{
                     	%>
                     	<option value="<%=j%>"><%=itemSize[j] %></option>
                     	<%
                     		}
                     	%>
                     	</SELECT>
                     </TD>
                  </TR>
                  <TR>
                     <TD style = "width:108px;height:30px">����</TD>
                     <TD id="marketPrice1"><STRIKE></STRIKE><font color = "red">&nbsp;&nbsp;&nbsp;29%</font></TD>
                  </TR>
                  <TR>
                     <TD style = "width:108px;height:30px">���� �ǸŰ�</TD>
                     <TD id="sellPrice1"></TD>
                  </TR>
                  <TR>
                     <TD style = "width:108px;height:30px">��ۺ�</TD>
                     <TD><B>������</B></TD>
                  </TR>
                  <TR>
                     <TD style = "width:108px;height:30px">��������</TD>
                         <TD><a href = "#">4���� ����</a></TD>
                  </TR>
                  <TR>
                     <TD style = "width:108px;height:30px">���� ����</TD>
                     <TD>
                        <input type="text" name="itemAmount" id="itemAmount">��                
                     </TD>
                  </TR>
               </TABLE>
            <HR style="border: 1px solid gray">
            <div class = "totallPrice" style = "width:200px;height:50px;align:right">�� ��ǰ �ݾ� :<font size = "5" ><font color = "red"></font></font> ��</div>
            <div class = "buy" align = "center">
            
            <ul class="nav nav-pills">
              <li role="presentation" class="butn btn-default" style = "width:228px;height:40px;align:center;margin-left:120px"><a id='goCartBtn'><B>�����ϱ� / ���</B></a></li>
            </ul>
            </div>
         </div>
         </div>
    </div>
    </div>
    </form>
   <BR>
   <BR>
	
   <script>
   $('#myTab a').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
      })
   </script>

   <!-- ��ǰ ���� ����ȭ ���� -->
   <div class="thumbnail" style = "width:100%;height:300px;">
   <div class = "product-munsu" style = "width:100%;height:300px;"><BR>
      <div class = "title" style = "margin-left:22px;"><font size = "4"><B>��ǰ ����</B></font></div>
      
      <div role="tabpanel">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist" style = "margin-left:-5px">
          <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">������</a></li>
          <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">����</a></li>
          <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">����</a></li>
          <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">�������</a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane active" id="home"><%=itemDetailInfo %></div>
          <div role="tabpanel" class="tab-pane" id="profile"><%=itemHowToUse %></div>
          <div role="tabpanel" class="tab-pane" id="messages"><%=itemIngredient %></div>
          <div role="tabpanel" class="tab-pane" id="settings">������������</div>
        </div>    
      
   </div>
   </div>
   </div>
   <!-- ��ǰ ���� ����ȭ �� -->
   
   <BR>
   <BR>
   
   <!-- �ȷο� ���� �ۼ� ���� -->
   <div class="thumbnail" style = "background-color:white;width:100%;"><BR>
       <div class = "title" style = "margin-left:22px;"><font size = "4"><B>��ǰ �̹���(��)</B></font></div>
          <div class="field description-wrap">
             <div class = "etc" align = "center">
              <img src = "/assets/images/1.jpg" />
              </div>
            </div>
          </div>
       
    <!-- �ȷο� ���� �ۼ� �� -->
    
    <BR>
    <BR>
    
    <!-- ���� �ۼ� ���� -->
        <div class="thumbnail" style = "background-color:white;width:100%;"><BR>
           <div class = "title" style = "margin-left:22px;"><font size = "4"><B>�ȷο� ����</B></font>
           </div><BR>
 <%
       for(int i = 0 ; i < 2 ; i++) {
 %>      
       <div class = "review" style = "background-color:white;width:100%;height:100px;">
         <div class = "profile" style = "width:100px;height:100px;float:left;margin-left:2%">
            <img src = "/assets/images/song.jpg" style = "width:100px;height:100px;"/></div>
         <div class = "name" style = "width:400px;height:30px;float:left;margin-left:20px;">���� : �� ��ǰ �ʹ� ���ƿ�
         (<b>dofwk2@***** / 2015-05-29</b>)</div>
         <br>
         <BR>
         <div class = "name" style = "width:700px;height:60px;float:left;margin-left:20px;">���� : </div>
      </div>
      <hr style = "width:100%;">
<%
       }
%>
    </div>
    <!--  ���� �ۼ� �� -->
    
    <BR>
    
    <!--  ���� �ۼ� ���� -->
    <div class="thumbnail" style = "background-color:white;width:100%;height:100%;"><BR>
        <div class = "title" style = "margin-left:22px;"><font size = "4"><B>����</B></font></div><BR>
<%
       for(int i = 0 ; i < 5 ; i++) {
 %>      
       <div class = "review" style = "width:100%;">
         <div class = "name" style = "width:400px;height:30px;float:left;margin-left:20px;">���� : �� ��ǰ �ʹ� ���ƿ�
         (<b>dofwk2@***** / 2015-05-29</b>)</div>
         <br>
         <BR>
         <div class = "name" style = "width:650px;height:60px;float:left;margin-left:20px;">���� : </div>
      </div>
      <hr style = "width:100%;">
<%
       }
%>
    </div>
</div>
    </body>