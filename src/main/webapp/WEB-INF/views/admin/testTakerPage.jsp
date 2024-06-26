<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@ include file="navbar.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
<link
	rel="https://cdnjs.datatables/1.12.1/css/dataTables.bootstrap4.min.css">
<!-- Option 1: Include in HTML -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<style>

.caret {
	cursor: pointer;
	user-select: none; /* Prevent text selection */
}

/* Create the caret/arrow with a unicode, and style it */
.caret::before {
	content: "\27A4";
	color: blue;
	display: inline-block;
	margin-right: 6px;
}

/* Rotate the caret/arrow icon when clicked on (using JavaScript) */
.caret-down::before {
	transform: rotate(90deg);
}

/* Hide the nested list */
.nested {
	display: none;
}

/* Show the nested list when the user clicks on the caret/arrow (with JavaScript) */
.active {
	display: block;
}


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

.adressNav {
	background-color: lightblue;
	margin-left: 300px;
}
</style>
</head>
<body>
	<div id="alertId">
		<c:if test="${not empty exist}">
			<script type="text/javascript">
				swal({
					title : "failed !",
					text : "Already Exist !",
					icon : "error",
					button : "try again!",
				});
			</script>
		</c:if>
		<c:if test="${not empty saveSubt}">
			<script type="text/javascript">
				swal({
					title : "saved !",
					text : "Successfully !",
					icon : "success",
					button : "Ok",
				});
			</script>
		</c:if>
		<c:if test="${not empty candy}">
			<script type="text/javascript">
				swal({
					title : "saved !",
					text : "Successfully !",
					icon : "success",
					button : "Ok",
				});
			</script>
		</c:if>
		<c:if test="${not empty candExist}">
			<script type="text/javascript">
				swal({
					title : "Failed !",
					text : "already Exist !",
					icon : "error",
					button : "try again",
				});
			</script>
		</c:if>
		<c:if test="${not empty saveCandExcel}">
			<script type="text/javascript">
			swal({
				title : "saved !",
				text : "Successfully !",
				icon : "success",
				button : "Ok",
			});
			</script>
		</c:if>
		<c:if test="${not empty cExistExcel}">
			<script type="text/javascript">
				swal({
					title : "Failed !",
					text : "already Exist !",
					icon : "error",
					button : "try again",
				});
			</script>
		</c:if>
		<c:if test="${not empty config}">
			<script type="text/javascript">
			swal({
				title : "saved !",
				text : "Successfully !",
				icon : "success",
				button : "Ok",
			});
			</script>
		</c:if>
		<c:if test="${not empty emailSent}">
			<script type="text/javascript">
			swal({
				title : "Sent !",
				text : "Successfully !",
				icon : "success",
				button : "Ok",
			});
			</script>
		</c:if>
		
	</div>
	<div>
		<div class="sidebar">
			<%-- <div>
				<ul style="list-style: none;">
					<li><a href="./testTakersList"> <i
							class="bi bi-folder-fill fa-2px text-warning"></i>College List
					</a>
						<ul style="list-style-type: none;">
							<c:forEach items="${collegeList}" var="tTaker">
								<li><i class="bi bi-folder-fill fa-2px text-warning"></i>&nbsp;
									<a href="./getTestTaker?testTakerId=${tTaker.testTakerId}">${tTaker.testTakerName}</a>
									<ul style="list-style-type: none;">
										<c:if test="${ttId eq tTaker.testTakerId}">
											<c:forEach items="${listSubTestTaker}" var="subTest">
												<li><i class="bi bi-folder-fill fa-2px text-warning"></i>&nbsp;
													<a
													href="./addTestTakerByExcel?subTestTakerId=${subTest.subTestTakerId}">${subTest.subTestTakerName}</a>

													<ul style="list-style-type: none;">
														<c:if test="${stId eq subTest.subTestTakerId}">
															<c:forEach items="${listCandidates}" var="cand">
																<li><a><i class="text-primary">@</i>${cand.candidateemail}</a>
																</li>
															</c:forEach>
														</c:if>

													</ul></li>
											</c:forEach>
										</c:if>

									</ul></li>
							</c:forEach>

						</ul></li>
				</ul>

			</div> --%>
			
			<div>

					<ul style="list-style-type: none;">

						<li><span id="item-${testTakerId}" class="caret"
							onclick="getTestTaker(event)">College </span> <input
							type="hidden" id='isOpen_${testTaker.testTakerId}' value="false"></li>

					</ul>


				</div>


		</div>
		<c:if test="${adressNav ne null }">
			<div class="adressNav">
				<span><i class="bi bi-folder-fill fa-2px text-warning"></i>Test-Taker/
				</span>

				<c:if test="${navTestTaker eq 'yes' }">
					<a style="text-decoration: none" class="text-dark"
						href="./testTakersList"><span>${TestTakerName}/ </span></a>
				</c:if>
				<c:if test="${navSubTestTaker eq 'yes' }">
					<a style="text-decoration: none" class="text-dark"
						href="./getTestTaker?testTakerId=${ttId}"><span>${SubTestTakerName}/
					</span></a>
				</c:if>
			</div>
		</c:if>

	</div>
	
		
		
		
		<input id="invalCol" hidden="" value="${invalideColumnNames}">
		<c:if test="${invalidCol ne null}">
		<script>
		var invalideColumnNames = document.getElementById("invalCol").value;
        // Check if the "invalidcolumn" attribute is present in the model
        var invalidColumnMessage = "${invalidCol}";
      	
        if (invalidColumnMessage!=4) {
            // Display the SweetAlert with the error message
            Swal.fire({
                icon: 'error',
                title: 'Invalid Column',
                text: invalideColumnNames ,
                confirmButtonText: 'OK'
            });
        }

        
    	</script>
    	
    	</c:if>
    	<c:if test="${invalidCol eq 4}">
    	<script>
    	if (invalidColumnMessage==4) {
            // Display the SweetAlert with the error message
            Swal.fire({
                icon: 'error',
                title: 'Invalid Column',
                text: invalideColumnNames ,
                confirmButtonText: 'OK'
            });
        }
    	</script>
    	</c:if>
    	
    	
    	
    	
    	<script>
    	
    	 var result = "<c:out value='${result}' />";	
    	
        
        function showAlert(message) {
            Swal.fire({
                icon: 'error',
                title: 'Email Already Present!',
                text: message,
                confirmButtonText: 'OK'
            });
        }

        function saveAlert(message) {
            Swal.fire({
                icon: 'success',
                title: 'Candidates Saved!',
                text: message,
                confirmButtonText: 'OK'
            });
        }
        function firstNameAlert(message) {
            Swal.fire({
                icon: 'error',
                title: 'FirstName Error!',
                text: message,
                confirmButtonText: 'OK'
            });
        }
        /* const result = '${result}'; */
        const inValidData = '${inValidData}';
        var result = "<c:out value='${result}' />";	
        if (result == 'error') {
            showAlert('This Candidate is Present!!!');
           
        }
        else if(result == 'success'){
        	 saveAlert('Excel Uploaded SuccessFully!!!');
            }
        
    </script>
    
    <script>
    // Check if the invalidFname flash attribute is set
    var invalidFname = "<c:out value='${invalidFname}' />";
    
    if (invalidFname) {
        // Display SweetAlert popup
        Swal.fire({
            icon: 'error',
            title: 'Invalid First Name',
            text: 'The entered First Name is invalid.',
            // You can customize the popup further here
        });
    }

    // Check if the invalidLname flash attribute is set
    var invalidLname = "<c:out value='${invalidLname}' />";
    
    if (invalidLname) {
        // Display SweetAlert popup
        Swal.fire({
            icon: 'error',
            title: 'Invalid Last Name',
            text: 'The entered First Name is invalid.',
            // You can customize the popup further here
        });
    }



 // Check if the invalidLname flash attribute is set
    var invalidemail = "<c:out value='${invalidemail}' />";
    
    if (invalidemail) {
        // Display SweetAlert popup
        Swal.fire({
            icon: 'error',
            title: 'Invalid Email',
            text: 'The entered Eamil is invalid.',
            // You can customize the popup further here
        });
    }


