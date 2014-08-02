package orgProfiles.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import orgProfiles.model.User;
import orgProfiles.repository.UserRepository;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
@Transactional
	public User save(User user) {
		// TODO Auto-generated method stub
		return userRepository.save(user);
	}
@Override
public List<User> findByname(String name) {
	System.out.println("finebyname");
	return  userRepository.findByName(name);
	
}

}
