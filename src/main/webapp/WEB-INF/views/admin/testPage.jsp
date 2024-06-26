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
<link
	href="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.12/dist/sweetalert2.min.css
"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.12/dist/sweetalert2.all.min.js
"></script>
</head>
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

/* Show the nested list when the user clicks on the caret/arrow (with
JavaScript) */
.active {
	display: block;
}

.sidebar {
	width: 20%;
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

#settingSetTable {
	display: none;
}
</style>
<body>
	<div>
		<div class="sidebar">
			<ul style="list-style-type: none;">

				<li><span id="item-${testId}" class="caret"
					onclick="getTest(event)">Test </span> <input type="hidden"
					id='isOpen_${tests.testId}' value="false"></li>

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
					href="./getTestList"><span>${testNavName}</span></a>
			</c:if>
		</div>
	</c:if>
	<c:if test="${SetDiv eq 'yes'}">

		<div id="addTestAndSubTestId"
			style="margin-top: 25px; margin-left: 300px; margin-right: 10px; border: 1px solid black;">
			<p align="right">
				<span class="text-danger">*</span> indicates mandatory fields
			</p>
			<div class="card text-center"
				style="margin-right: 5rem; margin-left: 5rem;">
				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active" id="testId111"
							onclick="openAddTest()" style="cursor:pointer">Add Test</a></li>
						<li class="nav-item"><a class="nav-link" id="subTestId"
							onclick="openSubTest()" style="cursor:pointer">Add SubTest</a></li>

					</ul>
				</div>

				<div id="test">
					<form method="post">
						<input type="hidden" name="userId" id="userId">
						<div class="card-body">

							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Add Test :<span
									class="text-danger">*</span></label> <input type="text" name="testName"
									id="testNameId" class="form-control"> <span
									id="testFormat" class="text-danger font-weight-bold"></span>
							</div>
							<div class="form-group col-md-6 offset-md-3" align="center">
								<input type="button" id="tabOneSubmit" onclick="validateTest()"
									value="Submit" class="btn btn-success">&nbsp;&nbsp; <input
									type="reset" value="Reset" class="btn btn-danger">

							</div>
						</div>
					</form>
				</div>

				<div id="subTest">
					<form method="post">
						<div class="container">
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Test Name<span
									class="text-danger">*</span>
								</label> <select class="form-control" name="testName" id="testId"
									>
									<option value="0">--select--</option>
									<c:forEach items="${testList}" var="test">
										<option value="${test.testId}">${test.testName}</option>
									</c:forEach>
								</select> <span id="TestEr" class="text-danger font-weight-bold"></span>
							</div>
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Add SubTest :<span
									class="text-danger">*</span></label> <input type="text"
									name="subTestName" id="subTestNameId" class="form-control">
								<span id="subTestEr" class="text-danger font-weight-bold"></span>
							</div>
							<div class="form-group col-md-6 offset-md-3" align="center">
								<input type="button" id="tabOneSubmit"
									onclick="return validateSubTest()" value="Submit"
									class="btn btn-success">&nbsp;&nbsp; <input
									type="reset" value="Reset" class="btn btn-danger">

							</div>

						</div>
					</form>

				</div>

			</div>
		</div>

	</c:if>

	<div id="setDivId">
		<div class="container"
			style="margin-top: 25px; margin-left: 300px; margin-right: 50px; border: 1px solid black; width: 1000px;">
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
								value="byItem">By Category</a> <span> | </span> <a
								href="./byTestLink" name="property" id="propertyId"
								value="byTest">By Set</a> <br> <span id="genderEr"
								class="text-danger font-weight-bold"></span>
						</div>

					</div>
				</form>
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

<script type="text/javascript">

$(document).ready(function() {
	$('#addTestAndSubTestId').show();
	$('#setDivId').hide();

});


