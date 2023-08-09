<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/mypageMenu.jspf" %>
<link rel="stylesheet" href="/jejuana/css/mypageCourse.css"/>

<script>

$(function(){
	
	//전체 선택을 클릭하면 체크박스의 상태에 따라 선택 또는 해제 하는 기능 구현
	$("#allCheckC").click(function(){
		$(".courseBookmark input[name=noCList]").prop("checked",$("#allCheckC").prop("checked"))
	});
	
	//선택삭제 버튼을 클릭하면
	$(".chooseDelC2").click(function(){
		//최소 1개 이상 삭제를 선택했을 때
		
		var checkCount = 0;
		
		$(".courseBookmark input[name=noCList]").each(function(idx, obj){
			if(obj.checked){ //$(obj).prop('checked')
				checkCount++;
			}
		});
		
		if(checkCount>0){
			if(confirm(checkCount+'개의 북마크를 삭제하시겠습니까?')){
				$("#delCList").submit();
			}
		}else{
			alert("삭제할 북마크가 없습니다.")
		}
	});
	
});

</script>

<div class="content_s">

	<div class="courseTitle">북마크(코스)</div>
	<form method="post" action="/jejuana/mypage/mypageCourseMultiDel?nowPage=${vo.nowPage }" id="delCList">
		<div id="acc">
			<input type="checkbox" id="allCheckC"/> 전체선택
		</div>
		<div class="container_flex">
			<c:forEach var="list" items="${list }">
			<div class="courseBookmark">
				<ul>
					<li>
						<input type="checkbox" value="${list.book_no }" name="noCList" class="chooseDelC1" >
						<div class="chooseDel1_txt">선택</div>
					</li>
					<li>
						<img class="image" src="${list.thumbnail }">
						</li>
					<li style="font-size:13px; color:gray; text-align:right;">${list.id }</li>
					<li style="font-weight:bold;padding-top:5px;">${list.review_subject }</li>
					<li>
						<div>
							<hr style="margin:0; width:240px;"/>
						</div>
					</li>
					<li style="font-size:14px;">${list.tag }</li>
					<li style="font-size:14px;">일정: ${list.days-1 }박${list.days }일</li>
					<li id="jo">
						<div>좋아요</div>
						<!-- 하트 -->
						<i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
						<div>${list.joayo_hit }</div>
					</li>
					<li>
						<input class="CourseBtn_view" type="button" value="코스보기" onclick="location.href='/jejuana/review/reviewView?plan_no=${list.target_no}'"/>
					</li>
				</ul>
			</div>
			</c:forEach>
			
		</div>
	
		<div>
			<input type="button" value="선택삭제" class="chooseDelC2"/>
		</div>
	
	</form>
	
	<!-- 페이징 -->
		<div class="pagingDivP">
			<ul>
				<c:if test="${vo.nowPage==1 }">
					<li>
						<i class="fa-solid fa-angle-left"></i>
					</li>
				</c:if>
				<c:if test="${vo.nowPage>1 }">
					<li>
						<a href="mypageCourse?nowPage=${vo.nowPage-1 }">
							<i class="fa-solid fa-angle-left"></i>
						</a>
					</li>
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
						<a href="mypageCourse?nowPage=${p }">${p }</a></li>
					</c:if>
				</c:forEach>
			
			<!-- 다음 페이지 -->
			<!-- 다음 페이지가 있을 때 -->
			<c:if test="${vo.nowPage<vo.totalPage }">
				<li>
					<a href="mypageCourse?nowPage=${vo.nowPage+1 }">
					
						<!-- fontawesome오른쪽 화살표 -->
						<i class="fa-solid fa-chevron-right"></i>
						
					</a>
				</li>	
			</c:if>	
			
			<!-- 현재 페이지가 마지막 페이지일 때 -->
			<c:if test="${vo.nowPage==vo.totalPage }"> 
				<li>
					<i class="fa-solid fa-chevron-right"></i>
				</li>
			</c:if>
			</ul>
		</div>
	
	</div>
</div>

