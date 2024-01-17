package spring.mvc.pokedex.test;

import java.util.List;
import java.util.Optional;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import spring.mvc.pokedex.dao.UserDaoImpl;
import spring.mvc.pokedex.model.entity.User;

public class UserDaoImplTest {

	public static void main(String[] args) {
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("/WEB-INF/springmvc-servlet.xml");
		
		UserDaoImpl userDaoImpl= ctx.getBean("userDaoImpl",UserDaoImpl.class);
		
		// 測試查詢功能
		List<User> users = userDaoImpl.findAllUsers();
		System.out.println(users);
		
		/*
		// 新增User
		User addUser = new User();
		addUser.setUserName("user2");
		addUser.setPassword("456");
		addUser.setLevel(2);
		userDaoImpl.addUser(addUser);
		System.out.println(addUser);
		
		*/
		// 測試修改密碼
		Integer userId = 4 ;
		String newPassword = "456";
		Boolean test1 = userDaoImpl.updateUserPassword(userId, newPassword);
		System.out.println(test1);
	
		// 測試修改權限等級
		userId = 4 ;
		String newLevel = "2";
		Boolean test4 = userDaoImpl.updateUserLevel(userId, newLevel);
		System.out.println(test4);
	
		
		// 測試透過 username 尋找user(單筆)
		String userName = "user1";
		Optional<User> test2 = userDaoImpl.findUserByUsername(userName);
		System.out.println(test2);
		
		
		
		// 測試透過 userId 尋找user(單筆)
		userId = 4;
		Optional<User> test3 = userDaoImpl.findUserById(userId);
		System.out.println(test3);
	}

}
