<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.hibernate.been.News"%>
<%@page import="java.util.List"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Contact Section -->
<section class="page-section" id="contact">
	<div class="container">
		<!-- Contact Section Form -->
		<!------list user------->
		<div class="row">
			<div class="col-lg-12 mx-auto" style="margin-top: 20px">
				<a href="addeditnew.jsp">Thêm mới tin tức</a>
				<p>
					<%
						if (request.getAttribute("msg") != null) {
							out.println(request.getAttribute("msg"));
						}
					%>
				</p>
				<h3>Danh sách tin tức</h3>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>ID</th>
								<th>Tiêu đề</th>
								<th>Tác giả</th>
								<th>Xuất bản & Nháp</th>
								<th>Ngày</th>
								<th style="text-align:center">Xem</th>
								<th style="text-align:center">Sửa</th>
								<th style="text-align:center">Xóa</th>
							</tr>
						</thead>
						<c:forEach items="${listNew}" var="news">
							<tr>
								<td><c:out value="${news.id}" /></td>
								<td><c:out value="${news.title}" /></td>
								<td><c:out value="${news.author}" /></td>
								<td>
									<c:if test="${news.released==1}">
										  <c:out value="Đã xuất bản"/>
									</c:if>
									<c:if test="${news.released==0}">
										  <c:out value="Nháp"/>	
									</c:if>
								</td>
								<td><fmt:formatDate value="${news.publisher}"
										var="formattedDate" type="date" pattern="dd-MM-yyyy"
									/> <c:out value="${formattedDate}" /></td>
								<td style="text-align:center">
									<form action="<c:url value="viewnew"/>" method="post">
										<input type="hidden" name="id" value="${news.id}"> <input
											type="submit" class="btn btn-primary" value="Xem"
										>
									</form>
								</td>		
								<td style="text-align:center">
									<form action="<c:url value="editnew"/>" method="post">
										<input type="hidden" name="id" value="${news.id}"> <input
											type="submit" class="btn btn-primary" value="Sửa"
										>
									</form>
								</td>
								<td style="text-align:center">
									<form action="<c:url value="deletenew"/>" method="post">
										<input type="hidden" name="id" value="${news.id}"> <input
											class="btn btn-danger" id="btnDelete" type="submit"
											value="Xóa" onclick="return confirm('Bạn có muốn xóa tin tức ?')"
										>
									</form>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
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
