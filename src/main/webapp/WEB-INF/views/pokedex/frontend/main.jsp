<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>你的Pokedex</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: red;
            padding: 20px;
            color: white;
            text-align: left;
            display: flex;
            justify-content: space-between;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 20px;
            display: block;
        }
        .welcome-section {
            background-color: #001f3f;
            color: white;
            text-align: center;
            padding: 50px;
        }
        .pokemon-card {
            background-color: #111;
            color: white;
            padding: 20px;
            margin: 10px;
            text-align: center;
        }
        .search-bar {
            margin-top: 20px;
        }
        .login-button {
            background-color: #d9534f;
            color: white;
            padding: 10px;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 20px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="#">首頁</a>
        <a href="#">寶可夢圖鑑</a>
        <a href="#">背包</a>
        <a href="#">個體分析</a>
        <a href="#">使用者設定</a>
        <div>
            <a href="#" class="login-button">登入</a>
        </div>
    </div>

    <div class="welcome-section">
        <h1>歡迎來到你的Pokedex</h1>
        <div class="pokemon-card">
            <!-- 這裡應該插入動態生成的隨機寶可夢卡片 -->
            <img src="/Pokedex/images/0778.png" alt="Pokemon Image">
            <h2>寶可夢名稱</h2>
            <p>ID: 寶可夢ID</p>
        </div>

        <div class="search-bar">
            <!-- 搜尋框和篩選器的 HTML 元素 -->
            <input type="text" placeholder="搜尋寶可夢">
            <select>
                <option value="id">按ID排序</option>
                <option value="name">按名稱排序</option>
            </select>
        </div>
    </div>
</body>
</html>
