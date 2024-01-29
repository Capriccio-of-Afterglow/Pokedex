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

								<!-- 更新 CP 表單 -->
								<form id="updateCPForm${pokeball.pokeballId}">
									<label for="newCp${pokeball.pokeballId}">修改CP: </label> <input
										type="text" id="newCp${pokeball.pokeballId}" name="newCp">

									<button type="button" class="btn btn-primary"
										onclick="updateCP(${pokeball.userId}, ${pokeball.pokeballId})">修改</button>
								</form>

							</div>
							<div class="modal-footer">
								<!-- 刪除 Pokeball 表單 -->
								<form id="deletePokeballForm${pokeball.pokeballId}">
									<button type="button" class="btn btn-danger"
										onclick="deletePokeball(${pokeball.userId}, ${pokeball.pokeballId})">刪除此寶可夢</button>
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

<script>
function updateCP(userId, pokeballId) {
    var newCp = $("#newCp" + pokeballId).val();

    $.ajax({
        type: "POST",
        url: "/Pokedex/mvc/myPokemon/" + userId + "/" + pokeballId + "/updateCP",
        data: { newCp: newCp },
        success: function(response) {
        	if (response.success) {
                Swal.fire({
                    icon: 'success',
                    title: 'CP 更新成功！',
                }).then(() => {
                    // 重新加載頁面
                    location.reload(true);
                });
            }  else {
                Swal.fire({
                    icon: 'error',
                    title: 'CP 更新失敗',
                    text: response.message,
                });
            }
        },
        error: function(error) {
            Swal.fire({
                icon: 'error',
                title: '發生錯誤',
                text: error.statusText,
            });
        }
    });
}

function deletePokeball(userId, pokeballId) {
    // 使用 SweetAlert2 顯示確認對話框
    Swal.fire({
        icon: 'warning',
        title: '確定要刪除這個寶可夢嗎？',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: '確定刪除',
        cancelButtonText: '取消'
    }).then((result) => {
        if (result.isConfirmed) {
            // 如果使用者確認要刪除，再執行刪除操作
            $.ajax({
                type: "POST",
                url: "/Pokedex/mvc/myPokemon/" + userId + "/" + pokeballId + "/deletePokeball",
                success: function(response) {
                    if (response.success) {
                        Swal.fire({
                            icon: 'success',
                            title: '寶可夢刪除成功！',
                        }).then(() => {
                            // 重新加載頁面
                            location.reload(true);
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: '寶可夢刪除失敗',
                            text: response.message,
                        });
                    }
                },
                error: function(error) {
                    Swal.fire({
                        icon: 'error',
                        title: '發生錯誤',
                        text: error.statusText,
                    });
                }
            });
        }
        // 如果使用者取消刪除，不執行任何操作
    });
}


</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>
