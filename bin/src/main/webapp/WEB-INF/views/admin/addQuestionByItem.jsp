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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	overflow-y: scroll;
	overflow-x: scroll;
}

.btn{
background-color: #4CAF50; /* Green */
border: none;
color: white;
padding: 15px 32px;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 16px;
}
/* The Modal (background) */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

/* Modal Content/Box */
.modal-content {
	background-color: #23395d;
	color: white;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	margin: 15% auto;
}

/* Close Button */
.close {
	margin: right;
	align-items: right;
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
	float: right;
	justify-content: right;
	display: flex;
}

.close:hover, .close:focus {
	color: red;
	text-decoration: none;
	cursor: pointer;
}

.question {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}

.options {
	margin-top: 10px;
}

.options label {
	display: block;
	margin-bottom: 10px;
}

.options input[type="radio"] {
	display: none;
}

.options label:before {
	content: "";
	display: inline-block;
	width: 20px;
	height: 20px;
	margin-right: 10px;
	border: 1px solid #ccc;
	border-radius: 50%;
	vertical-align: middle;
}

.options input[type="radio"]:checked+label:before {
	background-color: #007bff;
	border-color: #007bff;
}

.options label span {
	vertical-align: middle;
	font-size: 16px;
}

.adressNav {
	background-color: lightblue;
	
}

