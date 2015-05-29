<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
<title>행어</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="google" value="notranslate" />
<meta name="application-name" content="행거">
<meta name="theme-color" content="#ff5400">
<meta property="og:site_name" content="행거" />
<meta property="fb:app_id" content="564367626917477" />
<meta property="article:publisher"
   content="https://www.facebook.com/unniepouch" />
<meta property="og:type" content="article" />
<meta property="og:title" content="행거" />
<meta property="og:description"
   content="광고 없는 솔직한 화장품 리뷰를 찾아보고, 직접 물어보세요! 2014년 구글플레이가 선정한 BEST 30 선정, 정말 믿을 수 있는 뷰티앱이예요" />
<meta property="og:image"
   content="https://d33ur1yh5ph6b5.cloudfront.net/f5732718-abbb-4a5b-b144-ece52f8db8b3" />

<link rel="shortcut icon" type="image/webp"
   href="/images/unpa-logo.png">
<link rel="stylesheet" media="screen"
   href="/css/stylesheets/normalize.css">
<link rel="stylesheet" media="screen"
   href="/css/semantic/semantic.min.css">
<link rel="stylesheet" media="screen"
   href="/css/bootstrap/bootstrap.css">
<link rel="stylesheet" media="screen"
   href="/css/ionicons/ionicons.min.css">
<link rel="stylesheet" media="screen"
   href="/css/stylesheets/animate.css">
<link rel="stylesheet" media="screen"
   href="/css/fontello/fontello.css">
<link rel="stylesheet" media="screen"
   href="/css/raty/jquery.raty.css" />
<link rel="stylesheet" media="screen"
   href="/css/stylesheets/b72b7e9e95b2e0b8be8d51f9b65b96e0-unpa.min.css">

<script src="/js/javascripts/jquery-1.11.3.min.js"
   type="text/javascript"></script>
<script src="/js/javascripts/modernizr.custom.js"
   type="text/javascript"></script>
<script src="/js/raty/jquery.raty.js" type="text/javascript"></script>
<script src="/js/semantic/semantic.min.js"
   type="text/javascript"></script>
<script src="/js/bootstrap/bootstrap.min.js"
   type="text/javascript"></script>
<script src="/js/javascripts/history.js" type="text/javascript"></script>
<script src="/js/javascripts/jquery.cookie.js"
   type="text/javascript"></script>
<script src="/js/javascripts/typeahead.bundle.js"
   type="text/javascript"></script>
<script src="/js/javascripts/main.js" type="text/javascript"></script>

</head>
<body>
   <!-- 
<nav class="navbar navbar-inverse" style="position:fixed; z-index:999; width:100%;height:auto;" >
  <div class="container-fluid" >
      <ul class="nav navbar-nav">
         <li><img src="assets/images/unpa-logo.png" width="100px" height="50px" ></li>
        <li><a href="#">마크제이콥스</a></li>
        <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">검색</button>
      </form>
      </ul>
    </div>
</nav>
<div style="width:100%;position:fixed;z-index:1000;margin-top:50px;background-color:black;">
   <div style="width:50%;float:left;background:red;">
      <ul class="nav nav-pills">   
          <li><a href="#" style="margin-left:200px" >SHOP</a>
           <li><a href="#" >BRAND</a>
           <li><a href="#" >SALE</a>
       </ul>
   </div>
   <div style="width:50%;float:right;background:pink;">
      <ul class="nav nav-pills">
      <li><a href="#"  style="backgound-color:pink;margin-left:200px">REVIEWS</a>
        <li><a href="#"  style="backgound-color:pink;">TIPS</a>
        <li><a href="#"  style="backgound-color:pink;">HANG OUT</a>
        </ul>
     </TD>
   </div>
