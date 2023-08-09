<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	body{
		overflow:hidden; 
		height:100%;
	}
	.container_result{
		font-family: 'GmarketSansMedium';
		width:100%;
		height:55vh;
		display:flex;
		justify-content:center;
		align-items:center;
	}
	.resultBox{
		width:100%;
		border:1px solid #ddd;
		border-radius:30px;
		text-align:center;
		padding:2%;
		height:100%;
		margin-top:20%;
	}
	.result_msg{
		width:70%;
		border:1px solid gray;
		margin:0 auto;
		margin-bottom:25px;
		padding:20px;
	}
	.edit_button, .etc_button{
		width:100%;
	}
	.edit_button>input, .etc_button>input{
		width: 49%;
		height: 50px;
		margin-top: 6px;
		border: none;
		background: #082032;
		color: white;
	}
	
</style>
	
<script>
$(function(){
	if(${result}==0){
		document.getElementById("fail").style.display = "block";
	}
	else{
		document.getElementById("pass").style.display = "block";	
	}
	
	$("#pwdEditForm").submit(function(){
		if($("#password1").val() != $("#password2").val()){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	
		$("#password").append($("#password1").val());
		return true;
	});
});
</script>

<div class="container_result">
	<form method="post" action="pwdEditOk" id="pwdEditForm" enctype="multipart/form-data">
		<input type="hidden" id="name" name="name" value="${dto.name }">
		<input type="hidden" id="id" name="id" value="${dto.id }">
		<input type="hidden" id="phone_num" name="phone_num" value="${dto.phone_num }">
		<input type="hidden" id="password" name="password" value="">
		
		<div id="fail" class="resultBox" style="display:none">
			<div class="result_msg">일치하는 정보가 없습니다.</div>
			<div class="etc_button">
				<input type="button" value="다시 찾기" onClick="history.back()">
				<input type="button" value="아이디 찾기" onClick="location.href='findId'">
				<input type="button" value="회원가입" onClick="location.href='join'">
			</div>
		</div>
		<div id="pass" class="resultBox" style="display:none">
			<div class="result_msg">비밀번호 변경</div>
			<input type="password" id="password1" name="password1" placeholder="변경할 비밀번호 입력">
			<input type="password" id="password2" name="password2" placeholder="변경할 비밀번호 재입력">
			<div class="edit_button">
				<input type="submit" value="비밀번호 변경">
			</div>
		</div>
	</form>
</div>