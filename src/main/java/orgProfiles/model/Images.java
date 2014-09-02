package orgProfiles.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Images {
	@Id
	@GeneratedValue
private Long id;
private Long OrgId;


public Long getOrgId() {
	return OrgId;
}
public void setOrgId(Long orgId) {
	OrgId = orgId;
}
private String filename;
public String getFilename() {
	return filename;
}
public Long getId() {
	return id;
}

public void setFilename(String filename) {
	this.filename = filename;
}
public void setId(Long id) {
	this.id = id;
}

}
