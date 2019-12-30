package com.study.web.rest;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

@Path("/hellos")
public class Hellos {
    private static List<String> hellos = new ArrayList<>(Arrays.asList("HelloA", "HelloB"));
    
    @GET
    public String list() {
        return hellos.toString();
    }
    
    @GET
    @Path("/{id}")
    public String get(@PathParam("id") Integer id) {
        return hellos.get(id);
    }
}
