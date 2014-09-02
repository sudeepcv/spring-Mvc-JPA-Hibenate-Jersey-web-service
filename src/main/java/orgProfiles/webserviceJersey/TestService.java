package orgProfiles.webserviceJersey;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import orgProfiles.model.Registration;
import orgProfiles.repository.RegisterUserRepository;

@Path("mytest")
@Component
public class TestService {
	@Autowired
	private RegisterUserRepository registerUserRepository;
	
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public List<Registration> hitest() {
        return registerUserRepository.findAll();
    }
    
    
    @POST
    @Path("posttest")
    @Consumes(MediaType .APPLICATION_FORM_URLENCODED)
    @Produces({MediaType.APPLICATION_XML,MediaType.APPLICATION_JSON})
    public Registration testPost(MultivaluedMap <String,String> formParam) {
    	System.out.println(formParam.getFirst("des"));
        return null;
    }
    
    
    
    @GET
    @Produces(MediaType.APPLICATION_XML)
    @Path("{regid}")
    public Registration getone(@PathParam ("regid") Long regid ) {
        return registerUserRepository.findOne(regid);
    }

}
