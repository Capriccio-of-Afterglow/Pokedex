package spring.mvc.pokedex.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Package {

	Integer id;
	
	Integer userId;
	
	Integer pokemonId;
	
	Integer cp;
	
}
