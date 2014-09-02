package orgProfiles.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import orgProfiles.model.Registration;
import orgProfiles.service.UserService;

@Controller
public class AdminController {
	@Autowired
	private UserService userservice;
	
	@RequestMapping(value="/adminhome")
	public String login(Model model){
		
		List<Registration> allOrg= userservice.getAllOrgs();
		model.addAttribute("allOrg",allOrg);
	System.out.println(allOrg);
		return "adminhome";
	}
}
