<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>註冊</title>
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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

    </style>
</head>
<body>

    <form id="loginForm" method="post" action="/Pokedex/mvc/login" class="pure-form">
        <fieldset>
            <p class="text-danger text-center">${ error }</p>
            <legend>寶可夢圖鑑註冊</legend>
            😄 使用者名稱: <input type="text" id="username" name="username" placeholder="請輸入使用者名稱" required /><p />
            🔑 密碼: <input type="password" id="password" name="password" placeholder="請輸入密碼" required /><p />
            <p />
            <button type="submit" class="btn btn-primary" >註冊</button>
        </fieldset>
    </form>

</body>
</html>
