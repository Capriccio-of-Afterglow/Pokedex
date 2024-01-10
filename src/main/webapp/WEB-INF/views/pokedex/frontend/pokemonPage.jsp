<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/header.jsp" %>
	<body>

<div class="container">
    <div class="pokemon-details">
        <div class="left-section">
            <div class="pokemon-image">
                <img src="/Pokedex/images/0001.png" style="max-width: 500px;" alt="Pokemon Image">
            </div>
        </div>
        <div class="right-section">
            <h1 class="pokemon-name">Bulbasaur</h1>
            <p class="pokemon-id">ID: 001</p>
            <p class="pokemon-type">Type: Grass/Poison</p>
            <hr>
            <div class="pokemon-description">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Nullam vel tincidunt neque. Sed et tincidunt mi, vel fermentum risus.
                    Sed quis augue non odio aliquet tempus. Integer auctor justo nec ultrices convallis.
                </p>
            </div>
            <div class="back-to-pokedex">
                <a href="./dex">
                 <button type="button" class="btn btn-primary">回到寶可夢圖鑑</button>
                </a>
            </div>
        </div>
    </div>
</div>

</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>

