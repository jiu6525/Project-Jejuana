<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/jejuana/css/review.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<script>
$(function(){
	$("#searchForm").submit(function(){
		if($("#searchWord").val()==""){
			alert("검색어를 입력하세요");
			return false;
		}
		return true;
	});
});
</script>

<div class="review_header">
	<div class="page_feature">
		<p class="topic">여행기록</p>
		<p class="description">Travel And Record...</p>
	</div>
	<div class="search">
		<form method="get" id="searchForm" action="reviewList">
			<select class="review_selectBox" name="searchKey">
				<option value="review_subject">제목</option>
				<option value="nickname">닉네임</option>
				<option value="tag">태그</option>
			</select>
			<input class="review_searchBox" type="text" name="searchWord" id="searchWord"/>
			<input class="review_searchButton" type="submit" value="검색"/>
		</form>
	</div>
</div>

<div class="best_list">
	<hr>
	<div class="best_list_name">
		<i class="fa-solid fa-arrow-pointer best_click"></i>
		<b class="click">클릭</b> 폭발하는 여행지
	</div>
 	<swiper-container  class="mySwiper"  pagination="true" pagination-clickable="true" space-between="30" slides-per-view="5">	
    	<c:forEach var="bDTO" items="${best }">
			<swiper-slide>
				<div class="img-crop">
					<div class="inner">
		  				<img class="image" src="${bDTO.thumbnail }">
		 			</div>
		 		 </div>
				<div class="reviewList_data">
		    		<dl class="list_data">
		    			<dt class="dt_tag">${bDTO.tag }</dt>
		    			<dt class="dt_joa">
		    				<i class="fa-solid fa-heart best_heart" style="color: #d11a1a;"></i>
	    				</dt>
		    			<dt class="dt_cnt">${bDTO.joayo_hit }</dt>
		    		</dl>
		    	</div>
			  	<div class="li_sub">
			  		<a href="reviewView?plan_no=${bDTO.plan_no }">${bDTO.review_subject }</a>
		  		</div>
			  	<div class="li_id">by ${bDTO.nickname }</div>
		  </swiper-slide>
		  
		</c:forEach>
		 
    	
		<!-- <swiper-slide>
				<div class="img-crop">
					<div class="inner">
		  				<img class="image" src="../img/review/16.png">
		 			</div>
		 		 </div>
				<div>
		    		<dl class="list_data">
		    			<dt class="dt_tag">식도락</dt>
		    			<dt> · </dt>
		    			<dt class="dt_joa">
		    				<i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
	    				</dt>
		    			<dt class="dt_cnt">677</dt>
		    		</dl>
		    	</div>
			  	<div class="li_sub"><a href="reviewView?plan_no=${bDTO.plan_no }">먹기만 하다 온 기분</a></div>
			  	<div class="li_id">by 배고파</div>
		  </swiper-slide>
		  <swiper-slide>
				<div class="img-crop">
					<div class="inner">
		  				<img class="image" src="../img/review/08.jpeg">
		 			</div>
		 		 </div>
				<div>
		    		<dl class="list_data">
		    			<dt class="dt_tag">식도락/현지인맛집/친구들과</dt>
		    			<dt> · </dt>
		    			<dt class="dt_joa">
		    				<i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
	    				</dt>
		    			<dt class="dt_cnt">524</dt>
		    		</dl>
		    	</div>
			  	<div class="li_sub"><a href="reviewView?plan_no=${bDTO.plan_no }">여행 가서 살쪘다</a></div>
			  	<div class="li_id">by 레몬</div>
		  </swiper-slide>
		  <swiper-slide>
				<div class="img-crop">
					<div class="inner">
		  				<img class="image" src="../img/review/04.png">
		 			</div>
		 		 </div>
				<div>
		    		<dl class="list_data">
		    			<dt class="dt_tag">가성비/체험</dt>
		    			<dt> · </dt>
		    			<dt class="dt_joa">
		    				<i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
	    				</dt>
		    			<dt class="dt_cnt">462</dt>
		    		</dl>
		    	</div>
			  	<div class="li_sub"><a href="reviewView?plan_no=${bDTO.plan_no }">가성비 여행 bb</a></div>
			  	<div class="li_id">by 고구마</div>
		  </swiper-slide>
		  <swiper-slide>
				<div class="img-crop">
					<div class="inner">
		  				<img class="image" src="../img/review/01.jpeg">
		 			</div>
		 		 </div>
				<div>
		    		<dl class="list_data">
		    			<dt class="dt_tag">가족/액티비티</dt>
		    			<dt> · </dt>
		    			<dt class="dt_joa">
		    				<i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
	    				</dt>
		    			<dt class="dt_cnt">426</dt>
		    		</dl>
		    	</div>
			  	<div class="li_sub"><a href="reviewView?plan_no=${bDTO.plan_no }">가족들이랑 제주도~</a></div>
			  	<div class="li_id">by 밥밥</div>
		  </swiper-slide>
		  <swiper-slide>
				<div class="img-crop">
					<div class="inner">
		  				<img class="image" src="../img/review/13.jpg">
		 			</div>
		 		 </div>
				<div>
		    		<dl class="list_data">
		    			<dt class="dt_tag">나홀로/휴가</dt>
		    			<dt> · </dt>
		    			<dt class="dt_joa"><i class="fa-solid fa-heart" style="color: #d11a1a;"></i></dt>
		    			<dt class="dt_cnt">364</dt>
		    		</dl>
		    	</div>
			  	<div class="li_sub"><a href="reviewView?plan_no=${bDTO.plan_no }">휴가로는 역시 여기!</a></div>
			  	<div class="li_id">by 비비</div>
		  </swiper-slide> -->
		  
 	</swiper-container>
