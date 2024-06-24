package kca.cbt.view.criteria;

import javax.servlet.http.HttpServlet;
import java.util.HashMap;
import java.util.Map;

public class HandlerMapping {
    private Map<String, HttpServlet> mappings;

    public HandlerMapping() {
        mappings = new HashMap<>();
    }

    public void setMappings(Map<String, HttpServlet> mappings) {
        this.mappings = mappings;
    }

    public HttpServlet getHandler(String path) {
        return mappings.get(path);
    }
}
