<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>pokedex</title>
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	    
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
	  <div class="container-fluid">
	    <a class="navbar-brand text-dark" href="#">Pokedex</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active text-dark" aria-current="page" href="/Pokedex/mvc/frontend/main">首頁</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link text-dark" href="/Pokedex/mvc/frontend/dex">寶可夢圖鑑</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link text-dark" href="/Pokedex/mvc/myPokemon/${user.userId}">我的寶可夢</a>
	        </li>
	      </ul>
	    </div>
	    <i class="bi bi-person-circle text-dark h5 mb-0 d-none d-md-block px-3">${user.username}</i>
	    <c:choose>
                <c:when test="${empty user}">
                    <!-- 使用者未登入，顯示登入按鈕 -->
                    <i class="bi bi-box-arrow-right text-dark ml-3" role="button" onclick="window.location.href='/Pokedex/mvc/login'">登入</i>
                </c:when>
                <c:otherwise>
                    <!-- 使用者已登入，顯示登出按鈕 -->
                    <i class="bi bi-box-arrow-left text-dark ml-3" role="button" onclick="window.location.href='/Pokedex/mvc/logout'">登出</i>
                </c:otherwise>
            </c:choose>
	  </div>
	</nav>
	
	
</body>
</html>