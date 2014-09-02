package orgProfiles.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import orgProfiles.model.LoginCredentials;
import orgProfiles.model.User;
@Repository("userRepository")
public interface UserRepository extends JpaRepository<User, Long> {   

	@Query("Select r from User r where r.uname=:name")
	List<User> findByName(@Param("name")String name);
   @Query("Select u from LoginCredentials u where u.userName=:uname and u.password=:password")
	List<LoginCredentials> Authenticate(@Param("uname")String uname,@Param("password") String password);
   @Query("Select u from LoginCredentials u where u.userName=:uname")  
   LoginCredentials getIdByUname(@Param("uname")String uname);

 

}
