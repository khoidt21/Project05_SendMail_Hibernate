package com.hibernate.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hibernate.been.News;
import com.hibernate.dao.NewDAO;

/**
 * Servlet implementation class ViewNewControllerServlet
 */
@WebServlet("/ViewNewControllerServlet")
public class ViewNewControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewNewControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		getViewById(request, response);
	}
	public void getViewById(HttpServletRequest request,HttpServletResponse response) {
		try {
			NewDAO newDAO = new NewDAO();
			int id = Integer.parseInt(request.getParameter("id"));
			News editNew = newDAO.getNew(id);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("viewnew.jsp");
			
			request.setAttribute("news", editNew);
			requestDispatcher.forward(request, response);
			
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
