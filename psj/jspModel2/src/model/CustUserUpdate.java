package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustUserDao;
import dto.CustUserDto;

@WebServlet("/custuserupdate")
public class CustUserUpdate extends HttpServlet {
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
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String command = req.getParameter("command");
		if(command.equals("modify")) {
			CustUserDto dto = dao.selectUser(id);
	
			req.setAttribute("custdto", dto); // 짐싸
			forward("custusermodify.jsp", req, resp);	// 가세요

		} else if(command.equals("modifyAf")) {
			String name = req.getParameter("name");
			String address = req.getParameter("address");
			
			boolean isS = dao.updateCustUser(new CustUserDto(id, name, address));
			
			resp.sendRedirect("finding.jsp?command=modify&isS="+isS+"&id="+id);
		}
	}
	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req,resp);
	}
}
