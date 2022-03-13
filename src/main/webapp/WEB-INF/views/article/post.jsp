<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.demo.Article" %>
<!DOCTYPE html>
<html>

<head>
    <title>한남대 학생 청원</title>
    <link type="text/css" rel="stylesheet" href="/assets/css/post.css" />
        <script>
    	function plslogin(){
    		alert("로그인이 필요합니다. 로그인 창으로 이동합니다.");
    		location.href='/login/goLogin';
    	} 
    	
        function checkForm(form) {
            if (form.body.value.trim().length == 0) {
                form.body.value = "동의합니다."
                return true;
            }
            alert("동의하였습니다.");
            form.submit();
        } 
        
    	function replyAert(){
            alert("동의하였습니다.");
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

    <%	Article a = (Article)request.getAttribute("article");
	List<Article> list = (List<Article>)request.getAttribute("articleReplylist");
 
	if(session.getAttribute("userName") == null && a != null) {%>
    <div class="bo_title">
        <h1><%= a.getTitle() %></h1>
        <h3>참여인원 : [ <%=list.size() %>명 ]</h3>
    </div>
    <br>
    <table class="bo_sub" width="100%">
        <caption></caption>
        <colgroup>
            <col width="33%">
            <col width="33%">
            <col width="33%">
        </colgroup>
        <thead>
            <th>청원 시작일</th>
            <th>청원 마감일</th>
            <th>청원인</th>
        </thead>
        <tbody>
            <tr>
                <td class="bo_sub_arg"><%=a.getRegDate()%></td>
                <td class="bo_sub_arg"><%=a.getLimitDate()%></td>
                <td class="bo_sub_arg"><%=a.getRegUser()%></td>
            </tr>
        </tbody>
    </table><br><br>

    <div class="bo_cont">
        <h3>청원 내용</h3>
        <div><%= a.getContent() %></div>
    </div>

    <% } else {%>
    데이터를 가져오는데 실패했습니다. 다시 시도해주세요. <a href="/main/main">메인으로 다시 가기</a>
    <% } %>

    <div class="bo_re">
        <!--댓글이지롱-->
        <br><br>
        <h3>청원 동의 : [ <%=list.size() %>명 ]</h3>
        <form>
            <% 
	if(session.getAttribute("userName") == null && a != null) {	%>
            <input type="hidden" name="articleId" value="<%=a.getArticleId() %>" />
            <input type="hidden" name=userName value="<%= session.getAttribute("userName") %>" />
            <textarea name="body" placeholder="동의합니다."></textarea><br>
        </form>
                    <button onclick="plslogin()">동의 하기</button>
        <br><br><br>
        <%	
	if(list != null) {		
		for(int i = 0; i<list.size(); i++){
		%>
        <div class="re">
            <h4><%=list.get(i).getUserName() %></h4>
            <div><%=list.get(i).getBody() %></div>
            <br>
        </div>

    <%		}
	}
	}
%>
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

    <%	Article a = (Article)request.getAttribute("article");
	List<Article> list = (List<Article>)request.getAttribute("articleReplylist");
 
	if(session.getAttribute("userName") != null && a != null) {%>
    <div class="bo_title">
        <h1><%= a.getTitle() %></h1>
        <h3>참여인원 : [ <%=list.size() %>명 ]</h3>
    </div>
    <br>
    <table class="bo_sub" width="100%">
        <caption></caption>
        <colgroup>
            <col width="33%">
            <col width="33%">
            <col width="33%">
        </colgroup>
        <thead>
            <th>청원 시작일</th>
            <th>청원 마감일</th>
            <th>청원인</th>
        </thead>
        <tbody>
            <tr>
                <td class="bo_sub_arg"><%=a.getRegDate()%></td>
                <td class="bo_sub_arg"><%=a.getLimitDate()%></td>
                <td class="bo_sub_arg"><%=a.getRegUser()%></td>
            </tr>
        </tbody>
    </table><br><br>

    <div class="bo_cont">
        <h3>청원 내용</h3>
        <div><%= a.getContent() %></div>
    </div>

    <% }else {%>
    데이터를 가져오는데 실패했습니다. 다시 시도해주세요. <a href="/main/main">메인으로 다시 가기</a>
    <% } 
	if(userName != null){
	if(userName.equals("관리자"))	{%>
	      <div class="bo_list_btn">
    <a href="/article/goUpdate?articleId=<%=a.getArticleId()%>">변경</a>
    <a href="/article/delete?articleId=<%=a.getArticleId()%>">삭제</a>
    </div>
    <%
		}
	}       
        %>

    <div class="bo_re">
        <!--댓글이지롱-->
        <br><br>
        <h3>청원 동의 : [ <%=list.size() %>명 ]</h3>
        <form onsubmit="checkForm(this);" action="/article/doWriteReply">
            <% 
	if(session.getAttribute("userName") != null && a != null) {	%>
            <input type="hidden" name="articleId" value="<%=a.getArticleId() %>" />
            <input type="hidden" name=userName value="<%= session.getAttribute("userName") %>" />
            <textarea name="body" placeholder="동의합니다."></textarea><br>
            <button type="submit" onclick="replyAert()">동의 하기</button>
        </form>
        <br><br><br>
        <%	
	if(list != null) {		
		for(int i = 0; i<list.size(); i++){
		%>
        <div class="re">
            <h4><%=list.get(i).getUserName() %></h4>
            <div><%=list.get(i).getBody() %></div>
            <br>
        </div>

    

    <%		}
	}else{%>
    데이터를 가져오는데 실패했습니다.
    <%	
			}
        %>       
        <%
		}       
	}

%>
    </div>
    </div>
</body>

</html>