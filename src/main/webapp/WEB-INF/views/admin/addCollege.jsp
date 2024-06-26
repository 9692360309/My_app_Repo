<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>College Management</title>
<%@ include file="navbar.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
#divCenter {
	float: center;
}

.fa {
	color: #2759AE;
}

#reportTableDiv {
	display: none;
}
</style>
</head>
<body>
	<div id="alertId">
		<c:if test="${not empty exist}">
			<script type="text/javascript">
swal({
title : "failed !",
text : "${exist} Already Exist !",
icon : "error",
button : "try again!",
});
</script>
		</c:if>
		<script>
        // Check if errorMessage flash attribute is set
        const savecollege = "<c:out value='${savecollege}' />";
        if (savecollege) {
            swal({
                title: "Saved",
                text: savecollege,
                icon: "success",
                button: "OK",
            });
        }
    </script>
		<c:if test="${not empty saveDetail}">
			<script type="text/javascript">
			swal({
				title:'Saved!',
				text:' Message Sent successfully!!',
				icon: 'success',
				button : 'OK',
			});
</script>
		</c:if>
		<c:if test="${not empty delete}">
			<script type="text/javascript">
swal({
title : "Deleted",
text : " Successfully !",
icon : "success",
button : "ok!",
});
</script>
		</c:if>
		<c:if test="${not empty idNotNull}">
			<script type="text/javascript">
swal({
title : "Updated",
text : " Successfully !",
icon : "success",
button : "ok!",
});
</script>
		</c:if>
		
		<script>
        // Check if errorMessage flash attribute is set
        const errorMessage = "<c:out value='${errorMessage}' />";
        if (errorMessage) {
            swal({
                title: "Error",
                text: errorMessage,
                icon: "error",
                button: "try again!",
            });
        }
    </script>
    
	</div>


	<div class="container mt-5">
		<div class="card mx-6" style="width: 70rem; height: 60">
			<div class="card-header">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#addTab">Add College</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#viewTab">View Colleges</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#communication">Communication</a></li>

				</ul>
			</div>

			<div class="tab-content">
				<div id="addTab" class="card-body tab-pane active">
					<h2 class="text-primary text-center">Add College</h2>

					<form id="collegeForm" action="./saveCollege"
						onsubmit="return validateForm()">
						
						<div class="row">
							<div class="col-md-6">
								<input type="hidden" name="testTakerId" id="testTakerId"
									value="${updateCollege.testTakerId}"> <label
									for="collegeName" class="text font-weight-bold">College
									Name:</label> <input type="text" class="form-control"
									name="testTakerName" id="collegeName"
									value="${updateCollege.testTakerName}"> <span
									id="collegeNameEr" class="text-danger font-weight-bold"></span>
							</div>
							<div class="col-md-6">
								<label for="placementOfficer" class="text font-weight-bold">Placement
									Officer Name:</label> <input type="text" class="form-control"
									name="placementOfficer" id="placementOfficer"
									value="${updateCollege.placementOfficer}"> <span
									id="placementOfficerEr" class="text-danger font-weight-bold"></span>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-6">
								<label for="officerEmail" class="text font-weight-bold">Officer
									Email:</label> <input type="email" class="form-control"
									name="officerEmail" id="officerEmail"
									value="${updateCollege.officerEmail}"> <span
									id="officerEmailEr" class="text-danger font-weight-bold"></span>
							</div>
							<div class="col-md-6">
								<label for="phoneNumber" class="text font-weight-bold">Phone
									Number:</label> <input type="text" class="form-control"
									name="phoneNumber" id="phoneNumber"
									value="${updateCollege.phoneNumber}"> <span
									id="phoneNumberEr" class="text-danger font-weight-bold"></span>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-md-7 mx-auto">
								<!-- Add mx-auto class here -->
								<label for="collegeAddress" class="text font-weight-bold">College
									Address:</label>
								<textarea class="form-control" name="collegeAddress" oninput="limitText(this , 20)"
									id="collegeAddress">${updateCollege.collegeAddress}</textarea>
								<span id="collegeAddressEr" class="text-danger font-weight-bold"></span>
							</div>
						</div>
						<div class="text-center mt-3" id="divCenter">
							<input type="submit" class="btn btn-info"> <input
								class="btn btn-danger" type="reset">
						</div>
					</form>
				</div>

				<div id="viewTab" class="tab-pane">
					<div class="container mt-5">
						<h2>College List</h2>
						<table class="table">
							<thead>
								<tr>
									<th>College Name</th>
									<th>Placement Officer</th>
									<th>Email</th>
									<th>Phone Number</th>
									<th>College Address</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${collegeList}" var="college">
									<tr>
										<td>${college.testTakerName}</td>
										<td>${college.placementOfficer}</td>
										<td>${college.officerEmail}</td>
										<td>${college.phoneNumber}</td>
										<td>${college.collegeAddress}</td>
										<td><a
											href="http://localhost:8088/exam/updateCollege?testTakerId=${college.testTakerId}"
											class="text-primary mx-2"><i class="bi bi-pencil-square"></i></a>
											<a
											href="http://localhost:8088/exam/deleteCollege?testTakerId=${college.testTakerId}"
											class="text-danger mx-2"><i class="bi bi-trash"></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>

				</div>


				<div id="communication" class="tab-pane">
					<div class="container mt-5 offset-md-2">
						<form action="./saveMessage" id="messageForm"
							enctype="multipart/form-data" method="post"
							onsubmit="return checkCommunication()">
							<div class="form-group col-md-8">
								<label class="font-weight-bold">College Name<span
									class="text-danger">*</span>
								</label> <select class="form-control" name="testTakerName"
									id="testTakerNameId" onchange="getEmailId()">
									<option value="select">Choose College</option>
									<c:forEach items="${collegeList}" var="t">
										<option value="${t.testTakerId}">${t.testTakerName}</option>
									</c:forEach>
								</select> <span id="collegeNameErCom"
									class="text-danger font-weight-bold"></span>
							</div>

							<div class="form-group col-md-8">
								<lable class="text font-weight-bold">Email</lable>
								<div>
									<input type="text" name="email" id="emailId"
										class="form-control" disabled>
								</div>
							</div>


							<div class="form-group col-md-8">
								<label for="message" class="text font-weight-bold">Message:</label>
								<textarea class="form-control" name="message" id="message"></textarea>
								<span id="messageEr" class="text-danger font-weight-bold"></span>
							</div>

							<div class="form-group col-md-8">
								<label for="attachments" class="text font-weight-bold">
									<i class="fa fa-light fa-paperclip fa-lg"></i>&nbsp;&nbsp;Attach
									Files:
								</label> <input type="file" class="form-control-file" name="attachments"
									id="attachments" multiple> <span id="attachmentsEr"
									class="text-danger font-weight-bold"></span>
							</div>
							<div class="form-group col-md-4 offset-md-3" align="center">
								<button type="submit" class="btn btn-success">Send
									Message</button>
								<button type="button" class="btn btn-primary ml-2"
									onclick="showReports()" oninput="return limitText();">View
									Reports</button>

							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="reportTableDiv" class="tab-pane">
		<h2 class="text-center">Reports</h2>

		<table border="1" class="table table-striped" id="reportsTable">
			<thead>
				<tr>
					<th>SL No.</th>
					<th>TestTaker Name</th>
					<th>College Address</th>
					<th>Placement Officer</th>
					<th>Phone Number</th>
					<th>Email</th>
					<th>Message</th>

				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>

		<div id="showMoreButton" class="text-center mt-3">
			<button class="btn btn-secondary" onclick="loadMoreRecords()">Show
				More</button>
		</div>
		<div id="showLessButton" class="text-center mt-3">
			<button class="btn btn-secondary" onclick="loadRecords(5)">Show
				Less</button>
		</div>
	</div>




	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script>
    function limitText(collegeAddress, maxWords) {
        const text = collegeAddress.value;
        const words = text.trim().split(/\s+/);
        const wordCount = words.length;
        const wordCountSpan = document.getElementById("wordCount");

        if (wordCount > maxWords) {
            // If the word count exceeds the limit, prevent typing
            collegeAddress.value = words.slice(0, maxWords).join(' ');
        }

        // Calculate the number of words left and update the word count indicator
        const wordsLeft = Math.max(0, maxWords - wordCount);
        wordCountSpan.textContent = `${wordsLeft}/${maxWords}`;
    }
