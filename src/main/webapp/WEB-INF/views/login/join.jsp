<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지</title>
        <link type="text/css" rel="stylesheet" href="/assets/css/join.css" />
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
            if (form.loginPwCheck.value.trim().length == 0 || form.loginPwCheck.value.trim() != form.loginPw.value.trim()) {
                alert("비밀번호가 다릅니다.");
                form.loginPw.focus();
                return false;
            }
            if (form.userName.value.trim().length == 0) {
                alert("닉네임을 입력해주세요.");
                form.userName.focus();
                return false;
            }
            
            form.submit();

        }       
    </script>
</head>

<body>
	<div class="login-page">
	<div class="form">
    <form class="login-form" onsubmit="checkForm(this); return false;" action="/login/doJoin" align="center">
            <input type="text"  placeholder="username" name="loginId">
            <input type="password" placeholder="password" name="loginPw">
            <input type="password" placeholder="passwordCheck" name="loginPwCheck">
            <input type="text" placeholder="Name" name="userName">
            <button type="submit" value="join">Join</button>
            <p>회원이신가요?<a href="/login/goLogin">로그인</a></p>
        </div>
    </form>
    </div>
    </div>
</body>

</html>