var invalidmobileNo = "<c:out value='${invalidmobileNo}' />";
    
    if (invalidmobileNo) {
        // Display SweetAlert popup
        Swal.fire({
            icon: 'error',
            title: 'Invalid Mobile Number',
            text: 'The entered Mobile Number is invalid.',
            // You can customize the popup further here
        });
    }

    

	</script>
	<div class="container" id="setCollege">
			<div class="container"
				style="margin-top: 25px; margin-left: 150px; margin-right: 50px; border: 1px solid black;">
				<p align="right">
					<span class="text-danger">*</span> indicates mandatory fields
				</p>
				<div class="card text-center"
					style="margin-right: 5rem; margin-left: 5rem;">
					<div class="card-header">
						<ul class="nav nav-tabs card-header-tabs">
							<!-- <li class="nav-item"><a class="nav-link active" id="testId"
								onclick="openAddTest()">Add TestTaker Folder</a></li> -->
							<li class="nav-item"><a class="nav-link" id="subTestId"
								onclick="openSubTest()">Add SubTest</a></li>
							<!-- <li class="nav-item"><a class="nav-link" id="addQuestionId"
							onclick="questionEnter()">Add Questions</a></li> -->
						</ul>
					</div>
					<!-- <div id="test">
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
					</div> -->
					<div id="subTest">
						<form action="./addSubTest-Taker" method="post"
							onsubmit="return validateForm()">
							<div class="container">
								<div class="form-group col-md-6 offset-md-3">
									<label class="font-weight-bold">College Name<span
										class="text-danger">*</span>
									</label> <select class="form-control" name="testTakerName"
										id="testTakerName">
										<option value="select">--select--</option>
										<c:forEach items="${testTakerList}" var="t">
											<option value="${t.testTakerId}">${t.testTakerName}</option>
										</c:forEach>
									</select> <span id="testTakerNameSpanId"
										class="text-danger font-weight-bold"></span>
								</div>
								<div class="form-group col-md-6 offset-md-3">
									<label class="font-weight-bold">Add Batch Name :<span
										class="text-danger">*</span></label> <input type="text"
										name="SubTestTakerName" id="SubTestTakerNameId"
										class="form-control"> <span id="applicantNameEr"
										class="text-danger font-weight-bold"></span>
								</div>
								<div class="form-group col-md-6 offset-md-3" align="center">
									<input type="submit" id="tabOneSubmit"
										value="Submit" class="btn btn-success">&nbsp;&nbsp; <input
										type="reset" value="Reset" class="btn btn-danger">

								</div>


							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	




		<div class="container" id="ExcelTabForCand">
			<div class="container"
				style="margin-top: 25px; margin-left: 150px; margin-right: 100px;">


				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active" id="excelId"
							onclick="openExcel()">Add By Excel</a></li>
						<li class="nav-item"><a class="nav-link" id="addCanId"
							onclick="openCand()">Add Candidates</a></li>
						<li class="nav-item"><a class="nav-link" id="configId"
							onclick="openConfig()">Configure</a></li>
						<li class="nav-item"><a class="nav-link" id="mailId"
							onclick="mailSend()">Send Email</a></li>
					</ul>
				</div>

				<div class="container" id="excel">
					<form action="./getCandidatesByExcel" method="post"
						enctype="multipart/form-data">

						<div class="form-group col-md-6 offset-md-3">
							<label>Upload Candidate List :<span class="text-danger">(upload
									excel as given format)<a href="./candidate/export/excel"><i
										class="fas fa-file-excel" style="color: red"
										aria-hidden="true"></i>download</a>
							</span></label> <input type="file" name="excelfile" id="excelfile"
								class="form-control">
						</div>
						<div class="form-group col-md-6 offset-md-3" align="center">
							<input type="submit" id="tabOneSubmit"
								onclick="return confirm('Are you want to Save your Details');"
								class="btn btn-success">
						</div>
					</form>
				</div>

				<div class="container" id="addCan">
					<div>
						<form action="./saveCandidate" method="post"
							onsubmit="return validateFormForCandidate()">
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Candidate First Name :<span
									class="text-danger">*</span></label> <input type="text"
									name="candFirstname" id="candFirstnameId" class="form-control">
								<span id="firstNameSpanId" class="text-danger font-weight-bold"></span>
							</div>

							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Candidate Last Name :<span
									class="text-danger">*</span></label> <input type="text"
									name="candLastname" id="candLastnameId" class="form-control">
								<span id="lastNameSpanId" class="text-danger font-weight-bold"></span>
							</div>
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Candidate Email :<span
									class="text-danger">*</span></label> <input type="text"
									name="candidateemail" id="candidateemailId"
									class="form-control"> <span id="emailId"
									class="text-danger font-weight-bold"></span>
							</div>

							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Candidate Phone No :<span
									class="text-danger">*</span></label> <input type="text"
									name="candMobile" id="candMobileId" class="form-control">
								<span id="phoneId" class="text-danger font-weight-bold"></span>
							</div>


							<div class="form-group col-md-6 offset-md-3" align="center">
								<input type="submit" id="tabOneSubmit"
									onclick="return confirm('Are you want to Save your Details');"
									class="btn btn-success">
							</div>
						</form>
					</div>
				</div>


				<div class="container" id="config">
					<div>
						<form action="saveConfigure" method="post"
							onsubmit="return validateFormForConfig()">
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Set Test :<span
									class="text-danger">*</span></label> <select class="form-control"
									name="tNameId" id="tNameId" onchange="getSubtestByTest()">
									<option value="select">--select--</option>
									<c:forEach items="${testList}" var="test">
										<option value="${test.testId}">${test.testName}</option>
									</c:forEach>
								</select> <span id="tNameIdErr" class="text-danger font-weight-bold"></span>
							</div>

							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Set Sub-Test :<span
									class="text-danger">*</span></label> <select class="form-control"
									name="subtestName" id="subtestName"
									onchange="getNoOfQuestionBySId()">
									<option value="select">-select-</option>
								</select> <span id="subtestNameEr" class="text-danger font-weight-bold"></span>
							</div>
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Total Question in this
									Selected Set:<span class="text-danger">*</span>
								</label>
								<div>
									<input type="text" name="total" id="totalId"
										class="form-control" disabled> <span id="emailIdEr"
										class="text-danger font-weight-bold"></span>
								</div>
							</div>
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Enter the Number of
									Questions For Set<span class="text-danger">*(Particular
										Batch)</span>
								</label> <input type="number" name="noOfQuestion" id="noOfQuestion"
									class="form-control"> <span id="noOfQuestionEr"
									class="text-danger font-weight-bold"></span>
							</div>

							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Set Date :<span
									class="text-danger">*</span></label> <input type="date" name="testDate"
									id="testDate" class="form-control"> <span
									id="testDateEr" class="text-danger font-weight-bold"></span>
							</div>

							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Set Login Time :<span
									class="text-danger">*</span></label> <input type="time"
									name="loginTime" id="loginTime" class="form-control"> <span
									id="loginTimeEr" class="text-danger font-weight-bold"></span>
							</div>
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Set Start Time :<span
									class="text-danger">*</span></label> <input type="time"
									name="startTime" id="startTime" class="form-control"> <span
									id="startTimeEr" class="text-danger font-weight-bold"></span>
							</div>

							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Set End Time :<span
									class="text-danger">*</span></label> <input type="time" name="endTime"
									id="endTime" class="form-control"> <span id="endTimeEr"
									class="text-danger font-weight-bold"></span>
							</div>

							<div class="form-group col-md-6 offset-md-3" align="center">
								<input type="submit" id="OneSubmit"
									onclick="return confirm('Are you want to Save your Details');"
									class="btn btn-success">
							</div>
						</form>
					</div>
				</div>


				<div class="container" id="mail">
					<h5>Please Configure Before Sending the Mail</h5>
					<a href="./sendEmailToCandidates" class="btn btn-warning">Send
						Email</a>
				</div>

			</div>

		</div>


	<div class="footer">
		<p>@CSM All Right Reserved @ Online Examination System</p>
	</div>
