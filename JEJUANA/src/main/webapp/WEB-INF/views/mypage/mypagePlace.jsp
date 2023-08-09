<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/mypageMenu.jspf" %>
<link rel="stylesheet" href="/jejuana/css/mypagePlace.css">
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
				$("#delPList").submit();
			}
		}else{
			alert("삭제할 북마크가 없습니다.")
		}
	});
	
});

</script>
<div class="content_s">

	<div class="courseTitle">북마크(여행지)</div>
	<form method="post" action="/jejuana/mypage/mypagePlaceMultiDel?nowPage=${vo.nowPage }" id="delPList">
		<div id="acc">
			<input type="checkbox" id="allCheckC"/> 전체선택
		 </div>
		<div class="container_flex">
			<c:forEach var="list" items="${list }" varStatus="status">
			<div class="courseBookmark">
				<ul>
					<li>
						<input type="checkbox" value="${list.book_no }" name="noCList" class="chooseDelC1" >
						<div class="chooseDel1_txt">선택</div>
					</li>
					<li>
						<img src="/jejuana/img/${img[status.index]}.jpg"/>
					</li>
					<li style="font-weight:bold;">${list.book_name }</li>
					<li>
						<div>
							<hr style="margin:0; width:240px;"/>
						</div>
					</li>
					<li class="place_explanation">
						<div>${list.book_addr }</div>
					</li>
						<li style="font-size:14px;">
							별점 
							<i class="fa-solid fa-star" style="color: #f37321;"></i>
							${list.rate}
						</li>
					<li>
						<input class="CourseBtn_view" type="button" value="위치보기" onclick="location.href='/jejuana/map_listEdit?book_name=${list.book_name}'"/>
					</li>
				</ul>
			</div>
			</c:forEach>
			
		</div>
		
		<!-- 삭제버튼 -->
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
						<a href="mypagePlace?nowPage=${vo.nowPage-1 }">
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
						<a href="mypagePlace?nowPage=${p }">${p }</a></li>
					</c:if>
				</c:forEach>
			
			<!-- 다음 페이지 -->
			<!-- 다음 페이지가 있을 때 -->
			<c:if test="${vo.nowPage<vo.totalPage }">
				<li>
					<a href="mypagePlace?nowPage=${vo.nowPage+1 }">
					
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
