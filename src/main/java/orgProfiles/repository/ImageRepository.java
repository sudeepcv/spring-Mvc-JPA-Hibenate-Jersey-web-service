package orgProfiles.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import orgProfiles.model.Images;
@Repository("imageRepository")
public interface ImageRepository extends JpaRepository<Images,Long> {

	@Query("Select i from Images i where i.OrgId=:orgid")  
	Images getByOrgid(@Param("orgid")Long orgid);
	
	 

}
