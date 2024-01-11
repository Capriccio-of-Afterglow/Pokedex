package spring.mvc.pokedex.dao;

import java.util.List;

import spring.mvc.pokedex.model.entity.User;

public interface UserDao {

	List<User> findAllUsers();
	
	int save(User user);
}
