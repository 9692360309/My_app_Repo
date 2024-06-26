<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="navbar.jsp"%>
<style>
/* Table Styles */

body {
            background-color: #f0f4f8;
            color: #333;
        }
        
        header {
            background-color: #3498db;
            color: white;
            text-align: center;
            padding: 15px;
            margin-bottom: 20px;
        }
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .table-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

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
<body style="background-color: #f0f0f0;">
	<br>
	<h1 class="text-center text-danger">Result Status Here</h1>
	<div class="watermark">CSM RESULT STATUS</div>
	<div class="h3"></div>
	<%-- ${regdList } --%>
	<form class="form-group" method="post" action="./searchTest">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-3 control-label">
				<label class="text-primary font-weight-bold">Select College Name<sup
					class="text-danger">*</sup>
				</label> <select class="form-control" name="testTakerName"
					id="testTakerNameId" onchange="getSub()">
					<option value="0">--select--</option>
					<c:forEach items="${testTakerList}" var="pv">
						<option value="${pv.testTakerId }">${pv.testTakerName}</option>
					</c:forEach>
				</select>

			</div>
			<div class="col-md-3 control-label">
				<label class="text-primary font-weight-bold">Select Test Taker<sup class="text-danger">*</sup>
				</label> <select class="form-control" name="subTestTakerName"
					id="subTestTakerNameId">
					<option value='0'>--select--</option>
				</select>

			</div>
			<div class="col-md-1 control-label">
				<div class="text-center " style="margin-top: 30px">
					<input type="submit" value="search" class="btn btn-success">
				</div>
			</div>
		</div>
	</form>


	<div class="table-container">
		<table class="table table-bordered" id="dataTable">
			<thead>
				<tr>
					<th>SL#</th>
					<th>CANDIDATE ID</th>
					<th>subTestTaker</th>
					<th>Mark Appear</th>
					<th>Total Mark</th>
					<!-- <th>RESULT STATUS</th> -->


				</tr>
			</thead>
			<tbody>
				<c:forEach var="al" items="${resultList}" varStatus="count">
					<c:if test="${al.markAppear ne null}">
						<tr>
							<td>${count.count}</td>
							<td>${al.candidateemail}</td>
							<td>${al.subTestTaker.subTestTakerName}</td>
							<td>${al.markAppear}</td>
							<td>${al.totalMark}</td>
							<%-- <td>${al.resultStatus}</td> --%>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		
		<a href="./export/Result" >Export To Excel</a>
	</div>
	<div class="watermark">CSM RESULT STATUS</div>
</body>
<script type="text/javascript">
	function getSub() {
		var tId = $('#testTakerNameId').val();
		$.ajax({
			url : "./getSubById",
			type : "GET",
			data : {
				testTakerId : tId
			},
			success : function(result) {
				$("#subTestTakerNameId").html(result);
			}
		});
	}
</script>
</html>