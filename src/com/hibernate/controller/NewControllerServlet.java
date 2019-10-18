package com.hibernate.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hibernate.been.News;
import com.hibernate.been.User;
import com.hibernate.dao.NewDAO;


/**
 * Servlet implementation class NewControllerServlet
 */
@WebServlet("/NewControllerServlet")
public class NewControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewControllerServlet() {
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
			case "/addnew":
					addNew(request, response);
				break;			
			case "/editnew":
					editNew(request, response);
				break;
			case "/deletenew":
					deleteNew(request, response);			
			case "/updatenew":
					updatenew(request, response);
				break;
			default:
				loadnew(request, response);
				break;
			}		
		}
		catch (Exception ex) {
			
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
	private void addNew(HttpServletRequest request,HttpServletResponse response) {
		try {
			NewDAO newDAO = new NewDAO();		
			String title = request.getParameter("title");
			String description = request.getParameter("description");
			String content = request.getParameter("content");
			String author = request.getParameter("author");
			java.util.Date myDate = new java.util.Date();
			java.sql.Date publisher = new java.sql.Date(myDate.getTime());
			int released;
			String checkbox = request.getParameter("released");
			if(checkbox !=null) {
				released = 1;
			}
			else {
				released = 0;
			}
			try {	
				News news = new News(title, description, content,publisher, author,released);
				newDAO.addNew(news);
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("newsform.jsp");
				List<News> listNew = newDAO.getAllNew();
				request.setAttribute("listNew",listNew);
				request.setAttribute("msg","Thêm tin tức thành công");
				requestDispatcher.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	private void editNew(HttpServletRequest request,HttpServletResponse response) {
		try {
			NewDAO newDAO = new NewDAO();
			int id = Integer.parseInt(request.getParameter("id"));
			News editNew = newDAO.getNew(id);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("addeditnew.jsp");
			
			request.setAttribute("news", editNew);
			requestDispatcher.forward(request, response);
			
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	private void deleteNew(HttpServletRequest request,HttpServletResponse response) {
		try {
			NewDAO newDAO = new NewDAO();
			String newId = request.getParameter("id");
			if(newId == "" || newId == null) {
				request.getRequestDispatcher("/").forward(request, response);
			}
			else {
				newDAO.deleteNew(Integer.parseInt(newId));
				List<News> listNew = newDAO.getAllNew();
				request.setAttribute("msg", "Xóa tin tức thành công");
				request.setAttribute("listNew",listNew);
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("newsform.jsp");
				requestDispatcher.forward(request, response);
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	private void updatenew(HttpServletRequest request,HttpServletResponse response) {
		try {
			
			
			NewDAO newDAO = new NewDAO();
			int newsId = Integer.parseInt(request.getParameter("id"));
			String newTitle = request.getParameter("title");
			String newDescription = request.getParameter("description");
			String newContent = request.getParameter("content");
			String newAuthor = request.getParameter("author");
			
			System.out.println("===================" + newAuthor);
			
			java.util.Date myDate = new java.util.Date();
			java.sql.Date publisher = new java.sql.Date(myDate.getTime());
			
			//int released = Integer.parseInt(request.getParameter("released"));
			
			int released;
			String checkbox = request.getParameter("released");
			if(checkbox !=null) {
				released = 1;
			}
			else {
				released = 0;
			}
			
			News news = new News(newsId,newTitle,newDescription,newContent,publisher,newAuthor,released);
			newDAO.updateNew(news);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("newsform.jsp");
			List<News> listNew = newDAO.getAllNew();
			request.setAttribute("listNew",listNew);
			request.setAttribute("msg","Cập nhập tin tức thành công");
			requestDispatcher.forward(request, response);
			
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public void loadnew(HttpServletRequest request,HttpServletResponse response) {
		try {
			NewDAO newDAO = new NewDAO();
			List<News> listNew = newDAO.getAllNew();
			request.setAttribute("listNew", listNew);		
			RequestDispatcher dispatcher = request.getRequestDispatcher("newsform.jsp");
		    dispatcher.forward(request, response);
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
