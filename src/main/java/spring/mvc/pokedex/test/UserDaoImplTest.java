package spring.mvc.pokedex.test;

import java.util.List;
import java.util.Optional;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.crypto.bcrypt.BCrypt;

import spring.mvc.pokedex.dao.PokeballDao;
import spring.mvc.pokedex.dao.PokeballDaoImpl;
import spring.mvc.pokedex.dao.UserDaoImpl;
import spring.mvc.pokedex.model.entity.Pokeball;
import spring.mvc.pokedex.model.entity.User;

public class UserDaoImplTest {

	public static void main(String[] args) {
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/WEB-INF/springmvc-servlet.xml");
		
		UserDaoImpl userDaoImpl= ctx.getBean("userDaoImpl",UserDaoImpl.class);
		PokeballDaoImpl pokeballDaoImpl= ctx.getBean("pokeballDaoImpl",PokeballDaoImpl.class);
		
		// 測試查詢功能
//		List<User> users = userDaoImpl.findAllUsers();
//		System.out.println(users);
		
		// 新增User
//		User addUser = new User();
//		addUser.setUsername("user3");
//		addUser.setPassword(BCrypt.hashpw("456", BCrypt.gensalt()));
//		addUser.setLevel(2);
//		userDaoImpl.addUser(addUser);
//		System.out.println(addUser);

		// 測試修改密碼
//		Integer userId = 2 ;
//		String newPassword = "456";
//		Boolean test1 = userDaoImpl.updateUserPassword(userId, newPassword);
//		System.out.println(test1);

//		// 測試修改權限等級
//		userId = 2 ;
//		String newLevel = "2";
//		Boolean test4 = userDaoImpl.updateUserLevel(userId, newLevel);
//		System.out.println(test4);

//		// 測試透過 username 尋找user(單筆)
//		String userName = "user1";
//		Optional<User> test2 = userDaoImpl.findUserByUsername(userName);
//		System.out.println(test2);
		
		// 測試透過 userId 尋找user(單筆)
//		Integer userId = 2;
//		Optional<User> test3 = userDaoImpl.findUserById(userId);
//		System.out.println(test3);
		
		Integer userId = 1;
		List<Pokeball> test1 = pokeballDaoImpl.findUserPokeballsByUserId(userId);
		System.out.println(test1);
	}

}
