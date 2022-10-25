package personalProject.personalProjectClient.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import personalProject.personalProjectClient.Models.UserResponse;
import personalProject.personalProjectClient.Service.UserService;

@Controller
public class PokerWalletController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public String homePage(@RequestParam(required = false) String message, @RequestParam(required = false) String username, @RequestParam(required = false) boolean loggedIn, @RequestParam(required = false) String bankroll, Model model) {
		
		model.addAttribute("message", message);
		model.addAttribute("username", username);
		model.addAttribute("bankroll", bankroll);
		model.addAttribute("loggedIn", loggedIn);
		
		return "Home";
	}
		
	//Needs work
	@RequestMapping("/login")
	public String loginPage(@RequestParam(required = false) String username, @RequestParam(required = false) boolean loggedIn, @RequestParam(required = false) String bankroll, Model model) {
		
		String message = "Please enter your username and password.";
		model.addAttribute("message", message);
		model.addAttribute("username", username);
		model.addAttribute("bankroll", bankroll);
		model.addAttribute("loggedIn", loggedIn);
		
		return "login";
	}
	
	@PostMapping("/login")
	public String loginUser(@RequestParam String username, @RequestParam String password, Model model) {
		
		ArrayList<UserResponse> allUsers = userService.findAllUsers();
		
		for (UserResponse user : allUsers) {
			
			if (user.getUsername().equals(username)) {
				System.out.println("\n username = username");
				if (user.getPassword().equals(hashPassword(password))) {
					System.out.println("\n password = password");
					boolean loggedIn = true;
					model.addAttribute("loggedIn", loggedIn);
					model.addAttribute("username", username);
					model.addAttribute("bankroll", user.displayBankroll(user.getBankroll()));
					model.addAttribute("message", "Welcome back, " + username + "!");
					return "Home";
				} else {
					System.out.println("\n password != password");
					model.addAttribute("message", "That password was incorrect.");
					model.addAttribute("loggedIn", false);
					return "login";
				}
			}
		}
		model.addAttribute("message", "That username/password combo does not exist.");
		model.addAttribute("loggedIn", false);
		return "login";
	}
	
	//Needs work
	@RequestMapping("/signup")
	public String signupPage(@RequestParam(required = false) String username, @RequestParam(required = false) boolean loggedIn, @RequestParam(required = false) String bankroll, Model model) {
		
		model.addAttribute("username", username);
		model.addAttribute("loggedIn", loggedIn);
		
		return "signup";
	}
	
	@PostMapping("/signup")
	public String newUserSignUp(@RequestParam String username, @RequestParam String email, @RequestParam String password, Model model) {
		
		ArrayList<UserResponse> allUsers = userService.findAllUsers();
		for (UserResponse user : allUsers) {
			if (user.getUsername().equals(username)) {
				model.addAttribute("message", "That username exists already. Login instead?");
				return "login";
			}
		}
		if (username.equalsIgnoreCase("Anonymous") || username.equalsIgnoreCase("null") || username.equals("")) {
			model.addAttribute("message", "That username is not permitted.");
			return "signup";
		} else {
			UserResponse user = new UserResponse(username, hashPassword(password), email, 0.00, 0.00);
			userService.createUser(user);
			model.addAttribute("message", "Welcome, " + username + "!");
			model.addAttribute("username", username);
			model.addAttribute("bankroll", user.displayBankroll(user.getBankroll()));
			model.addAttribute("loggedIn", true);
			return "Home";
		}
	}
	
	@RequestMapping("/signout")
	public String userSignout(@RequestParam String username, @RequestParam boolean loggedIn, Model model) {
		model.addAttribute("loggedIn", false);
		model.addAttribute("message", "Come back soon, " + username + "!");
		return "Home";
	}
	
	@PostMapping("/managebankroll")
	public String manageBankroll(@RequestParam(required = false) String username, @RequestParam(required = false) boolean loggedIn, Model model) {
		
		if(username != null) {
		
			UserResponse user = userService.findByUsername(username);
		
			model.addAttribute("username", username);
			model.addAttribute("message", "Welcome to bankroll management, " + username + "! Enter your winnings or loses below.");
			model.addAttribute("bankroll", user.displayBankroll(user.getBankroll()));
			model.addAttribute("netprofit", user.displayNetProfit(user.getNetProfit()));
			model.addAttribute("loggedIn", true);
		}
		
		return "managebankroll";
	}
	
	@PostMapping("/managebankrollconfirmation")
	public String manageBankrollConfirmation(@RequestParam(required = false) String username, @RequestParam(required = false) boolean loggedIn, @RequestParam(required = false) Double bankrolladdition, @RequestParam(required = false) Double bankrollwithdrawal, @RequestParam(required = false) Double winnings, @RequestParam(required = false) Double loses, Model model) {
		
		if(username != null) {
		
			UserResponse user = userService.findByUsername(username);
			
			double bankroll = user.getBankroll();
			
			if(bankrolladdition != 0.00 && bankrollwithdrawal != 0.00) {
				String message = "Please perform one action at a time: either deposit funds or withdraw funds from your bankroll.";
				model.addAttribute("additionmessage", message);
				model.addAttribute("username", username);
				model.addAttribute("bankroll", user.displayBankroll(user.getBankroll()));
				model.addAttribute("netprofit", user.displayNetProfit(user.getNetProfit()));
				model.addAttribute("loggedIn", true);
				return "managebankrollconfirmation";
			}
			
			if(winnings != 0.00 && loses != 0.00) {
				String message = "Please perform one action at a time: either add winnings or subtract loses from your bankroll.";
				model.addAttribute("additionmessage", message);
				model.addAttribute("username", username);
				model.addAttribute("bankroll", user.displayBankroll(user.getBankroll()));
				model.addAttribute("netprofit", user.displayNetProfit(user.getNetProfit()));
				model.addAttribute("loggedIn", true);
				return "managebankrollconfirmation";
			}
			
			if(bankrolladdition > 0.00 && winnings == 0.00 && loses == 0.00 && bankrollwithdrawal == 0.00) {
				user.setBankroll(user.getBankroll() + bankrolladdition);
				userService.saveUser(user, user.getId());
				String message = "You've added a " + user.displayBankroll(bankrolladdition) + " buy-in to your bankroll. Your bankroll now stands at: " + user.displayBankroll(user.getBankroll()) + ".";
				model.addAttribute("additionmessage", message);
			}
			
			if(bankrollwithdrawal > 0.00 && winnings == 0.00 && loses == 0.00 && bankrolladdition == 0.00) {
				user.setBankroll(user.getBankroll() - bankrollwithdrawal);
				userService.saveUser(user, user.getId());
				String message = "You've withdrawn " + user.displayBankroll(bankrollwithdrawal) + " from your bankroll. Your bankroll now stands at: " + user.displayBankroll(user.getBankroll()) + ".";
				model.addAttribute("withdrawalmessage", message);
			} else if (bankrollwithdrawal > (bankroll + bankrolladdition + winnings - loses)) {
				String message = "You can't withdraw more than the total value of your bankroll. Update your bankroll and try again.";
				model.addAttribute("withdrawalmessage", message);
			}
			
			if(winnings > 0.00 && bankroll > 0.00) {
				user.setBankroll(user.getBankroll() + winnings);
				user.setNetProfit(user.getNetProfit() + winnings);
				userService.saveUser(user, user.getId());
				String message = "You've added " + user.displayBankroll(winnings) + " profit to your bankroll. Your bankroll now stands at: " + user.displayBankroll(user.getBankroll()) + ". Your net profit is: " + user.displayNetProfit(user.getNetProfit()) + ".";
				model.addAttribute("winningsmessage", message);
			} else if(winnings > 0.00 && (bankroll + bankrolladdition) > winnings && bankrolladdition > 0.00) {
				user.setBankroll(user.getBankroll() + bankrolladdition + winnings);
				user.setNetProfit(user.getNetProfit() + winnings);
				userService.saveUser(user, user.getId());
				String message = "You've added " + user.displayBankroll(winnings) + " profit to your bankroll. Your bankroll now stands at: " + user.displayBankroll(user.getBankroll()) + ". Your net profit is: " + user.displayNetProfit(user.getNetProfit()) + ".";
				model.addAttribute("winningsmessage", message);
			} else if (winnings > 0.00) {
				String message = "Your bankroll can't account for wins and loses while it's at $0. Please enter your starting buy-in, then try again.";
				model.addAttribute("winningsmessage", message);
			}
			
			if(loses > 0.00 && (bankroll + bankrolladdition) > loses) {
				user.setBankroll(user.getBankroll() + bankrolladdition - loses);
				user.setNetProfit(user.getNetProfit() - loses);
				userService.saveUser(user, user.getId());
				String message = "You've subtracted " + user.displayBankroll(loses) + " in loses from your bankroll. Your bankroll now stands at: " + user.displayBankroll(user.getBankroll()) + ". Your net profit is: " + user.displayNetProfit(user.getNetProfit()) + ".";
				model.addAttribute("losesmessage", message);
			} else if(loses > (bankroll + bankrolladdition)) {
				String message = "Your loses can't be greater than the total value of your bankroll. Please enter your total buy-in for the game, then try again.";
				model.addAttribute("losesmessage", message);
			} else if (loses > 0.00) {
				String message = "Your bankroll can't account for wins and loses while it's at $0. Please enter your total buy-in, then try again.";
				model.addAttribute("losesmessage", message);
			}
			
			model.addAttribute("username", username);
			model.addAttribute("bankroll", user.displayBankroll(user.getBankroll()));
			model.addAttribute("netprofit", user.displayNetProfit(user.getNetProfit()));
			model.addAttribute("loggedIn", true);
		}
		
		return "managebankrollconfirmation";
	}
	
	@PostMapping("/bankrollstats")
	public String bankrollStats(@RequestParam(required = false) String username, @RequestParam(required = false) boolean loggedIn, Model model) {
		
		if(username != null) {
		
			UserResponse user = userService.findByUsername(username);
			
			double bankroll = user.getBankroll();
			double netProfit = user.getNetProfit();
			
			if(bankroll > 0.00 && netProfit > 0.00) {
				String message = "Your total bankroll stands at " + user.displayBankroll(bankroll) + ". Your net profit stands at " + user.displayNetProfit(netProfit) + ".";
				model.addAttribute("message", message);
			} else if(bankroll > 0.00 && netProfit < 0.00) {
				String message = "Your total bankroll stands at " + user.displayBankroll(bankroll) + ". Your net loses stand at " + user.displayNetProfit(netProfit) + ".";
				model.addAttribute("message", message);
			} else if(bankroll == 0.00 && netProfit > 0.00){
				String message = "Your total bankroll stands at " + user.displayBankroll(bankroll) + ". Your net profit stand at " + user.displayNetProfit(netProfit) + ".";
				model.addAttribute("message", message);
			}else if(bankroll == 0.00 && netProfit < 0.00) {
				String message = "Your total bankroll stands at " + user.displayBankroll(bankroll) + ". Your net loses stand at " + user.displayNetProfit(netProfit) + ".";
				model.addAttribute("message", message);
			} else {
				String message = "You must deposit funds in your bankroll and play before statistics can be generated for your account!";
				model.addAttribute("message", message);
			}
			
			model.addAttribute("username", username);
			model.addAttribute("bankroll", user.displayBankroll(user.getBankroll()));
			model.addAttribute("netprofit", user.displayNetProfit(user.getNetProfit()));
			model.addAttribute("loggedIn", true);
		}
		
		return "bankrollstats";
	}
	
	public static String hashPassword(String password) {
		String result = "";
		int mult = (password.length() * password.length()) % 126;
		for (int i = password.length() - 1; i >= 0; i--) {
			int num = (int)password.charAt(i);
			num = num + mult;
			
			result += (char)num;
			mult += 4;
		}
		return result;
	}
}
