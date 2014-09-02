package orgProfiles.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
@Entity
public class News {
	@Id
	@GeneratedValue
	private long id;
	private Long orgId;
	private String title;
	@Column(name="news", columnDefinition="TEXT")
	private String news;
	private String date;
	public String getDate() {
		return date;
	}
	public long getId() {
		return id;
	}

	public String getNews() {
		return news;
	}
	public Long getOrgId() {
		return orgId;
	}
	public String getTitle() {
		return title;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setId(long id) {
		this.id = id;
	}

	public void setNews(String news) {
		this.news = news;
	}
	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	

}
