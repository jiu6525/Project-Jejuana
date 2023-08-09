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
		height:30vh;
		display:flex;
		justify-content:center;
		align-items:center;
	}
	.resultBox{
		width:40%;
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
	.etc_button{
		width:100%;
	}
	.etc_button>input{
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
});
</script>

<div class="container_result">
	<div id="fail" class="resultBox" style="display:none">
		<div class="result_msg">일치하는 정보가 없습니다.</div>
		<div class="etc_button">
			<input type="button" value="다시 찾기" onClick="history.back()">
			<input type="button" value="회원가입" onClick="location.href='join'">
		</div>
	</div>
	<div id="pass" class="resultBox" style="display:none">
		<div class="result_msg">회원님의 아이디는 ${userid} 입니다.</div>
		<div class="etc_button">
			<input type="button" value="로그인" onClick="location.href='login'">
			<input type="button" value="비밀번호 찾기" onClick="location.href='findPwd'">
		</div>
	</div>
</div>