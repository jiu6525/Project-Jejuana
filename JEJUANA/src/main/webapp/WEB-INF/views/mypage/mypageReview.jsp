<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/mypageMenu.jspf" %>
<link rel="stylesheet" href="/jejuana/css/mypageReview.css"/>

<script>
	$(function(){
		
		//전체 선택을 클릭하면 체크박스의 상태에 따라 선택 또는 해제 하는 기능 구현
		$("#allCheckR").click(function(){
			$(".reviewList input[name=noRList]").prop("checked",$("#allCheckR").prop("checked"))
		});
		
		//선택삭제 버튼을 클릭하면
		$("#chooseDelR").click(function(){
			//최소 1개 이상 삭제를 선택했을 때
			
			var checkCount = 0;
			
			$(".reviewList input[name=noRList]").each(function(idx, obj){
				if(obj.checked){ //$(obj).prop('checked')
					checkCount++;
				}
			});
			
			if(checkCount>0){
				if(confirm(checkCount+'개의 게시글을 삭제하시겠습니까?')){
					$("#delRList").submit();
				}
			}else{
				alert("삭제할 게시글이 없습니다.")
			}
		});
		
		
		
	});
</script>

<div class="content_s">
	<div class="reviewTitle">여행기록 관리</div>
	<form method="post" action="/jejuana/mypage/mypageReviewMultiDel" id="delRList">
		<ul class="reviewList">
			<li><input class="mypageReview_select weight_800" type="checkbox" id="allCheckR"/> </li>
			<li class="review_Num_css weight_800">No</li>
			<li class="review_subject_css weight_800">제목</li>
			<li class="weight_800">조회수</li>
			<li class="weight_800">등록일</li>
			<li></li>
			
			<c:set var="recordNum" value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord }"/>
			
			<c:forEach var="dto" items="${list }">
				<c:if test="${dto.activated==0 }">
				<li><input class="mypageReview_select" type="checkbox" id="noRList" name="noRList" value="${dto.plan_no }"></li>
				<li class="review_Num_css">${recordNum }</li>
				<li class="review_subject_css">${dto.review_subject }</li>
				<li>${dto.review_hit }</li>
				<li>${dto.writedate }</li>
				<li><input type="button" value="수정" id="reviewChange" onclick="location.href='mypageReviewEdit?plan_no=${dto.plan_no}'"></li>
				
				<c:set var="recordNum" value="${recordNum-1 }"/>
				</c:if>
				
				<c:if test="${dto.complain!=null }">
				<li><input class="mypageReview_select" type="checkbox" id="noRList" value="${dto.plan_no }" disabled></li>
				<li class="review_Num_css">${recordNum }</li>
				<li class="review_subject_css"><p style="font-weight:bold; float:left; margin-right:15px;">신고사유: ${dto.complain }</p><p>${dto.review_subject}</p></li>
				<li>${dto.review_hit }</li>
				<li>${dto.writedate }</li>
				<li><input type="button" value="삭제" id="reviewDelete" onclick="location.href='mypageReviewDelete?plan_no=${dto.plan_no}'"></li>
				
				<c:set var="recordNum" value="${recordNum-1 }"/>
				</c:if>
			</c:forEach>
		</ul>
	</form>
	
	<div>
		<input type="button" value="선택삭제" id="chooseDelR"/>
	</div>
	
	<!-- 페이징 -->
		<div class="pagingDivR">
			<ul>
				<c:if test="${vo.nowPage==1 }">
					<li><</li>
				</c:if>
				<c:if test="${vo.nowPage>1 }">
					<li><a href="mypageReview?nowPage=${vo.nowPage-1 }"><</a></li>
				</c:if>
				
				<!-- 페이지 번호 -->
				<c:forEach var="p" begin="${vo.startPageNum }" end="${vo.startPageNum+vo.onePageNumCount-1}">
				<c:if test="${p <= vo.totalPage }">	
					<c:if test="${p==vo.nowPage }">
						<li style="font-weight:bold;">
					</c:if>
					<c:if test="${p!=vo.nowPage }">
						<li>
					</c:if>
					<a href="mypageReview?nowPage=${p }">${p }</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지 -->
			<c:if test="${vo.nowPage<vo.totalPage }"> <!-- 다음 페이지가 있을 때 -->
				<li><a href="mypageReview?nowPage=${vo.nowPage+1 }">></a></li>	
			</c:if>	
			<c:if test="${vo.nowPage==vo.totalPage }"> <!-- 현재 페이지가 마지막 페이지일 때 -->
				<li>></li>
			</c:if>
			</ul>
		</div>
	
</div>


</div>