</div> 
<div class="reviewBox">
	<hr>
	<div class="review_list">
		<c:forEach var="rDTO" items="${list }">
			<div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="${rDTO.thumbnail }">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">${rDTO.tag }</li>
					<li class="li_sub">
						<a href="reviewView?plan_no=${rDTO.plan_no }">${rDTO.review_subject }</a>
					</li>
					<li class="li_id">by ${rDTO.nickname }</li>
					
					<!-- 조회수 -->
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 ${rDTO.review_hit }
					 </li>
					 
					 <!-- 좋아요 -->
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> ${rDTO.joayo_hit }
					</li>
					<li class="review_date">${rDTO.writedate }</li>
				</ul>
		  	</div>
		  	
		</c:forEach>
		<!-- <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/10.jpg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">식도락/유명맛집/숨은맛집</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">제주 맛집 알려 드림</a></li>
					<li class="li_id">by 먹짱</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 211
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 153
					</li>
					<li class="review_date">2023-04-26</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/07.jpeg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">가족/액티비티</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">좋았던 제주도 여행</a></li>
					<li class="li_id">by 감자</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 544
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 329
					</li>
					<li class="review_date">2023-04-24</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/09.jpg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">나홀로/감성/풍경</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">바이크 타고 드라이브</a></li>
					<li class="li_id">by 산타</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 498
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 236
					</li>
					<li class="review_date">2023-04-22</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/06.jpg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">감성/풍경/추억</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">멍때리기 좋은 날씨</a></li>
					<li class="li_id">by 889</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 521
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 254
					</li>
					<li class="review_date">2023-04-22</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/08.jpeg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">식도락/현지인맛집/친구들과</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">여행 가서 살쪘다</a></li>
					<li class="li_id">by 레몬</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 992
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 524
					</li>
					<li class="review_date">2023-04-21</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/05.jpg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">가족/도장깨기</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">제주도 도장깨기</a></li>
					<li class="li_id">by yesss</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 654
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 251
					</li>
					<li class="review_date">2023-04-19</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/04.png">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">가성비/체험</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">가성비 여행 bb</a></li>
					<li class="li_id">by 고구마</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 776
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 462
					</li>
					<li class="review_date">2023-04-18</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/03.jpg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">숨은맛집/버스여행/가성비</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">뚜벅이 코스</a></li>
					<li class="li_id">by momo</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 468
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 157
					</li>
					<li class="review_date">2023-04-16</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/02.jpg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">동쪽/식도락/힐링</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">날씨 좋아</a></li>
					<li class="li_id">by 여행좋아</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 674
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 320
					</li>
					<li class="review_date">2023-04-16</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/01.jpeg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">가족/액티비티</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">가족들이랑 제주도~</a></li>
					<li class="li_id">by 밥밥</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 652
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 426
					</li>
					<li class="review_date">2023-04-15</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/11.jpg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">가족/풍경</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">노을 보며 힐링</a></li>
					<li class="li_id">by 밥밥</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 589
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 269
					</li>
					<li class="review_date">2023-04-15</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/12.jpeg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">힐링</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">바닷물이 너무 투명했던</a></li>
					<li class="li_id">by yolo</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 667
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 314
					</li>
					<li class="review_date">2023-04-13</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/13.jpg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">나홀로/휴가</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">휴가로는 역시 여기!</a></li>
					<li class="li_id">by 비비</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 711
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 364
					</li>
					<li class="review_date">2023-04-13</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/14.jpg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">추억/뚜벅이</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">애인이랑 데이트</a></li>
					<li class="li_id">by 땅땅</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 657
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 299
					</li>
					<li class="review_date">2023-04-10</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/15.jpg">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">오름/투어</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">힐링하고 왔습니다</a></li>
					<li class="li_id">by fofo</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 406
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 233
					</li>
					<li class="review_date">2023-04-10</li>
				</ul>
		  </div>
		  <div class="review">
				<div class="img-crop">
					<div class="inner">
		  				<img class="thumbnail" src="../img/review/16.png">
		 			</div>
		 		 </div>
				<ul>
					<li class="li_tag">식도락</li>
					<li class="li_sub"><a href="reviewView?plan_no=${rDTO.plan_no }">먹기만 하다 온 기분</a></li>
					<li class="li_id">by 배고파</li>
					<li class="review_hit">
						<i class="fa-solid fa-street-view viewCount_icon"></i>
						 972
					 </li>
					 <li class="heartBox">
						<i class="fa-solid fa-heart joaCount_icon" style="color: #d11a1a;"></i> 677
					</li>
					<li class="review_date">2023-04-10</li>
				</ul>
		  </div> -->
	</div>
</div>