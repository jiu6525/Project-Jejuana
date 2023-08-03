<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	/* Swiper */
    .swiper {
      width: 100%;
      height: 100%;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    .autoplay-progress {
      position: absolute;
      right: 16px;
      bottom: 16px;
      z-index: 10;
      width: 48px;
      height: 48px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
      color: var(--swiper-theme-color);
    }
    .autoplay-progress svg {
      --progress: 0;
      position: absolute;
      left: 0;
      top: 0px;
      z-index: 10;
      width: 100%;
      height: 100%;
      stroke-width: 4px;
      stroke: var(--swiper-theme-color);
      fill: none;
      stroke-dashoffset: calc(125.6 * (1 - var(--progress)));
      stroke-dasharray: 125.6;
      transform: rotate(-90deg);
    }
    .main_clock{
    	display:none;
    }
	/* Swiper */
	header {
		display: none;
	}
	body{
		overflow:hidden; 
		height:100%;
	}
	img {
		width: 250px;
	}
	.mainContainer {
		width: 100%
	}
	.leftContainer {
		display: inline-block;
		width: 35%;
		height: 929px;
	}
	.top_box {
		width: 100%;
		align-items: center;
		float: left;
		height: 91px
	}
	.boxItem {
		display: inline-block;
		font-family: GmarketSansMedium;
	}
	.main_login{
		width: 100px;
		margin: 10px 0 0 50px;
		height: 50px;
		border: none;
		background: #2C394B;
		border-radius:5px;
		padding: 10% 10% 0 0;
	}
	.main_login_button>a{
		font-family: GmarketSansMedium;
		color: white;
		text-decoration-line:none;
		text-align:center;
		margin-right:9px;
	}
	.main_logout{
		/*display:none;*/
		width: 100px;
		margin: 10px 0 0 50px;
		height: 50px;
		border: none;
		background: #2C394B;
		border-radius:5px;
		padding: 10% 7% 0 0;
	}
	.main_mypage{
		/*display:none;*/
		width: 100px;
		margin: 10px 0 0 50px;
		height: 50px;
		border: none;
		background: #2C394B;
		border-radius:5px;
		padding: 10% 3% 0 0;
	}
	.main_logout_button>a{
		font-family: GmarketSansMedium;
		color: white;
		text-decoration-line:none;
		text-align:center;
		margin-right:9px;
	}
	.main_border_box {
		width: 90%;
		height: 90%;
	}
	.main_border_box{
		font-family: GmarketSansMedium;
	}
	.top_box>img {
		float: left;
	}
	.top_box>p {
		position: absolute;
		top: 52px;
		float: left;
		text-align: center;
	}
	.content_box1 {
		float: left;
		border: 1px solid #ddd;
		width: 100%;
		height: 419px;
		text-align: center;
	}
	.content_box1>div {
		margin: 0 auto
	}
	.content_box1>div>h3 {
		margin-top: 54px;
		margin-bottom: 26px;
		font-size: 20px;
	}
	.content_box1>div>div {
		widht: 100%
	}
	.content_box1>div>div>img {
		width: 47%;
	}
	.main1_button{
		width: 100px;
		height: 50px;
		margin-top: 6px;
		border: none;
		background: #082032;
		color: white;
		border-radius:5px;
	}
	.content_box2 {
		float: left;
		border: 1px solid #ddd;
		width: 100%;
		height: 419px;
		text-align: center;
		text-align: center;
	}
	.content_box2>div {
		margin: 0 auto
	}
	.content_box2>div>h3 {
		margin-top: 54px;
		margin-bottom : 26px;
		font-size:20px
	}
	.content_box2>div>div {
		width: 100%
	}
	.content_box2>div>div>img {
		width: 68%;
	}
	.main2_button{
		width: 100px;
		height: 50px;
		margin-top: 6px;
		border: none;
		background: #082032;
		color: white;
		border-radius:5px;
	}
	.rightContainer {
		display: inline-block;
		width: 65%;
		float: right;
		position: relative
	}
	.rightContainer img {
		width: 100%;
		height: 929px;
	}
	
	.main_category {
		position: absolute;
		transform: translate(0%, 0%);
		top: 0%;
		text-align: right;
		width: 13%;
		right: 0%;
		z-index:9999999;
	}
	.main_category>div {
		
	}
	.main_category>div>img {
		width: 50px;
		height: 25px
	}
	.main_category>ul {
		padding: 190% 10% 0 0;
	}
	.main_category ul>li {
		font-family: GmarketSansMedium;
		font-size: 25px;
		/*border: 1px solid gray;
		background: white;*/
		margin-bottom: 50px;
	}
	.main_category ul>li>a{
		color:#2C394B;
		text-decoration-line:none;
	}
</style>
	<div class="mainContainer">
		<div class="leftContainer">
			<!--로고+페이지설명 -->
			<a class="top_box" href="#">
				<!--로고 -->
				<img class="boxItem" src="img/jejuana.png">
				<p class="boxItem">MAKE YOUR ROUTE OPTIMIZED</p>
			</a>
			<!-- 플래너 작성 -->
			<div class="content_box1">
				<div class="main_border_box">
					<h3>여행 스케줄링 플래너</h3>
					<div class="main_planner_img"><img src="img/main_planner_img.png"></div>
					<button class="main1_button">시작하기</button>
				</div>
			</div>
			<!--코스추천페이지 -->
			<div class="content_box2">
				<div class="main_border_box">
					<h3>제주아나 코스추천</h3>
					<div><img src="img/main_course_img.png"></div>
					<button class="main2_button">시작하기</button>
				</div>
			</div>
		</div>
		<div class="rightContainer">
			<div class="main_imgBox">
				<!-- Swiper -->
					<div class="swiper mySwiper">
					    <div class="swiper-wrapper">
					      <div class="swiper-slide"><img src="img/main_image12.jpg"></div>
					      <div class="swiper-slide"><img src="img/main_image2.jpg"></div>
					      <div class="swiper-slide"><img src="img/main_image3.jpg"></div>
					      <div class="swiper-slide"><img src="img/main_image4.jpg"></div>
					      <div class="swiper-slide"><img src="img/main_image5.jpg"></div>
			          	</div>
					    <div class="autoplay-progress">
					      <svg viewBox="0 0 48 48">
					      </svg>
					      <span class="main_clock"></span>
					    </div>
					  </div>
				<!-- Swiper -->
			</div>
			<div class="main_category">
				
					<!-- 로그인폼 이동 -->
					<c:if test="${loginStatus!='Y' }">
						<div class="main_login_button main_login">
							<a href="login">로그인</a>
						</div>
					</c:if>
					<c:if test="${loginStatus=='Y' }">
						<div class="main_logout_button main_logout">
							<a href="logout">로그아웃</a>
						</div>
						<div class="main_logout_button main_mypage">
							<!-- 마이페이지 링크 넣어주기 -->
							<a href="#">마이페이지</a>
						</div>
					</c:if>				
				<ul>
					<li><a href="#">여행지목록</a></li>
					<li><a href="#">여행기록</a></li>
					<li><a href="#">여행친구</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Swiper -->
	<script>
		const progressCircle = document.querySelector(".autoplay-progress svg");
    const progressContent = document.querySelector(".autoplay-progress span");
    var swiper = new Swiper(".mySwiper", {
      spaceBetween: 0,
      centeredSlides: true,
      autoplay: {
        delay: 5000,
        disableOnInteraction: false
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
      },
      on: {
        autoplayTimeLeft(s, time, progress) {
          progressCircle.style.setProperty("--progress", 1 - progress);
          progressContent.textContent = `${Math.ceil(time / 1000)}s`;
        }
      }
    });
	</script>
	<!-- Swiper -->
</body>
</html>