.submitbtn{
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>

<body>

<div id="alertId">
		<c:if test="${alert eq 'save'}">
			<script type="text/javascript">
				swal({
					title : "Question Added Successfully!",
					text : "Click Ok to Continue !",
					icon : "success",
					button : "OK",
				});
			</script>
		</c:if>
	</div> 

	<div class="container"></div>

	<div class="test">
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
						<span></span>
					</c:if>
				</div>
			</c:if>

		<div class="row">
			<div class="col-md-6">
				<div class="box">
					<div class="h6 text-light head">
						<span class="p-2">Available Items</span>
					</div>
					<div class="row">
						<div class="form">
							

								<ul style="list-style-type: none;">
									<c:forEach items="${itemList}" var="items" varStatus="count">
										<li><i class="bi bi-folder-fill fa-2px text-warning"></i>
											<span id="item-${items.itemId}"
											onclick="getQuestionType(event)"> ${items.itemName} </span> <input
											type="hidden" id='isOpen_${items.itemId}' value="false"></li>
									</c:forEach>
								</ul>

								
							
						</div>

					</div>

				</div>

			</div>
			<div class="col-md-6">


				<div class="box" id="questionBox">
					<form id="formId" method="post" action="./saveSelectedQuestion">
					<div class="h6 text-light head">
						<span class="p-2">Selected Items</span>
					</div>
					<ul id="selectedQuestionsId">

					</ul>
					
					<input type="hidden" name="questionArray" id="questionArray">
					<input style="float:right; type="submit" value="Add Question" onclick="submitForm()" class="btn btn-primary submitbtn"
					id="btn">
					</form>
				</div>


			</div>
		</div>
	</div>
	</div>

	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<div id="modal-body"></div>
		</div>
	</div>




	<div class="footer mt-5">
		<p>@CSM All Right Reserved @ Online Examination System</p>
	</div>
</body>



<script type="text/javascript">
	var questionIds = [];
	function getQuestionType(event) {
		var span = event.target;
		var itemId = span.id.split('-')[1];
		var isOpen = document.getElementById("isOpen_" + itemId);
		var isOpenValue = isOpen.value;

		if (isOpenValue === "false") {
			$
					.ajax({
						type : "GET",
						url : "./showQuestionTypeById",
						data : {
							itemId : itemId,
						},
						success : function(response) {
							var values = response.split(",");
							var unList = document.createElement("ul");
							unList.style.listStyleType = 'none';
							for (var i = 1; i <= values.length; i++) {
								var list = document.createElement("li");
								list.style.listStyleType = 'none';
								list.innerHTML = '<i class="bi bi-folder-fill fa-2px text-warning"></i><span id="qType-'
										+ itemId
										+ '-'
										+ i
										+ '"  onclick="getAllsubItem(event)">'
										+ values[i - 1] + '</span><br/>';
								unList.appendChild(list);
								var newInput = document.createElement("input");
								newInput.setAttribute("type", "hidden");
								newInput.setAttribute("id",
										"isOpenQuestionType_" + itemId + "_"
												+ i);
								newInput.setAttribute("value", "false");
								unList.appendChild(newInput);
							}

							var li = span.parentNode;
							li.appendChild(unList);
							isOpen.value = "true";
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
	}

	function getAllsubItem(event) {
		var span = event.target;
		var itemId = span.id.split('-')[1];
		var questionTypeId = span.id.split('-')[2];
		var isOpenQuestionType = document.getElementById("isOpenQuestionType_"
				+ itemId + "_" + questionTypeId);
		var isOpenQuestionTypeValue = isOpenQuestionType.value;

		if (isOpenQuestionTypeValue === "false") {
			$
					.ajax({
						type : "GET",
						url : "./getAllsubItem",
						data : "itemId=" + itemId + '&questionTypeId='
								+ questionTypeId,
						success : function(response) {
							var values = response.split(",");
							var unList = document.createElement("ul");
							unList.style.listStyleType = 'none';
							if (values.length != 0) {
								for (var i = 0; i < values.length; i++) {
									var subItemObject = values[i].split("_");
									if (subItemObject != "") {
										var list = document.createElement("li");
										list.style.listStyleType = 'none';
										list.innerHTML = '<i class="bi bi-folder-fill fa-2px text-warning"></i><span id="subItem-'
												+ subItemObject[1]
												+ '-'
												+ questionTypeId
												+ '" onclick="getQuestionBySubItemId(event)">'
												+ subItemObject[0]
												+ '</span><br/>';
										unList.appendChild(list);
										var newInput = document
												.createElement("input");
										newInput.setAttribute("type", "hidden");
										newInput.setAttribute("id",
												"isOpenSubItem_"
														+ subItemObject[1]);
										newInput.setAttribute("value", "false");
										unList.appendChild(newInput);
									}
								}
							}
							var li = span.parentNode;
							li.appendChild(unList);
							isOpenQuestionType.value = "true";
						}

					});
		} else {
			var li = span.parentNode;
			var unList = li.querySelector("ul");
			if (unList) {
				li.removeChild(unList);
			}
			isOpenQuestionType.value = "false";
		}

	}

	///For Show All Question
	function getQuestionBySubItemId(event) {
		var span = event.target;
		var subitemId = span.id.split('-')[1];
		var questionTypeId = span.id.split('-')[2];
		var isOpenSubItem = document.getElementById("isOpenSubItem_"
				+ subitemId);
		var isOpenSubItemValue = isOpenSubItem.value;

		if (isOpenSubItemValue === "false") {
			$
					.ajax({
						type : "GET",
						url : "./getQuestionBySubId",
						data : "questionTypeId=" + questionTypeId
								+ '&subitemId=' + subitemId,
						success : function(response) {
							if (response != "") {
								var questionObject = response.split("_");
								var questionCode = questionObject[0];
								var values = questionObject[1].split(",");
								var unList = document.createElement("ul");
								unList.style.listStyleType = 'none';
								for (var i = 0; i < values.length; i++) {
									var list = document.createElement("li");
									list.style.listStyleType = 'none';
									var questionId = values[i];
									var questionIdWithCode = '"' + questionCode
											+ '_' + questionId + '"';
									var questionIdWithCodeObject = questionCode
											+ '_' + questionId;
									list.innerHTML = "<input type='checkbox' id='question_"
											+ questionId
											+ "' value='"
											+ questionId
											+ "' onclick='selectQuestion("
											+ questionIdWithCode
											+ ")' >"
											+ questionCode
											+ "_<span onclick='openModal("
											+ questionId
											+ ")'>"
											+ questionId
											+ "</span>";
									if (questionIds
											.includes(questionIdWithCodeObject)) {
										list.querySelector("input").checked = true;
									}
									unList.appendChild(list);
								}
								var li = span.parentNode;
								li.appendChild(unList);
								isOpenSubItem.value = "true";
							}
						}

					});
		} else {
			var li = span.parentNode;
			var unList = li.querySelector("ul");
			if (unList) {
				li.removeChild(unList);
			}
			isOpenSubItem.value = "false";
		}
	}
	function selectQuestion(questionIdWithCode) {
		var index = questionIds.indexOf(questionIdWithCode);
		if (index > -1) {
			questionIds.splice(index, 1);
		} else {
			questionIds.push(questionIdWithCode.toString());
		}
		getSelectedQuestionsId();
	}
	function submitForm() {
		const form = document.getElementById('formId');
		const hiddenField = document.getElementById('questionArray');
		hiddenField.value = questionIds;
		form.submit();
	}

	function getSelectedQuestionsId() {
		var selectedQuestionsId = document
				.getElementById("selectedQuestionsId");
		selectedQuestionsId.innerHTML = '';
		for (var i = 0; i < questionIds.length; i++) {
			var list = document.createElement("li");
			list.innerHTML = "<div>" + questionIds[i] + "</div>";
			console.log(questionIds[i]);
			selectedQuestionsId.appendChild(list);
		}

	}

	var modal = document.getElementById("myModal");

	var span = document.getElementsByClassName("close")[0];

	function openModal(questionId) {
		$.ajax({
			type : "GET",
			url : "./getQuestionBodyById",
			data : "questionId=" + questionId,
			success : function(response) {
				/* var modalBodyContent.innerHTML =response; */

				var modalBody = document.getElementById("modal-body");
				modalBody.innerHTML = response;

				modal.style.display = "block";
			}
		});

	}

	function closeModal() {
		modal.style.display = "none";

		var modalBody = document.getElementById("modal-body");
		modalBody.innerHTML = "";
	}

	span.onclick = function() {
		closeModal();
	};

	window.onclick = function(event) {
		if (event.target == modal) {
			closeModal();
		}
	};
</script>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded",() => {
		setTimeout(function(){
			document.getElementById('alertId').style.display='none';
		},3000);
	});
</script>





</html>