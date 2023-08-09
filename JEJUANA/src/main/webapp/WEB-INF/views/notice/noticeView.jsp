<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/jejuana/css/notice.css"/>

<script>
	
	function noticeDelete(){
		if(confirm("글을 삭제하시겠습니까?")){
			location.href = "noticeDelete?ref=${dto.ref}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>"
		}
	}
	
	function applyDelete(){
		if(confirm("글을 삭제하시겠습니까?")){
			location.href = "applyDelete?lvl=${dto.lvl}&ref=${dto.ref}&notice_no=${dto.notice_no}&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>"
		}
	}
	
</script>
<div class="container">
<br><br>
	<div class="titleView">문의게시판</div>
	<div class="view_sub">${dto.notice_subject }</div>
		<div>
		<dl class="list_data">
    			<dt class="dt_id">by ${dto.nickname}</dt>
    			<!-- <dt> · </dt> -->
    			<dt class="dt_date">${dto.notice_date }</dt>
    			<dt class="view_hit">조회 ${dto.notice_hit }</dt>
    		</dl>
	</div>
		<article class="view_cont">${dto.notice_content}</article>
		
		<c:if test="${dto.complain!=null }">
			<div class="com">신고 사유: ${dto.complain }</div>
		</c:if>
	
	
		<div class="btn_m">
			<div><input type="button" value="목록보기" id="nList" onclick="location.href='noticeList?notice_no=${dto.notice_no}<c:if test='${vo.searchWord!=null }'>&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>'"></div>
		<!-- 관리자 로그인이 된 경우 답변글쓰기 가능 -->
		<c:if test="${m_type==1 }">
			<div><input type="button" value="답변하기" id="noticeReply" onclick="location.href='noticeReply/${dto.notice_no}/${dto.secretKey }'"></div>
		</c:if>
		</div>
		
		<!-- 본인이 쓴 글일 때 -->
		<c:if test="${dto.id==loginId && m_type==0}">
		<div class="btn">
			<div><input type="button" value="수정" id="noticeEdit" onclick="location.href='noticeEdit?notice_no=${dto.notice_no}<c:if test='${vo.searchWord!=null }'>&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>'"></div>
			<div><input type="button" value="삭제" id="noticeDelete"  onclick="noticeDelete()"></div>
		</div>	
		</c:if>
		
		<!-- 관리자일 때 -->
		<c:if test="${m_type==1}">
		<div class="btn">
			<div><input type="button" value="수정" id="noticeEdit" onclick="location.href='noticeEdit?notice_no=${dto.notice_no}<c:if test='${vo.searchWord!=null }'>&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>'"></div>
			<div><input type="button" value="삭제" id="noticeDelete"  onclick="applyDelete()"></div>
		</div>	
		</c:if>
		

</div>