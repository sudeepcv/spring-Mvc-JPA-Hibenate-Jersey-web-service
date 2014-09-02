package orgProfiles.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import orgProfiles.model.Comments;
@Repository("commentsRepository")
public interface CommentsRepository extends JpaRepository<Comments,Long>  {

	List<Comments> findByOrgidEquals(Long orgid);

}
