<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="hrNavbar.jsp"%>
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
<style>
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: #23395d;
	color: black;
	text-align: center;
}
</style>
<body>
	<div class="container ">


		<c:if test="${msg ne null}">
			<div class="alert alert-danger">${msg}</div>
		</c:if>
		<form action="./updateHr" method="post">
			<input type="hidden" name="userId" id="userId"
				value="${sessionData.userId}">

			<div class="container"
				style="margin-top: 25px; border: 1px solid black;">
				<p align="right">
					<span class="text-danger">*</span> indicates mandatory fields
				</p>

				<div class="form-group col-md-6 offset-md-3">
					<label>HR Name :<span class="text-danger">*</span></label> <input
						type="text" name="name" id="nameId" class="form-control"
						value="${sessionData.name}"> <span id="applicantNameEr"
						class="text-danger font-weight-bold"></span>
				</div>
				<div class="form-group col-md-6 offset-md-3">
					<label>Gender <span style="color: red">*</span> :
					</label> <br> <input type="radio" name="gender" id="gentype"
						value="Female">Female <input type="radio" name="gender"
						id="gentype" value="Male" checked="checked">Male <span
						id="gender" class="text-danger font-weight-bold"></span>
				</div>

				<div class="form-group col-md-6 offset-md-3">
					<label>User Name :<span class="text-danger">*</span></label> <input
						type="text" name="username" id="usernameId" class="form-control"
						value="${sessionData.username}"> <span
						id="applicantNameEr" class="text-danger font-weight-bold"></span>
				</div>

				<div class="form-group col-md-6 offset-md-3">
					<label>Email :<span class="text-danger">*</span></label> <input
						type="text" name="email" id="emailId" class="form-control"
						value="${sessionData.email}"> <span id="emailEr"
						class="text-danger font-weight-bold"></span>
				</div>

				<div class="form-group col-md-6 offset-md-3">
					<label>Mobile No:<span class="text-danger">*</span></label> <input
						type="number" name="mobileNo" id="mobileNoId" class="form-control"
						value="${sessionData.mobileNo}" onclick="validate()"> <span
						id="mobileNoEr" class="text-danger font-weight-bold"></span>
				</div>
				<div class="form-group col-md-6 offset-md-3">
					<label>Address :<span class="text-danger">*</span></label> <br>
					<textarea name="userAddress" id="userAddressId"
						class="form-control">${sessionData.userAddress}</textarea>
				</div>
				<div class="form-group col-md-6 offset-md-3" align="center">
					<input type="submit" id="tabOneSubmit"
						onclick="return confirm('Are you want to Save your Details');"
						value="Submit" class="btn btn-success">&nbsp;&nbsp; <input
						type="reset" value="Reset" class="btn btn-danger">

				</div>
			</div>

		</form>

		<%--  ${sessionData}  --%>
	</div>
	<div id="rights" class="tab-pane fade">rights</div>
	<div class="footer">
		<p>All Right Reserved @ Online Examination System</p>
	</div>

</body>
</html>