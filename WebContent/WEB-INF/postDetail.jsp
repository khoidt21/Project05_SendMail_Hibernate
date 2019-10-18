<%@page import="com.hibernate.dao.NewDAO"%>
<%@page import="com.hibernate.controller.NewControllerServlet"%>
<%@page import="com.hibernate.been.News"%>
<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Contact Section -->
<section class="page-section" id="contact">
	<div class="container">
		<!-- Contact Section Form -->
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto" style="margin-top: 20px">
				<div class="post-preview">
					<%
						String username = (String) session.getAttribute("username");
						if (session.getAttribute("isNew") != null) {
							if ((boolean) session.getAttribute("isNew")) {
								session.setAttribute("isNew", false);
					%>
					<h3>
						Welcome to the Board,
						<%=username%></h3>
					<%
						} else {
					%>
					<h3>
						Welcome back-reader,
						<%=username%></h3>
					<%
						}
						}
					%>
				</div>
				<div class="post-preview">
					<h2 class="post-title">
						<c:out value="${news.title}" />
					</h2>
					<h3 class="post-subtitle">
						<c:out value="${news.description}" />
					</h3>
					<div class="post-content">
						<c:out value="${news.content}" escapeXml="false" />
					</div>
					<p>
						Ngày:
						<fmt:formatDate value="${news.publisher}" var="formattedDate"
							type="date" pattern="dd-MM-yyyy"
						/>
						<c:out value="${formattedDate}" />
					</p>
					<p class="post-meta">
						Tác giả:
						<c:out value="${news.author}" />
					</p>
					<p class="post-status-new">
						Tình trạng:
						<c:if test="${news.released==1}">
							<c:out value="Đã xuất bản" />
						</c:if>
						<c:if test="${news.released==0}">
							<c:out value="Nháp" />
						</c:if>
					</p>
				</div>
				<hr>
			</div>
		</div>
	</div>
</section>
<%@ include file="footer.jsp"%>
</body>
<style>
.post-content {
	font-style: italic;
	font-size: 15px !important;
	font-family: Nunito;
	letter-spacing: .0625em;
}

h2.post-title {
	color: #000 !important;
}

h3.post-subtitle {
	color: #212529 !important;
	font-weight: normal !important;
}

.post-preview>.post-meta>a {
	color: #212529 !important;
}

.floating-label-form-group label {
	opacity: 1 !important;
}

.bg-secondary {
	background-color: rgba(132,13,121,.88) !important;
}

.copyright {
	background-color: #000 !important;
}

.footer {
	background-color: rgba(132,13,121,.88) !important;
}
</style>
</html>
</html>