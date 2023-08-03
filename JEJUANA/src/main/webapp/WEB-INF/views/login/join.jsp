<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	body{
		overflow:hidden; 
		height:100%;
	}
	.join_leftBox, .join_centerBox, .join_rightBox{
		float:left;
		height:839px;
		margin:0px;
	}
	.join_leftBox{
		display:flex;
		width:40%;
		height:850px;
		align-items:center;
		justify-content:center;
	}
	.join_leftBox>img{
		width:80%;
		height:80%;
	}
	.join_centerBox{
		display:flex;
		width:60%;
		height:850px;
		align-items:center;
		justify-content:center;
		/*background:#ddd;*/	
	}
	#joinForm{
		height:80%;
	}
 	.join_inputBox{
	 	display:inline-block;
	 	width:100%;
	 }
	 .join_inputBox>div{
	 	width:100%;
	 	float:left;
	 	margin-left:14px;
	 	margin-bottom:20px;
	 }
	 .join_inputBox p{
	 	display:inline-block;
	 	width:20%;
	 	border:1px solid #aaaaaa;
	 	text-align:center;
	 	padding:6px;	
	 	
	 }
	 .join_inputBox>div>div>p{
	 	display:inline-block;
	 	width:20%;
	 	border:1px solid #aaaaaa;
	 	text-align:center;
	 	float:left;
	 	padding:6px;	
	 }
	 
	 .join_inputBox input{
	 	font-size:12px;
	 	padding:6px;
	 	height:31px;
	 	width:188px;
	 }
	 .idBox{
	 	width:62px
	 }
	 #userpwd, #addr{
	 	margin-bottom:20px;
	 }
	.leftBox{
		width:45%;
		display:inline-block;
		float:left;
	}
	 .left>div{
	 	display:inline-block;
	 }
	  .subBox5{
	 	width:53px;
	 	float:left;
	 	border:1px solid #aaaaaa;
	 	text-align:center;
	 	padding:6px;
		margin-right:5px;
	 }
	 .privacy{
	 	float:left;
	 }
	 .privacy>div{
 		/*display:inline-block;*/
	 }
	 .selectBox1{
	 	width:100px;
	 	padding:1px;
	 	padding-bottom:5px;
	 }
	 .selectBox2{
	 	width:60px;
	 	padding:1px;
	 	padding-bottom:5px;
	 }
	
	 
	 /*	개인정보 모달 */
     .modal_wrap{
        display: none;
        width: 80%;
        height: 780px;
        max-height: calc(100vh - 200px);
        overflow-y: auto;
        position: absolute;
        top:35%;
        left: 24%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
 		padding:30px;
    }
    .black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
       
    }
    
    .modal_close{
    	display:inline-block;
        width: 120px;
        height: 40px;
        line-height:40px;
    }
    .modal_close> a:hover{
    	background:#F37321;
    }
    .modal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:#123456;
        /*text-indent: -9999px;*/
        text-decoration-line:none;
        color:white;
        text-align:center;
        font-weight:bold;
    }
    .modal_close2{
    	display:inline-block;
        width: 120px;
        height: 40px;
        
    }
    .modal_close2> a{
        /*display: block;
        width: 100%;
        height: 100%;*/
        padding:10px;
        background:#123456;
        /*text-indent: -9999px;*/
        text-decoration-line:none;
        color:white;
        text-align:center;
        font-weight:bold;
        
    }
    #modal_btn:hover{
    	color:#082032;
    	font-weight:bold;
    }
    #modal_btn{
    	display:inline-block;
    	cursor:pointer;
    	transition:background 0.5s ease-in-out;
    }
    .font{
    	font-family: 'GmarketSansMedium';
    	font-size:15px;
    }
    .font>p{
    	margin: 6px 0 6px 0;
    }
	h2 {
    	font-size: 24px;
    }
    table th {
        font-size: 8px;
        text-align: left;
        /* vertical-align: top; */
        padding: 10px;
        font-weight: normal;
        background-color: #efefef;
        border-collapse: collapse;
        border: 1px solid #e8e8e8;
    }
    table td {
        font-size: 8px;
        text-align: left;
        /* vertical-align: top; */
        padding: 10px;
        opacity: 0.5;
        border-collapse: collapse;
        border: 1px solid #e8e8e8;
    }

    @media (max-width: 600px) {
	    p {
	        font-size: 12px;
	    }
	    ol,
	    li {
	        color: #9e9e9e !important;
	        font-size: 10px;
	    }
	
	    h1 {
	        font-size: 22px;
	    }
	
	    h2 {
	        font-size: 18px;
	    }
	    .contents {
	        font-size: 11px;
	        color: #616161 !important;
	    }
    }

