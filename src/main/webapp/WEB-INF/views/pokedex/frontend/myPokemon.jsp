<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/header.jsp"%>

<div class="container p-3">
	<h1 class="text-center">持有寶可夢</h1>

	<div class="row">
		<c:forEach items="${pokeballs}" var="pokeball">
			<div class="col-md-2 mb-4" >
				<div class="card border border-3">
					<a href="./pokemonPage?pokemonId=${pokeball.pokemon.pokemonId}"
						class="text-decoration-none text-dark">
						<img class="card-img-top"
							src="/Pokedex/images/<fmt:formatNumber type='number' minIntegerDigits='4' groupingUsed='false' value='${pokeball.pokemon.pokemonId}'/>.png"
							alt="Pokemon${pokeball.pokemon.pokemonId}">
						<div class="card-body text-center">
							<h5 class="card-title">${pokeball.pokemon.pokemonName}</h5>
							<h5 class="card-cp">CP值： ${pokeball.cp}</h5>
							<p class="card-text">寶可夢編號: ${pokeball.pokemon.pokemonId}</p>
						</div>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp"%>
