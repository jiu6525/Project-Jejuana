<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	header, footer{
		display:none;
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
</style>

<script>
	$("#userDeleteCheck").submit(function(){
		
		if($("#pwdC").val()==""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		$("#userDeleteCheck").attr("action", "userDeleteCheck");
		
	});
	
</script>

	<form method="post" id="userDeleteCheck">
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
	
</body>
</html>