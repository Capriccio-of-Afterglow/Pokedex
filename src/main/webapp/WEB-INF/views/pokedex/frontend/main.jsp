<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="welcome-section text-center ">
	<h1>歡迎來到Pokedex</h1>
	<div class="pokemon-card">
		<!-- 這裡插入動態生成的隨機寶可夢卡片 -->
		<img src="/Pokedex/images/0778.png" class="img-fluid mx-auto d-block"
			style="max-width: 500px;" alt="Pokemon Image">
		<h2>來尋找喜歡的寶可夢吧！</h2>
	</div>

	<div class="search-bar" style="padding: 15px;">
		<!-- 搜尋框的 HTML 元素 -->
		<input type="text" id="searchKeyword" placeholder="搜尋寶可夢">
		<button type="button" class="btn btn-primary"
			onclick="searchPokemonInMain()">搜尋寶可夢</button>
	</div>
	<a href="./dex">
		<button type="button" class="btn btn-primary">進入寶可夢圖鑑</button>
	</a>
</div>


<script>
    function searchPokemonInMain() {
        // 獲取搜尋框的值
        var keyword = encodeURIComponent($('#searchKeyword').val());

        // 動態生成 URL 並導航
        window.location.href = './dex/search?keyword=' + keyword;
    }
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>

