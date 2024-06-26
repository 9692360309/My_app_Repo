<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">

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
	position: absolute;
	padding-top: 0px 10px;
	z-index: 9999999999999999999999999999;
	overflow-y: scroll;
	overflow-x: scroll;
}

.sidebar2 {
	width: 20%;
	background: #eee;
	height: 29%;
	bottom: 0px;
	position: fixed;
	padding-top: 0px 10px;
	padding: 5px;
	z-index: 9999999999999999999999999999;
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

.box {
	height: 50%;
	width: 50%;
	padding: 3px;
	border: 1px solid gray;
	margin-top: 20px;
	background-color: white;
}

.adressNav {
	background-color: lightblue;
	margin-left: 300px;
}

#folderImg {
	height: 30px;
	width: 30px;
}
</style>
<body>
	<div>
		<div class="sidebar">
			<div>
				<ul style="list-style: none;">
					<li>
						<%-- <%
// create a folder object
File folder = new File("C:\\");

// get all the files and folders
File[] listOfFiles = folder.listFiles();

// iterate over the list and print out the file/folder names
for (int i = 0; i < listOfFiles.length; i++) {
// print out the filename
out.println(listOfFiles[i].getName());
}
%> --%> <a href="./getItemList"><i
							class="bi bi-folder-fill fa-2px text-warning"></i>Items</a>

						<ul style="list-style-type: none;">
							<c:forEach items="${itemList}" var="items" varStatus="count">
								<li><i class="bi bi-folder-fill fa-2px text-warning"></i> <a
									href="./showQuestionType?itemId=${items.itemId}">${items.itemName}
										<ul style="list-style-type: none;">
											<c:if test="${ivalue eq items.itemId}">
												<c:forEach items="${questionTypeList}" var="qt">
													<li><i class="bi bi-folder-fill fa-2px text-warning"></i>&nbsp;
														<a
														href="./showSubItem?questionTypeId=${qt.questionTypeId}">${qt.questionTypeName}

															<ul style="list-style-type: none;">
																<c:if test="${key eq qt.questionTypeId}">
																	<c:forEach items="${listSubItem}" var="sub">
																		<li><i
																			class="bi bi-folder-fill fa-2px text-warning"></i>&nbsp;
																			<a href="./questionList?subItemId=${sub.subItemId}">${sub.subItemName}
																				<ul style="list-style-type: none;">
																					<c:if test="${key1 eq sub.subItemId}">
																						<c:forEach items="${questionList}" var="ques"
																							varStatus="counter">
																							<li><i class="bi bi-file-text text-dark"></i>&nbsp;
																								<a
																								href="./showQuestion?questionId=${ques.questionId}">${firstOneChar}${counter.count}</a>
																							</li>
																						</c:forEach>
																					</c:if>

																				</ul>
																		</a></li>
																	</c:forEach>
																</c:if>

															</ul>
													</a></li>
												</c:forEach>
											</c:if>

										</ul>


								</a></li>


							</c:forEach>
						</ul>

					</li>
				</ul>

			</div>

		</div>
		<!-- <div class="sidebar2">
			<a href="" class="box">New Item</a> <a href="" class="box">New
				SubItem</a> <a href="" class="box">Delete</a>
		</div> -->
		<c:if test="${adressNav ne null }">

			<div class="adressNav">

				<span><i class="bi bi-folder-fill fa-2px text-warning"></i>items/
				</span>
				<c:if test="${itemNav eq 'yes'}">
					<a style="text-decoration: none" class="text-dark"
						href="./getItemList"><span> ${itemName} /</span></a>
				</c:if>
				<c:if test="${type ne null }">
					<a style="text-decoration: none" class="text-dark"
						href="./showQuestionType?itemId=${itemData}"><span>${subItem }
							/</span></a>
				</c:if>
				<c:if test="${question ne null }">
					<a style="text-decoration: none" class="text-dark"
						href="./showSubItem?questionTypeId=${qTypeData}"><span>${subItemId }</span></a>
				</c:if>

			</div>
		</c:if>
	</div>
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
						<li class="nav-item"><a class="nav-link active" id="addId"
							onclick="openAddItems()">Add Items</a></li>
						<li class="nav-item"><a class="nav-link" id="subItemId"
							onclick="openSubItem()">Add SubItem</a></li>
						<li class="nav-item"><a class="nav-link" id="addQuestionId"
							onclick="questionEnter()">Add Questions</a></li>
					</ul>
				</div>

				<div id="add">
					<form action="./addItems" method="post">
						<input type="hidden" name="userId" id="userId">
						<div class="card-body">

							<div class="form-group col-md-6 offset-md-3">
								<label>Add Item :<span class="text-danger">*</span></label> <input
									type="text" name="itemName" id="itemNameId"
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


				<div id="subItem">
					<form action="./addSubItem" method="post">
						<div class="container">
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Item Name<span
									class="text-danger">*</span>
								</label> <select class="form-control" name="itemName" id="itemId">
									<option value="select">--select--</option>
									<c:forEach items="${itemListsss}" var="item">
										<option value="${item.itemId}">${item.itemName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-md-6 offset-md-3">
								<label>Question Type :<span class="text-danger">*</span></label>
								<select name="type" class="form-control" id="type">
									<option>--Select--</option>
									<c:forEach items="${questionTypeList}" var="qt">
										<option value="${qt.questionTypeId}">${qt.questionTypeName}</option>
									</c:forEach>
								</select> <span id="emailEr" class="text-danger font-weight-bold"></span>
							</div>

							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Add SubItem :<span
									class="text-danger">*</span></label> <input type="text"
									name="subItemName" id="subItemNameId" class="form-control">
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


				<div id="addQuestion">

					<form action="./saveQuestions" method="post">

						<div class="form-group col-md-6 offset-md-3">
							<label class="font-weight-bold">Item Name<span
								class="text-danger">*</span>
							</label> <select class="form-control" name="iId" id="iId">
								<option value="select">-select-</option>
								<c:forEach items="${itemListsss}" var="item">
									<option value="${item.itemId}">${item.itemName}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group col-md-6 offset-md-3">
							<label>Question Type :<span class="text-danger">*</span></label>
							<select onchange="openSubItemById()" onclick="showHide()"
								onmouseover="showHideAnswer()" class="form-control" id="typeId"
								name="type">
								<option value="objective">-Select-</option>
								<c:forEach items="${questionTypeList}" var="qt">
									<option value="${qt.questionTypeId}">${qt.questionTypeName}</option>
								</c:forEach>
							</select> <span id="emailEr" class="text-danger font-weight-bold"></span>
						</div>

						<div class="form-group col-md-6 offset-md-3">
							<label class="font-weight-bold">SubItem Name<span
								class="text-danger">*</span>
							</label> <select class="form-control" name="sName" id="sName">
								<option value="0">-select-</option>
							</select>
						</div>

						<div class="form-group col-md-6 offset-md-3">
							<label>Question Text :<span class="text-danger">*</span></label>
							<input type="text" name="questionText" id="questionTextId"
								class="form-control"> <span id="applicantNameEr"
								class="text-danger font-weight-bold"></span>
						</div>

						<div class="form-group col-md-6 offset-md-3" id="options"
							style="display: none;">
							<div class="name-list">
								<label for="option1">Option :</label> <input type="text"
									id="option1" name="option1" class="form-control"><br>
							</div>
							<div class="sign-btn signup-page">
								<a class="btn btn-info sign-bttn">+</a>
							</div>

							<div class="form-group">
								<label>Correct Answer :<span class="text-danger">*</span></label>
								<input type="text" name="correctAns" id="correctAnsId"
									class="form-control"> <span id="applicantNameEr"
									class="text-danger font-weight-bold"></span>
							</div>
						</div>


						<div class="form-group col-md-6 offset-md-3" align="center">
							<input type="submit" id="tabOneSubmit"
								onclick="return confirm('Are you want to Save your Details');"
								value="Submit" class="btn btn-success">&nbsp;&nbsp; <input
								type="reset" value="Reset" class="btn btn-danger">

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
		$('#add').show();
		$('#subItem').hide();
		$('#addQuestion').hide();

	});
	function openAddItems() {
		$("#addId").addClass('active')
		$("#subItemId").removeClass('active')
		$("#addQuestionId").removeClass('active')

		$("#add").show();
		$("#subItem").hide();
		$("#addQuestion").hide();
	}

	function openSubItem() {
		$("#addId").removeClass('active')
		$("#subItemId").addClass('active')
		$("#addQuestionId").removeClass('active')

		$("#add").hide();
		$("#subItem").show();
		$("#addQuestion").hide();
	}

	function questionEnter() {
		$("#addId").removeClass('active')
		$("#subItemId").removeClass('active')
		$("#addQuestionId").addClass('active')

		$("#add").hide();
		$("#subItem").hide();
		$("#addQuestion").show();
	}
</script>
<script type="text/javascript">
	function openSubItemById() {
		var typeId = $("#typeId").val();
		alert(typeId);
		$.ajax({
			type : "GET",
			url : "./getSubItemListByQuestionTypeId",
			data : "questionTypeId=" + typeId,
			success : function(response) {

				$("#sName").html(response);
			}
		});
	}
</script>

<script>
	$(function() {
		var len = 5; // for testing purpose I am using 4 you can change it to 18
		$('.sign-bttn').on('click', function() {
			if ($('#options .name-list').length == len) {
				alert("You can't add more");
				return false;
			}
			$clone = $('#options .name-list:first').clone();
			$clone.find('input').val(''); // empty the new clone field
			$(this).parent('div').before($clone);
		});
	});
</script>

<script>
	function showHide() {
		var type = document.getElementById("typeId").value;

		if (type == "2") {
			document.getElementById("options").style.display = "block";
			document.getElementById("text").style.display = "none";
		} else {
			document.getElementById("options").style.display = "none";
			document.getElementById("text").style.display = "block";

		}
	}
</script>

</html>