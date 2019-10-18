<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.hibernate.been.User"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@page import="com.hibernate.been.TemporaryMessageMail"%>
<%@page import="javax.mail.Message"%>
<%@page import="com.hibernate.controller.EmailUtility"%>
<%@page import="java.util.List"%>
<!-- Contact Section -->
<section class="page-section" id="contact">
	<div class="container">
		<!-- Contact Section Form -->
		<div class="row">
			<div class="col-lg-8 mx-auto" style="margin-top: 20px">
				<h3 class="text-center" style="margin-bottom: 50px">List Mail Of Your Mail Box</h3>
				<%
					int indexPage = 1;
					try {
						indexPage = Integer.valueOf(request.getParameter("page"));
					} catch (Exception ex) {
						indexPage = 1;
					}
					if (indexPage < 1) {
						indexPage = 1;
					}

					EmailUtility.getInstance().downloadEmails(indexPage, "page");
					TemporaryMessageMail[] messages = EmailUtility.getTempMessage();
					if (messages != null && messages.length > 0) {

						for (int i = 0; i < messages.length; i++) {
							TemporaryMessageMail messageMail = messages[i];
				%>
				<div class="post col-md-6">
					<div class="post-title">
						
						<%=messageMail.getMailsubject()%>
					</div>
					<ul>
						<li><i class="fa fa-clock-o"></i> <%=messageMail.getDate().toString()%></li>
						<li><%=messageMail.getMailfrom()%></li>
						<li><%=messageMail.getMailto()%></li>
					</ul>
					<hr>
				</div>
				<%
					}
				%>
				<div class="text-center">
				<form method="GET" action="listmail.jsp">
					<a class="btn btn-primary" style="background-color: none !important"
						href="./listmail.jsp?page=<%=indexPage - 1%>"
					><i class="fa fa-arrow-circle-left"></i></i> </a> <input id="nextpage"
						name="page" style="text-align: center; width: 100px;"
						type="number" min="1" max="<%=EmailUtility.getNumPages()%>"
						value="<%=indexPage%>"
					/> /
					<%=EmailUtility.getNumPages()%>
					pages
					<button type="submit" class="btn btn-warning">Go Page</button>
					<a class="btn btn-primary"
						href="./listmail.jsp?page=<%=indexPage + 1%>"
					>Next Page</a>
				</form>
			</div>
			<%
				} else {
			%>
			<h3 class="text-center">No Email In Your Mail Box</h3>
			<%
				}
			%>
			</div>
			
		</div>
	</div>
</section>
<%@ include file="footer.jsp"%>
</body>
<style>
.floating-label-form-group label {
	opacity: 1 !important;
}

.bg-secondary {
	background-color: rgba(132, 13, 121, .88) !important;
}
.btn-warning{
	background-color: rgba(132, 13, 121, .88) !important;
	border-color :rgba(132, 13, 121, .88) !important;
	color:#fff !important;
}

.copyright {
	background-color: #000 !important;
}

.footer {
	background-color: rgba(132, 13, 121, .88) !important;
}

.mce-notification {
	display: none !important;
}
.btn {
    padding: 0 !important;
}
.btn-primary{
	background-color: rgba(132, 13, 121, .88) !important;
	border-color :rgba(132, 13, 121, .88) !important;
}
</style>
<script>
	function nextPageEmail() {
		window.location.href = './listemail.jsp?page=' + $("#nextpage").val();
	}
</script>
</html>
