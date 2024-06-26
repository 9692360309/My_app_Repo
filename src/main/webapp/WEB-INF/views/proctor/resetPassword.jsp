<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="proctorNavbar.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
<link
	rel="https://cdnjs.datatables/1.12.1/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
</head>
<body>

	<div class="container">
		<div id="login-row"
			class="row justify-content-center align-items-center">
			<div id="login-column" class="col-md-6"
				style="margin-top: 25px; border: 1px solid black;">

				<c:if test="${msg ne null}">
					<div class="alert alert-danger">${msg}</div>
				</c:if>
				<div id="login-box" style="height: 240px;" class="col-md-12">

					<h3 class="text-center mt-4">Enter new password</h3>
					</br>


					<form action="./changepassword" method="post">

						<input type="hidden" name="userid" id="userid"
							class="form-control" value="${userid}">

						<div class="form-group">
							<input name="newpassword" id="newpassword" required="required"
								type="password" placeholder="Enter New Password Here"
								class="form-control">
						</div>
						<div class="form-group">
							<input name="cpassword" id="cpassword" required="required"
								type="password" placeholder="Confirm Password Here"
								class="form-control">
						</div>
						<div class="container text-center">
							<input type="submit"
								onclick="return confirm('Are you want to Change Password');"
								value="Change Password" class="btn btn-success">&nbsp;&nbsp;

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>