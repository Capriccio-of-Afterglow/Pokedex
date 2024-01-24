<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/header.jsp"%>


<div class="container p-3">
	<h1 class="text-center">持有寶可夢</h1>

	<div class="row">
		<c:forEach items="${pokeballs}" var="pokeball">
			<div class="col-md-2 mb-4" style="width: 250px; height: 300px;">
				<div class="card border border-3">
					<button type="button" class="btn btn-light" data-bs-toggle="modal"
						data-bs-target="#pokemonModal${pokeball.pokeballId}">
						<img class="card-img-top"
							src="/Pokedex/images/<fmt:formatNumber type='number' minIntegerDigits='4' groupingUsed='false' value='${pokeball.pokemon.pokemonId}'/>.png"
							alt="Pokemon${pokeball.pokemon.pokemonId}">
						<div class="card-body text-center">
							<h5 class="card-title">${pokeball.pokemon.pokemonName}</h5>
							<h5 class="card-cp">CP值： ${pokeball.cp}</h5>
							<p class="card-text">寶可夢編號: ${pokeball.pokemon.pokemonId}</p>
						</div>
					</button>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="pokemonModal${pokeball.pokeballId}"
					tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div
						class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">${pokeball.pokemon.pokemonName}</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>${pokeball.pokemon.description}</p>

								<!-- 表單開始 -->
								<form id="pokemonForm" method="post"
									action="./${pokeball.userId}/${pokeball.pokeballId}/updateCP">
									<!-- 添加一個用於輸入新 CP 的文本框 -->
									<label for="newCp">修改CP: </label> <input type="text" id="newCp"
										name="newCp">
									<!-- 提交按鈕 -->
									<button type="submit" class="btn btn-primary">保存變更</button>
								</form>

							</div>
							<div class="modal-footer">
								<!-- 刪除按鈕表單 -->
								<form method="post"
									action="./${pokeball.userId}/${pokeball.pokeballId}/deletePokeball">
									<button type="submit" class="btn btn-danger">刪除此寶可夢</button>
								</form>

								<!-- 關閉按鈕 -->
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">關閉</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp"%>
