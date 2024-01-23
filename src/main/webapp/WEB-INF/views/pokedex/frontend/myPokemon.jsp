<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="container p-3">
	<h1 class="text-center">持有寶可夢</h1>

	<c:forEach items="${pokeballs}" var="pokeballs">
		<div class="col-md-12 mb-4">
			<h2>Pokeball ID: ${pokeballs.pokeballId}</h2>
			<div class="row">
			
					<div class="col-md-2 mb-4">
						<a href="./pokemonPage?pokemonId=${pokeballs.pokemon.pokemonId}" class="text-decoration-none text-dark">
							<div class="card border border-3">
								<img class="card-img-top"
									src="/Pokedex/images/<fmt:formatNumber type='number' minIntegerDigits='4' groupingUsed='false' value='${pokeballs.pokemon.pokemonId}'/>.png"
									alt="Pokemon${pokeballs.pokemon.pokemonId}">
								<div class="card-body text-center">
									<h5 class="card-title">${pokeballs.pokemon.pokemonName}</h5>
									<p class="card-text">寶可夢編號: ${pokeballs.pokemon.pokemonId}</p>
								</div>
							</div>
						</a>
					</div>
			
			</div>
		</div>
	</c:forEach>
</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>
