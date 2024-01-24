<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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

<div class="container">
	<div class="pokemon-details">
		<div class="left-section">
			<div class="pokemon-image">
				<img src="/Pokedex/images/<c:out value="${pokemon.img}" />"
					style="max-width: 500px;" alt="Pokemon Image">
			</div>
		</div>
		<div class="right-section">
			<h1 class="pokemon-name">${pokemon.pokemonName}</h1>
			<p class="pokemon-id">ID: ${pokemon.pokemonId}</p>
			<p class="pokemon-type">
				Type:

				<c:forEach var="type" items="${pokemon.types}">
					<a href="/Pokedex/mvc/frontend/dex?typeId=${ type.typeId }">
						<button type="button" class="btn btn-outline-secondary">${ type.typeName }</button>
					</a>
				</c:forEach>

			</p>
			<hr>
			<div class="pokemon-description">
				<p>${pokemon.description}</p>
			</div>
			<div class="back-to-pokedex">
				<form id="addToPokeballForm">
					<input type="hidden" name="pokemonId" value="${pokemon.pokemonId}">
					<button type="button" class="btn btn-primary"
						onclick="addToPokeball()">加入背包</button>
				</form>


				<a href="/Pokedex/mvc/frontend/dex">
					<button type="button" class="btn btn-primary">回到寶可夢圖鑑</button>
				</a>
			</div>
		</div>
	</div>
</div>

<script>
function addToPokeball() {
    var pokemonId = $("#addToPokeballForm input[name='pokemonId']").val();

    $.ajax({
        type: "POST",
        url: "/Pokedex/mvc/frontend/pokeball/" + pokemonId,
        success: function(response) {
            // 使用 SweetAlert2 顯示成功訊息
            Swal.fire({
                icon: 'success',
                title: '成功',
                text: '已加入背包！',
            }).then((result) => {
                // 如果需要在 SweetAlert2 的確認按鈕點擊後執行其他操作，可以在這裡添加相應的代碼
                console.log('SweetAlert2 確認按鈕被點擊');
            });
        },
        error: function(error) {
            // 使用 SweetAlert2 顯示錯誤訊息
            Swal.fire({
                icon: 'error',
                title: '錯誤',
                text: '發生錯誤，請稍後再試。',
            }).then((result) => {
                // 如果需要在 SweetAlert2 的確認按鈕點擊後執行其他操作，可以在這裡添加相應的代碼
                console.log('SweetAlert2 確認按鈕被點擊');
            });
        }
    });
}
</script>

<%@ include file="/WEB-INF/views/footer.jsp"%>
