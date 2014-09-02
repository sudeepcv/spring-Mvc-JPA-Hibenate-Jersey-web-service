package orgProfiles.service;

import java.util.List;

import orgProfiles.model.News;
import orgProfiles.model.Registration;
import orgProfiles.model.User;

public interface UserService {

	User save(User user);

	List<User> findByname(String name);

	void registerUser(Registration registration);

	List<Registration> getAllOrgs();

	Registration orgByname(String companyname);

	boolean Authenticate(String uname, String password);

	Registration orgByUname(String uname);

	void saveNews(News newsmodel);

	List<Registration> findPlace(String place);

	List<News> getNewsByOrgId(Long orgid);

	

	void deleteByNewsId(Long newsid);

	Registration getOrgByname(String uname);

	List<Registration> findOrgName(String name);

	List<Registration> findorgByType(String type);

	void deleteByid(Long orgid);

	List<Registration> findByTypeAndPlace(String type, String place);

	List<Registration> findByNameAndPlace(String name, String place);

	



	

	

	

	

	
}
