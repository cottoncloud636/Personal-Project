package com.xianzhou.stocksales.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.xianzhou.stocksales.models.Listing;
import com.xianzhou.stocksales.models.Login;
import com.xianzhou.stocksales.models.Registration;
import com.xianzhou.stocksales.services.ListService;
import com.xianzhou.stocksales.services.UserService;

@Controller
public class MainController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private ListService listService;

	@GetMapping ("/")
	public String index () {
		return "index.jsp";
	}
	
/**************************Handles Registration and Login**************************/
	@GetMapping ("/users")
	public String index (Model model) {
		model.addAttribute("newUser", new Registration());
		model.addAttribute("newLogin", new Login());
		return "users.jsp";
	}
	
	@PostMapping ("/register") //once click "register" button, will go to this hidden /register url
	public String register (@Valid @ModelAttribute("newUser") Registration newUser, BindingResult result, Model model, HttpSession session) {
			
		// Call a register method in the service to do some extra validations and create a new user.
		Registration user = userService.register(newUser, result);
			
		//if model-level has errors, be sure to send in empty LoginUser before re-rendering the page.
		if(result.hasErrors()) {
			model.addAttribute("newLogin",new Login());
			return "users.jsp";
		}
		//if no errors, store new user's id from the DB in session, in other words, log them in.
		session.setAttribute("userId", user.getId()); //here "userId" can be any name, "user" came from line48
		return "redirect:/home";
	}
	@PostMapping ("/login") //old user type in their info into form and submit
	public String login (@Valid @ModelAttribute ("newLogin") Login newLogin, BindingResult result, Model model, HttpSession session) {
		Registration user = userService.login(newLogin, result); // Call a login method in the service to do some extra validations and get ready to log in old user.
		
		if (result.hasErrors()) {
			model.addAttribute("newUser",new Registration());
			return "users.jsp";
		}
		
		session.setAttribute("userId", user.getId()); //if no errors, store user's id from the DB in session, in other words, log them in.
		return "redirect:/home";
	}
	/**************************End of Registration and Login"**************************/
	
	
	/************************** home: display the stock listing detail**************************/
	@GetMapping ("/home")
	public String home (HttpSession session, Model model) {
		if (session.getAttribute("userId") == null){ 
		return "redirect:/users";
	}
	
		model.addAttribute("listings", listService.all()); //"listings" can be any name
		model.addAttribute("user", userService.findById((Long)session.getAttribute("userId")));//"user" can be any name
			return "home.jsp"; //if user id is already in session, show all listings info
	}
	/**************************End of dashboard**************************/
	
	
	/**************************create new listing page**************************/
	@GetMapping ("/listings/new")
	public String addList (@ModelAttribute("list") Listing list, Model model, HttpSession session) {
		Registration user = userService.findById((Long)session.getAttribute("userId"));
		model.addAttribute("user", user);
			return "addstock.jsp";
	}
	
	@PostMapping ("/listings")
	public String createList(@Valid @ModelAttribute("list") Listing list, BindingResult result, Model model) {
	
		if (result.hasErrors()) { //if model-level has errors, rerender the addlist.jsp
			return "addstock.jsp";
	}
	
		listService.create(list); //if no input errors, create a list
		return "redirect:/home";
	}
	/**************************End of create new listing page**************************/
	
	
/**************************display listing**************************/
	@GetMapping("/listings/{id}") //to show the teams info
		public String showTeam(Model model, @PathVariable("id") Long id, HttpSession session) {
			if(session.getAttribute("userId") == null) { //if user is not in session, redirect to index page
				return "redirect:/";
		}
	
		Listing list = listService.findById(id);
		model.addAttribute("list", list);
		model.addAttribute("user", userService.findById((Long)session.getAttribute("userId")));

		return "display.jsp";
	}
	/**************************End of display listing**************************/
	
	
	/**************************edit page**************************/    
	@GetMapping("/listings/{id}/edit")
		public String editList(@PathVariable("id") Long id, Model model, HttpSession session) {
		
		if(session.getAttribute("userId") == null) {
		return "redirect:/users";
		}
	
		Listing list = listService.findById(id);
		model.addAttribute("list", list);
		return "edit.jsp";
		}
		
	@PutMapping("/listings/{id}") //update the list info
		public String updateList(@Valid @ModelAttribute("list") Listing list, BindingResult result) {
		
		if (result.hasErrors()) {
		return "edit.jsp"; //if error, stay on the edit page and keep editing
		}
	
		listService.update(list);    	
		return "redirect:/home";
	}
	/**************************end of edit page**************************/   
	
	
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/users";
    }

    @DeleteMapping("/listings/{id}")
	public String delete(@PathVariable("id") Long id) {
		
		listService.delete(id);
		return "redirect:/home";
	}
}