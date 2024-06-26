<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
</head>
<%@ include file="navbar.jsp"%>
<body>
	<div class="container" style="margin-top: 25px; border: 1px solid black;">
		<h3 class="text-center">Questions Search</h3>
		<div class="col-md-8 offset-md-2">
			<div>
				<form action="./search" method="post">
					<label for="examCode" class="font-weight-bold">
					</label>

					<div class="form-group">
						<label>Exam Code</label>
						<div class="input-group">
					<select class="form-control" name="examCode">
						<option value="0">-select-</option>

						<c:forEach items="${codelist}" var="con">
							<option value="${con.examId}">${con.examCode}</option>
						</c:forEach>
					</select>
							<div class="input-group-append">
								<button class="btn btn-primary" type="submit">
									<i class="fa fa-search" areal-hidden="true"></i>
								</button>

							</div>
						</div>
						<span id="phoneNoErr" class="text-danger font-weight-bold"></span>
					</div>
					
					</form>
					<div class="row col-md-12">
						<table class="table table-striped " border="1" id="tableId">

							<thead class="thead-dark">
								<tr>
									<th>SL#</th>
									<th>Question Text</th>
									<th>Question Type</th>
									<th>Exam Code</th>
									<th>Status</th>
								</tr>

							</thead>
							<tbody>
                              
								<c:forEach items="${AllQuesttion}" var="question"
									varStatus="count">
									<tr>
										<td>${count.count}</td>
										<td>${question.questionText}</td>
										<td>${question.questionType}</td>
										<td>${question.exam.examCode}</td>
										
										
										
										<c:if test="${question.questionStatus eq 0}">
										<td class="text-danger"><a href="./approveStatus?questionId=${question.questionId}">Pending</a></td>
										</c:if>
										<c:if test="${question.questionStatus eq 1}">
										<td class="text-success">Approved</td>
										</c:if>
										
										
									
									</tr>
								</c:forEach>
                                
							</tbody>

						</table>

					</div>
				
			</div>
		</div>
	</div>
</body>
</html>