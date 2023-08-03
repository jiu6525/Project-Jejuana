<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	body{
		overflow:hidden; 
		height:100%;
	}
	.container_login{
		font-family: 'GmarketSansMedium';
		width:100%;
		height:42vh;
		display:flex;
		justify-content:center;
		align-items:center;
	}
	.loginBox{
		width:40%;
		border:1px solid #ddd;
		border-radius:30px;
		text-align:center;
		padding:2%;
		height:100%;
		margin-top:20%;
	}
	.loginBox>h1{
		width:70%;
		border:1px solid gray;
		margin:0 auto;
		margin-bottom:25px;
		padding:20px;
		
	}
	.id_box, .pw_box{
		width:100%;
		margin:0 auto;
		padding-top:14px
	}
	.login_box_size{
		width:70%;
		margin:0 auto;
		margin-bottom:5px
	}
	.login_button{
		width:100%;
	}
	.login_button>input{
		width: 49%;
		height: 50px;
		margin-top: 6px;
		border: none;
		background: #082032;
		color: white;
	}
	
	.login_subBox{
		width:100%;
		margin:0 auto;

	}
	.login_subBox>div{
		width:60%;
		height:50px;
		margin:0 auto
	}

	.login_subBox>div>div{
		padding:3px;
		float:left;
		height:50%;
		margin-left:10%;
		margin-top:15px;
	}
	.login_subBox a{
		text-decoration-line:none;
		color:#082032
	}

</style>
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
					<div><a href="#">아이디 찾기</a></div>
					<div><a href="#">비밀번호 찾기</a></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>