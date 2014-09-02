package orgProfiles.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.xml.bind.annotation.XmlRootElement;

@Entity

@XmlRootElement
public class Registration {
	@Id	
	@GeneratedValue
	private Long id;
	private String name;
	@Column(name="description", columnDefinition="TEXT")
	private String description;
	private String type;
	private String place;
	@Column(name="address", columnDefinition="TEXT")
	private String address;
	
	private String website;
	private double latitude;
	private Long phoneNum;
	private double longitude;

	@OneToOne(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name="id")	
	private LoginCredentials loginCredentials;
	public String getAddress() {
		return address;
	}
	public String getDescription() {
		return description;
	}
	public Long getId() {
		return id;
	}
	
	public double getLatitude() {
		return latitude;
	}
	public LoginCredentials getLoginCredentials() {
		return loginCredentials;
	}
	public double getLongitude() {
		return longitude;
	}
	public String getName() {
		return name;
	}
	public Long getPhoneNum() {
		return phoneNum;
	}
	public String getPlace() {
		return place;
	}
	public String getType() {
		return type;
	}
	
	public String getWebsite() {
		return website;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public void setLoginCredentials(LoginCredentials loginCredentials) {
		this.loginCredentials = loginCredentials;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public void setName(String name) {
		this.name = name;
	}
	public void setPhoneNum(Long phoneNum) {
		this.phoneNum = phoneNum;
	}
	public void setPlace(String place) {
		this.place = place;
	}

	public void setType(String type) {
		this.type = type;
	}
	public void setWebsite(String website) {
		this.website = website;
	}


}
