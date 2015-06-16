<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="com.hanger.manager.item.vo.ManagerCategoryVo" %>
<%@ page import="com.hanger.manager.item.vo.ManagerFeatureVo" %>

<jsp:useBean id="inputTable" scope="request" class="java.util.Hashtable" />

<%
   String message = "";
   
   if((String)request.getAttribute("message") != null){ //메시지가 있다면
      message = (String)request.getAttribute("message");
   }

   Calendar cal = Calendar.getInstance();

   if (inputTable != null && inputTable.size() != 0) {
      ArrayList uploadFileList = (ArrayList) inputTable
            .get("uploadFile");
      Hashtable uploadTable = (Hashtable) uploadFileList.get(0);
      String path = (String) uploadTable.get("savePath");
      //System.out.println(path);   
   }
   
   List<ManagerCategoryVo> category1List = (List<ManagerCategoryVo>)request.getAttribute("category1List");
   List<ManagerCategoryVo> category2List = (List<ManagerCategoryVo>)request.getAttribute("category2List");
   List<ManagerCategoryVo> category3List = (List<ManagerCategoryVo>)request.getAttribute("category3List");
   List<ManagerFeatureVo> feature1List = (List<ManagerFeatureVo>)request.getAttribute("feature1List");
   List<ManagerFeatureVo> feature2List = (List<ManagerFeatureVo>)request.getAttribute("feature2List");
   
   int sizeNum = 1;
%>

<html>
<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT src="/js/common/common.js"></SCRIPT>
<script src="/js/manager/item/managerItem.js" type="text/javascript"></script>

<!-- include libries(jQuery, bootstrap, fontawesome) -->
<link
   href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css"
   rel="stylesheet">
<script
   src="//netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
<link
   href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"
   rel="stylesheet">

<!-- include summernote css/js-->
<link href="/css/posting/summernote.css" rel="stylesheet">
<script src="/js/posting/summernote.js"></script>
   
<script type="text/javascript">
   $(function() {
      $('.summernote').summernote({
      });
   });
</script>
<head>
<title>Manager Add Item</title>

<link rel="stylesheet" type="text/css" media="all"
   href="/css/niceforms-default.css">
   
<STYLE>
.button {
   background: #167ac6;
   border-bottom: transparent 1px solid;
   border-bottom-color: #167ac6;
   border-left: transparent 1px solid;
   border-left-color: #167ac6;
   border-right: transparent 1px solid;
   border-right-color: #167ac6;
   border-top: transparent 1px solid;
   border-top-color: #167ac6;
   box-shadow: 1px 1px 2px #333;
   color: #fff;
   cursor: pointer;
   display: inline-block;
   font-family: arial, sans-serif;
   font-size: 11px;
   font-weight: bold;
   height: 20px;
   line-height: normal;
   margin: 0px;
   outline-color: invert;
   outline-style: none;
   outline-width: 0px;
   padding-bottom: 0px;
   padding-left: 10px;
   padding-right: 10px;
   padding-top: 0px;
   text-align: left;
   text-decoration: none;
   vertical-align: middle;
   white-space: nowrap;
}

.text {
   background: white;
   border-bottom: transparent 1px solid;
   border-bottom-color: #167ac6;
   border-left: transparent 1px solid;
   border-left-color: #167ac6;
   border-right: transparent 1px solid;
   border-right-color: #167ac6;
   border-top: transparent 1px solid;
   border-top-color: #167ac6;
   color: #167ac6;
   display: inline-block;
   font-family: arial, sans-serif;
   font-size: 11px;
   font-weight: bold;
   height: 20px;
   line-height: normal;
   margin: 0px;
   padding-bottom: 0px;
   padding-left: 10px;
   padding-right: 10px;
   padding-top: 0px;
   text-align: left;
   text-decoration: none;
   vertical-align: middle;
   white-space: nowrap;
}
</STYLE>

<%
   if(message.length()>0) {
%>
   <SCRIPT>
      window.alert("<%= message%>");
      location.href='/';
   </SCRIPT>
<%
   }
%>

</head>

