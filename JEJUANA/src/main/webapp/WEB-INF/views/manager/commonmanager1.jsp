<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/jejuana/css/commonmanager1.css"/>
<script>
$(function(){
	$("#searchForm").submit(function(){
		if($("#searchWord").val()==""){
			alert("검색어를 입력하세요!");
			return false;
		}
		return true;
	});
	
	//---- 전체선택을 클릭하면 체크박스의 상태에 따라 선택 또는 해제 하는 기능구현
	$("#allCheck").click(function(){
		$(".tsearch input[name=noList]").prop("checked",$("#allCheck").prop("checked"))
	});
	
	//선택삭제 버튼 클릭하면
	$("#aupdate").click(function(){
		//최소 1개이상 삭제를 선택했을때....
		
		var checkCount = 0;
		$(".tsearch input[name=noList]").each(function(idx, obj){
			if(obj.checked){	//obj.prop('checked')
				checkCount++;
			}
			
		});
		
		if(checkCount>0){
			if(confirm(checkCount+'명을 관리자로 등록하시겠습니까?')){
				$("#upList").submit();		
			}
		}else{
			alert("글이 선택되지 않았습니다");
		}
	});
});
</script>

<div class="screen" >
	<div class="section">
		<div class="section1">
			<div class="section1_1">
				<i id="img1" class="fa-solid fa-circle-user fa-2xl"></i>
				<p class="section1_1_1"> 회원관리 </p></div>
			<div class="category2">
				<button class="category2_1" onclick="location.href='commonmanager1'">회원관리</button>
				<button class="category2_1" onclick="location.href='reviewmanager'">게시글 관리</button>
			</div>	
		</div>
		
		<div class="section2">
			<div class="category1" >
				<div>
					<div>관리자 페이지</div>
					<p>현재 생성되어 있는 회원정보를 확인 할 수 있습니다.</p>
				</div>
			</div>

			<div class="section2_2">
				<div class="section2_3"><p class="section2_3_1">회원검색</p></div>
				<div class="section2_4">
				<form method="get" id="searchForm"style="width:80%" action="commonmanager1">
					<select id="searchKey" name="searchKey">
					    <option value="name" selected>회원명</option>
					    <option value="phone_num">전화번호</option>
					    <option value="nickname">닉네임</option>
					    <option value="member_type">회원종류</option>
					</select>
						<input type="text" name="searchWord" id="searchWord"placeholder="검색...."/>
						<input type="submit" class="section2_5" value="검색"/>
					</form>
				</div>
			</div>
				
			<form method="post" action="/jejuana/manager/commonUpdate" id="upList">
				<div class="section2_6">
					<table id="tb" class="tsearch">
						<thead id="st">
							<tr class="st_1">
								<td><input type="checkbox" id="allCheck"></td>
								<td>번호</td>
								<td>회원명</td>
								<td>아이디</td>
								<td>전화번호</td>
								<td>가입일</td>
								<td>닉네임</td>
								<td>회원분류</td>
							</tr>
						<c:forEach var="rDTO" items="${list }">
							<tr class="st_2">
								<td><input type="checkbox" name="noList" value="${rDTO.common_no }"/></td>
								<td>${rDTO.common_no }</td>
								<td onclick="location.href='commonmanager2?common_no=${rDTO.common_no}&nowPage=${vo.nowPage }<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord }</c:if>'" style="cursor:Pointer;">${rDTO.name }</td>
								<td>${rDTO.id }</td>
								<td>${rDTO.phone_num }</td>
								<td>${rDTO.sign_date }</td>
								<td>${rDTO.nickname }</td>
								<td>
									<c:if test="${rDTO.member_type == 0}">일반회원</c:if>
									<c:if test="${rDTO.member_type == 1}">관리자</c:if>
								</td>
							</tr>
						</c:forEach>
						</thead>
					</table>		
				</div>
			</form>
					
			<div class="searchselect">
					<ul class="section3">
						<c:if test="${vo.nowPage==1 }">
							<li>&lt;</li>
						</c:if>
						<c:if test="${vo.nowPage>1 }">
							<li><a href="commonmanager1?nowPage=${vo.nowPage-1} <c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">&lt;</a></li>
						</c:if>
				
						<c:forEach var="p" begin="${vo.startPageNum }" end="${vo.startPageNum+vo.onePageNumCount-1 }">
							<c:if test="${p<=vo.totalPage }">
								<c:if test="${p==vo.nowPage }">
									<li>
								</c:if>	
								
								<c:if test="${p!=vo.nowPage }">
									<li>
								</c:if>	
									<a href="commonmanager1?nowPage=${p}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p} </a></li>
							</c:if>
						</c:forEach>
		
						<c:if test="${vo.nowPage<vo.totalPage }">
							<li><a href="commonmanager1?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">&gt;</a></li>
						</c:if>
						<c:if test="${vo.nowPage==vo.totalPage }">
							<li>&gt;</li>
						</c:if>
					</ul>
					
				</div>
					
				<div class="section3_1">
						<input type="button" value="관리자 등록" id="aupdate"/>
				</div>
		</div>
		
	</div>

</div>

