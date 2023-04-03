<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/link.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/community.css">

<style>
	.middle_box:last-child{
	background-color: #c3abd0;
	}
	.middle_box:last-child>a{
	color: white;
	}

</style>
<%@ include file="../layout/header.jsp" %>
  <div id="container">
    <div id="comm_header">
      <div  class="comm_h1">
        <h3>커뮤니티</h3> 
      </div>
      <div>
      </div>
      <div>
        <form>
          <a href="/saveboard">글쓰기</button></a>
        </form>
      </div>
    </div>
    <section id="comm_main">
      <div id="comm_menu">
        <ul id="comm_menu_bar">
          <div class="comm_menu_bar_1">
            <li class="menu1">
              <a onclick="hide1();" return false;>
                <div class="comm_menu comm_menu1">
               		<img alt="all" src="/img/all.png">
                  <span class="comm_menu_span">전체</span>
                </div>
              </a>
            </li>
            <li class="menu2">
              <a onclick="hide2();" return false;>
                <div class="comm_menu comm_menu2">
                  <img src="/img/team.png" alt="공유해요">
                  <span>공유해요</span>
                </div>
              </a>
            </li>
            <li class="menu3">
              <a onclick="hide3();" return false;>
                <div class="comm_menu comm_menu3">
                  <img src="/img/problem.png" alt="질문해요">
                  <span>질문해요</span>
                </div>
              </a>
            </li>
            <li class="menu4">
              <a onclick="hide4();" return false;>
                <div class="comm_menu comm_menu4">
                  <img src="/img/study.png" alt="공부해요">
                  <span>공부해요</span>
                </div>
              </a>
            </li>
            <li class="menu5">
              <a onclick="hide5();" return false;>
                <div class="comm_menu comm_menu5">
                  <img src="/img/campaign.png" alt="공지사항">
                  <span>공지사항</span>
                </div>
              </a>
            </li>
          </div>
        </ul>
      </div>
     
 	 <div class="comm_board comm_board1">
	 	<c:forEach var="commu" items="${community1.content}">
	        <ul class="comm_board_ul">
	          <a href="/auth/community/${commu.id}">
	            <li class="comm_board_box">
	              <div class="comm_board_text">
	                <p class="comm_category">${commu.category}</p>
	                <p class="comm_title">${commu.title}</p>
	                <p class="comm_content"></p>
	                <p class="comm_comment"><img src="/img/comment.png" alt="댓글">0</p>
	              </div>
	              <c:choose>
	              	<c:when test="${commu.fileOriName == null}">
		                <div class="comm_board_img" style="display: none;">
		              		<img src="/auth/images?filename=${commu.filename}">
		              	</div>
		            </c:when>
		            <c:otherwise>
		            	<div class="comm_board_img">
		              		<img src="/auth/images?filename=${commu.filename}">
		                </div>
		            </c:otherwise>
	              </c:choose>
	            </li>
	          </a>
	        </ul>
        </c:forEach>
      </div>
      <div class="comm_board comm_board2" style="display:none;">
      	<c:forEach var="commu" items="${community1.content}">
      		<c:if test="${commu.category eq '공유해요'}">
	        <ul class="comm_board_ul">
	          <a href="/auth/community/${commu.id}">
	            <li class="comm_board_box">
	              <div class="comm_board_text">
	                <p class="comm_category">${commu.category}</p>
	                <p class="comm_title">${commu.title}</p>
	                <p class="comm_content"></p>
	                <p class="comm_comment"><img src="/img/comment.png" alt="댓글">0</p>
	              </div>
	              <c:choose>
	              	<c:when test="${commu.fileOriName == null}">
		                <div class="comm_board_img" style="display: none;">
		              		<img src="/auth/images?filename=${commu.filename}">
		              	</div>
		            </c:when>
		            <c:otherwise>
		            	<div class="comm_board_img">
		              		<img src="/auth/images?filename=${commu.filename}">
		                </div>
		            </c:otherwise>
	              </c:choose>
	            </li>
	          </a>
	        </ul>
	        </c:if>
        </c:forEach>
      </div>
      <div class="comm_board comm_board3" style="display:none;">
      	<c:forEach var="commu" items="${community1.content}">
      		<c:if test="${commu.category eq '질문해요'}">
	        <ul class="comm_board_ul">
	          <a href="/auth/community/${commu.id}">
	            <li class="comm_board_box">
	              <div class="comm_board_text">
	                <p class="comm_category">${commu.category}</p>
	                <p class="comm_title">${commu.title}</p>
	                <p class="comm_content"></p>
	                <p class="comm_comment"><img src="/img/comment.png" alt="댓글">0</p>
	              </div>
	              <c:choose>
	              	<c:when test="${commu.fileOriName == null}">
		                <div class="comm_board_img" style="display: none;">
		              		<img src="/auth/images?filename=${commu.filename}">
		              	</div>
		            </c:when>
		            <c:otherwise>
		            	<div class="comm_board_img">
		              		<img src="/auth/images?filename=${commu.filename}">
		                </div>
		            </c:otherwise>
	              </c:choose>
	            </li>
	          </a>
	        </ul>
	        </c:if>
        </c:forEach>
      </div>
      <div class="comm_board comm_board4" style="display:none;">
      	<c:forEach var="commu" items="${community1.content}">
      		<c:if test="${commu.category eq '공부해요'}">
	        <ul class="comm_board_ul">
	          <a href="/auth/community/${commu.id}">
	            <li class="comm_board_box">
	              <div class="comm_board_text">
	                <p class="comm_category">${commu.category}</p>
	                <p class="comm_title">${commu.title}</p>
	                <p class="comm_content"></p>
	                <p class="comm_comment"><img src="/img/comment.png" alt="댓글">0</p>
	              </div>
	              <c:choose>
	              	<c:when test="${commu.fileOriName == null}">
		                <div class="comm_board_img" style="display: none;">
		              		<img src="/auth/images?filename=${commu.filename}">
		              	</div>
		            </c:when>
		            <c:otherwise>
		            	<div class="comm_board_img">
		              		<img src="/auth/images?filename=${commu.filename}">
		                </div>
		            </c:otherwise>
	              </c:choose>
	            </li>
	          </a>
	        </ul>
	        </c:if>
        </c:forEach>
      </div>
      <div class="comm_board comm_board5" style="display: none;">

      	  <c:forEach var="community" items="${community2.content}">
	        <ul class="comm_board_ul">
	          <a href="/auth/community/${community.id}">
	            <li class="comm_board_box">
	              <div class="comm_board_text">
	                <p class="comm_category">${community.category}</p>
	                <p class="comm_title">${community.title}</p>
	                <p class="comm_content"></p>
	                <p class="comm_comment"><img src="/img/comment.png" alt="댓글">0</p>
	              </div>
	              <c:choose>
	              	<c:when test="${community.fileOriName == null}">
		                <div class="comm_board_img" style="display: none;">
		              		<img src="/auth/images?filename=${community.filename}">
		              	</div>
		            </c:when>
		            <c:otherwise>
		            	<div class="comm_board_img">
		              		<img src="/auth/images?filename=${community.filename}">
		                </div>
		            </c:otherwise>
	              </c:choose>
	            </li>
	          </a>
	        </ul>
        </c:forEach>
      </div>
      
    </div>
  
  </section>
	  <div class="commu_page">
	      <ul class="pagination">
	      	<c:choose>
	      		<c:when test="${community.first}">
			  		<li class="page-item disabled"><a class="page-link" href="?page=${community.number-1}"><</a></li>
			  	</c:when>
			  	<c:otherwise>
			  		<li class="page-item"><a class="page-link" href="?page=${community.number-1}"><</a></li>
			  	</c:otherwise>
			</c:choose>
			  <li class="page-item"><a class="page-link" href="/auth/community">1</a></li>
			  <li class="page-item"><a class="page-link" href="/auth/community?page=1">2</a></li>
			  <li class="page-item"><a class="page-link" href="/auth/community?page=2">3</a></li>
			  <c:choose>
	      		<c:when test="${community.last}">
			  		<li class="page-item disabled"><a class="page-link" href="?page=${community.number+1}">></a></li>
			  	</c:when>
			  	<c:otherwise>
			  		<li class="page-item"><a class="page-link" href="?page=${community.number+1}">></a></li>
			  	</c:otherwise>
			</c:choose>
		  </ul>
		</div>
<script type="text/javascript" src="/JS/community.js"></script>
<%@ include file="../layout/footer.jsp" %>