</script>


	<script type="text/javascript">
    function showReports() {
    	 var viewTabDiv = document.getElementById('reportTableDiv');
         
         // Show the viewTab div
         viewTabDiv.style.display = 'block';
        loadRecords(5);
    }

    function loadRecords(limit) {
        // Use AJAX to fetch communication records from the server
        $.ajax({
            type: 'GET',
            url: "./fetch_communication_records", // Replace with your backend endpoint
            data: { limit: limit },
            success: function (records) {
                // Populate the table with the fetched records
                const reportsTable = document.getElementById('reportsTable').getElementsByTagName('tbody')[0];
                reportsTable.innerHTML = ''; // Clear existing data
                let index = 1;

                for (const record of records) {
                    
                    const row = reportsTable.insertRow();
                    
                  
                    row.insertCell().textContent = index;
                    
                    row.insertCell().textContent = record.testTaker.testTakerName;
                    row.insertCell().textContent = record.testTaker.collegeAddress;
                    row.insertCell().textContent = record.testTaker.placementOfficer;
                    row.insertCell().textContent = record.testTaker.phoneNumber;
                    row.insertCell().textContent = record.testTaker.officerEmail;
                    row.insertCell().textContent = record.message;
                    
                    // Increment the index for the next record
                    index++;
                }
            },
            error: function (error) {
                console.error(error);
            }
        });
        document.getElementById("showMoreButton").style.display = "block";
        document.getElementById("showLessButton").style.display = "none";
    }

    let currentLimit = 5;

    function loadMoreRecords() {
      /*   currentLimit += 5; */ // Increase the limit by 5
        loadRecords(0);
        document.getElementById("showMoreButton").style.display = "none";
        document.getElementById("showLessButton").style.display = "block";
    }
