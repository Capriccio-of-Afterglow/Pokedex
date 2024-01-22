<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		<script type="text/javascript">
			function loginBackend() {
				var loginForm = document.getElementById('loginForm');
				loginForm.action = './login_backend'; // 後台登入路徑
				loginForm.submit();
			}
		</script>
	</head>
	<body style="padding: 15px">
		<div style="display:flex; justify-content:center; align-items: center; height:100vh;">
			<form id="loginForm" method="post" action="/Pokedex/mvc/login" class="pure-form">
				<fieldset>
				    <p class="text-danger text-center">${ error }</p>
					<legend>寶可夢圖鑑登入</legend>
					😀 帳號: <input type="text" id="username" name="username" placeholder="請輸入帳號" value="user1" required /><p />
					🔑 密碼: <input type="password" id="password" name="password" placeholder="請輸入密碼" value="123" required /><p />
					<p />
					<button type="submit" class="pure-button pure-button-primary">前台登入</button>
					<button type="button" class="pure-button pure-button-primary" onclick="loginBackend()" >後台登入</button>
					 <a href="/Pokedex/mvc/frontend/main">
						<button type="button" class="pure-button pure-button-primary" >註冊</button>
					</a>
					 <div>
				        <a href="/Pokedex/mvc/frontend/main">
				            <button type="button" class="pure-button pure-button-primary" >返回首頁</button>
				        </a>
				    </div>
				</fieldset>
				<div style="color: red">${ loginMessage }</div>
			</form>
		</div>
	</body>
</html>