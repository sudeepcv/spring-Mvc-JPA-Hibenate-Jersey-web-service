package orgProfiles.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import orgProfiles.model.User;
@Repository("userRepository")
public interface UserRepository extends JpaRepository<User, Long> {   

	@Query("Select r from User r where r.uname=:name")
	List<User> findByName(@Param("name")String name);	
}
