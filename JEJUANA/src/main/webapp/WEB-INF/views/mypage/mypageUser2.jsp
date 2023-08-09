<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/mypageMenu.jspf" %>
<style>
	.userTitle{
		width:18%;
		border:1px solid navy;
		font-size:1.5em;
		margin-top:20px;
		margin-left:20px;
		padding:10px;
		text-align:center;
	}
	#bold5{
		font-weight:bold;
	}
	.join_inputBox{ 
	 	display:inline-block;
	 	width:42%;
	 	float:left;
	 	margin:50px 20px;
	 	padding-left:50px;
	}
	.join_inputBox>div{
	 	width:100%;
	 	float:left;
	 	margin-left:14px;
	 	margin-bottom:20px;
	 }
	 .join_inputBox p{
	 	display:inline-block;
	 	width:50%;
	 	border:1px solid #aaaaaa;
	 	text-align:center;
	 	padding:6px;	
	 }
	 .join_inputBox input{
	 	font-size:12px;
	 	padding:6px;
	 	height:31px;
	 	width:200px;
	 }
	 .userButton{
	 	float:left;
	 	margin:80px -153px 20px;
	 }
	 .userButton input{
	 	font-size:12px;
	 	padding:6px;
	 	height:31px;
	 	width:200px;
	 }
	 
	#modalC {
  	   width: 100%;
       height: 100%;
       position: absolute;
       left: 0;
       top: 0;
       display: none;
       flex-direction: column;
       align-items: center;
       justify-content: center;
	}
	.modal-window {
    	background: gray;
        box-shadow: 0 8px 32px 0 #ddd;
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
        width: 450px;
        height: 450px;
        position: relative;
        top: -85px;
        left:85px;
        padding: 10px;
    }
    #p1{
    	margin-top:115px;
    	text-align:center;
    	font-size:21px;
    	font-weight:bold;
    }
    #p2{
    	text-align:center;	
    }
    #pwdC{
    	margin-top:20px;
    	width:250px;
    }
    .btnC{
    	text-align:center;
    	margin-top:20px;
    }
    .btnC input{
    	font-size:12px;
	 	padding:6px;
	 	height:31px;
	 	width:200px;
    }
    .close-area{
    	padding-top:10px;
    	padding-left:400px;
    	font-weight:bold;
    }
</style>

