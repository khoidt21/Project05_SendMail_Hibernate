package com.hibernate.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hibernate.been.News;
import com.hibernate.been.User;
import com.hibernate.dao.NewDAO;
import com.hibernate.dao.UserDAO;


/**
 * Servlet implementation class UserControllerServlet
 */
@WebServlet("/UserControllerServlet")
public class UserControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
		
		String action = request.getServletPath();
		
		try {
			switch (action) {
			case "/add":
					addAdmin(request, response);
				break;
			case "/edit":
					editAdmin(request, response);
				break;
			case "/delete":
				deleteAdmin(request, response);
				break; 	
			case "/update":
				 update(request, response);
				break;
			default:
				loadadmin(request, response);
				break;
			}				
		}
		catch (Exception ex) {
			// TODO: handle exception
			throw new ServletException(ex);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void addAdmin(HttpServletRequest request,HttpServletResponse response) {
		String userName = request.getParameter("userName");
		String password1 = request.getParameter("password1");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String city = request.getParameter("city");
		
		try {		
			User user = new User(userName, password1, email, phone, city);
			UserDAO userDao = new UserDAO();
			//userDao.addUser(user);
			if(userDao.addUser(user)) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminform.jsp");
			String mgs = "Thêm admin thành công";
			List<User> listUser = userDao.getAllUser();
			request.setAttribute("listUser",listUser);
			request.setAttribute("msg",mgs);
			requestDispatcher.forward(request, response);
			}
			else {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminform.jsp");
				request.setAttribute("msg","Tên admin đã có trong cơ sở dữ liệu");
				requestDispatcher.forward(request, response);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public void editAdmin(HttpServletRequest request,HttpServletResponse response) {
		try {
		int id = Integer.parseInt(request.getParameter("id"));
		UserDAO userDAO = new UserDAO();
		User editUser = userDAO.getUser(id);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminform.jsp");
		
		request.setAttribute("user", editUser);
		requestDispatcher.forward(request, response);
		}catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public void deleteAdmin(HttpServletRequest request,HttpServletResponse response) {
		try {
			UserDAO userDAO = new UserDAO();
			String userId = request.getParameter("id");
			String uLogin = request.getParameter("userLogin");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminform.jsp");			
			
			boolean ktcheck = userDAO.deleteUser(Integer.parseInt(userId), uLogin);
			
			if(ktcheck == true) {
				List<User> listUser = userDAO.getAllUser();
				request.setAttribute("listUser",listUser);
				request.setAttribute("msg","Xóa admin thành công.");
				
				requestDispatcher.forward(request, response);
			}
			else {
				request.setAttribute("msg","Admin đang đăng nhập không xóa được.");
				List<User> listUser = userDAO.getAllUser();
				request.setAttribute("listUser",listUser);
				
				requestDispatcher.forward(request, response);
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public void update(HttpServletRequest request,HttpServletResponse response) {
		try {
			UserDAO userDAO = new UserDAO();
			int uId = Integer.parseInt(request.getParameter("id"));
			String uName = request.getParameter("userName");
			String uPassword1 = request.getParameter("password1");
			String uPhone = request.getParameter("phone");
			String uEmail = request.getParameter("email");
			String uCity = request.getParameter("city");
			
			User user = new User(uId,uName,uPassword1,uEmail, uPhone, uCity);
			userDAO.updateUser(user);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminform.jsp");
			List<User> listUser = userDAO.getAllUser();
			request.setAttribute("listUser",listUser);
			request.setAttribute("msg","Cập nhập admin thành công");
			requestDispatcher.forward(request, response);
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	private void loadadmin(HttpServletRequest request,HttpServletResponse response) {
		try {
			UserDAO userDAO = new UserDAO();
			List<User> listUser = userDAO.getAllUser();
			request.setAttribute("listUser", listUser);		
			RequestDispatcher dispatcher = request.getRequestDispatcher("adminform.jsp");
		    dispatcher.forward(request, response);
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
