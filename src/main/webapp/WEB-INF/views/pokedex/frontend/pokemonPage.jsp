<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

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
				<form action="/Pokedex/mvc/frontend/addToPokeball" method="post">
					<input type="hidden" name="pokemonId" value="${pokemon.pokemonId}">
					<button type="submit" class="btn btn-primary">加入背包</button>
				</form>
				
				<a href="/Pokedex/mvc/frontend/dex">
					<button type="button" class="btn btn-primary">回到寶可夢圖鑑</button>
				</a>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp"%>
