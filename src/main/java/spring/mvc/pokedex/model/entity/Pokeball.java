package spring.mvc.pokedex.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pokeball {

	Integer PackageId;
	
	Integer userId;
	
	Integer pokemonId;
	
	Integer cp;
	
}
