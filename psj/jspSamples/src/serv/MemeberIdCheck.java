package serv;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import dao.MemberDao;

@WebServlet("/chekid")
public class MemeberIdCheck extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String id = req.getParameter("userid");
		System.out.println(id);
		
		MemberDao dao = MemberDao.getInstance();
		boolean isS = dao.checkId(id);

		JsonObject obj = new JsonObject();
		obj.addProperty("check", isS);
		
		
	}

}
