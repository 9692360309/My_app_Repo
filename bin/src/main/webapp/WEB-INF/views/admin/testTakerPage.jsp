<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="navbar.jsp"%>
<script src='https://kit.fontawesome.com/a076d05399.js'
crossorigin='anonymous'></script>

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<style>
.sidebar {
	width: 20%;
	background: white;
	height: 60%;
	position: absolute;
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
</style>
</head>
<body>
	<div>
		<div class="sidebar">
			<div>
				<ul style="list-style: none;">
					<li><a href="./testTakersList"> <i
							class="bi bi-folder-fill fa-2px text-warning"></i>Test-Taker
					</a>
						<ul style="list-style-type: none;">
							<c:forEach items="${testtakerList}" var="tTaker">
								<li><i class="bi bi-folder-fill fa-2px text-warning"></i>&nbsp;
									<a href="./getTestTaker?testTakerId=${tTaker.testTakerId}">${tTaker.testTakerName}</a>
									<ul style="list-style-type: none;">
										<c:if test="${ttId eq tTaker.testTakerId}">
											<c:forEach items="${listSubTestTaker}" var="subTest">
												<li><i class="bi bi-folder-fill fa-2px text-warning"></i>&nbsp;
													<a href="./addTestTakerByExcel?subTestTakerId=${subTest.subTestTakerId}">${subTest.subTestTakerName}</a>
													
														<ul style="list-style-type: none;">
														<c:if test="${stId eq subTest.subTestTakerId}">
															<c:forEach items="${listCandidates}" var="cand">
																<li>
																	<a><i class="text-primary">@</i>${cand.candidateemail}</a>
																</li>
															</c:forEach>
														</c:if>

														</ul>
													
													</li>
											</c:forEach>
										</c:if>

									</ul>
								</li>
							</c:forEach>

						</ul></li>
				</ul>

			</div>


		</div>

	</div>
	<c:if test="${saveBox ne null}">
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
							onclick="openAddTest()">Add TestTaker Folder</a></li>
						<li class="nav-item"><a class="nav-link" id="subTestId"
							onclick="openSubTest()">Add SubTest</a></li>
						<!-- <li class="nav-item"><a class="nav-link" id="addQuestionId"
							onclick="questionEnter()">Add Questions</a></li> -->
					</ul>
				</div>
				<div id="test">
					<form action="./addTest-Taker" method="post">
						<input type="hidden" name="userId" id="userId">
						<div class="card-body">

							<div class="form-group col-md-6 offset-md-3">
								<label>Add Test-taker :<span class="text-danger">*</span></label>
								<input type="text" name="testTakerName" id="testTakerNameId"
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
					<form action="./addSubTest-Taker" method="post">
						<div class="container">
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Test Name<span
									class="text-danger">*</span>
								</label> <select class="form-control" name="testTakerName"
									id="testTakerNameId">
									<option value="select">--select--</option>
									<c:forEach items="${testtakerLists}" var="t">
										<option value="${t.testTakerId}">${t.testTakerName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Add SubTest-Taker :<span
									class="text-danger">*</span></label> <input type="text"
									name="SubTestTakerName" id="SubTestTakerNameId"
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
			</div>
		</div>
	</div>
	</c:if>
	
	<c:if test="${saveBoxExcel ne null}">
		<div class="container">
			<h2 class="text-danger text-center">Add Candidates</h2>
			<div class="container" style="margin-top: 25px; margin-left: 150px; margin-right: 100px; border: 1px solid black; background-color: #eee">
				<form action="./getCandidatesByExcel" method="post" enctype="multipart/form-data">
		
				<div class="form-group col-md-6 offset-md-3">
					<label>Upload Candidate List :<span class="text-danger">(upload excel as given format<a href="./candidate/export/excel"><i class="fas fa-file-excel"  style="color: red" aria-hidden="true"></i></a>)</span></label> 
					
					<input type="file" name="excelfile" id="excelfile" class="form-control">
				</div>
				<div class="form-group col-md-6 offset-md-3" align="center">
				<input type="submit" id="tabOneSubmit" onclick="return confirm('Are you want to Save your Details');"class="btn btn-success">
				</div>
				
				</form>
			</div>
		 </div>
	
	</c:if>

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