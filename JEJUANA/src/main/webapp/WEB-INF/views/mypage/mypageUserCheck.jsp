<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/mypageMenu.jspf" %>
<link rel="stylesheet" href="/jejuana/css/mypageUserCheck.css">

<script>
	$(function(){
		
		$("#pwdCheck").submit(function(){
			if($("#password").val()==""){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			$("#pwdCheck").attr("action", "mypageUser")
			
		});
		
	});
</script>
<div class="content_s">
	<div class="userTitle">회원정보수정</div>
	<form method="post" id="pwdCheck">
		<ul>
			<li class="mypagePassword">
				<p>비밀번호 확인</p>
				<input type="password" name="password" id="password"/>
			</li>
			<li>
				<input class="mypageOkBtn" type="submit" value="확인"/>
			</li>
		</ul>
	</form>
</div>


</div>

