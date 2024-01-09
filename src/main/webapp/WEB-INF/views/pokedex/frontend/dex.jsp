<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="container">
    <!-- 圖鑑區域 -->
    <div class="row">
        <% for (int i = 1; i <= 9; i++) { %>
            <div class="col-md-2 mb-4">
                <a href="/Pokedex/pokemon?id=<%= i %>"> <!-- 將 href 設定為你的目標 URL -->
                    <div class="card">
                        <img class="card-img-top" src="/Pokedex/images/<%= String.format("%04d", i) %>.png" alt="Pokemon<%= String.format("%04d", i) %>">
                        <div class="card-body text-center">
                            <h5 class="card-title">Pokemon <%= i %></h5>
                            <p class="card-text">ID: <%= String.format("%03d", i) %></p>
                        </div>
                    </div>
                </a>
            </div>
        <% } %>
    </div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>