</body>


<script type="text/javascript">
	function getSubtestByTest() {
		var tId = $("#tNameId").val();
		
		$.ajax({
			type : "GET",
			url : "./getSubTestNameByTestId",
			data : "tId=" + tId,
			success : function(response) {

				$("#subtestName").html(response);
			}
		});
	}

	$(document).ready(function() {
		/* 	$('#test').show(); */
		$('#subTest').show();

	});
	/* function openAddTest() {
		$("#testId").addClass('active')
		$("#subTestId").removeClass('active')

		$("#test").show();
		$("#subTest").hide();

	}
	 */
	function openSubTest() {
		$("#testId").removeClass('active')
		$("#subTestId").addClass('active')

		$("#test").hide();
		$("#subTest").show();

	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#excel').show();
		$('#addCan').hide();
		$('#config').hide();
		$('#mail').hide();

	});
	function openExcel() {
		$("#excelId").addClass('active')
		$("#addCanId").removeClass('active')
		$("#configID").removeClass('active')
		$("#mailId").removeClass('active')

		$("#excel").show();
		$("#addCan").hide();
		$("#config").hide();
		$('#mail').hide();
	}

	function openCand() {
		$("#excelId").removeClass('active')
		$("#addCanId").addClass('active')
		$("#configID").removeClass('active')
		$("#mailId").removeClass('active')

		$("#excel").hide();
		$("#addCan").show();
		$("#config").hide();
		$('#mail').hide();
	}

	function openConfig() {
		$("#excelId").removeClass('active')
		$("#addCanId").removeClass('active')
		$("#configID").addClass('active')
		$("#mailId").removeClass('active')

		$("#excel").hide();
		$("#addCan").hide();
		$("#config").show();
		$('#mail').hide();
	}

	function mailSend() {
		$("#excelId").removeClass('active')
		$("#addCanId").removeClass('active')
		$("#configID").removeClass('active')
		$("#mailId").addClass('active')

		$("#excel").hide();
		$("#addCan").hide();
		$("#config").hide();
		$('#mail').show();

	}
