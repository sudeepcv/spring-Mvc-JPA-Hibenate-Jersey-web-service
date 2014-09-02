package orgProfiles.controller;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import orgProfiles.model.Comments;
import orgProfiles.model.Images;
import orgProfiles.model.LoginCredentials;
import orgProfiles.model.News;
import orgProfiles.model.Registration;
import orgProfiles.model.User;
import orgProfiles.model.UserJsonResponse;
import orgProfiles.repository.CommentsRepository;
import orgProfiles.repository.ImageRepository;
import orgProfiles.service.UserService;

@Controller
public class UserController {
	 private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	 
		@Autowired
		private ImageRepository imageRepository;
		
		@Autowired
		private CommentsRepository commentRepository;
	
		
	
	@Autowired
	private UserService userservice;

	@RequestMapping(value="/index")
	public String index(){
		return "index";
		
	}
	@RequestMapping(value="/deletNews",method=RequestMethod.POST)
	public String deletNews(@RequestParam("uname") String uname,@RequestParam("orgid") Long orgid
			,@RequestParam("newsid") Long newsid){
		System.out.println("news is:"+newsid);
		userservice.deleteByNewsId(newsid);
		return "redirect:addnews.html?orgid="+orgid+"&uname="+uname;
	}

	
	@RequestMapping(value="/addnews")
	public String addNews(@RequestParam("uname") String uname,@RequestParam("orgid") Long orgid,Model model, HttpServletRequest request){
		String Uname=uname;
		List<News> allnews=userservice.getNewsByOrgId(orgid);
		model.addAttribute("allnews",allnews);
		System.out.println("uname in controller:"+Uname);
  	Registration orgInfo=userservice.orgByUname(Uname);
   	model.addAttribute("orgInfo",orgInfo);
   	
		model.addAttribute("orgid",orgid);
		String f=(String) request.getSession().getAttribute("addnewsSuccess");
		if(f=="success"){
          model.addAttribute("flag","success");		
          System.out.println("seted in addnews controller");
		}
		
		request.removeAttribute("addnewsSuccess");
		
		
		System.out.println(orgid);
		return "addnews";
	}
	
	
	@RequestMapping(value="/addnewsAction",method=RequestMethod.POST)
	public String addNews(@RequestParam("uname") String uname,@RequestParam("title") String title,@RequestParam("news") String news,@RequestParam("orgId") Long orgId, HttpServletRequest request ){
		System.out.println(title);
		System.out.println(news);
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		System.out.println(dateFormat.format(cal.getTime()));
		News newsmodel=new News();
		newsmodel.setNews(news);
		newsmodel.setTitle(title);
		System.out.println("orrrrrrrrrrrrrrrrg id:"+orgId);
		newsmodel.setOrgId(orgId);
		newsmodel.setDate(dateFormat.format(cal.getTime()));
		userservice.saveNews(newsmodel);	
		request.getSession().setAttribute("addnewsSuccess","success");
//		redirectAttributes.addFlashAttribute("flag","success");
		return "redirect:addnews.html?orgid="+orgId+"&uname="+uname;
	}
	@RequestMapping(value="/editprofile")
	public String editprofile(@RequestParam("uname") String uname,Model model){
		System.out.println("controller uname"+uname);
		Registration orgInfo=userservice.orgByUname(uname);
	   	model.addAttribute("orgInfo",orgInfo);
	   	
		return "editprofile";
	}

	@RequestMapping(value="/loginAction",method=RequestMethod.POST)
	public String loginAction(@RequestParam("email") String uname,@RequestParam("password") String password,RedirectAttributes redirectAttributes
			,HttpSession session,HttpServletRequest request,Model model){
		System.out.println(uname);
		boolean check=userservice.Authenticate(uname,password);
			
		
		if(check){
			Registration org=userservice.getOrgByname(uname);
			
			Long orgid=org.getId();
			
			if(orgid !=null){
				System.out.println(orgid+"iddddddddddddddddddddddd");	
//				request.setAttribute("uname", uname);
				model.addAttribute("uname", uname);
				request.getSession().setAttribute("sessionUname",uname);
				System.out.println("the result is in controller :"+check);
//				redirectAttributes.addFlashAttribute("uname",uname);
				return "redirect:/userhome.html?uname="+uname+"&orgid="+orgid;	
			}else{
				return "redirect:registration.html?t=f";
			}
				
			
		}else{
			System.out.println("bloc false");
			return "redirect:registration.html?t=f";
			
		}
		
	}
	@RequestMapping(value="/userhome")
	public String userhome(Model model,@RequestParam("uname") String uname,@RequestParam(value="orgid",defaultValue="") Long orgid, HttpServletRequest request){
//		System.out.println("Model attribute"+ model.asMap().get("uname"));
//		String Uname=(String) model.asMap().get("uname");
		List<News> allnews=userservice.getNewsByOrgId(orgid);
		model.addAttribute("news", allnews);
		
		String Uname=uname;
		
		System.out.println("uname in controller:"+Uname);
  	Registration orgInfo=userservice.orgByUname(Uname);
   	model.addAttribute("orgInfo",orgInfo);
   	
   Images images=	imageRepository.findOne(orgInfo.getId());
   System.out.println("org id in controlle:"+orgInfo.getId());
   if(images != null){
	   request.getSession().setAttribute("sessionimage",images.getFilename());
	   System.out.println("filename:"+images.getFilename());
	  
   }else{
	   System.out.println("image not in session");
	 
   }
		
		return "userhome";
	}
	
