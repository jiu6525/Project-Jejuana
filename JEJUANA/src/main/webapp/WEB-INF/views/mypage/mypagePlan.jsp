<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/mypageMenu.jspf" %>
<link rel="stylesheet" href="/jejuana/css/mypagePlan.css"/>

<script>
	$(function(){
		
		//전체 선택을 클릭하면 체크박스의 상태에 따라 선택 또는 해제 하는 기능 구현
		$("#allCheckP").click(function(){
			$(".planList input[name=noPList]").prop("checked",$("#allCheckP").prop("checked"))
		});
		
		//선택삭제 버튼을 클릭하면
		$("#chooseDelP").click(function(){
			//최소 1개 이상 삭제를 선택했을 때
			
			var checkCount = 0;
			
			$(".planList input[name=noPList]").each(function(idx, obj){
				if(obj.checked){ //$(obj).prop('checked')
					checkCount++;
				}
			});
			
			if(checkCount>0){
				if(confirm(checkCount+'개의 게시글을 삭제하시겠습니까?')){
					$("#delPList").submit();
				}
			}else{
				alert("삭제할 게시글이 없습니다.")
			}
		});
		
	});
	
</script>

<div class="content_s">
		<div class="planTitle">
			나의 일정 관리
			<i class="fa-solid fa-plane-circle-check"></i>
		</div>
		<form method="post" action="/jejuana/mypage/mypagePlanMultiDel?nowPage=${vo.nowPage }" id="delPList">
		<div id="acp">
			<input type="checkbox" id="allCheckP"/> 전체선택
		</div>
		<c:forEach var="pDTO" items="${list }">
			<div class="planList">
				<ul>
					<li>
						<input type="checkbox" id="noPList" name="noPList" value="${pDTO.plan_no }"/>
					</li>
					<c:if test="${pDTO.d_day>0 }">
						<li>
							<div style="font-size:2em; font-weight:bold;">D-${pDTO.d_day }</div>
						</li>
					</c:if>
					<c:if test="${pDTO.review_date>=0 && pDTO.d_day<=0 }">
						<li>
							<div style="font-size:2em; font-weight:bold;">
								D-Day
							</div>
						</li>
					</c:if>
					<c:if test="${pDTO.review_date<0 }">
						<li>
							<div style="font-size:2em; font-weight:bold;">
								End
							</div>
						</li>
					</c:if>
					<li>
						${pDTO.plan_name }
					</li>
						<li>날짜: ${pDTO.start_date} ~ ${pDTO.end_date}</li>
						<li>
							<input type="button" value="수정" id="planChange" onclick="location.href='/jejuana/planner'"/>
						</li>
					<c:if test="${pDTO.review_date>0 }">
						<li>
							<input type="button" value="리뷰작성" class="planReviewN" id="planReview" disabled/>
						</li>
					</c:if>
					<c:if test="${pDTO.review_date<=0 }">
						<c:choose>
						<c:when test="${rList.contains(pDTO.plan_no)}">
							<li>
								<input type="button" value="리뷰작성" class="planReviewN" id="planReview" disabled/>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<input type="button" value="리뷰작성" class="planReviewY" id="planReview" onclick="location.href='/jejuana/review/reviewWrite?plan_no=${pDTO.plan_no}'"/>
							</li>
						</c:otherwise>	
						</c:choose>
					</c:if>
				</ul>		
			</div>
		</c:forEach>
		<div>
			<input type="button" value="선택삭제" id="chooseDelP"/>
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
						<a href="mypagePlan?nowPage=${vo.nowPage-1 }">
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
						<a href="mypagePlan?nowPage=${p }">${p }</a></li>
					</c:if>
				</c:forEach>
			
			<!-- 다음 페이지 -->
			<!-- 다음 페이지가 있을 때 -->
			<c:if test="${vo.nowPage<vo.totalPage }">
				<li>
					<a href="mypagePlan?nowPage=${vo.nowPage+1 }">
					
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