</script>
<script type="text/javascript">
function getNoOfQuestionBySId() {

	var tId = $("#tNameId").val();
	var noId = $("#subtestName").val();
	var total = $("#totalId").val();
	$.ajax({
	url : "./checkQuestionAviableOrNot",
	type : "GET",
	data : {
	testId : tId,
	sId : noId

	},
	success : function(result) {
	$("#totalId").val(result);
	}
	});

	}
</script>
<script type="text/javascript">
	function validateForm() {

		var subTestTakerName = document.getElementById("SubTestTakerNameId").value;
		var testTakerName = document.getElementById("testTakerName").value;
		if (testTakerName === "select") {
			document.getElementById("testTakerNameSpanId").innerText = "Please select a Test.";
			return false; // Prevent form submission
			} else {
			document.getElementById("testTakerNameSpanId").innerText = ""; // Clear error message

			}
		
		// Check if the entered value has at least 2 characters
		if (subTestTakerName.length < 2) {
			document.getElementById("applicantNameEr").innerText = "SubTest-Taker Name must be at least 2 characters.";
			return false; // Prevent form submission
		} else {
			document.getElementById("applicantNameEr").innerText = ""; // Clear error message
		
		}
		
		return true; // Allow form submission
	}

	function validateFormForCandidate() {

		var firstName = document.getElementById("candFirstnameId").value;
		var lastName = document.getElementById("candLastnameId").value;
		var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
		var email = document.getElementById("candidateemailId").value;
		var mob = document.getElementById("candMobileId").value;

		if (firstName == "" || firstName.length < 4) {

			document.getElementById("firstNameSpanId").innerText = "Name must be at least 4 characters.";
			return false; // Prevent form submission
		} else {

			document.getElementById("firstNameSpanId").innerText = "";
			// Allow form submission
		}
		if (lastName.length < 2) {

			document.getElementById("lastNameSpanId").innerText = "Name must be at least 4 characters.";
			return false; // Prevent form submission
		} else {

			document.getElementById("lastNameSpanId").innerText = "";
			// Allow form submission
		}

		if (!email.match(emailPattern)) {
			document.getElementById("emailId").innerText = "Please put a Valid email."
			return false;
		} else {
			document.getElementById("emailId").innerText = "";
			// Allow form submission
		}

		if (isNaN(mob) || mob.length != 10) {
			document.getElementById("phoneId").innerText = "Phone Number is not less or greater than 10 number."
			return false;
		} else {
			document.getElementById("phoneId").innerText = "";
		}
		return true;
	}
	function validateFormForConfig() {
		var tNameId = document.getElementById("tNameId").value;
		var subtestNameId = document.getElementById("subtestName").value;
		//var noOfQuestion = document.getElementById("noOfQuestion").value;
		var testDate = document.getElementById("testDate").value;
		var testDateInput = document.getElementById("testDate").value;
		var today = new Date().toISOString().slice(0, 10);
		var loginTime = document.getElementById("loginTime").value;
		var startTime = document.getElementById("startTime").value;
		var endTime = document.getElementById("endTime").value;
		var totalQuestions = parseInt(document.getElementById("totalId").value);
		var noOfQuestion = parseInt(document.getElementById("noOfQuestion").value);
		/* if (noOfQuestion > totalQuestions )) {
		alert("xyz")
		     document.getElementById("noOfQuestionEr").innerText = "Please enter a valid number of questions.";
		     return false;
		} else {
		     document.getElementById("noOfQuestionEr").innerText = "";
		} */
		if (tNameId === "select") {
		document.getElementById("tNameIdErr").innerText = "Please select a Test.";
		return false; // Prevent form submission
		} else {
		document.getElementById("tNameIdErr").innerText = ""; // Clear error message

		}

		if (subtestNameId === "select") {
		document.getElementById("subtestNameEr").innerText = "Please select a SubTest.";
		return false; // Prevent form submission
		} else {
		document.getElementById("subtestNameEr").innerText = ""; // Clear error message

		}
		/* if (noOfQuestion === "" || isNaN(noOfQuestion)) {
		document.getElementById("noOfQuestionEr").innerText = "Please enter a valid number of questions.";
		return false;
		} else {
		document.getElementById("noOfQuestionEr").innerText = "";
		} */
		if (noOfQuestion > totalQuestions || isNaN(noOfQuestion)) {
		    document.getElementById("noOfQuestionEr").innerText = "Please enter a valid number of questions.";
		    return false;
		} else {
		    document.getElementById("noOfQuestionEr").innerText = "";
		}

		if (testDateInput < today) {
		document.getElementById("testDateEr").innerText = "Please select the Date and Enter today's date or a future date.";
		return false; // Prevent form submission
		} else {
		document.getElementById("testDateEr").innerText = ""; // Clear error message

		}

		if (loginTime === "") {
		document.getElementById("loginTimeEr").innerText = "Please select a valid login time.";
		return false;
		} else {
		document.getElementById("loginTimeEr").innerText = "";
		}
		if (startTime === "") {
		document.getElementById("startTimeEr").innerText = "Please select a valid start time.";
		return false;
		} else {
		document.getElementById("startTimeEr").innerText = "";
		}
		if (loginTime >= startTime) {
		document.getElementById("loginTimeEr").innerText = "Login Time must be before Start Time.";
		return false; // Prevent form submission
		} else {
		document.getElementById("loginTimeEr").innerText = ""; // Clear error message
		}
		// Validation for "Set End Time" input
		if (endTime === "") {
		document.getElementById("endTimeEr").innerText = "Please select a valid end time.";
		return false;
		} else {
		document.getElementById("endTimeEr").innerText = "";
		}
		if (startTime >= endTime) {
		document.getElementById("startTimeEr").innerText = "Start time must be before end time.";
		return false; // Prevent form submission
		} else {
		document.getElementById("startTimeEr").innerText = ""; // Clear error message
		}

		return true; // Allow form submission
		}
			
	
