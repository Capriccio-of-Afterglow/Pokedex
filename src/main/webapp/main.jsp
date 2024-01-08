<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Pokedex</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        nav {
            background-color: #4CAF50;
            overflow: hidden;
        }
        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .pokemon-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
        }
        .pokemon-card {
            width: 200px;
            margin: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        .pokemon-image {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>

<nav>
    <a href="#home">首頁</a>
    <a href="#pokedex">寶可夢圖鑑</a>
    <a href="#backpack">背包</a>
    <a href="#analysis">個體分析</a>
</nav>

<div class="pokemon-container">
    <!-- Sample Pokemon Card -->
    <div class="pokemon-card">
        <img class="pokemon-image" src="Pokedex\src\main\resources\static\images\0001.png" alt="Pokemon0001">
        <h3>Pokemon 1</h3>
        <p>ID: 001</p>
        <p>屬性: 屬性1</p>
    </div>

    <!-- Repeat the above card structure for each Pokemon -->
</div>

</body>
</html>