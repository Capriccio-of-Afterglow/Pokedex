package spring.mvc.pokedex.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Pokeball {

	Integer pokeballId;
	
	Integer userId;
	
	Integer pokemonId;
	
	Integer cp;
	
	Pokemon pokemon; // 採用的是Eager的方式進行讀取
	
}
