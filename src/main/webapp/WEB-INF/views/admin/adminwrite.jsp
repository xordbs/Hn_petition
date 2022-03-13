<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>한남대 학생 청원</title>
  <link type="text/css" rel="stylesheet" href="/assets/css/adminwrite.css"/>
</head>
<body>

    <%
	String userName = "";
	if(session.getAttribute("userName") != null){
		userName = (String)session.getAttribute("userName"); //getAttribute는 같은 요청 내에서 사용할 수 있는 서버에서 설정된 값.
	}
	if(userName.equals("관리자")) {
		
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
    <div class="write_board">
        <div class="w_b_title">
            <h2>공지사항 작성</h2>
        </div>
        <br>
        <div class="w_b_index">
          <form action="/admin/doadminWrite">
          <div class="w_b_index_title"><a>공지사항 제목</a></div>
          <textarea rows="1" cols="20" name="title"></textarea><br>
          <div class="w_b_index_title"><a>공지사항 내용</a></div>
          <textarea rows="10" cols="80" minlength="1" name="content"></textarea><br>
          <div class="w_b_index_btn">
            <button type="submit" class="btn1">작성 완료</button>
            <button onclick="/main/main" class="btn2">작성 취소</button>
            <input type="hidden" name="regUser" value="<%= session.getAttribute("userName") %>" />
          </div><br><br>
          </form>
        </div>
    </div>
  </div>
 

   <%
	} else {
%>
    <p>잘못된 접근입니다.</p>>
<% 			
		}
%>

</body>
</html>