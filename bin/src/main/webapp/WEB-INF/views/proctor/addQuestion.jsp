<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="proctorNavbar.jsp"%>

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

	<div>
		<div class="container ">

			<form action="./questionAdd" method="post">

				<div class="container"
					style="margin-top: 25px; border: 1px solid black;">
					<p align="right">
						<span class="text-danger">*</span> indicates mandatory fields
					</p>
					<div class="form-group col-md-6 offset-md-3">
					<label class="font-weight-bold">Item Name<span
						class="text-danger">*</span>
					</label> <select class="form-control" name="itemName" id="itemId">
						<option value="select">--select--</option>
						<c:forEach items="${allListItem}" var="item">
							<option value="${item.itemId}">${item.itemName}</option>
						</c:forEach>
					</select>
					</div>
					
					<div class="form-group col-md-6 offset-md-3">
									<label>Exam Code</label>
					<select class="form-control" name="examCode" id="examCode">
						<option value="0">-select-</option>

						<c:forEach items="${codelist}" var="con">
							<option value="${con.examId}">${con.examCode}</option>
						</c:forEach>
					</select>
								</div>
								

					<div class="form-group col-md-6 offset-md-3">
						<label>Question Text :<span class="text-danger">*</span></label>
						<textarea name="questionText" id="questionText" rows="2"
							cols="15" class="form-control">${ustud.address.address}</textarea>
						<span id="applicantNameEr" class="text-danger font-weight-bold"></span>
					</div>

					<div class="form-group col-md-6 offset-md-3">
						<label>Question Type :<span class="text-danger">*</span></label> <select
							class="form-control" name="questionType" id="questionTypeId">
							<option value="0">-select-</option>
							<option value="Subjective">Subjective</option>
							<option value="Objective">Objective</option>
						</select> <span id="emailEr" class="text-danger font-weight-bold"></span>
					</div>
					<div class="form-group col-md-6 offset-md-3" align="center">
						<input type="submit" id="tabOneSubmit"
							onclick="return confirm('Are you want to Save your Details');"
							value="Submit" class="btn btn-success">&nbsp;&nbsp; <input
							type="reset" value="Reset" class="btn btn-danger">

					</div>
				</div>

			</form>
		</div>

	</div>
</body>

<script type="text/javascript">

</script>
</html>