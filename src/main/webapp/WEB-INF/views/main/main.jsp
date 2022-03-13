<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.demo.Article" %>
<!DOCTYPE html>
<html>
<head>
  <title>한남대 학생 청원</title>
  <link type="text/css" rel="stylesheet" href="/assets/css/main.css"/>
    <script>
    	function plslogin(){
    		alert("로그인이 필요합니다. 로그인 창으로 이동합니다.");
    		location.href='/login/goLogin';
    	} 
    	
    </script>
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
        <h1 class="title">한남대학교</h1>
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
      <div class="cont_view"><img src="/assets/images/img.jpg" alt="학생 청원 IMG">
      </div>
      <div class="cont_btn">
        <button id="mainbtn1" onclick="plslogin()">청원하러가기</button>
        <button id="mainbtn2" onclick="plslogin()">내가 쓴 청원 보기</button>
      </div>
    </div>
    <br>
    <!-- 게시판-->
                    <%
	List<Article> Toplist = (List<Article>)request.getAttribute("articleTopList");
	if(Toplist != null) {
		%>
    <table class="board1" width="100%">
        <caption class="bo_title">조회수 Top 5</caption>
        <colgroup>
            <col width="10%">
            <col width="50%">
            <col width="20%">
            <col width="20%">
        </colgroup>
        <thead class="bo_thead">
            <th>번호</th>
            <th>제목</th>
            <th>등록일</th>
            <th>참여인원</th>
        </thead>
        <tbody class="bo_tbody">
 <%
		for(int i = 0; i<Toplist.size(); i++){
		%>
            <tr class="article" onclick="location.href='/article/post?articleId=<%=Toplist.get(i).getArticleId()%>'">
                <td><%=i+1%></td>
                <td><%=Toplist.get(i).getTitle() %></td>
                <td><%=Toplist.get(i).getRegDate() %></td>
                <td><%=Toplist.get(i).getViews() %></td>
            </tr>
                           <%		}
	}
%>   
        </tbody>
    </table>
    <!-- //게시판-->
      <br><br><br><br><br>
  </div>


   <%
	} else {
%>
  <div class="header_wrap">
    <div class="header">
        <h1 class="title">한남대학교</h1>
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
      <div class="cont_view"><img src="/assets/images/img.jpg" alt="학생 청원 IMG">
      </div>
      <div class="cont_btn">
        <button id="mainbtn1" onclick="location.href='/article/goWrite'">청원하러가기</button>
        <button id="mainbtn2" onclick="location.href='/article/mypostList?regUser=<%=userName%>'">내가 쓴 청원 보기</button>
      </div>
    </div>
    <br>
    <!-- 게시판-->
    <table class="board1" width="100%">
        <caption class="bo_title">조회수 Top 5</caption>
        <colgroup>
            <col width="10%">
            <col width="50%">
            <col width="20%">
            <col width="20%">
        </colgroup>
        <thead class="bo_thead">
            <th>번호</th>
            <th>제목</th>
            <th>등록일</th>
            <th>참여인원</th>
        </thead>
        <tbody class="bo_tbody">
                 <%
	List<Article> Toplist = (List<Article>)request.getAttribute("articleTopList");
	if(Toplist != null) {
		
		for(int i = 0; i<Toplist.size(); i++){
		%>
            <tr class="article" onclick="location.href='/article/post?articleId=<%=Toplist.get(i).getArticleId()%>'">
                <td><%=i+1%></td>
                <td><%=Toplist.get(i).getTitle() %></td>
                <td><%=Toplist.get(i).getRegDate() %></td>
                <td><%=Toplist.get(i).getViews() %></td>
            </tr>
                           <%		}
	}
%>   
        </tbody>
    </table>
<% 			
		}
	
%>
    <!-- //게시판-->
  <br><br><br><br><br>
  </div>
  
    </body>
</html>