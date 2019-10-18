package com.hibernate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hibernate.dao.UserDAO;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class LoginControllerServlet
 */
@WebServlet("/LoginControllerServlet")
public class LoginControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		UserDAO userDAO = new UserDAO();
		HttpSession session = request.getSession(true);
		
		if(username.trim().length() >=0 && username !=null && password.trim().length() > 0 && password !=null) {
			boolean flag = userDAO.login(username, password);
			if(flag) {
				request.getSession().setAttribute("username", username);
				request.getSession().setAttribute("isNew", true);
				response.sendRedirect("welcome.jsp");
			}
			else {
				session.invalidate();
				String errLogin = "Sorry UserName or Password Error!";
				request.setAttribute("error", errLogin);
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);	
			}
		}
		
	}
	
}