<body style = "background-color:#EBEBEB">
   
   <form id="addItemForm" name="addItemForm" action="/managerAddItemResult.hang"
      method="post" enctype="multipart/form-data">
      <div class="container" style = "background-color:#EBEBEB" >
      <br><BR>
         <fieldset>
            <legend>상품등록</legend>
            <dl>
               <dt>
                  <label for="brand">브랜드:</label>
               </dt>
               <dd>
                  <input class="text" name="brandName" id="brandName" size="60" onclick="searchBrand();" readonly/>
                  <input type="hidden" id="brandCode" name="brandCode" value=""/>
                  
                  <INPUT class="button" type="button" value="브랜드 검색" style="cursor: pointer" onclick="searchBrand()"> 
               </dd>
            </dl>
            
            <dl>
               <dt>
                  <label for="name">상품 이름:</label>
               </dt>
               <dd>
                  <INPUT class="text" type="text" name="name" size="60">
               </dd>
            </dl>
            <hr style = "border:1px solid black">
            <dl>
               <dt>
                  <label for="size">용량:</label>
                  <select>
                     <option value = "ml">ml</option>
                     <option value = "g">g</option>
                  </select>
               </dt>
               
               <dd id="sizeForm">
                  <INPUT class="text" type="text" id="size0" name="size0" maxlength="10" style = "margin-right:6px;width:215px">
               </dd>
               <dd>
                  <INPUT type="button" id="sizeAddBtn" value="사이즈 추가"  style = "width:105px">
                  <INPUT type="hidden" id="sizeCnt" name="sizeCnt" value="1">
                  <INPUT type="button" id="sizeDeleteBtn" value="사이즈 제거" style = "width:105px">
               </dd>
            </dl>

            <dl>
               <dt>
                  <label for="marketPrice">시장가:</label>
               </dt>
               <dd id="marketPriceForm">
                  <INPUT class="text" type="text" id="marketPrice0" name="marketPrice0" maxlength="20" style = "margin-right:6px;width:215px">
               </dd>
            </dl>

            <dl>
               <dt>
                  <label for="sellPrice">판매가:</label>
               </dt>
               <dd id="sellPriceForm">
                  <INPUT class="text" type="text" id="sellPrice0" name="sellPrice0" maxlength="20" style = "margin-right:6px;width:215px">
               </dd>
            </dl>

            <dl>
               <dt>
                  <label for="purchasePrice">매입가:</label>
               </dt>
               <dd id="purchasePriceForm">
                  <INPUT class="text" type="text" id="purchasePrice0" 
                  name="purchasePrice0" maxlength="20" style = "margin-right:6px;width:215px">
               </dd>
               
            </dl>
            
            <dl>
               <dt>
                  <label for="manufactureDate">제조일자:</label>
                  (null허용 ex-20150607)
               </dt>
               <dd id="manufactureDateForm">
                  <SELECT id="manufactureYear0" name="manufactureYear0">
                     <option value="0000" selected="1">YEAR</option>
                     <% 
                        for(int i = cal.get(Calendar.YEAR); i > 1999; i--){
                     %>
                        <option value="<%=i%>"><%=i %>년</option>
                     <%
                        }
                     %>
                  </SELECT>
                  <SELECT id="manufactureMonth0" name="manufactureMonth0">
                     <option value="00" selected="1">MONTH</option>
                     <% 
                        for(int i = 1; i < 13; i++){
                           if(i < 10){
                     %>
                              <option value="0<%=i%>"><%=i %>월</option>
                     <%
                           }
                           else{
                     %>
                              <option value="<%=i%>"><%=i %>월</option>
                     <%
                           }
                        }
                     %>
                  </SELECT>
                  <SELECT id="manufactureDay0" name="manufactureDay0" style = "margin-right:6px;">
                     <option value="00" selected="1">DAY</option>
                     <% 
                        for(int i = 1; i < 32; i++){
                           if(i < 10){
                     %>
                              <option value="0<%=i%>"><%=i %>일</option>
                     <%
                           } 
                           else {
                     %>
                              <option value="<%=i%>"><%=i %>일</option>
                     <%
                           }
                        }
                     %>
                  </SELECT>
                  <!-- <INPUT type="checkbox" id="manufactureCheck" onclick="manufactureDisable()"> 사용안함 -->
               </dd>
            </dl>
            
            <dl>
               <dt>
                  <label for="expireDate">유효기한:</label>
                  (null허용 ex-20150607)
               </dt>
               <dd id="expireDateForm">
                  <SELECT id="expireYear0" name="expireYear0">
                     <option value="0000" selected="1">YEAR</option>
                     <% 
                        for(int i = cal.get(Calendar.YEAR); i < 2025; i++){
                     %>
                        <option value="<%=i%>"><%=i %>년</option>
                     <%
                        }
                     %>
                  </SELECT>
                  <SELECT id="expireMonth0" name="expireMonth0">
                     <option value="00" selected="1">MONTH</option>
                     <% 
                        for(int i = 1; i < 13; i++){
                           if(i < 10){
                     %>
                              <option value="0<%=i%>"><%=i %>월</option>
                     <%
                           }
                           else{
                     %>
                              <option value="<%=i%>"><%=i %>월</option>
                     <%
                           }
                        }
                     %>
                  </SELECT>
                  <SELECT id="expireDay0" name="expireDay0" style = "margin-right:6px;">
                     <option value="00" selected="1">DAY</option>
                     <% 
                        for(int i = 1; i < 32; i++){
                           if(i < 10){
                     %>
                              <option value="0<%=i%>"><%=i %>일</option>
                     <%
                           } 
                           else {
                     %>
                              <option value="<%=i%>"><%=i %>일</option>
                     <%
                           }
                        }
                     %>
                  </SELECT>

               </dd>
            </dl>
            
            <dl>
               <dt>
                  <label for="releaseDate">발매일자:</label> (null허용 ex-19920707)
               </dt>
               <dd id="releaseDateForm">
                  <SELECT id="manufactureYear" name="releaseYear">
                     <option value="0000" selected="1">YEAR</option>
                     <% 
                        for(int i = cal.get(Calendar.YEAR); i > 1979; i--){
                     %>
                        <option value="<%=i%>"><%=i %>년</option>
                     <%
                        }
                     %>
                  </SELECT>
                  <SELECT id="releaseMonth" name="releaseMonth">
                     <option value="0" selected="1">MONTH</option>
                     <% 
                        for(int i = 1; i < 13; i++){
                           if(i < 10){
                     %>
                              <option value="0<%=i%>"><%=i %>월</option>
                     <%
                           }
                           else{
                     %>
                              <option value="<%=i%>"><%=i %>월</option>
                     <%
                           }
                        }
                     %>
                  </SELECT>
                  <SELECT id="releaseDay" name="releaseDay" style = "margin-right:6px;">
                     <option value="0" selected="1">DAY</option>
                     <% 
                        for(int i = 1; i < 32; i++){
                           if(i < 10){
                     %>
                              <option value="0<%=i%>"><%=i %>일</option>
                     <%
                           } 
                           else {
                     %>
                              <option value="<%=i%>"><%=i %>일</option>
                     <%
                           }
                        }
                     %>
                  </SELECT>
                  
               </dd>
            </dl>
         <hr style = "border:1px solid black">
            <dl>
               <dt>
                  <label for="summaryInfo">간단한설명(null허용):</label>
               </dt>
               <dd>
                  <INPUT class="text" type="text" name="summaryInfo" style = "width:215px;height:21px;margin-right:6px">
               </dd>
            </dl>
            
            <dl>
               <dt>
                  <label for="detailInfo">상세한 설명 (null허용):</label>
               </dt>
               <dd>
                  <INPUT class="text" type="text" name="detailInfo" style = "width:215px;height:21px;margin-right:6px">
               </dd>
            </dl>
            <hr style = "border:1px solid black">
            <dl>
               <dt>
                  <label for="totalInfo">설명</label>
               </dt>
               <dd style = "background-color:white">
                  <INPUT type="hidden" id="totalInfo" name="totalInfo" value=""/>
                  <textarea class="summernote" ></textarea>
               </dd>
            </dl>
            <hr style = "border:1px solid black">
            <dl>
               <dt>
                  <label for="ingredient">성분 (null허용):</label>
               </dt>
               <dd>
                  <INPUT class="text" type="text" name="ingredient" style = "width:215px;height:21px;margin-right:6px">
               </dd>
            </dl>
            
            <dl>
               <dt>
                  <label for="howToUse">사용법 (null허용):</label>
               </dt>
               <dd>
                  <INPUT class="text" type="text" name="howToUse" style = "width:215px;height:21px;margin-right:6px">
               </dd>
            </dl>

            <dl>
               <dt>
                  <label for="sellMaxNum">최대판매가능개수(default 999999):</label>
               </dt>
               <dd id="sellMaxNumForm">
                  <INPUT class="text" type="text" id="sellMaxNum0" name="sellMaxNum0" maxlength="20" style = "width:215px;height:21px;margin-right:6px"> 
               </dd>
            </dl>
            
            <dl>
               <dt>
                  <label for="stockAmount">재고</label>
               </dt>
               <dd id="stockAmountForm">
                  <INPUT class="text" type="text" id="stockAmount0" name="stockAmount0" maxlength="20" style = "width:215px;height:21px;margin-right:6px">
               </dd>
            </dl>
         <hr style = "border:1px solid black">
            <dl>
               <dt>
                  <label for="category">상품종류</label>
               </dt>
               <dd>
                  <table border="1" width="100%" style = "background-color:white">
                     <tr align="center">
                        <td width="150">1차 카테고리</td>
                        <td width="200">2차 카테고리</td>
                        <td width="600">3차 카테고리</td>
                     </tr>
                  <% 
                     int rowCount = 0;
                     int cate2Index = 0;
                     int cate2IndexEnd = 0;
                     for(int i = 0; i < category1List.size(); i++){
                        for(int j = 0; j < category2List.size(); j++){
                           if((category1List.get(i).getCategory1Code()).equals(category2List.get(j).getCategory1Code())){
                              rowCount++;
                           }
                        }
                        
                        cate2IndexEnd += rowCount;
                        
                        for(int j = cate2Index; j < cate2IndexEnd; j++){
                  %>
                           <tr>
                  <%
                              if(rowCount != 0){
                  %>
                                 <td align="center" rowspan="<%=rowCount%>"><%=category1List.get(i).getCategory1Name() %></td>
                  <%
                                 rowCount = 0;
                              }               
                  %>            
                              <td align="center"><%=category2List.get(j).getCategory2Name() %></td>
                              <td>
                  <%
                                 int cate3Count = 0;
                                 for(int k = 0; k < category3List.size(); k++){
                                    if((category3List.get(k).getCategory2Code()).equals(category2List.get(j).getCategory2Code())){
                  %>
                                       <input type="checkbox" name="category" value="<%=category3List.get(k).getCategory3Code() %>" >
                                          <font size = "3" style = "margin-right:3%"><%=category3List.get(k).getCategory3Name() %></font>
                                       
                  <%                     cate3Count++;
                                       if(cate3Count % 5 == 0){
                  %>
                                          <br>
                  <%
                                       }
                                    }
                                 }
                  %>
                              </td>
                           </tr>
                  <%
                        }
                        cate2Index = cate2IndexEnd;
                  %>
                  
                  <%
                     }
                  %>
                  </table>
