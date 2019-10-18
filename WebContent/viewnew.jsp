<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.hibernate.been.User"%>
<%@page import="java.util.List"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Contact Section -->
<section class="page-section" id="contact">
	<div class="container">
		<!-- Contact Section Form -->
		<div class="row">
			<div class="col-lg-8 mx-auto" style="margin-top: 20px">
				<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
				<div class="control-group">
					<label>Tiêu đề</label>
				</div>
				<div class="control-group">
					<div
						class="form-group floating-label-form-group controls mb-0 pb-2"
					>
						<c:if test="${news.title !=null}">
							<c:out value='${news.title}' />
						</c:if>
					</div>
				</div>
				<div class="control-group">
					<label>Mô tả</label>
				</div>
				<div class="control-group">
					<div
						class="form-group floating-label-form-group controls mb-0 pb-2"
					>
						<c:if test="${news.description !=null}">
							<c:out value='${news.description}' />
						</c:if>
					</div>
				</div>
				<div class="control-group">
					<label>Nội dung</label>
				</div>
				<div class="control-group">
					<div
						class="form-group floating-label-form-group controls mb-0 pb-2"
					>
						<c:if test="${news.content !=null}">
							<c:out value="${news.content}" escapeXml="false" />
						</c:if>
					</div>
				</div>
				<div class="control-group">
					<label>Tác giả</label>
				</div>
				<div class="control-group">
					<div
						class="form-group floating-label-form-group controls mb-0 pb-2"
					>
						<c:if test="${news.author !=null}">
							<c:out value='${news.author}' />
						</c:if>
					</div>
				</div>
				<div class="control-group">
					<label>Ngày</label>
				</div>
				<div class="control-group">
					<div
						class="form-group floating-label-form-group controls mb-0 pb-2"
					>
						<fmt:formatDate value="${news.publisher}" var="formattedDate"
							type="date" pattern="MM-dd-yyyy"
						/>
						<c:out value="${formattedDate}" />
					</div>
				</div>
				<div class="control-group">
					<label>Đã xuất bản & Nháp</label>
				</div>
				<div class="control-group">
					<div
						class="form-group floating-label-form-group controls mb-0 pb-2"
					>
						<c:if test="${news.released==1}">
							<c:out value="Đã xuất bản" />
						</c:if>
						<c:if test="${news.released==0}">
							<c:out value="Nháp" />
						</c:if>
					</div>
				</div>
				<div class="form-group controls mb-0 pb-2">
					<div class="control-group">
						<div class="form-group controls mb-0 pb-2"></div>
					</div>
					<div id="success"></div>
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

.mce-notification {
	display: none !important;
}
</style>
</html>
