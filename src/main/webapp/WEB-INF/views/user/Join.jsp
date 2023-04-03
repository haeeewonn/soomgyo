<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"  xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숨교</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/462a97624e.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
 <link rel="stylesheet" href="/css/join_main.css">
<%@ include file ="../layout/header.jsp" %>
      <div id="join_main_container">
        <div class="join_font">
            <h3>회원가입</h3>
        </div>
        <div class="box">
            <div class="student">
                <a href="/auth/joinstudent"><p class="small_font">학생</p></a>
            </div>
            <div class="teacher">
                <a href="/auth/jointeacher"><p class="small_font">선생님</p></a>
            </div>
        </div>
    </div>
    
<%@ include file="../layout/footer.jsp" %>