	   @RequestMapping(value="/org/{companyname}")
	    public String getUserName(Model model,@PathVariable("companyname") String companyname, HttpServletRequest request){

		   
		   System.out.println(companyname);
		   Registration orgInfo=userservice.orgByname(companyname);
		    Long orgid=orgInfo.getId();
		    System.out.println(".............long int is:"+orgid);
		    
		   List<Comments> cmts=commentRepository.findByOrgidEquals(orgid);
		   model.addAttribute("allMsg", cmts);
		    
		    
//		    Images images=	imageRepository.findOne(orgid);
		    Images images=imageRepository.getByOrgid(orgid);
		   
		    if(images != null){
		    	model.addAttribute("sessionimage",images.getFilename());
		    	 
		    	System.out.println(images.getFilename());
		    	System.out.println(".........................null");
		    }else{
		    	request.removeAttribute("sessionimage");
		    	System.out.println("removed session...........................");
		    }
		
//    if( images.getFilename() != null && !"".equals(images.getFilename()) ){
//		    
//		    
//		    System.out.println("uuuuuuuuuuuuuuuuuu");
//		    
//		    request.getSession().setAttribute("sessionimage",images.getFilename());
//		    }
		
		    
		    List <News> allnews=userservice.getNewsByOrgId(orgid);
		    model.addAttribute("news",allnews);
		   System.out.println("uname:"+orgInfo.getLoginCredentials().getUserName());
		   model.addAttribute("orgInfo",orgInfo);
		   
		   
		   
		   
		   return "orgProfile";
	    }
	   
	
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
@RequestMapping(value="/registration")
public String registrationForm(@RequestParam(value="t",defaultValue="")String flag,Model model){
	if(flag.length()>0){
		model.addAttribute("ErrorLogin","error");
	}
	System.out.println(System.getProperty("catalina.base"));
	return "registration";
}
@RequestMapping(value="/org/addcmd",method=RequestMethod.POST)
public @ResponseBody Comments addcmd(@RequestParam("orgid")Long orgid,@RequestParam("text")String text,@RequestParam("date")String date){
	System.out.println("date is:"+date+"txtid:"+text);
	Comments cmnts=new Comments();
	cmnts.setOrgid(orgid);
	cmnts.setDate(date);
	cmnts.setComment(text);
	commentRepository.save(cmnts);
	
	
	return cmnts;
}

@RequestMapping(value="/registration",method=RequestMethod.POST)
public @ResponseBody Registration registrationAction(@Valid Registration registration,@Valid LoginCredentials loginCredentials,BindingResult bindingResult
	){
	    
	
     System.out.println("from controller"+loginCredentials.getLogind());
   registration.setLoginCredentials(loginCredentials);
	userservice.registerUser(registration);
	return registration;
	
}

@RequestMapping(value="/updateProfile",method=RequestMethod.POST)
public @ResponseBody Registration updateProfile(@Valid Registration registration,@Valid LoginCredentials loginCredentials,BindingResult bindingResult
		,@RequestParam("orgId") Long orgId	){
	System.out.println();
//	Registration orgId=registerUserRepository.findByCompanyname(registration.getName());
     System.out.println("from controller"+loginCredentials.getLogind());
     loginCredentials.setLogind(orgId);
     
   registration.setLoginCredentials(loginCredentials);
   registration.setId(orgId);
	userservice.registerUser(registration);
	return registration;
	
}





@RequestMapping(value="/upload")
public String uploadFile(){
	return "upload";
}

@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
public @ResponseBody
String uploadFileHandler(@RequestParam("name") String name,
        @RequestParam("file") MultipartFile file) {

    if (!file.isEmpty()) {
        try {
            byte[] bytes = file.getBytes();

            // Creating the directory to store file
            String rootPath = System.getProperty("catalina.home");
            File dir = new File(rootPath + File.separator + "tmpFiles");
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath()
                    + File.separator + name);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
            System.out.println(serverFile.getAbsolutePath());

            logger.info("Server File Location="
                    + serverFile.getAbsolutePath());

            return "You successfully uploaded file=" + name;
        } catch (Exception e) {
            return "You failed to upload " + name + " => " + e.getMessage();
        }
    } else {
        return "You failed to upload " + name
                + " because the file was empty.";
    }
}