</style>

<script>
	//변수
	var ojId = document.getElementById("id");
	var ojPwd = document.getElementById("password");
	var ojPwd2 = document.getElementById("password2");
	var ojUsername = document.getElementById("username");
	var ojUsernickname = document.getElementById("usernickname");
	var ojEmail = document.getElementById("email");
	var ojEmail2 = document.getElementById("email2");
	var ojTel = document.getElementById("tel");
	var ojTelnum = document.getElementById("telNum");
	var ojInformation = document.getElementById("information");
	
	//아이디 조건변수
	var idCondition = /^[a-z0-9_]{5,20}$/
	//비밀번호 조건변수
	var pwdCondition = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()-_=+[\]{};:'",.<>/?])[a-zA-Z!@#$%^&*()-_=+[\]{};:'",.<>/?]+$/
	//닉네임 조건변수
	var nickCondition = /^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]{2,10}$/
	//이메일 조건변수
	var emailCondition = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
	//휴대폰 조건변수
	var telCondition = /^01[016789][1-9]\d{6,7}$/
	
	$(function(){
		//아이디 중복검사
		$("input[value=중복검사]").click(function(){
			//아이디 검사
			if($("#id").val()!=""){
				if( !idCondition.test($("#id").val()) ){
					alert("아이디는 5~20자의 영소문자,숫자와 특수문자(_)만 사용가능 합니다.");
					ojId.focus();
					return false;			
				}else{
					//모달로 변경필요
					window.open("idCheck?id="+$("#id").val(),"chk","width=550,height=230");
				}
			}else{
				alert("아이디를 입력 후 중복검사하세요.");
				ojId.focus();
				return false;
			}	
		});
		
		//아이디 중복검사
		$("input[value=휴대폰인증받기]").click(function(){
			//아이디 검사
			if($("#id").val()!=""){
				if( !idCondition.test($("#id").val()) ){
					alert("아이디는 5~20자의 영소문자,숫자와 특수문자(_)만 사용가능 합니다.");
					ojId.focus();
					return false;			
				}else{
					//모달로 변경필요
					window.open("idCheck?id="+$("#id").val(),"chk","width=550,height=230");
				}
			}else{
				alert("아이디를 입력 후 중복검사하세요.");
				ojId.focus();
				return false;
			}	
		});
		
		//휴대폰인증
		$("#").keyup(function(){
			$("#").val("N");
		});
		
		//select박스 설정
		var idval = $('#email2');
		$("#email2_box").change(function(){
			var element = $(this).find('option:selected');
			var emailTag = element.attr('value');
			idval.val(emailTag);
		});
		
		
		
		//유효성 검사
		$("#joinForm").submit(function(){
			event.preventDefault();
			
			//아이디
			if($("#id").val()==""){
				alert("아이디를 입력하세요.");
				ojId.focus();
				return false;
			};
	
			//비밀번호
			if($("#password").val()==""){
				alert("비밀번호를 입력하세요.");
				ojPwd.focus();
				return false;
			}
			//비밀번호 검사
			if(!pwdCondition.test($("#password").val())){
				alert("비밀번호는 영대소문자, 특수기호 필수포함, 연속되는 숫자 사용금지, 공백문자가 포함되지 않게 사용가능합니다.");
				ojPwd.focus();
				return false;
			}
			//비밀번호 확인
			if($("#password2").val()==""){
				alert("비밀번호를 입력하세요.");
				ojPwd2.focus();
				return false;
			}
			//이름
			if($("#username").val()==""){
				alert("이름은 ");
				ojUsername.focus();
				return false;
			}
			//닉네임
			if($("#usernickname").val()==""){
				alert("닉네임을 입력하세요.");
				ojUsernickname.focus();
				return false;
			}
			//닉네임 검사
			if(!nickCondition.test($("#nickname").val())){
				alert("닉네임은 영대소문자, 특수기호 필수포함, 연속되는 숫자 사용금지, 공백문자 불가의 조건으로 생성가능합니다.");
				ojUsernickname.focus();
				return false;
			}
			//이메일
			if($("#email").val()==""){
				alert("이메일을 입력하세요.");
				ojEmail.focus();
				return false;
			}
			//이메일 검사
			if(!emailCondition.test($("#email").val())){
				alert("올바른 이메일을 입력해주세요.");
				ojEmail.focus();
				return false;
			}
			//도메인
			if($("#email2").val()==""){
				alert("도메인을 입력하거나 선택해주세요.");
				ojEmail2.focus();
				return false;
			}
			//휴대폰
			if($("#tel").val()==""){
				alert("휴대폰번호를 입력하세요.");
				ojTel.focus();
				return false;
			}
			//휴대폰 검사
			if(!telCondition.test($("#tel").val())){
				alert("올바른 휴대폰 번호를 입력하세요.");
				ojTel.focus();
				return false;
			}
			//인증번호
			if($("#telNum").val()==""){
				alert("인증번호를 입력하세요.");
				ojTelnum.focus();
				return false;
			}
			//개인정보동의 체크박스
			if( !$("input[name='information']").attr('checked') ){
				alert("개인정보를 동의하셔야 회원가입 가능합니다.");
				ojInformation.focus();
				return false;
			}
			
			//form 태그
			$("#joinForm").attr("action","joinOk");
			return true;

		});
		
	});
