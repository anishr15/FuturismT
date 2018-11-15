package com.ibm.cto;

import java.io.IOException;
import java.util.Map;
import java.lang.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.ibm.watson.developer_cloud.conversation.v1.ConversationService;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageRequest;
import com.ibm.watson.developer_cloud.conversation.v1.model.MessageResponse;

import com.alibaba.fastjson.JSONObject;

/**
 * Servlet implementation class Talk
 */
@WebServlet("/Talk")
public class Talk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Talk() {
        super();
    }

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String requestMessage = request.getParameter("message");
		String contextString = request.getParameter("context");
		JSONObject contextObject = new JSONObject();
		

		if(contextString != null) {
			contextObject = JSONObject.parseObject(contextString);
		}

		System.out.println("Context: "+contextString);
		System.out.println(contextObject);

		Map<String, Object> contextMap = Utility.toMap(contextObject);

		if(requestMessage == null || requestMessage.isEmpty()){
			requestMessage = "Greetings";
		}
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("utf-8");
		

		ConversationService service = new ConversationService("2018-07-10");
		service.setUsernameAndPassword(Configuration.getInstance().CONVERSATION_USERNAME, Configuration.getInstance().CONVERSATION_PASSWORD);

		MessageRequest newMessage = new MessageRequest.Builder().context(contextMap).inputText(requestMessage).build();

		MessageResponse r = service.message(Configuration.getInstance().CONVERSATION_WORKSPACE_ID, newMessage).execute();

		response.getWriter().append(r.toString());
		boolean isExist = (boolean) r.getContext().containsKey("contact_details_entered");
		System.out.println(" IsExist:--"+isExist);
		String name = (String) r.getContext().get("name");
		String email = (String) r.getContext().get("email");
		String phone =(String) r.getContext().get("phone");
		String company =(String) r.getContext().get("company_name");
		String companytype =(String) r.getContext().get("company_type");
		String partnumber =(String) r.getContext().get("part_number");
		Double qty = (Double) r.getContext().get("part_qty");
		String timeframe =(String) r.getContext().get("timeframe");
		
		System.out.println(" name :--"+name);
		System.out.println(" email :--"+email);
		System.out.println(" company :--"+company);
	
		/*contextMap = r.getContext();*/
		//System.out.println(r.getContext().get("contact_details_entered"));
	/*	if (r.getOutput().get("actions")=="DBinsert"){
		    System.out.println("inserted data");
		}*/
	
		
	}
}
