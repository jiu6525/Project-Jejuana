<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 


<script type="text/javascript" src="/scripts/jquery-ui/jquery.min.js"></script>
<script type="text/javascript" src="/scripts/common/common-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<div>
    <h1>텍스트 메일 보내기</h1>
 
    <form method="post" action="smssend" >
        <table>
            <tr class="form-group">
                <td>발송할 전화번호</td>
                <td>
                    <input type="text" class="form-control" name="to" placeholder="입력하세요">
                </td>
                
            </tr>
            
        </table>
        <button class="btn btn-default">발송</button>
    </form>
    
    <table>
    	<tr>
		    <td>인증번호</td>
		    <td>
		    	<input type="text"  placeholder="입력하세요" id="setn"><button class="btn btn-default" id="getn">확인</button>
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
 				
 				alert("인증확인!");
 				target.disabled = true;
 				return false;
 			}else{
 				alert("아닌데요?");
 				return false;
 			}
 				
 		});
 	})
 </script>

