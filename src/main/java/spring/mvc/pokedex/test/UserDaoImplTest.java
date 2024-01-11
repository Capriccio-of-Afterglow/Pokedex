package spring.mvc.pokedex.test;

import java.util.List;

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
		
		// 新增User
		User addUser = new User();
		addUser.setName("user2");
		addUser.setPassword("456");
		addUser.setLevel(2);
		userDaoImpl.save(addUser);
		System.out.println(addUser);
	}

}
