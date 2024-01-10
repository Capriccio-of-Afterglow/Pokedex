<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="container p-3">

	<h1 class="text-center">寶可夢圖鑑</h1>
	 <!-- 搜尋器和篩選器 -->
    <div class="row mb-3">
        <div class="col-md-6">
            <!-- 搜尋框 -->
            <div class="input-group mb-3" style="width: 300px; margin-right: auto; margin-left: 0;">
			  <input type="text" class="form-control" placeholder="請輸入要搜尋的寶可夢名稱" aria-label="Recipient's username" aria-describedby="basic-addon2">
			  <button class="btn btn-primary" type="button" id="button-addon2">搜尋</button>
			</div>
        </div>
        <div class="col-md-6" style="width: 300px; margin-right: 0; margin-left: auto;">
            <!-- 假的屬性篩選器 -->
            <select id="filterSelect" class="form-select">
		        <option value="" disabled selected hidden>請選擇寶可夢屬性</option>
                <option value="fire">火屬性</option>
                <option value="water">水屬性</option>
                <option value="grass">草屬性</option>
                <!-- 添加其他屬性選項 -->
            </select>
        </div>
    </div>
    <!-- 圖鑑區域 -->
    <div class="row">
        <% for (int i = 1; i <= 25; i++) { %>
            <div class="col-md-2 mb-4">
                <a href="./pokemonPage" class="text-decoration-none text-dark"> 
                    <div class="card border border-3">
                        <img class="card-img-top" src="/Pokedex/images/<%= String.format("%04d", i) %>.png" alt="Pokemon<%= String.format("%04d", i) %>">
                        <div class="card-body text-center">
                            <h5 class="card-title">Pokemon <%= i %></h5>
                            <p class="card-text">寶可夢編號: <%= String.format("%03d", i) %></p>
                        </div>
                    </div>
                </a>
            </div>
        <% } %>
    </div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>