</script>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded",() => {
		setTimeout(function(){
			document.getElementById('alertId').style.display='none';
		},3000);
	});
	function noBack(){
		window.history.forward();
		}
</script>

<script type="text/javascript">

$(document).ready(function() {
	$('#setCollege').show();
	$('#ExcelTabForCand').hide();

});

function getTestTaker(event){

	
	$(document).ready(function() {
		$('#setCollege').show();
		$('#ExcelTabForCand').hide();

	});
	
	var span = event.target;
	var li = span.parentNode;
	//var unList = li.querySelector("ul");
	const elementsToRemove = li.querySelectorAll('ul');
	elementsToRemove.forEach(element => {
	  element.remove();
	});
	var isOpen = span.nextElementSibling;
	var isOpenValue = isOpen.value;

	if (isOpenValue === "false") {
		$.ajax({
			type : "GET",
			url : "./gettestTakersList",
			success : function(response) {
				
				if(response == ""){
						
					}
				else{
				var values = response.split(",");
				
				/* alert(values); */
				var unList = document.createElement("ul");
				unList.style.listStyleType = 'none';
				document.getElementById("item-").classList
						.add('caret-down');
				for (var i = 0; i < values.length; i++) {
					
					var testTakerId = values[i].split("_")[1];
					var testTakerName = values[i].split("_")[0];
					//alert(testId+"   "+testName);
					var list = document.createElement("li");
					list.style.listStyleType = 'none';
					list.innerHTML = '<span class="caret" id="qType-'
							+ testTakerId + '-' + i
							+ '" onclick="getSubTestTaker(event)">'
							+ testTakerName + '</span><br/>';
					unList.appendChild(list);

					var newInput = document.createElement("input");
					newInput.setAttribute("type", "hidden");
					newInput.setAttribute("id", "isOpenSubTestTaker_"
							+ testTakerId);
					newInput.setAttribute("value", "false");
					unList.appendChild(newInput);
				}

				var li = span.parentNode;
				li.appendChild(unList);
				isOpen.value = "true";
				
			}
			}
		});
	} else {
		var li = span.parentNode;
		var unList = li.querySelector("ul");
		if (unList) {
			li.removeChild(unList);
		}
		isOpen.value = "false";
	}
	document.getElementById("item-").classList.remove('caret-down');
	
}