</div>
-->
   <div style="width: 100%;"
      class="hidden-xs navbar navbar-default navbar-fixed-top unpa-navbar HOME"
      role="navigation">
      <div class="container">

         <!-- 
         <div class="mobile-search-box">
            <span class="nav-search-wrap"> <input type="text" name="q"
               class="nav-search" value="" placeholder="뷰티리뷰 검색" required
               autocomplete="off" /> <i class="ion ion-android-search"></i> <input
               type="submit" style="display: none;">
            </span>
         </div>
         <div class="desktop-search-box">
            <div class="nav-search-wrap">
                  <input type="text" name="q" class="nav-search typeahead" value=""
                     required autocomplete="off" />
                  <button type="submit" style="display: none;"></button>
            </div>
            <button type="button"
               class="btn btn-default search-sub-infos-toggle">
               <i class="ion-navicon-round"></i> <span class="caret"></span>
            </button>
         </div>
       -->

         <div class="navbar-header">
            <a class="navbar-brand" href="/"> <img
               style="height: 32px; padding: 3px 0;"
               src="/assets/images/hanger.png" id="brand-icon" alt="Hanger" />
            </a>
         </div>

         <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
               <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">검색</button>
         </form>
         <!-- 기본페이지에는 이거보임 -->
         <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right unpa-navbar-right">
               <li>
                  <button class="compose-button sign-in-require-action">
                     <i class="unpacon-pencil"></i>
                  </button>
               </li>
               <li><a href="/signin" class="remove-border">로그인</a></li>
               <li><a href="/signin" class="remove-border">회원가입</a></li>
            </ul>
         </div>
      </div>
   </div>
   <div
      class="hidden-xs navbar navbar-default navbar-fixed-top unpa-navbar HOME"
      style="width: 100%; position: fixed; z-index: 1000;">
      <div
         style="width: 50%; float: left; background: red; margin-top: 50px">
         <ul class="nav nav-pills">
            <li><a href="#" style="margin-left: 150px">SHOP</a>
            <li><a href="#">BRAND</a>
            <li><a href="#">SALE</a>
         </ul>
      </div>
      <div style="width: 50%; float: right; margin-top: 50px">
         <ul class="nav nav-pills">
            <li><a href="#" style="margin-left: 100px;">REVIEWS</a>
            <li><a href="#">TIPS</a>
            <li><a href="#">HANG OUT</a>
         </ul>
      </div>
   </div>
   <!--  기본페이지 end -->
   <!-- 화면이작아지면 보이는페이지 -->
   <div
      class="visible-xs navbar navbar-default navbar-fixed-top unpa-navbar HOME"
      style="width: 100%; position: fixed; z-index: 1000; margin: 50px 0px 0px;">
      <div style="width: 50%; float: left; background: red;">
         <ul class="nav navbar-nav navbar-middle unpa-navbar-middle">
            <a href="#" style="margin-left:120px">SHOP</a>
            <a href="#">BRAND</a>
            <a href="#">SALE</a>
         </ul>
      </div>
      <div style="width: 50%; float: right; background: pink;">
         <ul class="nav navbar-nav navbar-middle unpa-navbar-middle">

            <span class="text-right"> <a class="unpa-xs-navbar-menu sign-in"
               href="/signin" style="margin-left: 70px;"> REVIEWS </a> <a
               class="unpa-xs-navbar-menu sign-in" href="/signin">TIPS </a> <a
               class="unpa-xs-navbar-menu sign-in" href="/signin">HANG OUT </a>

            </span>

            <!--
           
            <a href="#" style="backgound-color: pink; margin-left: 70px">REVIEWS</a>
            <a href="#" style="backgound-color: pink;">TIPS</a>
            <a href="#" style="backgound-color: pink;">HANG OUT</a>
         -->
         </ul>
      </div>
   </div>
   <div id="unpa-xs-navbar"
      class="visible-xs navbar navbar-default navbar-fixed-top unpa-navbar HOME"
      role="navigation">
      <div class="navbar-header">
         <a class="navbar-brand" href="/"> <img
            style="height: 32px; padding: 3px 0;"
            src="/assets/images/hanger.png" id="brand-icon" alt="Hanger" />
         </a>
      </div>
      </span> <span class="right"> <a class="unpa-xs-navbar-menu sign-in"
         href="/signin"> 로그인 </a>
      </span> <span class="right" style="margin-right: 80px;"> <a
         class="unpa-xs-navbar-menu sign-in" href="/signin"> 회원가입 </a>
      </span>
   </div>

   <!-- 화면이작으면 보이는 페이지 END -->

   <div class="search-sub-infos">
      <span class="close"><i class="ion ion-close-round"></i></span>
      <div class="left"></div>
   </div>
   <div class="container" style="margin-top: 100px">
      <div class="unpa-home-wrap">
         <div class="row unpa-home-section">
            <div class="col-xs-12">
               <div class="hot-issue">
                  <div id="carousel-example-generic"
                     class="carousel slide unpa-home-hot-issue-carousel"
                     data-ride="carousel">
                     <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0"
                           class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                     </ol>
                     <div class="carousel-inner" role="listbox">
                        <div class="item active">
                           <a href="/article/detail/2b2b74d7-91e4-4387-b562-219e8613df2d">
                              <div class="image"
                                 style="background-image: url('https://d33ur1yh5ph6b5.cloudfront.net/a39dfb3f-4384-4ae7-8aa4-f02f4befcbc8-mid')"></div>
                              <div class="carousel-caption hidden-xs">
                                 <div class="hot-issue-label">unpa</div>
                                 <div class="hot-issue-title">함께여서 더 즐거웠던 언파x클리오 뷰티 클래스</div>
                              </div>
                           </a>
                        </div>

                        <div class="item ">
                           <a href="/article/detail/9a6add19-7ae4-4fc3-b1bf-350eef5ae9c6">
                              <div class="image"
                                 style="background-image: url('https://d33ur1yh5ph6b5.cloudfront.net/10562197-e508-4827-a303-35d1a8956bc4-mid')"></div>
                              <div class="carousel-caption hidden-xs">
                                 <div class="hot-issue-label">unpa</div>
                                 <div class="hot-issue-title">주간 우수 리뷰 당첨자 10명을 발표합니다!</div>
                              </div>
                           </a>
                        </div>

                        <div class="item ">
                           <a href="/article/detail/3b7231f8-6fc9-486a-95bd-f306ea780237">
                              <div class="image"
                                 style="background-image: url('https://d33ur1yh5ph6b5.cloudfront.net/6a46d73f-fcb9-4f16-a4e1-bfda7f045258-mid')"></div>
                              <div class="carousel-caption hidden-xs">
                                 <div class="hot-issue-label">리얼추천</div>
                                 <div class="hot-issue-title">한번 빠지면 헤어나올 수 없는 클리오
                                    베스트아이템 추천!</div>
                              </div>
                           </a>
                        </div>

                        <div class="item ">
                           <a href="/article/detail/9587fa83-9e7a-4255-a673-79f557f53116">
                              <div class="image"
                                 style="background-image: url('https://d33ur1yh5ph6b5.cloudfront.net/13a51083-7a5b-4f13-9480-ba76471944fe-mid')"></div>
                              <div class="carousel-caption hidden-xs">
                                 <div class="hot-issue-label">스킨케어</div>
                                 <div class="hot-issue-title">연예인 피부는 돈? 맞아요 근데 세안 습관이
                                    그보다 더! 중요해요~</div>
                              </div>
                           </a>
                        </div>

                        <div class="item ">
                           <a href="/article/detail/3edb4e5e-329c-42fb-942c-0a974d2457ff">
                              <div class="image"
                                 style="background-image: url('https://d33ur1yh5ph6b5.cloudfront.net/5168f54e-9ee8-407c-8873-ce3f49d9e63a-mid')"></div>
                              <div class="carousel-caption hidden-xs">
                                 <div class="hot-issue-label">unpa</div>
                                 <div class="hot-issue-title">5월 넷째 주! 놓치지 말아야할 주요 브랜드
                                    세일 정보</div>
                              </div>
                           </a>
                        </div>
                     </div>
                     <a class="left carousel-control" href="#carousel-example-generic"
                        role="button" data-slide="prev"> <span
                        class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                     </a> <a class="right carousel-control"
                        href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"
                        aria-hidden="true"></span> <span class="sr-only">Next</span>
                     </a>
                  </div>
               </div>
            </div>
         </div>
         <div class="row unpa-home-section">
            <div class="col-xs-12"></div>
         </div>
         <div class="row unpa-home-section">
            <div class="col-xs-12">
               <div class="unpa-home-section-title">
                  인기 제품 <span class="sub-title">Product</span>
               </div>

               <div class="popular-product">
                  <div class="row">
                     <%
                        for (int i = 1; i < 5; i++) {
                     %>
                     <div class="col-sm-3 unpa-xs-padding-bottom">
                        <div class="unpa-card unselectable unpa-product"
                           id="a2eab6e0-609d-41a9-9922-8010a74c6ceb"
                           data-unpa-url="/product/detail/a2eab6e0-609d-41a9-9922-8010a74c6ceb">
                           <div class="main-section">
                              <div class="review-main-image-wrapper">
                                 <div class="review-main-image"
                                    style="background-image: url('https://d33ur1yh5ph6b5.cloudfront.net/aeae4e4b-3f06-11e4-a530-06530c0000b4-small')"></div>
                                 <div class="rating-action-box pullUp">
                                    <div class="title">별점주기</div>
                                    <div class="raty unpa-product-rating"
                                       data-unpa-rating-url="/product/rating/a2eab6e0-609d-41a9-9922-8010a74c6ceb"></div>
                                 </div>
                                 <script>
                                    jQuery(
                                          'div.raty.unpa-product-rating')
                                          .raty(
                                                {
                                                   half : true,
                                                   score : function() {
                                                      return $(
                                                            this)
                                                            .data(
                                                                  'unpa-rating-my-rating');
                                                   },
                                                   starHalf : '/assets/raty/images/unpa-star-half.png',
                                                   starOff : '/assets/raty/images/unpa-star-empty.png',
                                                   starOn : '/assets/raty/images/unpa-star.png'
                                                });
                                 </script>
                              </div>
                              <div class="field brand-name">더페이스샵</div>
                              <div class="field product-name">러블리믹스 유&amp;아이즈 03 피치
                                 키스드</div>
                              <div class="field rating-price-wrap">
                                 <div class="field rating">
                                    <span class="stars"> <img
                                       src="/assets/images/icons/star.png" alt="" /> <img
                                       src="/assets/images/icons/star.png" alt="" /> <img
                                       src="/assets/images/icons/star.png" alt="" /> <img
                                       src="/assets/images/icons/star-half.png" alt="" /> <img
                                       src="/assets/images/icons/star-empty.png" alt="" />
                                    </span> <span class="rating-value">3.54</span> <span
                                       class="message">(참여92)</span>
                                 </div>
                                 <div class="field price">
                                    <span class="title">가격</span> <span class="value">3,900원</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <%
                        }
                     %>
                  </div>
               </div>

               <div class="row unpa-home-section">
                  <div class="col-xs-12">
                     <div class="unpa-home-section-title">
                        인기 브랜드 <span class="sub-title">Brand</span>
                     </div>

                     <div class="popular-brand">
                        <div class="row">

                           <!--  인기브랜드 for문 시작  -->
                           <%
                              for (int i = 1; i < 5; i++) {
                           %>
                           <div class="col-sm-3 unpa-xs-padding-bottom">
                              <div class="unpa-card unselectable unpa-brand"
                                 id="ade5b21a-3b44-4ef9-b22a-3e8f2914aebb"
                                 data-unpa-url="/brand/detail/ade5b21a-3b44-4ef9-b22a-3e8f2914aebb">
                                 <div class="main-section">
                                    <div class="review-main-image-wrapper">
                                       <div class="review-main-image"
                                          style="background-image: url('https://d33ur1yh5ph6b5.cloudfront.net/a19ef240-3976-11e4-a530-06530c0000b4-small')"></div>
                                    </div>
                                    <div class="field brand-name">나스(NARS)</div>
                                    <div class="field count-info">
                                       <div class="field">
                                          <span class="title">좋아요</span> <span class="value">10,428</span>
                                       </div>
                                       <div class="field">
                                          <span> <span> <span class="title">등록제품</span>
                                                <span class="value">589</span>
                                          </span> <span class="divider"></span> <span> <span
                                                class="title">등록리뷰</span> <span class="value">55</span>
                                          </span>
                                          </span>
                                       </div>
                                    </div>

                                 </div>
                              </div>
                           </div>
                           <%
                              }
                           %>
                           <!--  인기브랜드 for문 END  -->
                        </div>
                     </div>
                  </div>

               </div>

               <div class="row unpa-home-section">

                  <div class="col-sm-6 unpa-xs-padding-bottom">
                     <div class="popular-review">
                        <div class="unpa-home-section-title">
                           <a class="read-more-button" href="/issue/review">더보기</a> <span>인기
                              리뷰</span> <span class="sub-title">Review</span>
                        </div>


                        <div class="row">
                           <div class="col-xs-6 unpa-xs-narrow-padding">
                              <a href="/review/detail/33e4cd40-7cf8-4d48-97c5-7fb70d197aa4"
                                 class="review-card unpa-home-card unpa-card-box-shadow">
                                 <div class="image"
                                    style="background-image: url('https://d33ur1yh5ph6b5.cloudfront.net/52ad3857-bee1-453c-843a-bc2b7f2a44ab-small')"></div>
                                 <div class="content">
                                    <div class="title">화사하게 톤업 시켜주는 쌩얼 쿠션 추천</div>
                                    <div class="category">페이스 메이크업</div>
                                 </div>
                              </a>
                           </div>




                           <div class="col-xs-6 unpa-xs-narrow-padding">
                              <a href="/review/detail/32a89886-41ac-4f3d-9cca-39cd2ededc28"
                                 class="review-card unpa-home-card unpa-card-box-shadow">
                                 <div class="image"
                                    style="background-image: url('https://d33ur1yh5ph6b5.cloudfront.net/9e1d581b-cda6-4adc-a741-1260acec668b-small')"></div>
                                 <div class="content">
                                    <div class="title">여름에 쓰기 좋은 투명한 핑크컬러 립 틴트</div>
                                    <div class="category">립 메이크업</div>
                                 </div>
                              </a>
                           </div>

                        </div>

                     </div>
                  </div>


                  <div class="col-sm-6 unpa-xs-padding-bottom">
                     <div class="popular-tip">
                        <div class="unpa-home-section-title">
                           <a class="read-more-button" href="/issue/beautytip">더보기</a> <span>인기
                              뷰티팁</span> <span class="sub-title">Tip</span>
                        </div>


                        <div class="row">
                           <div class="col-xs-6 unpa-xs-narrow-padding">
                              <a href="/tip/detail/ddf99cdd-f269-4c7f-a1ed-fae4240ce663"
                                 class="tip-card unpa-home-card unpa-card-box-shadow">
                                 <div class="image"
                                    style="background-image: url('https://d33ur1yh5ph6b5.cloudfront.net/05a39899-f787-40d7-bedf-a5fafc3b822c-small')"></div>
                                 <div class="content">
                                    <div style="text-overflow: ellipsis;" class="title">하루
                                       10분만 투자해서 신민아 어깨 만들기!</div>
                                    <div class="category">팔로우미</div>
                                 </div>
                              </a>
                           </div>




                           <div class="col-xs-6 unpa-xs-narrow-padding">
                              <a href="/tip/detail/e09a065e-9e24-4ee5-b7ac-27d060912189"
                                 class="tip-card unpa-home-card unpa-card-box-shadow">
                                 <div class="image"
                                    style="background-image: url('https://d33ur1yh5ph6b5.cloudfront.net/5b027911-ef17-4c31-ace8-80bf7bdea513-small')"></div>
                                 <div class="content">
                                    <div style="text-overflow: ellipsis;" class="title">완전
                                       초간단! 15분만에 고체향수 만들기~</div>
                                    <div class="category">D.I.Y</div>
                                 </div>
                              </a>
                           </div>

                        </div>

                     </div>
                  </div>

               </div>


               <div class="row unpa-home-section">
                  <div class="col-xs-12">
                     <div class="unpa-home-section-title">
                        인기 사용자 <span class="sub-title">User</span>
                     </div>
                     <div class="popular-user">
                        <div class="row">

                           <!-- 인기사용자 start -->
                           <%
                              for (int i = 1; i < 20; i++) {
                           %>
                           <div class="col-sm-2 unpa-xs-padding-bottom">
                              <div class="unpa-card user-card followable   "
                                 data-unpa-user-uuid="5e7cc1f207d683fd7b22aa15c73fd3ac">
                                 <a href="/@%EB%B8%94%EB%A6%A5">
                                    <div class="user-image"
                                       style="background-image: url('https://d33ur1yh5ph6b5.cloudfront.net/35dbe522-2115-11e3-993f-06ebb80000ba-thumbnail')"></div>
                                    <div class="user-nickname">블릥</div>
                                    <div class="user-skin-info"></div>
                                    <div class="unpa-user-labels"></div>
                                    <div class="user-count-info">
                                       <div>
                                          <i class="ion-person"></i> 1
                                       </div>
                                       <div>
                                          <i class="ion-edit"></i> 0
                                       </div>
                                       <div>
                                          <i class="ion-heart"></i> 170
                                       </div>
                                    </div>
                                 </a>
                                 <button class="user-follow-button followed">
                                    <i class="ion-checkmark-round"></i> 팔로우 중
                                 </button>
                                 <button class="user-follow-button">
                                    <i class="unpacon-user"></i> 팔로우
                                 </button>
                              </div>
                           </div>
                           <%
                              }
                           %>
                           <!-- 인기사용자 end -->
                        </div>

                     </div>
                  </div>
               </div>
            </div>
            <script>
               jQuery(document)
                     .ready(
                           function() {
                              var currentIndex = 0;
                              var size = jQuery(
                                    ".home-real-time-tags .tag")
                                    .size();

                              setInterval(
                                    function() {
                                       currentIndex++;
                                       if (currentIndex >= size) {
                                          currentIndex = 0;
                                       }
                                       jQuery(
                                             ".home-real-time-tags .tag")
                                             .removeClass(
                                                   "active");
                                       jQuery(
                                             ".home-real-time-tags .tag .right")
                                             .removeClass(
                                                   "pullUp");
                                       jQuery(
                                             jQuery(
                                                   ".home-real-time-tags .tag")
                                                   .get(
                                                         currentIndex))
                                             .addClass("active");
                                       jQuery(
                                             jQuery(
                                                   ".home-real-time-tags .right")
                                                   .get(
                                                         currentIndex))
                                             .addClass("pullUp");
                                    }, 3000);
                           });
            </script>
         </div>
         <div class="footer">
            <div class="container">풋터</div>
         </div>
      </div>
</body>
</html>