package orgProfiles.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import orgProfiles.model.LoginCredentials;
import orgProfiles.model.News;
import orgProfiles.model.Registration;
import orgProfiles.model.User;
import orgProfiles.repository.ImageRepository;
import orgProfiles.repository.NewsRepository;
import orgProfiles.repository.RegisterUserRepository;
import orgProfiles.repository.UserRepository;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private ImageRepository imageRepository;
	@Autowired
	private NewsRepository newsRepository;
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RegisterUserRepository registerUserRepository;
@Transactional
	public User save(User user) {
		// TODO Auto-generated method stub
		return userRepository.save(user);
	}
@Transactional
public List<User> findByname(String name) {
	System.out.println("finebyname");
	return  userRepository. findByName(name);
	
}
@Transactional
public void registerUser(Registration registration) {
	System.out.println("registerUser");
	 registerUserRepository.save(registration);
	
}

public List<Registration> getAllOrgs() {
	           
	return registerUserRepository.findAll();
	
}
public Registration orgByname(String companyname) {
	
	return registerUserRepository.findByCompanyname(companyname);
}
public boolean Authenticate(String uname, String password) {
	List<LoginCredentials> user=userRepository.Authenticate(uname,password);
	if(user.isEmpty()){
		return false;
	}else{return true;}
	
}
@Transactional
public Registration orgByUname(String uname) {
	LoginCredentials user=userRepository.getIdByUname(uname);
	Long id=user.getLogind();
	return registerUserRepository.findOne(id);
}

public void saveNews(News newsmodel) {
	newsRepository.save(newsmodel);
	
}
public List<Registration> findPlace(String place) {
	// TODO Auto-generated method stub
	return registerUserRepository.findByPlaceContaining(place);
}
public List<News> getNewsByOrgId(Long orgid) {
	// TODO Auto-generated method stub
	return newsRepository.findAllByOrgid(orgid);
}
public void deleteByNewsId(Long newsid) {
	newsRepository.delete(newsid);
	System.out.println("news id:"+newsid+"deleted...........................");
	
}
public Registration getOrgByname(String uname) {
	// TODO Auto-generated method stub
	
	LoginCredentials user=userRepository.getIdByUname(uname);
	Long id=user.getLogind();
	return registerUserRepository.findOne(id);
	
}
public List<Registration> findOrgName(String name) {
	// TODO Auto-generated method stub
	return registerUserRepository.findByNameContaining(name);
}
public List<Registration> findorgByType(String type) {
	// TODO Auto-generated method stub
	return registerUserRepository.findByTypeContaining(type);
	
	
}
public void deleteByid(Long orgid) {
	registerUserRepository.delete(orgid);
	
}
public List<Registration> findByTypeAndPlace(String type, String place) {
	// TODO Auto-generated method stub
	return registerUserRepository.findByTypeAndPlace(type,place);
}
public List<Registration> findByNameAndPlace(String name, String place) {
	// TODO Auto-generated method stub
	return registerUserRepository.findByNameAndPlace(name,place);
}




}
