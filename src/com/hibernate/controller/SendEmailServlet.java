package com.hibernate.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hibernate.been.UtilityMailMessage;

@WebServlet(urlPatterns = "/SendEmailServlet")
public class SendEmailServlet extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet PostController</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet PostController at " + request.getContextPath() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}
	}
	
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String to = request.getParameter("to");
		String cc = request.getParameter("cc");

		UtilityMailMessage mailMessage = new UtilityMailMessage(to, cc, subject, content);

		try {
			EmailUtility.getInstance().sendEmail(mailMessage);

			try (PrintWriter out = response.getWriter()) {
				// Send mail success 
				
				String success = "The e-mail was sent successfully";
				request.setAttribute("resultMessage", success);
				request.getRequestDispatcher("sendemail.jsp").forward(request, response);
			}
		} catch (MessagingException ex) {
			ex.printStackTrace();
			mailMessage.setError("There were an error: " + ex.getMessage());
		}
		finally {
            request.setAttribute("mailMessage", mailMessage);
            getServletContext().getRequestDispatcher("/sendemail.jsp").forward(
                    request, response);
        }
	}

	@Override
	public String getServletInfo() {
		return "ServletInfo";
	}

}
