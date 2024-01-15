package spring.mvc.pokedex.dao;

import java.util.List;
import java.util.Optional;

import spring.mvc.pokedex.model.entity.User;

public interface UserDao {
	// 1.查詢所有使用者 
	List<User> findAllUsers();
	
	// 2.新增使用者
	int save(User user);
	
	//3. 修改密碼
	Boolean updateUserPassword(Integer userId, String newPassword);
	
	//4. 根據使用者名稱查找使用者(登入用-單筆)
	Optional<User> findUserByUsername(String username);
	
	//5. 根據使用者ID查找使用者(單筆)
	Optional<User> findUserById(Integer userId);
	
	
	
}
