<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="hrNavbar.jsp"%>
<style>
/* Table Styles */
.watermark {
	opacity: 0.5;
	color: BLACK;
	position: fixed;
	top: auto;
	left: 80%;
	font-size: 20px;
}

.table {
	width: 100%;
	border-collapse: collapse;
}

.table th, .table td {
	padding: 10px;
	text-align: center;
	border: 1px solid #ddd;
}

.table th {
	background-color: #f2f2f2;
}

.table tbody tr:nth-child(even) {
	background-color: #f9f9f9;
}

/* Additional Styles */
.table-container {
	margin: 20px auto;
	max-width: 600px;
}
</style>
</head>
<body>
	<br>
	<h4 class="text-center text-danger">Result Status Here</h4>

	<table class="table table-bordered" id="dataTable">
		<thead>
			<tr>
				<th>sl no.</th>
				<th>name</th>
				<th>percentage</th>
				<th>mark</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="al" items="${result}" varStatus="counter">
				<c:if test="${al.markAppear ne null}">
					<%-- <c:if test="${al.resultStatus eq 'PASS'}"> --%>
					<tr>
						<td>${counter.count}</td>
						<td>${al.candidateemail}</td>
						<td>${al.markAppear}</td>
						<td>${al.resultStatus}</td>

					</tr>
				</c:if>
				<%-- </c:if> --%>

			</c:forEach>

		</tbody>
	</table>

</body>
</html>