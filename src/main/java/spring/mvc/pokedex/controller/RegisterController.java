package spring.mvc.pokedex.controller;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.pokedex.dao.UserDao;
import spring.mvc.pokedex.model.entity.User;


/**
 * http://localhost:8080/Pokedex/mvc/login GET
 * http://localhost:8080/Pokedex/mvc/login POST
 */
@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	UserDao userDao;
	
	@GetMapping("/registerPage")
	public String registerPage() {
		return "/pokedex/register";
	}

	
	@PostMapping("/submit")
    public String processRegistrationForm(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            Model model) {

        // 檢查使用者名稱是否重複
		Optional<User> UserOpt = userDao.findUserByUsername(username);
        if (UserOpt.isPresent()) {
            model.addAttribute("error", "使用者名稱已存在，請選擇其他名稱");
            return "/pokedex/register";
        }

        // 使用者名稱不重複，執行註冊邏輯
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        User newUser = new User(null, username, hashedPassword, 1);
        
        userDao.addUser(newUser);
        model.addAttribute("message", "註冊成功！請返回登入！");
        return "/pokedex/register";
    }

}