function getSubTestTaker(event){

	$(document).ready(function() {
		$('#setCollege').show();
		$('#ExcelTabForCand').hide();

	});
	

var span = event.target;
	
	var testTakerId = span.id.split('-')[1];
	
	var isOpenSubTestTaker = document.getElementById("isOpenSubTestTaker_" + testTakerId);
	var isOpenSubTestTakerValue = isOpenSubTestTaker.value;
	if ( isOpenSubTestTakerValue === "false") {
		$.ajax({
			type: "GET",
			url: "./getSubtestTakerByTestTaker",
			data: "testTakerId=" + testTakerId,
			success: function(response) {
				
				if(response == ""){
					
					}else{
				
				/* alert(response + " subtest data"); */
				span.classList.add('caret-down');
				var values = response.split(",");
				var unList = document.createElement("ul");
				unList.style.listStyleType = 'none';
				$('#subtest-' + testTakerId).parent().remove();
				if (values.length !== 0) {
					for (var i = 0; i < values.length; i++) {
						var subTestTakerObj = values[i].split("_");
					/* 	alert(subTestObj); */
						if (subTestTakerObj !== "") {
							var list = document.createElement('li');
							list.style.listStyleType = 'none';
							list.style.width = '300px';
							list.innerHTML = '<span class="caret" id="subTestTaker-' + subTestTakerObj[1] + '" onclick="getExcelTab(event);getAllCandidates(event)">'
							+ subTestTakerObj[0] + '</span><br/>';
							unList.appendChild(list);
							var newInput = document.createElement("input");
							newInput.setAttribute("type", "hidden");
							newInput.setAttribute("id", "isOpenCandidateList_" + subTestTakerObj[1]);
							newInput.setAttribute("value", "false");
							unList.appendChild(newInput);
						}
					}
				}
				var li = span.parentNode;
				li.appendChild(unList);
				isOpenSubTestTaker.value = "true";
				
			}
			}
		});
	} else {
		span.classList.remove('caret-down');
		var li = span.parentNode;
		var unList = li.querySelector("ul");
		if (unList) {
			li.removeChild(unList);
		}
		isOpenSubTestTaker.value = "false";
	}
	
}

