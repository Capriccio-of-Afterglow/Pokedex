<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="container">
    <h2 class="text-center">寶可夢圖鑑</h2>

    <!-- 搜尋欄位 -->
    <div class="search-bar text-center">
        <input type="text" id="searchInput" placeholder="搜尋寶可夢">
        <button class="btn btn-primary" onclick="searchPokemon()">搜尋</button>
    </div>

    <!-- 寶可夢卡片區域 -->
    <div class="pokemon-container">
        <!-- Sample Pokemon Card -->
        <div class="pokemon-card">
            <img class="pokemon-image" src="/Pokedex/images/0001.png" alt="Pokemon0001">
            <h3>Pokemon 1</h3>
            <p>ID: 001</p>
            <p>屬性: 屬性1</p>
        </div>

        <!-- Repeat the above card structure for each Pokemon -->
    </div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>