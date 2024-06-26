<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page Here..</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
<link
	rel="https://cdnjs.datatables/1.12.1/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
body {
	background: url(/img/loginbg.jpg) !important;
	background-size: cover !important;
	padding-top: 20vh !important;
	background-position: bottom;
}

.marginbox {
	margin-top: 30px;
}

.loginbox {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.inputtext {
	width: 100%;
	padding: 12px 30px;
	margin: 12px 0;
	box-sizing: border-box;
	border: none;
	border-bottom: 1px solid grey;
}

.roundcircle {
	width: 100%;
	border-radius: 50px;
	padding: 10px;
	margin-bottom: 50px;
}
</style>
</head>
<body>
<div id="alertId">
		<c:if test="${alert eq 'failed'}">
			<script type="text/javascript">
				swal({
					title : "Login failed !",
					text : "Invalid credentials !",
					icon : "error",
					button : "try again!",
				});
			</script>
		</c:if>
	</div>
	
	
	<div>


		<div class="col-md-8 offset-md-2 loginbox">

			<c:if test="${msg ne null}">
				<div class="alert alert-danger">${msg}</div>
			</c:if>
			</br> </br>


			<h3>Welcome to</h3>
			<h2>CSM Talent Hunt</h2>

			<form method="post" action="./loginHere">
				<div class="col-md-5">
					<h5>LOGIN</h5>
					<input type="text" name="username" id="username" class="inputtext"></input>
				</div>
				<div class="col-md-5">
					<h5>PASSWORD</h5>
					<input type="text" name="password" id="password" class="inputtext"></input>
				</div>
				<div class="col-md-5">
					<input type="submit" class="btn btn-success roundcircle"
						value="Log in">
				</div>
			</form>



		</div>

	</div>
	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded",() => {
		setTimeout(function(){
			document.getElementById('alertId').style.display='none';
		},3000);
	});
</script>
</body>
</html>