<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
<link
	rel="https://cdnjs.datatables/1.12.1/css/dataTables.bootstrap4.min.css">
<!-- Option 1: Include in HTML -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>


<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
</head>
<style>
navbar {
	top: 0;
	margin-bottom: 0px;
	overflow: hidden;
	width: 100%;
	position: fixed;
}

.imgposition {
	background-color: white;
	display: flex;
}

.navbar-nav {
	margin-left: auto;
	overflow: hidden;
	width: 100%;
	top: 0;
	position: fixed;
}
</style>
<body>

	<div class="row">
		<div class="imgposition col-md-2"
			style="margin-left: 0px; padding: 15px">
			<img alt="" src="../img/logocsm.png">
		</div>
		<nav class="navbar col-md-10" style="background-color: #23395d">
			<div>
				<a class="navbar-bar p-3" href="./createFolder"><i
					class="fa fa-list-ul fa-2px text-white text-center"
					aria-hidden="true"></br>Category</i></a> <a class="navbar-bar p-3"
					href="./test"><i
					class="fa fa-clipboard fa-2px text-white text-center"
					aria-hidden="true"></br>Set Of Question</i></a> <a class="navbar-bar p-3"
					href="./addCollege"> <i
					class="fa fa-building-o fa-2px text-white text-center"
					aria-hidden="true"></br>Add College</i></a> <a class="navbar-bar p-3"
					href="./testTakers"><i
					class="fa fa-user-plus fa-2px text-white text-center"
					aria-hidden="true"></br>Add Candidate</i> </a>
				<a class="navbar-bar p-3" href="./result"><i
					class="fa fa-trophy fa-2px text-white text-center"
					aria-hidden="true"></br>Results </i></a>

				<!-- <a class="navbar-bar p-3" href=""><i
					class="fa fa-cogs fa-2x text-white" aria-hidden="true"></i></a> -->


			</div>
			<div>
				<a class="navbar-brand " href="./manageUsers"><i
					class="bi bi-people-fill fa-1x text-white"></i></a> <a
					class="navbar-bar p-3" href=""><i
					class="fa fa-question fa-2x text-white" aria-hidden="true"></i> </a> <a
					class="navbar-bar p-3 text-white text-center" href=""><i
					class="fa fa-user fa-2x text-white" aria-hidden="true"></i> </a> <span
					class="text-white">${sessionData.username}</span> <a
					class="navbar-bar p-3" href="./logout"><i
					class="fa fa-sign-out fa-2x text-white" aria-hidden="true"></i> </a>
				<c:if test="${sessionData == null}">
					<c:redirect url="${pageContext.request.contextPath}/exam/login" />
				</c:if>
			</div>


		</nav>

	</div>



</body>
</html>