</script>


<div class="join_container">


		<div>
			<div class="join_leftBox">
				<img src="img/login_img.png">
			</div>
			<div class="join_centerBox">
			
				<form method="post" id="joinForm">
					<div>
						<div class="join_inputBox">
						
							<!-- 아이디 -->
							<div>
								<p>아이디</p>
								<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." minlength="5" maxlength="15">
								<input type="button" class="idBox" value="중복검사">
								<input type="hidden" id="idStatus" value="N">
								<span style="font-size:15px;display:block; margin:10px 0 10px 5px;">아이디는 5~20자의 영소문자, 숫자와 특수문자_만 사용가능하고, 공백문자 는 사용 불가합니다.</span>
							</div>
							
							<!-- 비밀번호 -->
							<div>
								<p>비밀번호</p>
								<input type="password" name="password" id="password" minlength="12" maxlength="20" placeholder="비밀번호를 입력해주세요.">
								<span style="font-size:15px;display:block; margin:10px 0 10px 5px;">비밀번호는 12~20자의 영대소문자, 특수기호必로 사용하고, 연속되는 숫자,공백문자는 사용 불가합니다.</span>
								<p>비밀번호 확인</p>
								<input type="password" name="password2" id="password2" minlength="12" maxlength="20" placeholder="비밀번호를 입력해주세요."><br>							
							</div>
							
							<!-- 이름 -->
							<div>
								<p>이름</p>
								<input type="text" name="username" id="username" minlength="2" maxlength="10" placeholder="예) 홍길동"><br>
							</div>
							
							<!-- 닉네임 -->
							<div>
								<p>닉네임</p>
								<input type="text" name="usernickname" id="usernickname" minlength="2" maxlength="10" placeholder="닉네임을 입력해주세요."><br>
							</div>
							
							<!-- 이메일 -->
							<div>
								<p>이메일</p>
								<input type="text" name="email" id="email" placeholder="ex) jejuana"> @
								<input type="text" name="email2" id="email2" placeholder="직접입력">
								<select class="selectBox1" name="email2_box" id="email2_box">
									<option value='naver.com'>naver.com</option>
									<option value='hanmail.net'>hanmail.net</option>
									<option value='nate.com'>nate.com</option>
									<option  value='google.com'>google.com</option>
								</select>
							</div>
							
							<!-- 휴대전화 -->
							<div>
								<input type="button" name="telNumGet" id="telNumGet" value="휴대폰인증받기" onClick="location.href='sendSms'">
							</div>
							
							<div class="privacy">
								<input type="checkbox" class="checkbox" disabled name="information" id="information" style="width:20px;padding:0px;height:15px;display:inline-block;">
								<div id="modal_btn">개인정보처리 방침</div>
								<div class="black_bg"></div>
								<div class="modal_wrap">
								    
						    		<!-- 개인정보 처리방침 -->
						    		<div class="font">
						                ㈜ 제주아나 (' jejuana, 제주아나, jejuana.co.kr, ' 이하
						                "회사")은(는) 개인정보보호법에 따라 이용자의 개인정보보호 및
						                권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게
						                처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.<br/>
						                <p>1. 개인정보의 수집 및 이용목적</p><br>
							                "회사"는 개인정보를 다음의 목적을 위해 활용합니다. 처리한
							                개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용
							                목적이 변경될 시에는 사전동의를 구할 예정입니다.
							                <br/><br/>
						                ■ 홈페이지 회원가입 및 관리 <br/>회원 가입의사 확인,
						                회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리,
						                제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지,
						                각종 고지·통지, 분쟁 조정을 위한 기록 보존 등을 목적으로
						                개인정보를 활용합니다.
						                <br/>
						                <br/>■ 서비스 예약 또는 서비스의 이용 <br />서비스 제공, 바우처
						                및 이용권 발송, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증,
						                요금결제·정산 등을 목적으로 개인정보를 활용합니다. <br />콘텐츠
						                등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석,
						                서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한
						                이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스
						                제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여
						                개인정보를 활용합니다. <br />법령 및 마이로 이용약관을 위반하는
						                이용자에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의
						                원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및
						                부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한
						                기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여
						                개인정보를 활용합니다.<br />서비스 제공에 관한 계약 이행 및
						                서비스 제공에 따른 요금정산, 여행상품 예약, 컨텐츠 제공, 구매 및
						                요금 결제, 물품배송 또는 청구지 등 발송, 금융거래 본인 인증 및
						                금융서비스 등을 위하여 개인정보를 활용합니다.
						                <br />
						                <br />■ 마케팅 및 광고에 활용 <br />신규 서비스(제품) 개발 및
						                맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공,
						                서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에
						                대한 통계 등을 목적으로 개인정보를 활용합니다. <br />
						                <p>2. 수집하는 개인정보의 항목</p><br>
						                "회사"는 회원가입 및 서비스 이용 과정에서 이용자로부터 직접 입력
						                받는 방식으로 필요한 최소한의 개인정보를 수집하며,
						                여행상품(항공, 숙박, 투어, 티켓 등)예약 등의 유료 서비스 이용
						                과정에서 추가적인 정보를 수집하고 있습니다. 오프라인으로
						                진행되는 이벤트 및 세미나 등에서 서면을 통해 개인정보를 수집할
						                수 있으며, 고객센터 상담 과정에서 웹 페이지, 메일, 팩스, 전화
						                등을 통해서도 수집할 수 있습니다."회사"는 개인정보의 수집이
						                발생하는 경우, 반드시 ‘개인정보 수집 및 이용’에 대한 이용자의
						                사전 동의를 받습니다. 선택 정보를 입력하지 않아도 서비스 이용에
						                제한은 없습니다. "회사"는 이용자의 기본적 인권을 침해 할 우려가
						                있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및
						                본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는
						                수집하지 않습니다. 그리고, 어떤 경우에라도 입력하신 정보를
						                이용자들에게 미리 밝힌 목적 이외의 다른 목적으로는 사용하지
						                않으며 외부로 유출하지 않습니다.다만 IP 주소, 쿠키, 기기정보
						                등의 경우 PC 웹, 모바일 웹/앱으로 서비스를 이용하는 과정에서
						                자동으로 생성되어 수집될 수 있습니다. <br /><br />- 개인정보
						                수집 방법<br />회원가입 절차(홈페이지, APP), 상담절차, 이벤트나
						                경품 행사, 상품 구매 단계, 영업업무 위탁사 또는 제휴사 등의
						                방법으로 수집하며 이동 전화 및 유-무선 인터넷 서비스를 사용할 때
						                생성정보 수집 도구를 통한 방법(쿠키) 등으로도 개인정보를
						                수집합니다.
						                <br />
						                <br />- 개인정보 수집 항목<br />
						                <table>
						                    <thead>
						                        <tr>
						                            <th style="background:#F37321">목적</th>
						                            <th style="background:#F37321">구분</th>
						                            <th style="background:#F37321">항목</th>
						                            <th style="background:#F37321">용도</th>
						                        </tr>
						                    </thead>
						                    <tbody>
						                        <tr>
						                            <td rowspan="4" style="background:#c8cdca">회원가입</td>
						                            <td style="background:#c8cdca">회원가입</td>
						                            <td style="background:#c8cdca">[필수]이름, 이메일, 닉네임, 비밀번호</td>
						                            <td style="background:#c8cdca">
						                                [필수]고객 편의를 위한 서비스 제공, 이용자 식별
						                                및 연령확인, 고지사항 전달, 서비스 이용 및 상담
						                                등 원활한 의사소통 경로 확보, 부정이용 방지
						                            </td>
						                        </tr>
						                        <tr>
						                            <td style="background:#c8cdca">네이버 간편가입</td>
						                            <td style="background:#c8cdca">
						                                [필수]이름, 이메일(아이디), 닉네임, 프로필 사진
						                            </td>
						                            <td style="background:#c8cdca">
						                                [필수]고객 편의를 위한 간편가입 서비스 제공,
						                                이용자 식별 및 연령확인, 고지사항 전달, 서비스
						                                이용 및 상담 등 원활한 의사소통 경로 확보,
						                                부정이용 방지
						                            </td>
						                        </tr>
						                        <tr>
						                            <td style="background:#c8cdca">카카오 간편가입</td>
						                            <td style="background:#c8cdca">
						                                [필수]이름, 이메일(아이디), 닉네임, 프로필 사진
						                                / [선택]성별, 연령대, 생년월일
						                            </td>
						                            <td style="background:#c8cdca">
						                                [필수] 고객 편의를 위한 간편가입 서비스 제공,
						                                이용자 식별 및 연령확인, 고지사항 전달, 서비스
						                                이용 및 상담 등 원활한 의사소통 경로 확보,
						                                부정이용 방지 / [선택] 맞춤형 상품 추천 등
						                                마케팅 활용
						                            </td>
						                        </tr>
						                        <tr>
						                            <td style="background:#c8cdca">구글 간편가입</td>
						                            <td style="background:#c8cdca">
						                                [필수]이름, 이메일(아이디), 닉네임, 생년월일 /
						                                [선택]성별, 연령대
						                            </td>
						                            <td style="background:#c8cdca">
						                                [필수]고객 편의를 위한 간편가입 서비스 제공,
						                                이용자 식별 및 연령확인, 고지사항 전달, 서비스
						                                이용 및 상담 등 원활한 의사소통 경로 확보,
						                                부정이용 방지 / [선택] 맞춤형 상품 추천 등
						                                마케팅 활용
						                            </td>
						                        </tr>
						                        <tr>
						                            <td rowspan="2" style="background:#c8cdca">회원공통</td>
						                            <td style="background:#c8cdca">자동수집</td>
						                            <td style="background:#c8cdca">
						                                서비스이용기록, 이용정지기록, 이용해지 기록,
						                                기기정보 아이피 주소(IP address), 접속로그,
						                                쿠키(cookie)
						                            </td>
						                            <td style="background:#c8cdca">
						                                불법/부정이용 방지, 개인정보 유효기간제 준수,
						                                맞춤형 서비스 제공, 장바구니, 최근 본 상품 등
						                                서비스
						                            </td>
						                        </tr>
						                        <tr>
						                            <td style="background:#c8cdca">선택수집</td>
						                            <td style="background:#c8cdca">휴대전화번호, 이메일 주소</td>
						                            <td style="background:#c8cdca">이벤트 및 신규서비스 안내, 마케팅</td>
						                        </tr>
						                        <tr>
						                            <td style="background:#c8cdca">구매회원</td>
						                            <td style="background:#c8cdca">결제</td>
						                            <td style="background:#c8cdca">
						                                예약자 이름, 예약자 휴대전화번호, 예약자 이메일,
						                                계좌정보, 신용카드 정보, 요금청구 및 결제 기록
						                            </td>
						                            <td style="background:#c8cdca">
						                                상품예약, 대금결제 서비스, 구매취소 등에 따른
						                                거래금액 환불, 전자금융기록 보관
						                            </td>
						                        </tr>
						                    </tbody>
						                </table><br>
						                <p>3. 개인정보의 보유 기간 및 파기</p><br>
						                ■ "회사"는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가
						                불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.
						                단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우,
						                또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당
						                기간 동안 개인정보를 안전하게 보관합니다.<br /><br />■
						                이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우는
						                다음과 같습니다. 부정가입 및 징계기록 등의 부정이용기록은 부정
						                가입 및 이용 방지를 위하여 수집 시점으로부터 6개월간 보관하고
						                파기하고 있습니다. 부정이용기록 내 개인정보는 가입인증 휴대폰
						                번호(만 14세 미만 회원의 경우 법정대리인 DI)가 있습니다.<br /><br />■
						                전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법,
						                통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는
						                경우는 아래와 같습니다. "회사"는 이 기간 동안 법령의 규정에 따라
						                개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지
						                않습니다.<br /><br />◦ 전자상거래 등에서 소비자 보호에 관한
						                법률<br />&nbsp&nbsp・ 계약 또는 청약철회 등에 관한 기록: 5년
						                보관<br />&nbsp&nbsp・ 대금결제 및 재화 등의 공급에 관한 기록:
						                5년 보관<br />&nbsp&nbsp・ 소비자의 불만 또는 분쟁처리에 관한
						                기록: 3년 보관<br /><br />◦ 전자금융거래법<br />&nbsp&nbsp・
						                전자금융에 관한 기록: 5년 보관<br /><br />◦ 정보통신 이용촉진 및
						                정보보호 등에 관한 법률<br />&nbsp&nbsp・ 본인 확인에 대한 기록:
						                6개월 보관<br /><br />◦ 통신비밀보호법<br />&nbsp&nbsp・ 로그인
						                기록: 3개월 보관 <br /><br />■ 회원탈퇴, 서비스 종료, 이용자에게
						                동의받은 개인정보 보유기간의 도래와 같이 개인정보의 수집 및
						                이용목적이 달성된 개인정보는 재생이 불가능한 방법으로 파기하고
						                있습니다.<br />
						                <br />■ 법령에서 보존의무를 부과한 정보에 대해서도 해당 기간
						                경과 후 지체없이 재생이 불가능한 방법으로 파기합니다.<br /><br />◦
						                전자적 파일 형태의 경우 복구 및 재생이 되지 않도록 기술적인
						                방법을 이용하여 안전하게 삭제하며, 출력물 등은 분쇄하거나
						                소각하는 방식 등으로 파기합니다.<br>
						                <p>4. 개인정보의 제3자 제공에 관한 사항</p><br>
						                ■ "회사"는 정보주체의 동의, 법률의 특별한 규정 등 개인정보
						                보호법 제17조 및 제18조에 위반되지 않는 범위에서 개인정보를
						                제3자에게 제공합니다. <br /><br />■ "회사"는 본 웹사이트를
						                통해서 수집되거나 본 서비스를 구매할 때에 수집된 개인정보와 그
						                밖의 데이터를, 귀하의 사용자 계정을 개설하고, 귀하에게 본
						                서비스를 제공하며, 본 웹사이트와 본 서비스를 지속적으로 개선하고
						                본 서비스와 관련하여 귀하에게 연락을 하는 데 사용할 것 입니다.
						                본 웹사이트와 본 서비스를 개선한다는 말은, 구매요청을 더
						                신속하게 처리하고, 고객지원 서비스를 좀 더 강화하며, 신규 서비스
						                등을 시의적절하게 귀하에게 통지할 수 있도록 하는 데 귀하의
						                개인정보와 위와 같은 여타의 데이터를 당사가 사용한다는 것을
						                의미합니다.
						                <br />
						                <br />수시로, 당사는 본 웹사이트를 귀하가 이용하는 것에 대한
						                피드백을 위해 귀하에게 연락하거나, 본 웹사이트를 개선하는 데
						                당사가 도움을 받거나, 귀하에게 특별한 적립혜택이나 홍보물을
						                제공하기 위해서도(동의한다고 명시한 경우에 한함) 당사는 귀하의
						                개인정보를 사용할 수 있습니다. 귀하가 특별 적립 또는 홍보물에
						                대한 통지를 받고 싶지 않다면, 그러한 통지문에 함께 제공된
						                하이퍼링크를 통해 당사에게 회신을 주는 방식으로 귀하는 그
						                통지문의 수신을 간단히 거부할 수 있습니다.
						                <br />
						                <br />수집된 개인정보는, 귀하와의 계약을 이행하기 위해 필요한
						                한도 내에서만 처리할 것입니다. 예컨대, 귀하가 본 웹사이트를 통해
						                본 서비스를 구매하는 경우가 그에 해당합니다. 그 외에는, 당사는
						                당사의 정당한 이익에 근거하여서만 수집된 여타의 개인정보를
						                처리하는데, 본 서비스를 좀더 개선하고 직접적인 마케팅을 목적으로
						                하는 것들이 그에 해당합니다.<br>
						                <p>5. 개인정보처리 위탁</p><br>
						                ■ "회사"는 원활한 개인정보 업무처리를 위하여 다음과 같이
						                개인정보 처리 업무를 위탁하고 있습니다. <br /><br />■ "회사"는
						                위탁계약 체결 시 개인정보 보호법 제25조에 따라 위탁업무 수행
						                목적 외 개인정보 처리 금지, 기술적․관리적 보호조치, 재 위탁
						                제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을
						                계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게
						                처리하는지를 감독하고 있습니다. <br /><br />■ 위탁 업무의
						                내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보
						                처리방침을 통하여 공개하도록 하겠습니다.<br>
						                <p>6. 정보주체와 법정대리인의 권리·의무 및 그 행사방법</p><br>
						                이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.
						                <br />
						                <br />■ 정보주체는 "회사"에 대해 언제든지 개인정보 열람, 정정,
						                삭제, 처리정지 요구 등의 권리를 행사할 수 있습니다.
						                <br /><br />■ 제1항에 따른 권리 행사는 "회사"에 대해 개인정보
						                보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX)
						                등을 통하여 하실 수 있으며 "회사" 이에 대해 지체 없이 조치하도록
						                노력하겠습니다. <br /><br />■ 제1항에 따른 권리 행사는
						                정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실
						                수 있습니다. <br />이 경우 개인정보 보호법 시행규칙 별지 제11호
						                서식에 따른 위임장을 제출하셔야 합니다. <br /><br />■ 개인정보
						                열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조
						                제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
						                <br /><br />■ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그
						                개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할
						                수 없습니다. <br /><br />■ "회사"는 정보주체 권리에 따른 열람의
						                요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한
						                자가 본인이거나 정당한 대리인 인지를 확인합니다.<br>
						                <p>
						                    7. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항
						                </p><br>
						                ■ 쿠키(cookie)는 웹사이트가 이용자의 브라우저(인터넷 익스플로러,
						                크롬, 파이어폭스, 기타 모바일 브라우저)로 전송하는 소량의
						                정보입니다. "회사"는 개별적인 맞춤서비스를 제공하기 위해
						                이용자에 대한 정보를 저장하고 수시로 찾아내는 ‘쿠키(cookie)’를
						                사용합니다. <br /><br />■ "회사"는 쿠키를 통해 이용자가 선호하는
						                설정 등을 저장하여 이용자에게 보다 빠른 웹 환경을 지원하며,
						                편리한 이용을 위해 서비스 개선에 활용합니다. "회사"는 쿠키를
						                통해 서비스의 접속 빈도, 방문 시간, 방문 회수 등을 분석하여
						                이용자의 취향과 관심분야를 파악하여 서비스 제공에 활용합니다.<br /><br />■
						                쿠키는 이용자의 컴퓨터 또는 모바일 기기는 식별하지만 이용자을
						                개인적으로 식별하지는 않습니다. 또한 이용자는 쿠키에 대한
						                선택권이 있습니다. 웹브라우저 상단의 도구 > 인터넷옵션 탭(option
						                tab)에서 모든 쿠키를 다 받아들이거나, 쿠키가 설치될 때 통지를
						                보내도록 하거나, 아니면 모든 쿠키를 거부할 수 있는 선택권을 가질
						                수 있습니다. 모바일 기기의 경우에도 ‘설정’ 메뉴나 또는 각 모바일
						                브라우저의 설정 메뉴에서 쿠키에 대한 선택을 제어할 수 있습니다.
						                다만, 쿠키를 거부할 경우 로그인이 필요한 서비스 이용에 일부
						                제약이 있을 수 있습니다.<br>
						                <p>8. 개인정보의 안전성 확보 조치</p><br>
						                "회사"는 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에
						                필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
						                <br />
						                <br />■ 관리적 조치 <br />내부관리계획 수립 및 시행, 개인정보를
						                취급하는 직원에 대한 정기적 교육 등
						                <br />
						                <br />■ 기술적 조치 <br />보안프로그램 설치, 개인정보의 암호화,
						                개인정보 접근 권한 관리 등
						                <br />
						                <br />■ 물리적 조치 <br />외부로부터의 무단 접근 통제<br>
						                <p>9. 이용자 및 법정대리인의 권리와 행사 방법</p><br>
						                ■ 이용자는 언제든지 '설정'에서 자신의 개인정보를 조회하거나
						                수정할 수 있습니다.
						                <br />
						                <br />■ 이용자는 언제든지 ‘회원탈퇴’ 등을 통해 개인정보의 수집
						                및 이용 동의를 철회할 수 있으며, 수집된 개인정보는 철회 즉시
						                파기됩니다.
						                <br />
						                <br />■ 만 14세 미만 아동의 경우, 법정대리인이 아동의 개인정보를
						                조회하거나 수정할 권리, 수집 및 이용 동의를 철회할 권리를 가지며
						                수집된 개인정보는 철회 즉시 파기됩니다.
						                <br />
						                <br />■ 이용자가 개인정보의 오류에 대한 정정을 요청한 경우,
						                정정을 완료하기 전까지 해당 개인정보를 이용 또는 제공하지
						                않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는
						                정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록
						                하겠습니다.<br>
						                <p>10. 개인정보 보호책임자 작성</p><br>
						                ■ "회사"는 개인정보 처리에 관한 업무를 총괄해서 책임지고,
						                개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을
						                위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
						                <br />
						                <br />• 개인정보 보호책임자 <br />성명 : 홍길동 <br />직책 : 과장
						                <br />연락처 : admin@jejuana.co.kr
						                <br />
						                <br />• 개인정보 보호 담당부서 <br />부서명 : 개발팀
						                <br />담당자 : 현준혁 <br />연락처 : admin@jejuana.co.kr
						                <br />
						                <br />■ 정보주체께서는 "회사"의 서비스('myro.co.kr, myro app',
						                또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의,
						                불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및
						                담당부서로 문의하실 수 있습니다. "회사"는 정보주체의 문의에 대해
						                지체 없이 답변 및 처리해드릴 것입니다. 기타 개인정보 침해에 대한
						                신고나 상담이 필요한 경우에 아래 기관에 문의 가능합니다.
						                <br />
						                <br />• 개인정보침해신고센터 (
						                <a href="https://privacy.kisa.or.kr/">privacy.kisa.or.kr</a> /
						                국번없이 118 ) <br />• 대검찰청 사이버수사과 (
						                <a href="http://www.spo.go.kr/">www.spo.go.kr</a> / 국번없이
						                1301 ) <br />• 경찰청 사이버안전국 (
						                <a href="http://cyberbureau.police.go.kr/"
						                    >cyberbureau.police.go.kr</a
						                >
						                / 국번없이 182 )<br>
						                <p>11. 개인정보 처리방침 변경 및 개정 전 고지 의무</p><br>
						                ■ 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른
						                변경 내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행
						                7일 전부터 공지사항을 통하여 고지할 것입니다. 다만, 수집하는
						                개인정보의 항목, 이용목적의 변경 등과 같이 이용자 권리의 중대한
						                변경이 발생할 때에는 최소 30일 전에 공지하며, 필요 시 이용자
						                동의를 다시 받을 수도 있습니다. <br />
						                <br />• 공고일자: 2023년 04월 21일 <br />• 시행일자: 2023년 04월
						                21일<br />
					                	<br/>
					                	<br/>
								    </div>
								    <!-- 개인정보 처리방침 -->
								    <div class="modal_close" onclick="information_true()"><a href="#">동의합니다.</a></div>
								    <div class="modal_close2" onclick="information_false()"><a href="#">취소</a></div>
								</div>
							</div>
							
							<div>
								<input type="submit" name="joinBtn" id="joinBtn" value="회원가입">
							</div>
							
					</form>

			</div>
			
		</div>
		
</div>
	
<script>
	window.onload = function() {
	 
	function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
		
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
    document.querySelector('.modal_close2').addEventListener('click', offClick);
	};
	
	/* 개인정보 처리방침 '동의합니다' 클릭 시 이벤트 */
	function information_true(){
		$('[name=information]').prop('checked', true);
	}
	
	/* 개인정보 처리방침 '동의합니다' 클릭 시 이벤트 */
	function information_false(){
		$('[name=information]').prop('checked', false);		
	}
	

</script>
	

</body>
</html>