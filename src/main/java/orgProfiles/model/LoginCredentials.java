package orgProfiles.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class LoginCredentials {
	@Id 
	@GeneratedValue
	private Long logind;
	
	
	
	public Long getLogind() {
		return logind;
	}
	public void setLogind(Long logind) {
		this.logind = logind;
	}
	private String userName;
	private String password;
	
	public String getPassword() {
		return password;
	}
	public String getUserName() {
		return userName;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

}