<!-- --------------------------------------------------------------------------------------------------- 
                  <SELECT id="category1ListView" name="category1ListView">
                     <option value="0" selected="1">1차 카테고리</option>
                     <% 
                        for(int i = 1; i < category1List.size(); i++){
                     %>
                           <option value="<%= category1List.get(i).getCategory1Code()%>" >
                              <%=category1List.get(i).getCategory1Name() %>
                           </option>
                     <%
                        }
                     %>
                  </SELECT>
                  <INPUT type="button" name="addCategoryBtn" style="cursor: pointer" onclick="addCategoryAction()"/>
-->                  
               </dd>
            </dl>
            
            <dl>
               <dt>
                  <label for="feature">상품특징</label>
               </dt>
               <dd>
                  <table border="1" style = "background-color:white">
                     <tr align="center">
                        <td width="50">분류</td>
                        <td   width="300">내용</td>
                     </tr>
                  <%
                     for(int i = 0; i < feature1List.size(); i++){
                  %>
                        <tr>
                           <td align="center"><%=feature1List.get(i).getFeature1Name() %></td>
                           <td>
                  <%
                              for(int j = 0; j < feature2List.size(); j++){
                                 if((feature2List.get(j).getFeature1Code()).equals(feature1List.get(i).getFeature1Code())){
                  %>
                                    <input type="checkbox" name="feature" value="<%=feature2List.get(j).getFeature2Code() %>">
                                          <%=feature2List.get(j).getFeature2Name() %>
                  <% 
                                 }
                              }
                  %>
                           </td>
                        <tr>
                  <%
                     }
                     
                  %>
                  </table>
               </dd>
            </dl>
            
            
         </fieldset>
      <hr style = "border:1px solid black">
      
         <fieldset>
            <legend>상품 메인이미지</legend>
            <dl>
               <dt>
                  <label for="test">Uploaded Image:</label>
               </dt>
               <dd>
                  <input class="button" id="mainPic" name="mainPic" type="file"
                     onchange="InputMainPic()">
                  <div id="mainPicPreview"></div>
               </dd>
            </dl>
         </fieldset>
         
         <fieldset class="action">
            <INPUT class="button" type="button" value="등록"
               name="ManagerAddItemForm" style="cursor: pointer" onclick="addItemAction()"> 
            <INPUT class="button" type="button" value="취소" name="cancelBtn" 
               style="cursor: pointer" name="test" onClick="home()">
         </fieldset>
         
      </div>
   </form>
</body>
</html>