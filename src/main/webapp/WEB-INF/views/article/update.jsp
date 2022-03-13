<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.example.demo.Article" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한남대 청원 페이지</title>
</head>
<body>
<div onclick="location.href='/main/main'">한남대학교</div>
<h1>게시물 변경</h1>

<%	Article a = (Article)request.getAttribute("article");
 
	if(session.getAttribute("userName") != null && a != null) {%>
	<form action="/article/doUpdate">
		<div>
			<div>
				제목 : <input type="text" name="title" value="<%= a.getTitle() %>">
			</div>
			<div>
				내용 : <textarea name="content"><%= a.getContent() %></textarea>
			</div>
			<div>
				<input type="submit" value="변경"/>
			</div>
			<input type="hidden" name="regUser" value="<%= a.getRegUser() %>" />
			<input type="hidden" name="articleId" value="<%=a.getArticleId() %>" />
<% } else {%>
	데이터를 가져오는데 실패했습니다. 다시 시도해주세요. <a href="/main/main">메인으로 다시 가기</a>
<% } %>
		</div>	
	</form>

</body>
</html>