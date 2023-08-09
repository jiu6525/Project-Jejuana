<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/jejuana/css/reviewmanager.css">

<div class="screen">
	<div class="section">
		<div class="section1">
			<div class="section1_1">
				<i id="img1" class="fa-solid fa-paste"></i>
				<p class="section1_1_1">여행목록 관리</p>
			</div>
			<div class="category2">
				<button class="category2_1" onclick="location.href='commonmanager1'">회원관리</button>
				<button class="category2_1" onclick="location.href='reviewmanager'">게시글 관리</button>
			</div>
		</div>

		<div class="section2">
			<div class="category1">
				<div>
					<div>관리자 페이지</div>
					<p>여행목록을 관리 할 수 있습니다.</p>
				</div>
			</div>
			
			<div class="section2_2">
				<div class="section2_4">
					<form method="get" id="searchForm" action="reviewmanager">
						<div class="section2_1_1">여행목록 검색</div>
						<select id="searchKey" name="searchKey">
							<option value="review_subject" selected>제목</option>
							<option value="activated">활성화</option>
							<option value="r.id">아이디</option>
						</select> <input type="text" name="searchWord" id="searchWord"
							placeholder="검색...." /> <input type="submit" class="section2_5"
							value="검색" />
					</form>
				</div>
			</div>

			<form method="post" action="/jejuana/manager/reviewUpdate" id="upList">
				<div class="section3">
					<div id="tb" class="tsearch">
						<div id="st">
							<div class="st_1">
								<div>
									<input type="checkbox" id="allCheck">
								</div>
								<div>번호</div>
								<div>제목</div>
								<div>작성자</div>
								<div>조회수</div>
								<div>등록일시</div>
								<div>IP</div>
								<div>활성여부</div>
							</div>
							<c:forEach var="rDTO" items="${list }">
								<div class="st_2">
									<div>
										<input type="checkbox" name="noList" value="${rDTO.plan_no }" />
									</div>
									<div>${rDTO.plan_no }</div>
									<div class="st_2_1">
										<a
											<c:if test="${rDTO.complain!=null }"> style="color:red"</c:if>
											href="reviewView?plan_no=${rDTO.plan_no }&nowPage=${vo.nowPage}
											<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }
											</c:if>
											">${rDTO.review_subject }
										</a>
									</div>
									<div>${rDTO.id }</div>
									<div>${rDTO.review_hit }</div>
									<div>${rDTO.writedate }</div>
									<div>${rDTO.ip }</div>
									<div>
										<c:if test="${rDTO.activated == 0}">활성화</c:if> 
										<c:if test="${rDTO.activated == 1}">비활성화</c:if>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</form>

			<div class="searchselect">
				<ul class="section3_1">
					<c:if test="${vo.nowPage==1 }">
						<li>&lt;</li>
					</c:if>
					<c:if test="${vo.nowPage>1 }">
						<li><a
							href="reviewmanager?nowPage=${vo.nowPage-1} <c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">&lt;</a></li>
					</c:if>

					<c:forEach var="p" begin="${vo.startPageNum }"
						end="${vo.startPageNum+vo.onePageNumCount-1 }">
						<c:if test="${p<=vo.totalPage }">
							<c:if test="${p==vo.nowPage }">
								<li>
							</c:if>

							<c:if test="${p!=vo.nowPage }">
								<li>
							</c:if>
							<a
								href="reviewmanager?nowPage=${p}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">${p}
							</a>
							</li>
						</c:if>
					</c:forEach>

					<c:if test="${vo.nowPage<vo.totalPage }">
						<li><a
							href="reviewmanager?nowPage=${vo.nowPage+1}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey}&searchWord=${vo.searchWord}</c:if>">&gt;</a></li>
					</c:if>
					<c:if test="${vo.nowPage==vo.totalPage }">
						<li>&gt;</li>
					</c:if>
				</ul>

			</div>

			<div class="scection4">
				<input type="button" value="활성화/비활성화" id="aupdate" />
			</div>
		</div>

	</div>

</div>


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
			if(confirm(checkCount+'개의 글을 활성화/비활성화 하시겠습니까?')){
				$("#upList").submit();		
			}
		}else{
			alert("글이 선택되지 않았습니다");
		}
	});
});
</script>