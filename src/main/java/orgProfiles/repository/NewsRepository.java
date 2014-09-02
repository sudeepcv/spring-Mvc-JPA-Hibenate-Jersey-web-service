package orgProfiles.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import orgProfiles.model.News;

@Repository("newsRepository")
public interface NewsRepository extends JpaRepository<News,Long> {
	@Query("Select n from News n where n.orgId=:orgid")
	List<News> findAllByOrgid(@Param("orgid")Long orgid);

}
