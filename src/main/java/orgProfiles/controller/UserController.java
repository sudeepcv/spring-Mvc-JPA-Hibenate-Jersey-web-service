package orgProfiles.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import orgProfiles.model.User;
import orgProfiles.model.UserJsonResponse;
import orgProfiles.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userservice;

@RequestMapping(value="/greeting")
public String hello(Model model){
	System.out.println("ingreeting");
	User user=new User();
	user.setPassword("testpassword");
	user.setUname("setuname");
	model.addAttribute("greeting","helloworld");
	userservice.save(user);
	
	String name="setuname";
	userservice.findByname(name);
	return "hello";
	
	
}
@RequestMapping(value="/login")
public String login(){
	return "login";
}

@RequestMapping(value = "/submituser",method=RequestMethod.POST )
public  @ResponseBody UserJsonResponse submitUser(@Valid User user,BindingResult bindingResult){
	UserJsonResponse userJsonResponse=new UserJsonResponse();
	
	System.out.println("form posted");
	System.out.println("password is:"+user.getPassword());
	return userJsonResponse;
}
}
