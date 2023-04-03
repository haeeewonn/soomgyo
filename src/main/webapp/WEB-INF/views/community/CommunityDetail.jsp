<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/link.jsp" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/CommunityDetail.css">
<%@ include file="../layout/header.jsp"%>
	<div id="container">
        <div class="category">
            <span class="sp_category">${community.category}</span>
            <span id="id" style="display:none;">${community.id}</span>
        </div>
       
        
        <div class="title">
            <span class="sp_title">${community.title}</span>
        </div>
        
        <div class="board_info">
            <div class="writer">
                <span class="sp_writer">작성자 : ${community.users.name}</span>
            </div>
            <div class="board_date_count">
                <span class="sp_date">
                	<fmt:formatDate pattern = "yyyy/MM/dd" value="${community.createDate}"/>
                </span>
            
                <span class="sp_count">조회수: ${community.count}</span>
            </div>
        </div>
        
        <div class="content">
        	<div class="content_uses">
           		<p><pre>${community.content}</pre></p>
           		<c:choose>
           			<c:when test="${community.fileOriName == null}">
		            	<div class="commu_content_imgbox" style="display: none;">
		            		<img src="/auth/images?filename=${community.filename}">
		            	</div>
	            	</c:when>
	            	<c:otherwise>
	            		<div class="commu_content_imgbox">
		            		<img src="/auth/images?filename=${community.filename}">
		            	</div>
	            	</c:otherwise>
            	</c:choose>
            </div>
            <div class="comment_img">
                
                <img src="img/comment.png" alt="" style="width: 14px;"> <span class="comment_img_label">댓글 : ${reply}</span>
                <div class="content_btn">
	                <c:if test="${community.users.id==principal.user.id}">
	                    <a href="/community/${community.id}/updateForm">수정</a>
	                    <button id="btn-delete">삭제</button>
	                </c:if>
                </div>
            </div>
        </div>
        <div class="reply">
            <label for="comment" class="reply_label">댓글 </label>
            <input type="hidden" id="communityID" value="${community.id}">
            <input type="text" placeholder="댓글을 입력해주세요!" id="comment"name="comment">
            <button id="reply-btn-save" class="btn_comment">등록</button>
        </div>
        	<c:forEach var="reply" items="${community.replyList}" varStatus="status">
		       <div class="comment">
			       	<div class="reply_name">
			       		<p>${reply.users.name}</p>
			       		<span id="reid" style="display:none;">${reply.id}</span>
			       	</div>
			       	
			       	<div class="reply_content">
			       		<p id="re_name${status.index}">${reply.content}</p>	
			       		<textarea id="re_modify_box${status.index}">${reply.content}</textarea>
			       	</div>
			       	
			       	<div class="reply_time">
			       		<div class="reply_time_box">
			       			<p><fmt:formatDate pattern = "MM/dd HH:mm" value="${reply.createDate}"/></p>
			       		</div>
			       		<div class="reply_time_box">
				       		<c:if test="${reply.users.id==principal.user.id}">
				        		<button class="mo_btn" id="${status.index}" value="${reply.id}" onclick="cknum(this.id)">수정</button>
				        		<button class="de_btn" id="de_btn${status.index}" onclick="replyDelete(${community.id},${reply.id})">삭제</button>
				        		<button class="${status.index}" id="mo_finish_btn${status.index}" onclick="final_modify(${community.id},${reply.id},this.id)" style="display:none;">수정완료</button>
				        	</c:if>
			       		</div>
			       	</div>
		       </div>
	    	</c:forEach>
    </div>
<script type="text/javascript" src="/JS/community.js"></script>
<script type="text/javascript" src="/JS/reply.js"></script>
<%@ include file="../layout/footer.jsp" %>