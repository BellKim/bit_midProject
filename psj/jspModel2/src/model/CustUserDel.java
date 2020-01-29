package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;
import dto.CustUserDto;

@WebServlet("/custuserdelete")
public class CustUserDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}
	
	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CustUserDao dao = CustUserDao.getInstance();
		
		String command = req.getParameter("command");
		
		if(command.equals("onedel")) {
			String id = req.getParameter("id");
			boolean isS = dao.deleteUser(id);
			
			resp.sendRedirect("finding.jsp?command=delete&isS="+isS+"&id="+id);
		
		} else if(command.equals("muldel")) {
			String delck[] = req.getParameterValues("delck");
			boolean isS = dao.deleteCustUsers(delck);
	    	
			resp.sendRedirect("finding.jsp?command=muldel&isS="+isS);
		}
		
	}
}
