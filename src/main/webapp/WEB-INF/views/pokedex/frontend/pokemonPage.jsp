<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/header.jsp" %>
<style>
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 90vh;
}

.pokemon-details {
    display: flex;
}

.left-section {
    flex: 1;
}

.right-section {
    flex: 1;
    margin-left: 20px; /* 調整右側部分與左側的間距 */
}
</style>

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
            <p class="pokemon-id">ID: 0001</p>
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
            
            	<button type="button" class="btn btn-primary">加入背包</button>
            
                <a href="./dex">
                 <button type="button" class="btn btn-primary">回到寶可夢圖鑑</button>
                </a>
            </div>
        </div>
    </div>
</div>

</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>