function getTest(event) {
	/// alert("abc");
	
	$(document).ready(function() {
	$('#addTestAndSubTestId').show();
	$('#setDivId').hide();

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
			url : "./getAllTest",
			success : function(response) {
				$('#addTestAndSubTestId').show();
				//alert(response);
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
					
					var testId = values[i].split("_")[1];
					var testName = values[i].split("_")[0];
					//alert(testId+"   "+testName);
					var list = document.createElement("li");
					list.style.listStyleType = 'none';
					list.innerHTML = '<span class="caret" id="qType-'
							+ testId + '-' + i
							+ '" onclick="getSubTest(event)">'
							+ testName + '</span><br/>';
					unList.appendChild(list);

					var newInput = document.createElement("input");
					newInput.setAttribute("type", "hidden");
					newInput.setAttribute("id", "isOpenSubTest_"
							+ testId);
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



function getSubTest(event) {

	$(document).ready(function() {
		$('#addTestAndSubTestId').show();
		$('#setDivId').hide();

	});
	
	var span = event.target;
	span.classList.add('caret-down');
	var testId = span.id.split('-')[1];
	/* alert(testId); */
	var isOpenSubTest = document.getElementById("isOpenSubTest_" + testId);
	var isOpenSubTestValue = isOpenSubTest.value;
	if (isOpenSubTestValue === "false") {
		$.ajax({
			type: "GET",
			url: "./getAllSubtestByTest",
			data: "testId=" + testId,
			success: function(response) {
				
				/* alert(response + " subtest data"); */
				var values = response.split(",");
				var unList = document.createElement("ul");
				unList.style.listStyleType = 'none';
				$('#subtest-' + testId).parent().remove();
				if (values.length !== 0) {
					for (var i = 0; i < values.length; i++) {
						var subTestObj = values[i].split("_");
					/* 	alert(subTestObj); */
						if (subTestObj !== "") {
							var list = document.createElement('li');
							list.style.listStyleType = 'none';
							list.style.width = '300px';
							list.innerHTML = '<span class="caret" id="subTest-' + subTestObj[1] + '" onclick="addSet(event)">'
							+ subTestObj[0] + '</span><br/>';
							unList.appendChild(list);
							var newInput = document.createElement("input");
							newInput.setAttribute("type", "hidden");
							newInput.setAttribute("id", "isOpen_" + subTestObj[1]);
							newInput.setAttribute("value", "false");
							unList.appendChild(newInput);
						}
					}
				}
				var li = span.parentNode;
				li.appendChild(unList);
				isOpenSubTest.value = "true";
				
			}
		});
	} else {
		span.classList.remove('caret-down');
		var li = span.parentNode;
		var unList = li.querySelector("ul");
		if (unList) {
			li.removeChild(unList);
		}
		isOpenSubTest.value = "false";
	}
}


function addSet(){
	var span = event.target;
   
	var subTestId = span.id.split('-')[1];
	
	$.ajax({
			type: "GET",
			url: "./addSet",
			data: "sId=" + subTestId,
			success: function(response) {
			
				 if (response === "no") {
					
		                $('#setDivId').show();
		                $('#addTestAndSubTestId').hide() // Hide another div
		            } else {
		               // Show another div
		            	$('#addTestAndSubTestId').show();
		             }
			}
	});
												
}	




</script>


<script type="text/javascript">

function validateSubTest() {
    let testName = $("#testId").val();
    let subTestName = $("#subTestNameId").val().trim();

    if (testName === "0" || subTestName.length === 0) {
        Swal.fire({
            icon: 'error',
            title: 'Failed',
            text: 'All fields are required'
        });
    } else {
        $.ajax({
            url: "checkSubTestName",
            type: "GET",
            data: {
                testName: testName,
                subTestName: subTestName
            },
            success: function (response) {
                if (response === 'exists') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Failed',
                        text: subTestName + ' SubTest is already Exist'
                    });
                } else {
                    Swal.fire({
                        title: 'Do you want to Save Data?',
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Save'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url: "addSubTest",
                                type: "POST",
                                data: {
                                    testName: testName,
                                    subTestName: subTestName
                                },
                                success: function (response) {
                                    if (response === 'notExists') {
                                        Swal.fire(
                                            'Saved!',
                                            subTestName + ' SubTestName successfully Saved',
                                            'success'
                                        ).then(() => {
                                            // Reload the page after successful save and Swal close
                                            location.reload();
                                        });;
                                    } else {
                                    	Swal.fire(
                                                'Saved!',
                                                subTestName + ' SubTestName successfully Saved',
                                                'success'
                                            ).then(() => {
                                                // Reload the page after successful save and Swal close
                                                location.reload();
                                            });;
                                    }
                                    
                                }
                            });
                        }
                    });
                }
            }
        });
    }

    return false;
}



function validateTest() {
    let testName = $("#testNameId").val().trim();

    if (testName.length === 0) {
        Swal.fire({
            icon: 'error',
            title: 'Failed',
            text: 'TestName is required'
        });
    } else {
        // Check if the testName already exists
        $.ajax({
            url: "checkTestName", // Create a new mapping for checking test name
            type: "GET",
            data: {
                testName: testName
            },
            success: function (response) {
                if (response === 'exists') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Failed',
                        text: testName + ' Test is already Exist'
                    });
                } else {
                    Swal.fire({
                        title: 'Do you want to Save Data?',
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Save'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url: "addTest",
                                type: "POST",
                                data: {
                                    testName: testName
                                },
                                success: function (response) {
                                    if (response === 'notExists') {
                                        Swal.fire(
                                            'Saved!',
                                            testName + ' TestName successfully Saved',
                                            'success'
                                        ).then(() => {
                                            // Reload the page after successful save and Swal close
                                            location.reload();
                                        });
                                    } 
                                    else {
                                    	Swal.fire(
                                                'Saved!',
                                                testName + ' TestName successfully Saved',
                                                'success'
                                            ).then(() => {
                                                // Reload the page after successful save and Swal close
                                                location.reload();
                                            });
                                    }   
                                }
                            });
                        }
                    });
                }
            }
        });
    }

    return false;
}



</script>


</html>