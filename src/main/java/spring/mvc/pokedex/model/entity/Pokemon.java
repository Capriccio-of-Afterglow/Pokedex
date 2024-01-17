package spring.mvc.pokedex.model.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pokemon {
	
	Integer pokemonId;
	
	String pokemonName;
	
	String img;
	
	String description;
	
	List<Type> typeId;
	
}
