package spring.mvc.pokedex.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	
	Integer id;
	
	String name;
	
	String password;
	
	Integer level;
}
