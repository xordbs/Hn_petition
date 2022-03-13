<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List"%>
    <%@ page import="com.example.demo.Article" %>
<!DOCTYPE html>
<html>
<head>
  <title>한남대 학생 청원</title>
  <link type="text/css" rel="stylesheet" href="/assets/css/list.css"/>
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
    <h2>전체 청원</h2>
    <br>
    <!-- 게시판-->
<%
	List<Article> plist = (List<Article>)request.getAttribute("articleProgressList");
	if(plist != null) {
		%>		
    <div class="main_table">
      <table class="board1" width="100%">
          <caption class="bo_title">진행 중인 청원</caption>
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
              <th>만료일</th>
          </thead>
          <tbody class="bo_tbody">
      <%		
		for(int i = 0; i<plist.size(); i++){
		%>	
              <tr class="article" onclick="location.href='/article/post?articleId=<%=plist.get(i).getArticleId()%>'">
                  <td><%=plist.size()-i %></td>
                  <td><%=plist.get(i).getTitle() %></td>
                  <td><%=plist.get(i).getRegDate() %></td>
                  <td><%=plist.get(i).getLimitDate() %></td>
              </tr>
                                         <%		}
	}
	%>
          </tbody>
      </table>
      <br>
	    <%
	List<Article> Llist = (List<Article>)request.getAttribute("articleLimitList");
	if(Llist != null) {
		%>				
      <table class="board1" width="100%">
          <caption class="bo_title">만료된 청원</caption>
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
		for(int i = 0; i<Llist.size(); i++){
		%>		
              <tr class="article" onclick="location.href='/article/post?articleId=<%=Llist.get(i).getArticleId()%>'">
                  <td><%=Llist.size()-i %></td>
                  <td><%=Llist.get(i).getTitle() %></td>
                  <td><%=Llist.get(i).getRegDate() %></td>
                  <td><%=Llist.get(i).getLimitDate() %></td>
              </tr>
                           <%		}
	}
%>   
          </tbody>
      </table>
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
    <h2>전체 청원</h2>
    <br>
    <!-- 게시판-->
<%
	List<Article> plist = (List<Article>)request.getAttribute("articleProgressList");
	if(plist != null) {
		%>		
    <div class="main_table">
      <table class="board1" width="100%">
          <caption class="bo_title">진행 중인 청원</caption>
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
              <th>만료일</th>
          </thead>
          <tbody class="bo_tbody">
      <%		
		for(int i = 0; i<plist.size(); i++){
		%>	
              <tr class="article" onclick="location.href='/article/post?articleId=<%=plist.get(i).getArticleId()%>'">
                  <td><%=plist.size()-i %></td>
                  <td><%=plist.get(i).getTitle() %></td>
                  <td><%=plist.get(i).getRegDate() %></td>
                  <td><%=plist.get(i).getLimitDate() %></td>
              </tr>
                                         <%		}
	}
	%>
          </tbody>
      </table>
      <br>

	<%
	List<Article> Llist = (List<Article>)request.getAttribute("articleLimitList");
	if(Llist != null) {
		%>				
      <table class="board1" width="100%">
          <caption class="bo_title">만료된 청원</caption>
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
		for(int i = 0; i<Llist.size(); i++){
		%>		
              <tr class="article" onclick="location.href='/article/post?articleId=<%=Llist.get(i).getArticleId()%>'">
                  <td><%=Llist.size()-i %></td>
                  <td><%=Llist.get(i).getTitle() %></td>
                  <td><%=Llist.get(i).getRegDate() %></td>
                  <td><%=Llist.get(i).getLimitDate() %></td>
              </tr>
                           <%		}
	}
%>   
          </tbody>
      </table>
    </div>
<% 			
		}
	
%>
    </body>
</html>