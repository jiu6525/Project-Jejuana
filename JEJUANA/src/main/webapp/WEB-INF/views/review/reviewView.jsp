<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/jejuana/css/review.css"/>
<script>
    function reviewDel(){
        if(confirm("글을 삭제하시겠습니까?")){
            location.href = "reviewDel?plan_no=${dto.plan_no}";
        }
    }
    $(function(){
        var courseArr = new Array(); //코스가 담긴 배열
        var dayArr = new Array(); //여행일이 담긴 배열
        <c:forEach var="cDTO" items="${list }">
            courseArr.push("${cDTO.place_name}");
            dayArr.push("${cDTO.days_order}");
            var days = "${cDTO.days}";
        </c:forEach>
        
        //코스 목록
        if(dayArr.length != 0){
            var tag = "<div class='reviewSubM'> ${dto.nickname} 님이 다녀온 " + days + "일 동안의 여행 코스" + "</div>";
            for(let i=1; i<=days; i++){ //1,2,3,4
                tag += "<div>" + i + "일차 "+ '<i class="fa-solid fa-caret-right dayIcon"></i> ';
                for(let j=0; j<=courseArr.length; j++){ //1,2,3,4,5,6,7,8,9
                    if(dayArr[j] == i){
                        tag += courseArr[j]+ " ";
                    }
                }
                tag += "</div>";
            }
            $("#course").append(tag);
        }
    
        //댓글 목록 - ajax로 해당 게시물의 모든 댓글 선택해 뷰에 표시
        function commentList(){
            $.ajax({
                url : "/jejuana/commentList",
                data:{target_no:${dto.plan_no}},
                type:"GET",
                dataType:"json",
                success:function(comment){
                    var tag = "";
                    $(comment).each(function(i, cDTO){
                        tag += "<li><div><b>"+cDTO.id+" ("+cDTO.writedate+")</b>";
                        //본인이 쓴 댓글일 때
                        if(cDTO.id == '${loginId}'){
                            tag += "<input type='button' value='수정'/>";
                            tag += "<input type='button' value='삭제' title='"+cDTO.comment_no+"' />";
                            
                            tag += "<p>"+cDTO.comment_content+"</p></div>";
                            
                            //댓글 수정폼 - 기존 댓글 내용, 댓글 번호가 폼에 있어야 함
                            tag += "<div style='display:none'>";
                            tag += "<form method='post'>";
                            tag += "<input type='hidden' name='comment_no' value='"+cDTO.comment_no+"'/>"; //댓글 번호
                            tag += "<textarea name='comment_content' style='width:400px; height:80px;'>"+cDTO.comment_content+"</textarea>";
                            tag += "<input type='submit' value='수정하기'>";
                            tag += "</form>";
                            tag += "</div>";
                        }else{
                            tag += "<p>"+cDTO.comment_content+"</p></div>";
                        }
                        
                        tag += "</li>";
                    });
                    $("#commentList").html(tag);
                },error:function(e){
                    console.log(e.responseText);
                }
            });
        }
        
        //댓글 작성
        if(${loginStatus!='Y' }){
            $("#comment_button").attr("disabled", true);
            $("#comment_content").attr("readonly", true);
        }
        $("#commentForm").submit(function(){
            //코멘트가 있을 때 ajax실행
            if($("#comment_content").val()==""){
                alert("댓글을 입력하세요");
                return false;
            }
            
            var query = $(this).serialize(); 
            $.ajax({
                url: "/jejuana/commentSend",
                data: query,
                type: "POST",
                success:function(result){
                    console.log(result);
                    document.getElementById("comment_content").value=''; //기존에 입력한 댓글 지우기
                    //댓글 목록 뿌리기
                    commentList();
                },error:function(e){
                    console.log(e.responseText);
                }
                
            });
            return false; //form의 기본 이벤트 때문 다음 실행 중단(action으로 이동)
        });
        //댓글 수정폼 보여 주기
        $(document).on('click','#commentList input[value=수정]',function(){
            $(this).parent().css("display","none"); //댓글 숨기고
            $(this).parent().next().css("display","block"); //폼 보여주기
            
        });
        //댓글 수정(DB)
        $(document).on('click','#commentList input[value=수정하기]',function(){
            //데이터 준비
            var params = $(this).parent().serialize();
            var url = "/jejuana/commentEdit";
            
            $.ajax({
                url : url,
                data : params,
                type : "POST",
                success:function(result){
                    commentList();
                },error:function(e){
                    console.log(e.responseText);    
                }
            });
            
            
            return false;
        });
        
        //댓글 삭제
        $(document).on('click', '#commentList input[value=삭제]', function(){
            if(confirm("댓글을 삭제하시겠습니까?")){
                var params = "comment_no=" + $(this).attr("title");
                var url = "/jejuana/commentDelete";
                
                $.ajax({
                    url : url,
                    data: params,
                    succenss:function(result){
                        console.log(result);
                        commentList();
                    },error:function(e){
                        console.log(e.responseText);
                    }
                });
            }
        });
        
        //댓글 목록 뿌리기 -- 처음 글 내용 보기로 왔을 때 실행
        commentList();
    });
