package net.heidloff;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.eclipse.microprofile.metrics.annotation.Counted;

@Path("/hello")
public class GreetingResource {

    @ConfigProperty(name = "greeting.message") 
    String message;

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    @Counted(name = "countHelloEndpointInvoked", description = "How often /hello has been invoked")
    public String hello() {
        return String.format("Hello %s", message);        
    }
}