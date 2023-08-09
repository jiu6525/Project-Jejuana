<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="/scripts/jquery-ui/jquery.min.js"></script>
<script type="text/javascript" src="/scripts/common/common-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/jejuana/css/sendSms.css"/>

<div class="sendSms_container">
	
	<h1 class="sms_h1">휴대폰인증</h1>
 	<img src="../img/sendSms_img.png">
    <form method="post" action="smssend" class="sendSms_form">
        <table class="sendSms_table1">
            <tr class="form-group">
                <td class="sms_font">휴대폰 번호 : </td>
                <td>
                    <input type="text" class="form-control" name="to" placeholder="번호">
                </td>
            </tr>
        </table>
        <button class="btn btn-default" id="getn2">발송</button>  
    </form>
    
    <table class="sendSms_table2">
    	<tr>
		    <td class="sms_font">인증번호 : </td>
		    <td>
		    	<input type="text"  placeholder="인증번호를 입력하세요" id="setn" class="input_box_sms">
		    	<button class="btn btn-default" id="getn">확인</button>	
		   	</td>
		   	
		</tr>
 	</table>
 		
 </div>
 
 <script>
 	var target = document.getElementById('getn');
 	
 	$(function(){
 		$("#getn").click(function(){
 			var inputVal = $("#setn").val();
 			if(inputVal =="${Anumber}"){
 				
 				alert("인증이 완료되었습니다.");
 				target.disabled = true;
 				window.close();
 				return false;
 				
 			}else{
 				alert("인증에 실패하였습니다.");
 				return false;
 			}
 		});
 	});
 	
 </script>