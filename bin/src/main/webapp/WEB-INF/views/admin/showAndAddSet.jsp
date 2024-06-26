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
	margin-left: 300px;
}
</style>
</head>
<body>

	<div class="sidebar">
		<div>
			<ul style="list-style: none;">
				<li><a href="./getTestList"> <i
						class="bi bi-folder-fill fa-2px text-warning"></i>Tests
				</a>

					<ul style="list-style-type: none;">
						<c:forEach items="${testList}" var="test">
							<li><i class="bi bi-folder-fill fa-2px text-warning"></i> <a
								href="./showSubTest?testId=${test.testId}">${test.testName}</a>
								<ul style="list-style-type: none;">
									<c:if test="${tId eq test.testId}">
										<c:forEach items="${subTestList}" var="st">
											<li><i class="bi bi-folder-fill fa-2px text-warning"></i>&nbsp;
												<a href="./showQuesType?subTestId=${st.subTestId}">${st.subTestName}
													<ul style="list-style-type: none;">
														<c:if test="${sId eq st.subTestId}">
															<c:forEach items="${questionTypeList}" var="qtype">
																<li><i
																	class="bi bi-folder-fill fa-2px text-warning"></i>&nbsp;
																	<a
																	href="./showTest?questionTypeId=${qtype.questionTypeId}">${qtype.questionTypeName}



																</a></li>
															</c:forEach>
														</c:if>
													</ul>


											</a></li>
										</c:forEach>
									</c:if>
								</ul></li>


						</c:forEach>
					</ul></li>
			</ul>
		</div>

	</div>
	<c:if test="${test ne null}">

		<div class="adressNav">
			<c:if test="${testNav eq 'yes' }">
				<span><i class="bi bi-folder-fill fa-2px text-warning"></i>Test/</span>
			</c:if>
			<c:if test="${Tname eq 'yes'}">
				<a style="text-decoration: none" class="text-dark"
					href="./getTestList"><span>${testNavName}/</span></a>
				<a style="text-decoration: none" class="text-dark"
					href="./showSubTest?testId=${testData}""><span>${subTestNav}</span></a>
			</c:if>
		</div>
	</c:if>



	<div class="container">
		<div class="container"
			style="margin-top: 25px; margin-left: 150px; margin-right: 50px; border: 1px solid black;">
			<p align="right">
				<span class="text-danger">*</span> indicates mandatory fields
			</p>

			<div id="properties">
				<form action="./addTest" method="post">
					<input type="hidden" name="userId" id="userId">
					<div class="card-body">
						<h3 style="margin-left: 0">Edit Properties</h3>
						<div class="form-group col-md-6 offset-md-3">
							<label>Property Type :<span class="text-danger">*</span></label>
							<br> <a href="./byItemLink" name="property" id="propertyId"
								value="byItem">By Item</a> <span> | </span> <a
								href="./byTestLink" name="property" id="propertyId"
								value="byTest">By Test</a> <br> <span id="genderEr"
								class="text-danger font-weight-bold"></span>
						</div>

					</div>
				</form>
			</div>
		</div>

	</div>
	<div>ygbygbyugbyg</div>
	<div class="footer">
		<p>@CSM All Right Reserved @ Online Examination System</p>
	</div>


	<div>

		<c:if test="${qSet ne null} ">

			<div>

				<div class="sidebar">
					<div>
						<ul style="list-style: none;">
							<li><a href="./getTestList"> <i
									class="bi bi-folder-fill fa-2px text-warning"></i>Tests
							</a>

								<ul style="list-style-type: none;">
									<c:forEach items="${testList}" var="test">
										<li><i class="bi bi-folder-fill fa-2px text-warning"></i>
											<a href="./showSubTest?testId=${test.testId}">${test.testName}</a>
											<ul style="list-style-type: none;">
												<c:if test="${tId eq test.testId}">
													<c:forEach items="${subTestList}" var="st">
														<li><i class="bi bi-file-text text-dark"></i>&nbsp; <a
															href="./showTest?subTestId=${st.subTestId}">Q${st.subTestName}</a>
														</li>
													</c:forEach>
												</c:if>
											</ul></li>


									</c:forEach>
								</ul></li>
						</ul>
					</div>

				</div>

			</div>
		</c:if>


	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#test').show();
		$('#subTest').hide();

	});
	function Properties() {
		$("#propertiesId").addClass('active')
		$("#setTestId").removeClass('active')

		$("#properties").show();
		$("#subTest").hide();

	}

	function setTest() {
		$("#propertiesId").removeClass('active')
		$("#setTestId").addClass('active')

		$("#properties").hide();
		$("#subTest").show();

	}
</script>
</html>