</script>
<div class="container reviewView_container">
    <div class="category">
        <i class="fa-regular fa-flag"></i>
        ${dto.tag }
    </div>
    <div class="view_sub">${dto.review_subject }</div>
    <div class="view_NameDate">
        <dl class="list_data">
                <dt class="dt_id">by ${dto.nickname}</dt>
                <dt class="dt_date">${dto.writedate }</dt>
                <dt class="view_hit">
                    <i class="fa-solid fa-street-view"></i>
                    ${dto.review_hit }
                </dt>
            </dl>
    </div>
    
    <article class="view_cont">${dto.review_content}</article>
    
    <div id="course"></div>
    
    <div class="postbtn" style="word-wrap:break-word;">
        <c:if test="${loginStatus!='Y'}">
            <a href="javascript:alert('로그인 후 이용 가능합니다.');" class="joayo">
	            좋아요
	            <i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
	            ${dto.joayo_hit }
            </a>
            <a href="javascript:alert('로그인 후 이용 가능합니다.');" class="bookmark">
            	<i class="fa-solid fa-bookmark reviewView_book"></i>
            	북마크
           	</a>
        </c:if>
        <c:if test="${loginStatus=='Y' && loginId!=dto.id && cnt==0}">
            <a href="reviewJoa?plan_no=${dto.plan_no }" class="joayo">
	            좋아요
	            <i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
	            ${dto.joayo_hit }
            </a>
            <a href="/jejuana/notice/complainWrite?plan_no=${dto.plan_no }&review_subject=${dto.review_subject}&id=${dto.id}" style="margin-top: 3px;" class="complainWrite">
            	<i class="fa-solid fa-tombstone-blank" style="color: #ea2a2a;"></i>
            	신고하기
            </a>
            <a href="reviewBm?target_no=${dto.plan_no }" class="bookmark">
	            <i class="fa-solid fa-bookmark reviewView_book"></i>
	            북마크
            </a>
            <!-- 내 일정에 담기 
            <input type="button" id="planPopup" value="일정담기">-->
        </c:if>
        
        <c:if test="${loginStatus=='Y' && loginId!=dto.id && cnt!=0}">
            <a href="reviewJoa?plan_no=${dto.plan_no }" class="joayo">
	            좋아요
	            <i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
	            ${dto.joayo_hit }</a>
            <a href="javascript:alert('이미 신고된 글입니다.');" class="complainWrite" style="margin-top: 3px;">
            	<i class="fa-solid fa-tombstone-blank" style="color: #ea2a2a;"></i>
            	신고하기
           	</a>
            <a href="reviewBm?target_no=${dto.plan_no }" class="bookmark">
            	<i class="fa-solid fa-bookmark reviewView_book"></i>
            	북마크
            </a>
            <!-- 내 일정에 담기 
            <input type="button" id="planPopup" value="일정담기">-->
        </c:if>
        
        <c:if test="${loginId==dto.id }">
            <a href="javascript:alert('자신이 작성한 글은 좋아요를 할 수 없습니다.');" class="joayo">
	            좋아요
	            <i class="fa-solid fa-heart" style="color: #d11a1a;"></i>
	            ${dto.joayo_hit }
            </a>
            <a href="javascript:alert('자신이 작성한 글은 북마크를 할 수 없습니다.');" class="bookmark">
	            <i class="fa-solid fa-bookmark reviewView_book"></i>
	            북마크
            </a>
        </c:if>
    </div>
    
    <div class="view_subMenu">
        <input type="hidden" name="plan_no" value="${dto.plan_no }">
        <a href="reviewList">목록</a>
        <c:if test="${loginId==dto.id }">
            <a href="reviewEdit?plan_no=${dto.plan_no }">수정</a>
        <a href="javascript:reviewDel()">삭제</a>
        </c:if>
    </div>
    
    <hr>
    <div>댓글</div>
    <div class="ViewEndBox">
        <form method="post" id="commentForm">
            <input type="hidden" name="target_no" value="${dto.plan_no }">
            <textarea name="comment_content" id="comment_content" placeholder="<c:if test= "${loginStatus=='Y' }">내용을 입력해 주세요</c:if><c:if test= "${loginStatus!='Y' }">로그인 후 입력 가능합니다</c:if>"></textarea>
            <div class="comment_buttonDiv">
                <button id="comment_button">등록</button>
            </div>
        </form>
        <ul id="commentList">
        </ul>
    </div>
</div>