@RequestMapping(value = "/submituser",method=RequestMethod.POST )
public  @ResponseBody UserJsonResponse submitUser(@Valid User user,BindingResult bindingResult){
	UserJsonResponse userJsonResponse=new UserJsonResponse();
	
	System.out.println("form posted");
	System.out.println("password is:"+user.getPassword());
	return userJsonResponse;
}
@RequestMapping(value="/logout")
public String logout(HttpServletRequest request){
	request.getSession().invalidate();
	return "index";
}

@RequestMapping(value="/search")
public String searchProfile(@RequestParam("place") String place,Model model){
	
	List<Registration> searchResult=userservice.findPlace(place);
	System.out.println("last index of search result:"+searchResult.lastIndexOf(searchResult));
	model.addAttribute("allOrg",searchResult);
	return "adminhome";
}
@RequestMapping(value="/deleteOrg")
public String deleteOrg(@RequestParam("orgId") Long orgid){
	userservice.deleteByid(orgid);
	return "redirect:/adminhome.html";
}

@RequestMapping(value="/org/search")
public String searchProfilePublic(@RequestParam(value="place",defaultValue="") String place,@RequestParam(value="name",defaultValue="") String name,
		
		@RequestParam(value = "type", defaultValue = "") String type,Model model){
	System.out.println("...............containes String"+place.isEmpty());
	
	int count=0;
	if(place.length()>0)
		count=count+1;
	if(type.length()>0)
		count=count+1;
	if(name.length()>0)
		count=count+1;
	
	
			if(count==2){
	
	if(place.length()>0 && type.length()>0){
		System.out.println("place and type in................");
		List<Registration> searchResult=userservice.findByTypeAndPlace(type,place);
		model.addAttribute("allOrg",searchResult);
		
	}
	
	
	if(place.length()>0 && name.length()>0){
		System.out.println("place and name in................");
		List<Registration> searchResult=userservice.findByNameAndPlace(name,place);
		model.addAttribute("allOrg",searchResult);
		
	}
	
	
			}
	if(count==1){
	
	if(place.length() > 0){
		List<Registration> searchResult=userservice.findPlace(place);
		System.out.println("last index of search result:"+searchResult.lastIndexOf(searchResult));
		model.addAttribute("allOrg",searchResult);
		System.out.println("............................inside place");
	}
	if(type.length() > 0){
		List<Registration> searchResult=userservice.findorgByType(type);
		System.out.println("last index of search result:"+searchResult.lastIndexOf(searchResult));
		model.addAttribute("allOrg",searchResult);
		System.out.println("............................inside Type");
	}
	if(name.length() > 0){
		List<Registration> searchResult=userservice.findOrgName(name);
		System.out.println("............................inside name");
		System.out.println("last index of search result:"+searchResult.lastIndexOf(searchResult));
		model.addAttribute("allOrg",searchResult);
	}}
//	List<Registration> searchResult=userservice.findOrgName(name);
	
//	List<Registration> searchResult=userservice.findPlace(place);
	
	return "publicSearchResult";
}


@RequestMapping(value="/UploadImage",method=RequestMethod.POST)
public String syHello(@RequestParam MultipartFile file, Model uiModel,RedirectAttributes redirectAttributes, HttpServletRequest request,@RequestParam("orgId") Long orgId,
		@RequestParam("uname") String uname
		) throws IOException{
	//		System.out.println(file.getOriginalFilename());
//	System.out.println("posted");

//	regform.setPic(file.getOriginalFilename());
//	System.out.println(System.getProperty("user.dir"));
	String userdir=System.getProperty("user.dir");
//	String fileName=orgId+".jpg";
String fileName=file.getOriginalFilename();
	System.out.println(userdir+"/"+fileName);
	String path = request.getContextPath();
	System.out.println(path);
	
	if (!file.isEmpty()) {
		 BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
		 
		 String pathtoimages="/home/sudeepcv/springsts/projectwork/orgProfiles/src/main/webapp/img";
		 File destination = new File(pathtoimages+"/"+fileName);
		 // something like C:/Users/tom/Documents/nameBasedOnSomeId.png
		 ImageIO.write(src, "png", destination);
		 //Save the id you have used to create the file name in the DB. You can retrieve the image in future with the ID.
		 } 
	Images imageModel=new Images();
	

	System.out.println("model id in contoller:"+orgId);
	imageModel.setOrgId(orgId);
	imageModel.setId(orgId);
	imageModel.setFilename(fileName);
	request.getSession().setAttribute("sessionimage",fileName);
	
	System.out.println();
	imageRepository.save(imageModel);
	
//return "redirect:greeting.html";
//	redirectAttributes.addFlashAttribute("uname",uname);
	redirectAttributes.addFlashAttribute("uploadsuccess","success");
	return "redirect:/userhome.html?uname="+uname;
			
//	return "redirect:/company/"+companyName+".html";
}




}
