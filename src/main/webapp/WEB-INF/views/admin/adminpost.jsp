<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.demo.Admin" %>
<!DOCTYPE html>
<html>

<head>
    <title>한남대 학생 청원</title>
    <link type="text/css" rel="stylesheet" href="/assets/css/adminpost.css" />
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
        <br>
        <!-- 게시판-->
    <%	Admin a = (Admin)request.getAttribute("admin");
    
	if(session.getAttribute("userName") == null && a != null) {%>
        <table class="board1" width="100%">
            <caption class="bo_title">공지사항</caption>
        </table>
        <div class="bo_wrap">
            <dl>
                <dt>
                    <span class="bo_read_tit">
                        <%= a.getTitle() %>
                    </span>
                </dt>
                <dd class="bo_read_info">
                    <strong>작성일</strong><span><%=a.getRegDate()%></span>
                    <strong>작성자</strong><span><%=a.getRegUser()%></span>
                    <strong>조회수</strong><span><%=a.getViews()%></span>
                </dd>
                <dd class="bo_read_cont">
                    <pre><%= a.getContent() %></pre>
                </dd>
            </dl>
            <div class="bo_list_btn">
                <a href="/admin/admin">목록</a>
            </div>
        <% } else {%>
        데이터를 가져오는데 실패했습니다. 다시 시도해주세요. <a href="/main/main">메인으로 다시 가기</a>
        <% } %>
        </div>
        </div>
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
            <br>

            <!-- 게시판-->
    <%	Admin a = (Admin)request.getAttribute("admin");
 
	if(session.getAttribute("userName") != null && a != null) {%>            
            <table class="board1" width="100%">
                <caption class="bo_title">공지사항</caption>
            </table>
            <div class="bo_wrap">
                <dl>
                    <dt>
                        <span class="bo_read_tit">
                            <%= a.getTitle() %>
                        </span>
                    </dt>
                    <dd class="bo_read_info">
                        <strong>작성일</strong><span><%=a.getRegDate()%></span>
                        <strong>작성자</strong><span><%=a.getRegUser()%></span>
                        <strong>조회수</strong><span><%=a.getViews()%></span>
                    </dd>
                    <dd class="bo_read_cont">
                        <pre><%= a.getContent() %></pre>
                    </dd>
                </dl>

                <div class="bo_list_btn">
                <%
	if(userName != null){
	if(userName.equals("관리자"))	{%>
                    <a href="/admin/goadminUpdate?adminId=<%=a.getAdminId()%>">변경</a>
                    <a href="/admin/admindelete?adminId=<%=a.getAdminId()%>">삭제</a>
                    <%
		}
	}
	%>
	                    <a href="/admin/admin">목록</a>
                </div>
                <% } else {%>
                데이터를 가져오는데 실패했습니다. 다시 시도해주세요. <a href="/main/main">메인으로 다시 가기</a>
                <% } %>
            </div>
            </div>
            <%		
	}
%>
            <!-- //게시판-->
</body>

</html>