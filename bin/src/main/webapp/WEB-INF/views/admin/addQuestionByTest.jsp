<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<%@ include file="navbar.jsp"%>
</head>

<style>
.footer {
	clear: both;
	position: relative;
	bottom: 0;
	width: 100%;
	background-color: #23395d;
	text-align: center;
	text-decoration: white;
	color: white;
}

.sidebar {
	width: 20%;
	background: white;
	height: 60%;
	position: absolute;
	padding-top: 0px 10px;
	z-index: -1;
	overflow-y: scroll;
	overflow-x: scroll;
}

.test {
	margin-top: 30px;
	scale: 100%;
	margin-left: 250px;
}

.head {
	background-color: #23395d;
}

.itembox {
	background-color: #23395d;
	height: 700px;
	width: 300px;
}

.box {
	height: 500px;
	border: #23395d solid 2px;
}
.adressNav {
	background-color: lightblue;
}

</style>
<body>
	

	<div>
		<div class="sidebar">
			<div>
				<ul style="list-style: none;">
					<li><a href="./testListInItem"> <i
							class="bi bi-folder-fill fa-2px text-warning"></i>Tests
					</a>

						<ul style="list-style-type: none;">
							<c:forEach items="${testList}" var="test">
								<li><i class="bi bi-folder-fill fa-2px text-warning"></i> <a
									href="./showSubtestInTest?testId=${test.testId}">${test.testName}</a>
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


	<div class="test">
		<div class="container mx-2">
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
						<a style="text-decoration: none" class="text-dark"
							href="./byItemLink"> <span>/${byItemLink}</span>
						</a>
						<a style="text-decoration: none" class="text-dark"
							href="./byTestLink"><span>${byTestLink}</span></a>
					</c:if>
				</div>
			</c:if>
			

			<div class="row">
				<div class="col-md-6">
					<div class="box">
						<div class="h6 text-light head">
							<span class="p-2">Available Tests</span>
						</div>
						<div class="row">
							<div class="form">
								<ul style="list-style: none;">
									<li><i class="bi bi-folder-fill fa-2px text-warning"></i><span>Tests</span>


										<ul style="list-style-type: none;">
											<c:forEach items="${testList1}" var="test">
												<li><i class="bi bi-folder-fill fa-2px text-warning"></i>
													<%-- <a href="./showSubtestInTest?testId=${test.testId}">${test.testName}</a> --%>
													<span>${test.testName}</span>
													<ul style="list-style-type: none;">

														<c:forEach items="${allSubTest}" var="st">
															<c:if test="${st.test.testId eq test.testId}">
																<i class="bi bi-folder-fill fa-2px text-warning"></i> ${st.subTestName}<input
																	class="m-1" type="checkbox" value="${test.testId}">
																<br />
															</c:if>
														</c:forEach>

														<%-- <c:if test="${test.testId eq null}">
															<c:forEach items="${subTestList}" var="st">
																<li><i class="bi bi-file-text text-dark"></i>&nbsp;
																	${st.subTestName}<span class="p-1"><input type="checkbox" value="${st.subTestId}" ></span>
																	
																</li>
															</c:forEach>
														</c:if> --%>
													</ul></li>


											</c:forEach>
										</ul></li>
								</ul>
							</div>

						</div>

					</div>

				</div>
				<div class="col-md-6">
					<div class="box"></div>
				</div>
			</div>
		</div>
	</div>



	<div class="footer mt-5">
		<p>@CSM All Right Reserved @ Online Examination System</p>
	</div>
</body>
</html>