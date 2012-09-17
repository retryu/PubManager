package com.servelet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.DB.DBUtil;
import com.DB.DBupdate;
import com.model.Activity;
import com.model.Member;

public class registMember extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html:charset=utf-8");

		WebApplicationContext wac = WebApplicationContextUtils
				.getWebApplicationContext(this.getServletContext());
		ServletContext sc = getServletContext();
		DBupdate dbupdate = (DBupdate) wac.getBean("DBupdate");
		DBUtil db = (DBUtil) wac.getBean("DBUtil");
		String activity_id = req.getParameter("activity_id");
		String member_token = req.getParameter("member_token");

		System.out.println("\n\nget  Register");
		if (activity_id != null) {
			List l = db.getInfo("from  Activity  where activity_id="
					+ activity_id);
			Activity activity = (Activity) l.get(0);
			System.out.println("activity_id:"
					+ new JSONObject().fromObject(activity));
			req.setAttribute("activity", activity);
			RequestDispatcher rd = sc
					.getRequestDispatcher("/activitydetail.jsp");
			rd.forward(req, resp);
		}
		if (member_token != null) {
			String member_id = req.getParameter("member_id");
			System.out.print("token:" + member_token + "  member_id"
					+ member_id);
			System.out.println("\n\n~~~member_id:" + member_id + "\n"
					+ "member_token:" + member_token);
			if (member_token != null) {
				List list = db
						.getInfo("from  Member where  member_id=18042107657");
				System.out.println("list's  size()" + list.size());
				Member m = (Member) list.get(0);
				JSONObject jsonObject = new JSONObject().fromObject(m);
				System.out.print(jsonObject.toString());
				Member member = new Member(new  Integer(member_id), "王二", "中国 山西", 1000,
						"2001-2-3", "男", member_token, "1","可乐");
				dbupdate.updateTable("Member", member, member_id);
			} else {
				System.out.print("member_id=null");
			}

		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

	}

}