</script>

	<script src="js/script.js">
		$(document).ready(function() {
			$('#collegeForm').submit(function(event) {
				event.preventDefault(); // Prevent form submission

				// Get form data
				var collegeName = $('#collegeName').val();
				var placementOfficer = $('#placementOfficer').val();
				var officerEmail = $('#officerEmail').val();
				var phoneNumber = $('#phoneNumber').val();
				var collegeAddress = $('#collegeAddress').val();

				var data = {
					collegeName : collegeName,
					placementOfficer : placementOfficer,
					officerEmail : officerEmail,
					phoneNumber : phoneNumber,
					collegeAddress : collegeAddress
				};

				$.ajax({
					type : 'POST',
					url : 'add_college_backend.jsp',
					data : data,
					success : function(response) {

						console.log(response);
					},
					error : function(error) {

						console.error(error);
					}
				});
			});
		});

		$(document).ready(function() {
			$('#messageForm').submit(function(event) {
				event.preventDefault();

				var message = $('#message').val();

				// Prepare data to be sent to the server
				var data = {
					message : message
				};

				// Perform AJAX request to the server-side endpoint for handling message sending
				$.ajax({
					type : 'POST',
					url : 'send_message_backend.jsp', // Replace with your backend endpoint
					data : data,
					success : function(response) {
						// Handle success response, e.g., show a success message or update UI
						console.log(response);
					},
					error : function(error) {
						// Handle errors if any
						console.error(error);
					}
				});
			});
		});
	</script>
	<script type="text/javascript">
		function getEmailId() {

			var pId = $('#testTakerNameId').val();
			$.ajax({
				url : "./getEmailByCollege",
				type : "GET",
				data : {
					collegeId : pId
				},
				success : function(result) {

					$("#emailId").val(result);
				}
			});
		}
		function validateForm() {

			var collegeName = document.getElementById("collegeName").value;
			var placementOfficer = document.getElementById("placementOfficer").value;
			var emailIdPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
			var officerEmail = document.getElementById("officerEmail").value;
			var phoneNumber = document.getElementById("phoneNumber").value;
			var collegeAddress = document.getElementById("collegeAddress").value;

			if (collegeName == "" || collegeName.length < 2) {
			document.getElementById("collegeNameEr").innerText = "College must be at least 2 characters.";
			return false; // Prevent form submission
			} else {
			document.getElementById("collegeNameEr").innerText = ""; // Clear error message
			// Allow form submission
			}

			if (placementOfficer == "" || placementOfficer.length < 2) {
			document.getElementById("placementOfficerEr").innerText = "Officer Name must be at least 2 characters.";
			return false; // Prevent form submission
			} else {
			document.getElementById("placementOfficerEr").innerText = ""; // Clear error message
			// Allow form submission
			}

			if (!officerEmail.match(emailIdPattern)) {
			document.getElementById("officerEmailEr").innerText = "Email format should be (csmpl@gmail.com).";
			return false; // Prevent form submission
			} else {
			document.getElementById("officerEmailEr").innerText = ""; // Clear error message
			// Allow form submission

			}
			if (phoneNumber == "" || phoneNumber.length != 10) {
			document.getElementById("phoneNumberEr").innerText = "Number must be at least 10 characters.";
			return false; // Prevent form submission
			} else {
			document.getElementById("phoneNumberEr").innerText = ""; // Clear error message
			// Allow form submission
			}
			if (collegeAddress == "" || collegeAddress.length < 2) {
			document.getElementById("collegeAddressEr").innerText = "Address must be at least 2 characters.";
			return false; // Prevent form submission
			} else {

			document.getElementById("collegeAddressEr").innerText = ""; // Clear error message
			// Allow form submission
			}
			return true;
			}

		//Communication Tab
		function checkCommunication() {
			
			var collegeName = document.getElementById("testTakerNameId").value;
			var message = document.getElementById("message").value;
			var attachments = document.getElementById("attachments").value;
			if (collegeName === 'select') {

			document.getElementById("collegeNameErCom").innerText = "select a college";
			return false; // Prevent form submission
			} else {
			document.getElementById("collegeNameErCom").innerText = ""; // Clear error message
			// Allow form submission
			}
			if (message == "" || message.length < 2) {
			document.getElementById("messageEr").innerText = "message must be at least 2 characters.";
			return false; // Prevent form submission
			} else {
			document.getElementById("messageEr").innerText = ""; // Clear error message
			// Allow form submission
			}

			if (attachments == "") {
			document.getElementById("attachmentsEr").innerText = "you must attach a file.";
			return false; // Prevent form submission
			} else {
			document.getElementById("attachmentsEr").innerText = ""; // Clear error message
			// Allow form submission

			}
			return true;
			}		
		
	</script>
</body>
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
</html>