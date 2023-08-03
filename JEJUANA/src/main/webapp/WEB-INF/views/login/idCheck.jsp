<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<style>
	header, footer{
		display:none;
	}
	body{
		overflow:hidden; 
		height:230px;
		width:550px;
		margin: 0 auto;
	}
	.loginContainer{
		text-align:center;
		height:100%;
		padding:10px;
	}
	.loginContainer>div>div>div{
		font-family: 'GmarketSansMedium';
		display:inline-block;
	}
	.loginContainer>div>div>p{
		font-family: 'GmarketSansMedium';
		display:inline-block;	
	}
	.loginContainer>div>input{
		width: 20%;
		height: 35px;
		margin-top: 6px;
		border: none;
		background: #082032;
		color: white;
	}
	.idCheckBox_B p{
		font-family: 'GmarketSansMedium';
		display:inline-block;
	}
	.idCheckBox_button{
		font-family: 'GmarketSansMedium';
		width: 20%;
		height: 35px;
		margin-top: 6px;
		border: none;
		background: #082032;
		color: white;
	}
	#userid{
		font-family: 'GmarketSansMedium';
		height:35px;
	}
</style>
<script>
	function setUserid(id){
		//회원가입 폼에 체크한 아이디를 표기
		opener.document.getElementById("id").value = id;
		opener.document.getElementById("idStatus").value = "Y";
		//현재 아이디 검색창 닫기
		window.close(); //self.close();
	}
	
</script>
		<div class="loginContainer">
			<div class="idCheckBox_B">
				<form action="idCheck">
					<p>아이디 입력 :</p> 
					<input type="text" name="id" id="id">
					<input type="submit" value="중복검사하기" class="idCheckBox_button">							
				</form>
			</div>
			<hr>
			<div>
				<!-- 사용 가능한 경우 -->
				<c:if test="${result==0 }">
					<div>
						<div>${id }</div>
						<p>는 사용 가능한 아이디입니다.</p>
					</div>
					<input type="button" value="사용하기" onclick="setUserid('${id}')">
				</c:if>
				<!-- 사용 불가능한 경우 -->
				<c:if test="${result>0 }">
					<div>
						<div>${id }</div>
						<p>는 사용 불가능한 아이디입니다.</p>
					</div>
				</c:if>
			</div>
			<hr>
			<img src="img/idCheckBox.png">
		</div>
	</body>
</html>