<script>
	
	//비밀번호 조건변수
	let pwdCondition = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/
	//닉네임 조건변수
	let nickCondition = /^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]{2,10}$/
	//이메일 @앞부분 조건변수
	let emailCondition = /^[a-zA-Z0-9._%+-]+$/
	
	//이메일 @뒷부분 조건변수
	let emailCondition2 = /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
	//휴대폰 조건변수
	let telCondition = /^01(0|1|6|7|8|9)[0-9]{7,8}/
	$(function(){
		
		//select박스 설정
		var idval = $('#email2');
			$("#email2_box").change(function(){
				var element = $(this).find('option:selected');
				var emailTag = element.attr('value');
				idval.val(emailTag);
			});
			
		//휴대폰 인증 팝업
		$("input[value=휴대폰인증]").click(function(){
				
			var popupWidth = 550;
			var popupHeight = 800;
			var popupX = (document.body.offsetWidth / 2) - (550 / 2);
			var popupY= (document.body.offsetheight / 2) - (800 / 2);
			window.open('sendSms', 'chkSms', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
				
			this.value='휴대폰인증완료';
			this.style.backgroundColor = "#082032";
			this.style.border = "1px solid gray";
			this.style.color = "white";
		});
		
		//유효성 검사
		$("#userEditForm").submit(function(){
				
				//비밀번호
				if($("#password").val()==""){
					alert("비밀번호를 입력하세요.");
					return false;
				}
				//비밀번호 검사
				if(!pwdCondition.test($("#password").val())){
					alert("비밀번호는 영대소문자, 특수기호 필수포함, 연속되는 숫자 사용금지, 공백문자가 포함되지 않게 사용가능합니다.");
					return false;
				}
			
				//닉네임
				if($("#usernickname").val()==""){
					alert("닉네임을 입력하세요.");
					return false;
				}
				//닉네임 검사
				if(!nickCondition.test($("#nickname").val())){
					alert("닉네임은 특수기호, 공백문자 사용불가('_','-'포함)하며 최대 10글자까지 가능합니.");
					return false;
				}
					
				//이메일
				if($("#email1").val()==""){
					alert("이메일을 입력하세요.");
					return false;
				}
				//이메일 검사
				if(!emailCondition.test($("#email1").val())){
					alert("올바른 이메일을 입력해주세요.");
					return false;
				}
					
				//도메인
				if($("#email2").val()==""){
					alert("도메인을 입력하거나 선택해주세요.");
					return false;
				}
				
				//도메인 검사
				if(!emailCondition2.test($("#email2").val())){
					alert("올바른 도메인을 입력해주세요.");
					return false;
				}
				
				//휴대폰
				if($("#phone_num").val()==""){
					alert("휴대폰번호를 입력하세요.");
					return false;
				}
				//휴대폰 검사
				if(!telCondition.test($("#phone_num").val())){
					alert("올바른 휴대폰 번호를 입력하세요.");
					return false;
				}
			
				//form 태그
				$("#userEditForm").attr("action","userEditOk");
				
			});
		
			
	});
</script>

<div class="content_s">
	<div class="userTitle">회원정보수정</div>
	
	<form method="post" id="userEditForm">
		<div>
			<div class="join_inputBox">
			<c:forEach var="proDTO" items="${proDTO }">
				<div>	
					<p>아이디</p>
					<input type="text" name="id" id="id" value="${proDTO.id }" readonly/>
				</div>
				<div>
					<p>비밀번호</p>
					<input type="password" name="password" id="password" minlength="8" maxlength="20" placeholder="비밀번호를 입력해주세요."/>
					<span style="font-size:12px;display:block; margin-top:5px;">비밀번호는 8~20자의 영대소문자, 특수기호必로 사용하고, 연속되는 숫자,공백문자는 사용 불가합니다.</span>
				</div>
				<div style="width:200%">
					<p style="width:25%">휴대전화</p>
					<input type="text" name="phone_num" id="phone_num" placeholder="-를 제외하고 입력하세요." value="${proDTO.phone_num }">
					<input type="button" name="telNumGet" id="telNumGet" value="휴대폰인증">
				</div>
				</c:forEach>
				<div style="width:200%">
					<p style="width:25%">이메일</p>
					<input type="text" name="email1" id="email1" value="${email1 }"> @
					<input type="text" name="email2" id="email2" placeholder="직접입력" value="${email2 }">
					<select class="selectBox1" name="email2_box" id="email2_box">
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="google.com">google.com</option>
					</select>
				</div>
			</div>
			
			<div class="join_inputBox">
			<c:forEach var="proDTO" items="${proDTO }">
				<div>
					<p>이름</p>
					<input type="text" name="name" id="username" value="${proDTO.name }" readonly/><br>
				</div>
				<div>
					<p>닉네임</p>
					<input type="text" name="nickname" id="nickname" minlength="2" maxlength="10" placeholder="닉네임을 입력해주세요." value="${proDTO.nickname }">
				</div>
			</c:forEach>
			</div>
		</div>	
		<div class="userButton">
			<input type="submit" value="수정하기"/>
			<input type="button" value="탈퇴하기" id="userDelete"/>
		</div>
	</form>
</div>	
	
	<div id="modalC" class="modal-overlay">
		<div class="modal-window">
			<form method="post" id="userDeleteCheck">
				<div class="close-area">X</div>
				<div class="content-modal"> 
					<p id="p1">정말 탈퇴하시겠습니까?</p><br/>
					<p id="p2">탈퇴하시려면 비밀번호를 입력해주세요.</p>
				</div>
				<div style="text-align:center">
					<input type="password" name="password" id="pwdC"/>
				</div>
				<div class="btnC">
					<input type="submit" value="탈퇴하기"/>
				</div>
			</form>
		</div>
	</div>
	



</div>

<script>
	const modal = document.getElementById("modalC")
	const btnModal = document.getElementById("userDelete")
	btnModal.addEventListener("click", e => {
	    modal.style.display = "flex"
	})
	
	const closeBtn = modal.querySelector(".close-area")
	closeBtn.addEventListener("click", e => {
	    modal.style.display = "none"
	})
	
	$(function(){
		
		//회원탈퇴
		$("#userDeleteCheck").submit(function(){
			
			if($("#pwdC").val()==""){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			$("#userDeleteCheck").attr("action", "userDelete");
			
		});
		
	});
</script>

</body>
</html>