function getExcelTab(event){

	
	var span = event.target;
	var subtestTakerId = span.id.split('-')[1];
	

	$.ajax({
		type: "GET",
		url: "./testTakerByExcel",
		data: "subtestTakerId=" + subtestTakerId,
		success: function(response) {
           
			if (response === "no") {
				
                $('#ExcelTabForCand').show();
                $('#setCollege').hide() // Hide another div
            } else {
               // Show another div
            	$('#setCollege').show();
             }
			
		}
});
	
	
}


function getAllCandidates(event){
	

	var span = event.target;
	var subtestTakerId = span.id.split('-')[1];
	
	var isOpenCandidates = document.getElementById("isOpenCandidateList_" + subtestTakerId);
	var isOpenCandidatesValue = isOpenCandidates.value;
	if ( isOpenCandidatesValue === "false") {
	$.ajax({
		type: "GET",
		url: "./getAllCandidatesByStId",
		data: "subtestTakerId=" + subtestTakerId,
		success: function(response) {
           
            if(response == ""){
				
			}else{

					

					span.classList.add('caret-down');
					var values = response.split(",");
					var unList = document.createElement("ul");
					unList.style.listStyleType = 'none';
					$('#subtest-' + subtestTakerId).parent().remove();
					if (values.length !== 0) {
						for (var i = 0; i < values.length; i++) {
							var candidateObj = values[i].split("_");
							
						/* 	alert(subTestObj); */
							if (candidateObj !== "") {
								
								var list = document.createElement('li');
								list.style.listStyleType = 'none';
								list.style.width = '300px';
								list.innerHTML = '<span id="subTestTaker-' + candidateObj[1] +'<i class="fa fa-file-text-o" aria-hidden="true"></i><i class="fa fa-solid fa-envelope text-danger"></i> '
								+ candidateObj[0] + '</span><br/>';
								unList.appendChild(list);
								
							}
						}
					}
					var li = span.parentNode;
					li.appendChild(unList);
					isOpenCandidates.value = "true";
				
				}
		}
	});
	}

	else {
		span.classList.remove('caret-down');
		var li = span.parentNode;
		var unList = li.querySelector("ul");
		if (unList) {
			li.removeChild(unList);
		}
		isOpenCandidates.value = "false";
	}
}


</script>

</html>