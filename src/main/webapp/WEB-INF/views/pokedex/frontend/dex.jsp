<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <!-- 屬性篩選器 -->
            <select id="filterSelect" class="form-select" onchange="selectType(event.target.value)">
		        <option value="" disabled selected hidden>請選擇寶可夢屬性</option>
		        	<option value="-1">全部</option>
		        <c:forEach items="${ types }" var="type">
		        	<option value="${ type.typeId }">${ type.typeName }</option>
		        </c:forEach>
            </select>
        </div>
    </div>
    <!-- 圖鑑區域 -->
    <div class="row">
        <c:forEach items="${ pokemons }" var="pokemon">
             <div class="col-md-2 mb-4">
                <a href="./dex/page/${pokemon.pokemonId}" class="text-decoration-none text-dark"> 
                    <div class="card border border-3">
                        <img class="card-img-top" 
                             src="/Pokedex/images/<fmt:formatNumber type="number" minIntegerDigits="4" groupingUsed="false" value="${pokemon.pokemonId}"/>.png" 
                             alt="Pokemon${pokemon.pokemonId}">
                        <div class="card-body text-center">
                            <h5 class="card-title">${pokemon.pokemonName}</h5>
                            <p class="card-text">寶可夢編號: ${pokemon.pokemonId}</p>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>

<script type="text/javascript">

	function selectType(typeId) {
		window.location.href = '/Pokedex/mvc/frontend/dex?typeId='+typeId;
	}

</script>

<%@ include file="/WEB-INF/views/footer.jsp" %>
