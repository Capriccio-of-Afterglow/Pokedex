package spring.mvc.pokedex.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	
	Integer userId;
	
	String userName;
	
	String password;
	
	Integer level;
}
