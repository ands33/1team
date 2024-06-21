package kca.cbt.criteria;

import javax.servlet.http.HttpServlet;
import java.util.HashMap;
import java.util.Map;

public class HandlerMapping {
	private Map<String, HttpServlet> mappings;

public HandlerMapping() { mappings = new HashMap<>();
mappings.put("/getCriteriaList.do", new GetCriTeriaServlet()); // 수정된 부분 }
}

	public HttpServlet getHandler(String path) {
		return mappings.get(path);
	}
}
