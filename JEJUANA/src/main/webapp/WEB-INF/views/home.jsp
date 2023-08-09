<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- css -->
<link rel="stylesheet" href="/jejuana/css/home.css"/>

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
					<h1>Jejuana</h1>
					<h3>여행 스케줄링 플래너</h3>
					<div class="main_planner_img"><img src="img/main_planner_img.png"></div>
					<button class="main1_button" onclick="location.href='planner'">시작하기</button>
				</div>
			</div>
			<!--코스추천페이지 
			<div class="content_box2">
				<div class="main_border_box">
					<h3>제주아나 코스추천</h3>
					<div><img src="img/main_course_img.png"></div>
					<button class="main2_button">시작하기</button>
				</div>
			</div>-->
		</div>
		<div class="rightContainer">
			<div class="main_imgBox">
				<!-- Swiper -->
					<div class="swiper mySwiper">
					    <div class="swiper-wrapper">
					      <div class="swiper-slide"><img src="img/main_image12.png"></div>
					      <div class="swiper-slide"><img src="img/main_image2.png"></div>
					      <div class="swiper-slide"><img src="img/main_image3.png"></div>
					      <div class="swiper-slide"><img src="img/main_image4.jpg"></div>
					      <div class="swiper-slide"><img src="img/main_image5.png"></div>
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
							<a href="mypage/mypagePlan">마이페이지</a>
						</div>
					</c:if>				
				<ul>
					<li><a href="/jejuana/map_list">여행지목록</a></li>
					<li><a href="/jejuana/review/reviewList">여행기록</a></li>
					<!-- <li><a href="#">여행친구</a></li> -->
					<li><a href="/jejuana/notice/noticeList">고객센터</a></li>
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