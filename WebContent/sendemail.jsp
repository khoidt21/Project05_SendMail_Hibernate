<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Contact Section -->
<section class="page-section" id="contact">
	<div class="container">
		<!-- Contact Section Form -->
		<div class="row">
			<div class="col-lg-12 mx-auto" style="margin-top: 20px">
					
					<form name="form1" id="form1" action="SendEmailServlet" method="POST">
			
						<div class="control-group">
						<h5 style="color: red; font-weight: bold;">Gửi Email </h5>
						</div>	
					<div class="control-group">
						<label>To</label> <span style="color:red">(*)</span>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<input class="form-control" id="to" type="text"
								name="to" value="${mailMessage.getTo()}"
							>	
						</div>
					</div>		
					<div class="control-group">
						<label>CC</label> <span style="color:red"></span>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							 <input class="form-control" type="text" id="cc" name="cc" value="${mailMessage.getCc()}" />
						
						</div>
					</div>
					<div class="control-group">
						<label>Title</label> <span style="color:red">(*)</span>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							 <input class="form-control" type="text" id="subject" name="subject" value="${mailMessage.getSubject()}" />
						</div>
					</div>
					<div class="control-group">
						<label>Content</label> <span style="color:red">(*)</span>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<textarea id="content" name="content"><c:out value='${mailMessage.getContent()}'/></textarea>
						</div>
					</div>		
					<div class="control-group">
						<div class="form-group controls mb-0 pb-2"></div>
					</div>
					<div id="success"></div>
					<div class="form-group">
						<p class="text-danger" style="color: red">${mailMessage.getError()}</p>
                        <p class="text-danger" style="color: red">${resultMessage}</p>
						<button type="submit" class="btn btn-primary btn-sm"
							id="sendMessageButton"
						>Send Mail</button>
						
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
.mce-notification {
	display: none !important;
}
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
											var to = $("#to").val();
											var subject = $('#subject').val();
											var content = $('#content').val();	
											var valid = true;
											$(".error").remove();
											if (to.length < 1) {
												$('#to')
														.after(
																'<span class="error" style="color:red">This field is required</span>');
												valid = false;
											} else {
												var regEx = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i;
												var validEmail = regEx
														.test(to);
												if (!validEmail) {
													$('#to')
															.after(
																	'<span class="error" style="color:red">Enter a valid email</span>');
													valid = false;
												}
											}
											if (subject.length < 1) {
												$('#subject')
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
											return valid;
										});
					});
</script>
</html>
