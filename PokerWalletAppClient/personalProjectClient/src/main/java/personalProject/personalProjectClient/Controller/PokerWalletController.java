package personalProject.personalProjectClient.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import personalProject.personalProjectClient.Models.UserResponse;
import personalProject.personalProjectClient.Service.UserService;

@Controller
public class PokerWalletController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public ModelAndView homeTest() {
		
		ArrayList<UserResponse> allUsers = userService.findAllUsers();
		ModelAndView modelAndView = new ModelAndView("Home");
		modelAndView.addObject("users", allUsers);
		
		return modelAndView;
	}

}
