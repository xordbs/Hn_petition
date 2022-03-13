<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List"%>
    <%@ page import="com.example.demo.Article" %>
<!DOCTYPE html>
<html>
<head>
  <title>한남대 학생 청원</title>
  <link type="text/css" rel="stylesheet" href="/assets/css/faq.css"/>
</head>
<body>

    <%
	String userName = "";
	if(session.getAttribute("userName") != null){
		userName = (String)session.getAttribute("userName"); //getAttribute는 같은 요청 내에서 사용할 수 있는 서버에서 설정된 값.
	}
	if(userName.equals("")) {
		
%>
  <div class="header_wrap">
    <div class="header">
        <h1 class="title" onclick="location.href='/main/main'">한남대학교</h1>
        <div class="head_btn">
           <a href="/login/goLogin">Login</a>
           <a href="/login/goJoin">Join</a>
        </div>
    </div>
  </div>
  <div class="container">
    <div class="contents">
       <div class="cont_tab">
          <div>
            <a href="/article/list">전체 청원</a>
            <ul class="depth2">
              <li><a href="/article/progressList">진행 중인 청원</a></li>
              <li><a href="/article/limitList">만료된 청원</a></li>
            </ul>
          </div>
          <div>
            <a href="/article/viewsList">인기순 청원</a>
          </div>
          <div>
            <a href="/admin/admin">공지사항</a>
          </div>
          <div>
            <a href="/article/faq">FAQ</a>
          </div>
        </div><br>
    </div>
    <div class="faq">
      <div class="hgroup">
      <br>
      <h1>FAQ</h1>
      </div>
      <br>
      <ul>
        <li class="article">
          <p class="q"><a href="#ans1">Q : 한남대 학생청원이란?</a></p>
          <p class="ans" id="ans1">A : 국민 청원과 같은 플랫폼으로 ‘학생소통 플랫폼’에 적용하여 학생들의 청원을 학교측에 전달하여 의사소통을 목적으로 하는 커뮤니티 사이트입니다.</p>
        </li>
        <li class="article">
          <p class="q"><a href="#ans2">Q : 학생청원 어떻게 참여하나요?</a></p>
          <p class="ans" id="ans2">A : 홈페이지에 가입하여 직접 청원글을 작성하거나, 진행 중인 청원에 동의하실 수 있습니다. 한 번 작성하거나 동의한 청원에 대해서는 삭제나 철회하실 수 없습니다.</p>
        </li>
        <li class="article">
          <p class="q"><a href="#ans3">Q : 학생청원, 이렇게 답변드립니다.</a></p>
          <p class="ans" id="ans3">A : 공개된 시점으로부터 --일 이내 1000명 이상의 학생이 동의한 청원에 답하겠습니다.</p>
        </li>
      </ul>
    </div>
    <!-- //게시판-->
   <%
	} else {
%>
   <div class="header_wrap">
    <div class="header">
        <h1 class="title" onclick="location.href='/main/main'">한남대학교</h1>
        <div class="head_btn">
                <a><%=userName %>님 안녕하세요</a>
                <a href="/login/goLogout">Logout</a>
        </div>
    </div>
  </div>
  <div class="container">
    <div class="contents">
       <div class="cont_tab">
          <div>
            <a href="/article/list">전체 청원</a>
            <ul class="depth2">
              <li><a href="/article/progressList">진행 중인 청원</a></li>
              <li><a href="/article/limitList">만료된 청원</a></li>
            </ul>
          </div>
          <div>
            <a href="/article/viewsList">인기순 청원</a>
          </div>
          <div>
            <a href="/admin/admin">공지사항</a>
          </div>
          <div>
            <a href="/article/faq">FAQ</a>
          </div>
        </div><br>
    </div>
    <div class="faq">
      <div class="hgroup">
      <br>
      <h1>FAQ</h1>
      </div>
      <br>
      <ul>
        <li class="article">
          <p class="q"><a href="#ans1">Q : 한남대 학생청원이란?</a></p>
          <p class="ans" id="ans1">A : 국민 청원과 같은 플랫폼으로 ‘학생소통 플랫폼’에 적용하여 학생들의 청원을 학교측에 전달하여 의사소통을 목적으로 하는 커뮤니티 사이트입니다.</p>
        </li>
        <li class="article">
          <p class="q"><a href="#ans2">Q : 학생청원 어떻게 참여하나요?</a></p>
          <p class="ans" id="ans2">A : 홈페이지에 가입하여 직접 청원글을 작성하거나, 진행 중인 청원에 동의하실 수 있습니다. 한 번 작성하거나 동의한 청원에 대해서는 삭제나 철회하실 수 없습니다.</p>
        </li>
        <li class="article">
          <p class="q"><a href="#ans3">Q : 학생청원, 이렇게 답변드립니다.</a></p>
          <p class="ans" id="ans3">A : 공개된 시점으로부터 --일 이내 1000명 이상의 학생이 동의한 청원에 답하겠습니다.</p>
        </li>
      </ul>
    </div>
    </div>
<% 			
		}
	
%>
    </body>
</html>