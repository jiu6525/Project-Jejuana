<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/jejuana/css/idCheck.css"/>

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