<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.hibernate.been.User"%>
<%@page import="java.util.List"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!-- Contact Section -->
<section class="page-section" id="contact">
	<div class="container">
		<!-- Contact Section Form -->
		<div class="row">
			<div class="col-lg-8 mx-auto" style="margin-top: 20px">
				<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
				<c:if test="${user !=null}">
					<form name="form1" id="form1" action="update" method="POST">
				</c:if>
				<c:if test="${user == null}">
					<form name="form1" id="form1" action="add" method="POST">
				</c:if>
				<c:if test="${user !=null}">
					<div class="control-group">
						<h5 style="color: red; font-weight: bold">Cập nhập Admin</h5>
					</div>
				</c:if>
				<c:if test="${user ==null}">
					<div class="control-group">
						<h5 style="color: red; font-weight: bold;">Đăng ký Admin</h5>
					</div>
				</c:if>
				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>
				<c:if test="${user ==null}">
					<div class="control-group">
						<label>Tên</label> <span style="color: red">(*)</span>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<input class="form-control" id="username" type="text"
								name="userName" value="<c:out value='${user.userName}'/>"
							>
						</div>
					</div>
				</c:if>
				<c:if test="${user != null}">
					<input type="hidden" name="userName" id="userName"
						value="<c:out value='${user.userName}' />"
					/>
				</c:if>
				<c:if test="${user.password1 ==null}">
					<div class="control-group">
						<label>Mật khẩu</label> <span style="color: red">(*)</span>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<input class="form-control" id="password1" type="password"
								name="password1" value="<c:out value='${user.password1}'/>"
							>
						</div>
					</div>
					<div class="control-group">
						<label>Nhập lại mật khẩu</label> <span style="color: red">(*)</span>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<input class="form-control" id="password2" type="password"
								name="password2"
							>
						</div>
					</div>
				</c:if>
				<c:if test="${user != null}">
					<input type="hidden" name="password1" id="password1"
						value="<c:out value='${user.password1}' />"
					/>
				</c:if>
				<div class="control-group">
					<label>Email <span style="color: red">(*)</span></label>
				</div>
				<div class="control-group">
					<div
						class="form-group floating-label-form-group controls mb-0 pb-2"
					>
						<input class="form-control" type="text" id="email" name="email"
							value="<c:out value='${user.email}' />"
						/>
					</div>
				</div>
				<div class="control-group">
					<label>Điện thoại <span style="color: red">(*)</span></label>
				</div>
				<div class="control-group">
					<div
						class="form-group floating-label-form-group controls mb-0 pb-2"
					>
						<input class="form-control" type="text" id="phone" name="phone"
							value="<c:out value='${user.phone}' />"
						/>
					</div>
				</div>
				<div class="control-group">
					<label>Thành phố <span style="color: red">(*)</span></label>
				</div>
				<div class="control-group">
					<div
						class="form-group floating-label-form-group controls mb-0 pb-2"
					>
						<input class="form-control" type="text" id="city" name="city"
							value="<c:out value='${user.city}' />"
						/>
					</div>
				</div>
				<div class="control-group">
					<div class="form-group controls mb-0 pb-2"></div>
				</div>
				<div id="success"></div>
				<div class="form-group">
					<c:if test="${user == null}">
						<button type="submit" class="btn btn-primary btn-sm"
							id="sendMessageButton"
						>Submit</button>
					</c:if>
					<c:if test="${user !=null}">
						<button type="submit" class="btn btn-primary btn-sm"
							id="sendMessageButton"
						>Update</button>
					</c:if>
				</div>
				</form>
			</div>
		</div>
		<!------list user------->
		<c:if test="${user == null}">
			<div class="row">
				<div class="col-lg-8 mx-auto" style="margin-top: 20px">
					<h5>Danh sách Administrator</h5>
					<%
						if (request.getAttribute("msg") != null) {
								out.println(request.getAttribute("msg"));
							}
					%>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>ID</th>
									<th>Tên</th>
									<th>Email</th>
									<th>Điện thoại</th>
									<th>Thành phố</th>
									<th style="text-align: center">Sửa</th>
									<th style="text-align: center">Xóa</th>
								</tr>
							</thead>
							<c:forEach items="${listUser}" var="user">
								<tr>
									<td><c:out value="${user.id}" /></td>
									<td><c:out value="${user.userName}" /></td>
									<td><c:out value="${user.email}" /></td>
									<td><c:out value="${user.phone}" /></td>
									<td><c:out value="${user.city}" /></td>
									<td style="text-align: center;">
										<form action="<c:url value="edit"/>" method="post">
											<input type="hidden" name="id" value="${user.id}"> <input
												type="submit" class="btn btn-primary" value="Sửa"
											>
										</form>
									</td>
									<td style="text-align: center;">
										<%
											if (session.getAttribute("username") == null) {
														response.sendRedirect("login.jsp");
													}
													String userLogin = (String) session.getAttribute("username");
										%>
										<form action="<c:url value="delete"/>" method="post">
											<input type="hidden" name="id" value="${user.id}"> 
											<input
												type="hidden" name="userLogin" value="<%=userLogin%>"
											> <input class="btn btn-danger" id="btnDelete"
												type="submit" value="Xóa"
												onclick="return confirm('Bạn có muốn xóa admin ?')"
											>
										</form>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</c:if>
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
<script>
	$(document)
			.ready(
					function() {
						$('#form1')
								.submit(
										function(e) {
											var username = $('#username').val();
											var password1 = $('#password1')
													.val();
											var password2 = $('#password2')
													.val();
											var email = $('#email').val();
											var phone = $('#phone').val();
											var city = $('#city').val();

											var valid = true;
											$(".error").remove();
											if (username.length < 1) {
												$('#username')
														.after(
																'<span class="error" style="color:red">This field is required</span>');
												valid = false;
											} else {
												var regEx = /^[A-Za-z\s]+$/;
												var validName = regEx
														.test(username);
												if (!validName) {
													$('#username')
															.after(
																	'<span class="error" style="color:red">The name must be a characters and name Vietnamese without accents</span>');
													valid = false;
												}
											}
											if (password1.length < 1) {
												$('#password1')
														.after(
																'<span class="error" style="color:red">This field is required</span>');
												valid = false;
											}
											if (password2.length < 1) {
												$('#password2')
														.after(
																'<span class="error" style="color:red">This field is required</span>');
												valid = false;
											}
											if (password2 != password1) {
												$('#password2')
														.after(
																'<span class="error" style="color:red">password 2 must be the same as password 1</span>');
												valid = false;
											}
											if (email.length < 1) {
												$('#email')
														.after(
																'<span class="error" style="color:red">This field is required</span>');
												valid = false;
											} else {
												var regEx = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i;
												var validEmail = regEx
														.test(email);
												if (!validEmail) {
													$('#email')
															.after(
																	'<span class="error" style="color:red">Enter a valid email</span>');
													valid = false;
												}
											}
											if (phone.length < 1) {
												$('#phone')
														.after(
																'<span class="error" style="color:red">This field is required</span>');
												valid = false;
											} else {
												var regEx = /^\d{10}$/;
												var validPhone = regEx
														.test(phone);
												if (!validPhone) {
													$('#phone')
															.after(
																	'<span class="error" style="color:red">Enter a valid phone.Min length of digits should be 10</span>');
													valid = false;
												}
											}
											if (city.length < 1) {
												$('#city')
														.after(
																'<span class="error" style="color:red">This field is required</span>');
												valid = false;
											}
											return valid;
										});
					});
</script>
</html>
