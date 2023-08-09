<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/jejuana/css/r-popup.css"/>

<script>

//별점 체크 여부

</script>
<div class="stars">
	<form method="post" action="reviewStarOk" id="starForm" enctype="multipart/form-data">
		<input type="hidden" name="place_no" id="place_no" value="${dto.place_no }">
		<img class="reviewStar_back" src="../img/reviewStar_back.jpg">
		<div class="star_txt1">[${dto.place_name }]에 대한 별점을 남겨 주세요!</div>
		<div class="star_txt2">다른 이용자들에게 많은 도움이 됩니다.</div>
		<div class="star-rating space-x-4 mx-auto">
			<input type="radio"  id="5-stars" name="rate" value="5" v-model="ratings"/>
			<label for="5-stars" class="star pr-4">★</label>
			<input type="radio"  id="4-stars" name="rate" value="4" v-model="ratings"/>
			<label for="4-stars" class="star">★</label>
			<input type="radio"  id="3-stars" name="rate" value="3" v-model="ratings"/>
			<label for="3-stars" class="star">★</label>
			<input type="radio"  id="2-stars" name="rate" value="2" v-model="ratings"/>
			<label for="2-stars" class="star">★</label>
			<input type="radio"  id="1-stars" name="rate" value="1" v-model="ratings" />
			<label for="1-star" class="star">★</label>
		</div>
		<input class="btn" type="submit" value="확인">
	</form>
</div>