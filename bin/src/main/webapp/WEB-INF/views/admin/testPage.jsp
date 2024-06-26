<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="navbar.jsp"%>
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
.sidebar {
	width: 20%;
	background: white;
	height: 60%;
	position: fixed;
	padding-top: 0px 10px;
	z-index: 9999999999999999999999999999;
	overflow-y: scroll;
	overflow-x: scroll;
}

.footer {
	clear: both;
	position: fixed;
	bottom: 0;
	width: 100%;
	background-color: #23395d;
	text-align: center;
	text-decoration: white;
	color: white;
}

.adressNav {
	background-color: lightblue;
	margin-left: 275px;
}
</style>
<body>
	<div>
		<div class="sidebar">
			<div>
				<ul style="list-style: none;">
					<li><a href="./getTestList"> <i
							class="bi bi-folder-fill fa-2px text-warning"></i>Tests
					</a> ${testId}

						<ul style="list-style-type: none;">
							<c:forEach items="${testList}" var="test">
								<li><i class="bi bi-folder-fill fa-2px text-warning"></i> <a
									href="./showSubTest?testId=${test.testId}">${test.testName}</a>
									<ul style="list-style-type: none;">
										<c:if test="${tId eq test.testId}">
											<c:forEach items="${subTestList}" var="st">
												<li><i class="bi bi-folder-fill fa-2px text-warning"></i>&nbsp;
													<a href="./showTest?sId=${st.subTestId }">${st.subTestName}
														<%--<ul style="list-style-type: none;">
													 <c:if test="${sId eq st.subTestId}">
													<c:forEach items="${questionTypeList}" var="qtype">
														<li><i class="bi bi-folder-fill fa-2px text-warning"></i>&nbsp;
														<a href="./showTest?questionTypeId=${qtype.questionTypeId}">${qtype.questionTypeName}
													
													
													
														</a>
														</li>
													</c:forEach>
													</c:if> 
													</ul>--%>


												</a></li>
											</c:forEach>
										</c:if>
									</ul></li>


							</c:forEach>
						</ul></li>
				</ul>
			</div>
			<%-- ${subTestList } --%>

		</div>
		<!-- <div class="sidebar2">
			<a href="" class="box">New Item</a> <a href="" class="box">New
				SubItem</a> <a href="" class="box">Delete</a>
		</div> -->
	</div>
	<c:if test="${test ne null}">
		<div class="adressNav">
			<c:if test="${testNav eq 'yes' }">
				<span><i class="bi bi-folder-fill fa-2px text-warning"></i>Test/</span>
			</c:if>
			<c:if test="${Tname eq 'yes'}">
				<a style="text-decoration: none" class="text-dark"
					href="./getTestList"><span>${testNavName}</span></a>
			</c:if>
		</div>
	</c:if>
	<div class="container">
		<div class="container"
			style="margin-top: 25px; margin-left: 150px; margin-right: 50px; border: 1px solid black;">
			<p align="right">
				<span class="text-danger">*</span> indicates mandatory fields
			</p>
			<div class="card text-center"
				style="margin-right: 5rem; margin-left: 5rem;">
				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active" id="testId"
							onclick="openAddTest()">Add Test</a></li>
						<li class="nav-item"><a class="nav-link" id="subTestId"
							onclick="openSubTest()">Add SubTest</a></li>
						<!-- <li class="nav-item"><a class="nav-link" id="addQuestionId"
							onclick="questionEnter()">Add Questions</a></li> -->
					</ul>
				</div>

				<div id="test">
					<form action="./addTest" method="post">
						<input type="hidden" name="userId" id="userId">
						<div class="card-body">

							<div class="form-group col-md-6 offset-md-3">
								<label>Add Test :<span class="text-danger">*</span></label> <input
									type="text" name="testName" id="testNameId"
									class="form-control"> <span id="applicantNameEr"
									class="text-danger font-weight-bold"></span>
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


				<div id="subTest">
					<form action="./addSubTest" method="post">
						<div class="container">
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Test Name<span
									class="text-danger">*</span>
								</label> <select class="form-control" name="testName" id="testId">
									<option value="select">--select--</option>
									<c:forEach items="${testList}" var="test">
										<option value="${test.testId}">${test.testName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Add SubTest :<span
									class="text-danger">*</span></label> <input type="text"
									name="subTestName" id="subTestNameId" class="form-control">
								<span id="applicantNameEr" class="text-danger font-weight-bold"></span>
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
		</div>
	</div>
	<div class="footer">
		<p>@CSM All Right Reserved @ Online Examination System</p>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#test').show();
		$('#subTest').hide();

	});
	function openAddTest() {
		$("#testId").addClass('active')
		$("#subTestId").removeClass('active')

		$("#test").show();
		$("#subTest").hide();

	}

	function openSubTest() {
		$("#testId").removeClass('active')
		$("#subTestId").addClass('active')

		$("#test").hide();
		$("#subTest").show();

	}
</script>

</html>