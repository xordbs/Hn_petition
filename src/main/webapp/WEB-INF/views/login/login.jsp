<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
            <link type="text/css" rel="stylesheet" href="/assets/css/login.css" />
    <script>
        function checkForm(form) {
            if (form.loginId.value.trim().length == 0) {
                alert("아이디를 입력해주세요.");
                form.loginId.focus();
                return false;
            }
            if (form.loginPw.value.trim().length == 0) {
                alert("비밀번호를 입력해주세요.");
                form.loginPw.focus();
                return false;
            }
            
            form.submit();
        }      
    </script>
</head>
<body>
	<div class="login-page">
	<div class="form">
    <form class="login-form" onsubmit="checkForm(this); return false;" action="/login/doLogin" align="center">
            <input type="text"  placeholder="username" name="loginId">
            <input type="password" placeholder="password" name="loginPw">
            <button type="submit" value="로그인">Login</button>
            <p>회원이 아니신가요?<a href="/login/goJoin">회원가입</a></p>
        </div>
    </form>
    </div>
    </div>
</body>
</html>