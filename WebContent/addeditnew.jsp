<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.hibernate.been.User"%>
<%@page import="java.util.List"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Contact Section -->
<section class="page-section" id="contact">
	<div class="container">
		<!-- Contact Section Form -->
		<div class="row">
			<div class="col-lg-8 mx-auto" style="margin-top: 20px">
				<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
				
				<c:if test="${news !=null}">
					<form name="form1" id="form1" action="updatenew" method="POST">
				</c:if>
				<c:if test="${news == null}">
					<form name="form1" id="form1" action="addnew" method="POST">
				</c:if>
					<c:if test="${news !=null}">
						<div class="control-group">
						<h5 style="color: red; font-weight: bold">Cập nhập tin tức</h5>
						</div>
					</c:if>
					<c:if test="${news ==null}">
						<div class="control-group">
						<h5 style="color: red; font-weight: bold;">Thêm tin tức</h5>
					</div>	
					</c:if>
					 <c:if test="${news != null}">
           			<input type="hidden" name="id" value="<c:out value='${news.id}' />" />
         			 </c:if>            
					
					<div class="control-group">
						<label>Tiêu đề</label> <span style="color:red">(*)</span>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<input class="form-control" id="title" type="text"
								name="title" value="<c:out value='${news.title}'/>"
							>
						</div>
					</div>		
					<div class="control-group">
						<label>Mô tả</label> <span style="color:red">(*)</span>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							 <input class="form-control" type="text" id="description" name="description" value="<c:out value='${news.description}' />" />
						</div>
					</div>
					<div class="control-group">
						<label>Nội dung</label> <span style="color:red">(*)</span>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<textarea id="content" name="content"><c:out value='${news.content}'/></textarea>
						</div>
					</div>
					<div class="control-group">
						<label>Tác giả</label> <span style="color:red">(*)</span>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<input class="form-control" type="text" id="author" name="author" value="<c:out value='${news.author}' />" />
						</div>
					</div>
					<div class="form-group controls mb-0 pb-2"
						>
						<input type="checkbox" name="released" id="released" <c:if test="${news.released==1}">checked=checked</c:if>> Đã xuất bản
						
						</div>
						
					<div class="control-group">
						<div class="form-group controls mb-0 pb-2"></div>
					</div>
					<div id="success"></div>
					<div class="form-group">
						<c:if test="${news == null}">
						<button type="submit" class="btn btn-primary btn-sm"
							id="sendMessageButton"
						>Submit</button>
						</c:if>
						<c:if test="${news !=null}">
							<button type="submit" class="btn btn-primary btn-sm"
							id="sendMessageButton"
						>Update</button>
						</c:if>
						<button type="button" class="btn btn-danger btn-sm" name="back" onclick="history.back()">Cancel</button>
					</div>
				</form>
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
.mce-notification {display: none !important;}
</style>
<script type="text/javascript">
tinymce.init({
	  selector: 'textarea#content',
	  height: 200,
	  menubar: true,
	  plugins: [
	    'advlist autolink lists link image charmap print preview anchor',
	    'searchreplace visualblocks code fullscreen',
	    'insertdatetime media table paste code help wordcount'
	  ],
	  toolbar: 'undo redo | formatselect | bold italic backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help',
	  content_css: [
	    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
	    '//www.tiny.cloud/css/codepen.min.css'
	  ]
	});
</script>
<script>
	$(document)
			.ready(
					function() {
						$('#form1')
								.submit(
										function(e) {
											var username = $('#title').val();
											var description = $('#description').val();
											var content = $('#content').val();
											var author = $('#author').val();
											
											var valid = true;
											$(".error").remove();
											if (username.length < 1) {
												$('#title')
														.after(
																'<span class="error" style="color:red">This field is required</span>');
												valid = false;
											} 
											if (description.length < 1) {
												$('#description')
														.after(
																'<span class="error" style="color:red">This field is required</span>');
												valid = false;
											}
											if (content.length < 1) {
												$('#content')
														.after(
																'<span class="error" style="color:red">This field is required</span>');
												valid = false;
											} 
											if (author.length < 1) {
												$('#author')
														.after(
																'<span class="error" style="color:red">This field is required</span>');
												valid = false;
											} 
											
											return valid;
										});
					});
</script>
</html>
