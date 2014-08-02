package orgProfiles.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class User {
@Id
@GeneratedValue
private Long id;
private String uname;
private String password;
public Long getId() {
	return id;
}
public String getPassword() {
	return password;
}
public String getUname() {
	return uname;
}
public void setId(Long id) {
	this.id = id;
}
public void setPassword(String password) {
	this.password = password;
}
public void setUname(String uname) {
	this.uname = uname;
}

}
