<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/jejuana/css/findId.css"/>
<script>
$(function(){
	$("#idFindForm").submit(function(){
	 	if($("#name").val()==""){
			alert("이름을 입력해 주세요");
			return false;
		}
	 	if($("#phone_num").val()==""){
			alert("휴대폰 번호를 입력해 주세요");
			return false;
		}
		return true;
	});
});
</script>
 
 <div class="container_find">
	<div class="findBox">
			<h1>아이디 찾기</h1>
			<!-- 아이디 찾기 폼 -->
			<form id="idFindForm" action="findIdResult" method = "POST">
				<!-- 이름 -->
				<div class="name_box">
					<p class="find_box_size" align="left">이름</p>	
					<input type="text" name="name" id="name" placeholder="이름을 입력해 주세요."  class="find_box_size"/>
				</div>
				<!-- 전화번호 -->
				<div class="phone_box">
					<p class="find_box_size" align="left">전화번호</p>
					<input type="text" name="phone_num" id="phone_num" placeholder="전화번호를 입력해 주세요. ('-' 제외)" maxlength="11"  class="find_box_size"/>
				</div>
				<!-- 찾기/이전으로 버튼 -->
				<div class="find_button">
					<input type="submit" value="찾기">
					<input type="button" value="이전으로" onClick="history.back()">
				</div>
			</form>
		</div>
	</div>