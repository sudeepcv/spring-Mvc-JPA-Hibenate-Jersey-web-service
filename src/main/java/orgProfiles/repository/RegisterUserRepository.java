package orgProfiles.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import orgProfiles.model.Registration;
@Repository("registerUserRepository")
public interface RegisterUserRepository extends JpaRepository<Registration,Long>{
    @Query("Select c from Registration c where c.name=:companyname")
	Registration findByCompanyname(@Param("companyname")String companyname);
    
//    @Query("Select c from Registration c where c.place like %:place%")
	List<Registration> findByPlaceContaining(String place);
    
//    @Query("Select c from Registration c where c.name like %:name%")
	List<Registration> findByNameContaining( String name);
    
//	@Query("Select c from Registration c where c.type like :type")
    List<Registration> findByTypeContaining(String type);

	List<Registration> findByTypeAndPlace(String type, String place);

	List<Registration> findByNameAndPlace(String name, String place);
}
