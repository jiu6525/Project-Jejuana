<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/jejuana/css/login.css"/>
<div class="container_login">
	<div class="loginBox">
			<h1>LOGIN</h1>
			<!-- 로그인 폼 -->
			<form action="loginOk" method="post">
				<!-- 아이디 -->
				<div class="id_box">
					<p class="login_box_size" align="left">아이디</p>	
					<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요."  class="login_box_size"/>
				</div>
				<!-- 비밀번호 -->
				<div class="pw_box">
					<p class="login_box_size" align="left">비밀번호</p>
					<input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요."  class="login_box_size"/>
				</div>
				<!-- 로그인버튼 -->
				<div class="login_button">
					<input type="submit" value="로그인">
				</div>
			</form>
			<div class="login_subBox">
				<div>
					<!-- 회원가입 폼 이동 -->
					<div><a href="join">회원가입</a></div>					
					<div><a href="findId">아이디 찾기</a></div>
					<div><a href="findPwd">비밀번호 찾기</a></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>