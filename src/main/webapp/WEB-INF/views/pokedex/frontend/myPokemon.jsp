<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<div class="container p-3">
	<h1 class="text-center">持有寶可夢</h1>

	<div class="row">
		<c:forEach items="${pokeballs}" var="pokeball">
			<div class="col-md-2 mb-4">
				<div class="card border border-3">
					<a href="" class="text-decoration-none text-dark"
						data-toggle="modal"
						data-target="#pokemonModal${pokeball.pokemon.pokemonId}"> <img
						class="card-img-top"
						src="/Pokedex/images/<fmt:formatNumber type='number' minIntegerDigits='4' groupingUsed='false' value='${pokeball.pokemon.pokemonId}'/>.png"
						alt="Pokemon${pokeball.pokemon.pokemonId}">
						<div class="card-body text-center">
							<h5 class="card-title">${pokeball.pokemon.pokemonName}</h5>
							<h5 class="card-cp">CP值： ${pokeball.cp}</h5>
							<p class="card-text">寶可夢編號: ${pokeball.pokemon.pokemonId}</p>
						</div>
					</a>
				</div>

				<!-- Modal -->
				<div class="modal fade"
					id="pokemonModal${pokeball.pokemon.pokemonId}" tabindex="-1"
					role="dialog" aria-labelledby="pokemonModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="pokemonModalLabel">寶可夢詳細資訊</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<!-- 在這裡顯示寶可夢的詳細資訊，提供修改 CP 的選項，以及刪除的選項 -->
								<p>寶可夢名稱: ${pokeball.pokemon.pokemonName}</p>
								<p>CP值: ${pokeball.cp}</p>
								<!-- 其他詳細資訊 ... -->

								<!-- 修改 CP 的表單 -->
								<form action="/Pokedex/mvc/frontend/updateCp" method="post">
									<input type="hidden" name="pokeballId"
										value="${pokeball.pokeballId}"> <label for="newCp">新的
										CP 值:</label> <input type="number" name="newCp" id="newCp" required>
									<button type="submit">修改 CP</button>
								</form>

								<!-- 刪除的表單 -->
								<form action="/Pokedex/mvc/frontend/deletePokemon" method="post">
									<input type="hidden" name="pokeballId"
										value="${pokeball.pokeballId}">
									<button type="submit">從背包中刪除</button>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">關閉</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp"%>
