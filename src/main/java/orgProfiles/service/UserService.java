package orgProfiles.service;

import java.util.List;

import orgProfiles.model.User;

public interface UserService {

	User save(User user);

	List<User> findByname(String name);
}
