<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/jejuana/css/notice.css"/>

<div class="container">
	<div class="title">문의게시판</div>
	
	<!-- 검색 -->
	<div class="searchDiv">
		<form method="get" id="searchForm" action="noticeList">
			<select name="searchKey" class="searchKey">
				<option value="notice_subject">제목</option>
				<option value="id">작성자</option>
				<option value="notice_content">글내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWord"/>
			<input type="submit" value="검색하기"/>
		</form>
	</div>
	
	<form>
		<!-- 페이지번호, 검색키, 검색어 -->
		<input type="hidden" name="nowPage" value="${vo.nowPage }"/>
		<c:if test="${vo.searchWord!=null}">
			<input type="hidden" name="searchKey" value="${vo.searchKey }"/>
			<input type="hidden" name="searchWord" value="${vo.searchWord }"/>
		</c:if>
		<ul class="noticeList">
			<li>no</li>
			<li>제목</li>
			<li>작성자</li>
			<li>날짜</li>
			<li>조회수</li>
			
		<c:forEach var="gDTO" items="${gList }">
			<li style="font-weight:bold;">공지</li>
			<li style="font-weight:bold;">
				<a href="noticeView?notice_no=${gDTO.notice_no }">${gDTO.notice_subject }</a>
			</li>
			<li>${gDTO.nickname }</li>
			<li>${gDTO.notice_date }</li>
			<li>${gDTO.notice_hit }</li>
		</c:forEach>
		
		<c:set var="recordNum" value="${vo.totalRecord - (vo.nowPage-1)*vo.onePageRecord}"/>
		
		<c:forEach var="dto" items="${list }">
			<li>${recordNum }</li>
			<li>
			<c:choose>
			<c:when test="${dto.secretKey==true}"><c:if test="${dto.lvl==1 }"><p style="float:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;↳</p></c:if><img alt="secret" src="/jejuana/img/secret.png">
				<c:choose>
				<c:when test="${dto.id==loginId }"><p><a href="noticeView?notice_no=${dto.notice_no }&nowPage=${vo.nowPage}<c:if test='${vo.searchWord!=null }'>&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${dto.notice_subject }</a></p></c:when>
				<c:when test="${m_type==1 }"><p><a href="noticeView?notice_no=${dto.notice_no }&nowPage=${vo.nowPage}<c:if test='${vo.searchWord!=null }'>&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${dto.notice_subject }</a></p></c:when>
				<c:when test="${dto.orgId==loginId }"><p><a href="noticeView?notice_no=${dto.notice_no }&nowPage=${vo.nowPage}<c:if test='${vo.searchWord!=null }'>&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${dto.notice_subject }</a></p></c:when>
				<c:otherwise>${dto.notice_subject }</c:otherwise>
				</c:choose>
			</c:when>
				<c:otherwise><a href="noticeView?notice_no=${dto.notice_no }&nowPage=${vo.nowPage}<c:if test='${vo.searchWord!=null }'>&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">
				<c:if test="${dto.lvl==1 }"><p style="float:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;↳</p></c:if>${dto.notice_subject }</a></c:otherwise>
			</c:choose></li>
			<li>${dto.nickname }</li>
			<li>${dto.notice_date }</li>
			<li>${dto.notice_hit }</li>
			
		<c:set var="recordNum" value="${recordNum-1 }"/>
		</c:forEach>
		
		</ul>
	</form>
	
	<div class="btn">
			<div><c:if test="${loginStatus=='Y' && m_type==0}">
			<input type="button" value="문의하기" id="noticeWrite" onClick="location.href='noticeWrite'"></c:if>
			</div>
			<div><c:if test="${m_type==1 }">
			<input type="button" value="공지작성하기" id="managerWrite" onClick="location.href='managerWrite'"></c:if>
			</div>
		</div>
	
	<!-- 페이징 -->
		<div class="pagingDivP">
			<ul>
				<c:if test="${vo.nowPage==1 }">
					<li><</li>
				</c:if>
				<c:if test="${vo.nowPage>1 }">
					<li><a href="noticeList?nowPage=${vo.nowPage-1 }<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>"><</a></li>
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
					<a href="noticeList?nowPage=${p }<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">${p }</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지 -->
			<c:if test="${vo.nowPage<vo.totalPage }"> <!-- 다음 페이지가 있을 때 -->
				<li><a href="noticeList?nowPage=${vo.nowPage+1 }<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">></a></li>	
			</c:if>	
			<c:if test="${vo.nowPage==vo.totalPage }"> <!-- 현재 페이지가 마지막 페이지일 때 -->
				<li>></li>
			</c:if>
			</ul>
		</div>
</div>