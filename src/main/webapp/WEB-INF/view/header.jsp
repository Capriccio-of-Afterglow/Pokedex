<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>pokedex</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
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
	          <a class="nav-link active text-dark" aria-current="page" href="./">首頁</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link text-dark" href="./page1.jsp">我的寶可夢</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link text-dark" href="#">寶可夢圖鑑</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link text-dark" href="#">個體分析</a>
	        </li>
	      </ul>
	    </div>
	    <i class="bi bi-person-circle text-dark h5 mb-0 d-none d-md-block">${sessionScope.username}</i>
	    <i class="bi bi-box-arrow-right text-dark ml-3" role="button" onclick="window.location.href='./logout'">Logout</i>
	  </div>
	</nav>
</body>
</html>