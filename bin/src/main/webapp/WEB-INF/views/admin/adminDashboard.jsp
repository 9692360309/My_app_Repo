<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page here</title>
<%@ include file="navbar.jsp" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.footer{
position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color:#23395d;
   color:black;
   text-align: center;

}
</style>

</head>
<body>
<div id="alertId">
		<c:if test="${alert eq 'success'}">
			<script type="text/javascript">
				swal({
					title : "Admin Login Successful!",
					text : "Click Ok to Continue !",
					icon : "success",
					button : "OK",
				});
			</script>
		</c:if>
	</div>

<h1>Welcome admin here.......</h1>
<div class="container">

</div>
<div class="footer">
    <p>All Right Reserved @ Online Examination System</p>
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