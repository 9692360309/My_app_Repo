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
	overflow-y: scroll;
	overflow-x: scroll;
}

.btn {
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

.submitbtn {
	margin-right: 0px;
	margin-bottom: 0px;
}

.myButton:before {
	content: ">";
	display: inline-block;
	margin-right: 10px;
}
</style>

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


								<ul style="list-style-type: none;">
									<c:forEach items="${testList}" var="tests" varStatus="count">
										<li><i class="bi bi-folder-fill fa-2px text-warning"></i>
											<span id="item-${tests.testId}"
											onclick="getSubtestByTest(event)"> ${tests.testName} </span>
											<input type="hidden" id='isOpen_${tests.testId}'
											value="false"></li>
									</c:forEach>
								</ul>



							</div>

						</div>

					</div>

				</div>
				<div class="col-md-6">


					<div class="box" id="questionBox">
						<form id="formId" method="post"
							action="./saveSelectedQuestionBySubtest">
							<div class="h6 text-light head">
								<span class="p-2">Selected Question By Test</span>
							</div>
							<ul id="selectedSubQuestionsId">

							</ul>

							<input type="hidden" name="questionArrays" id="questionArrays">

							<input type="hidden" name="subTestId" id="subTestId"
								value=${subTestId}> <input style="float: right;"
								submit;" value="Add to Set" onclick="submitForm()"
								class="btn btn-primary submitbtn" id="btn">
						</form>
					</div>


				</div>
			</div>
		</div>
	</div>

	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<div id="modal-body-2"></div>
		</div>
	</div>

	<div class="footer mt-5">
		<p>@CSM All Right Reserved @ Online Examination System</p>
	</div>

</body>
<script type="text/javascript">
var questionsubIds = [];
var sid = ${subTestId};
function getSubtestByTest(event) {
var span = event.target;
var testId = span.id.split('-')[1];
var isOpen = document.getElementById("isOpen_" + testId);
var isOpenValue = isOpen.value;

if (isOpenValue === "false") {
$
.ajax({
type : "GET",
url : "./getAllSubtestByTest",
data : {
testId : testId,
},
success : function(response) {
var values = response.split(",");
var unList = document.createElement("ul");
unList.style.listStyleType = 'none';
for (var i = 0; i <= values.length - 1; i++) {
var subTestId = values[i].split("_")[1];
var list = document.createElement("li");
list.style.listStyleType = 'none';
list.innerHTML = '<span class="myButton"></span><i class="bi bi-folder-fill fa-2px text-warning"></i><span id="subtest-'
+ subTestId
+ '"  onclick="getAllQuestionBySubtest(event)">'
+ values[i] + '</span><br/>';
unList.appendChild(list);
var newInput = document.createElement("input");
newInput.setAttribute("type", "hidden");
newInput.setAttribute("id",
"isOpenSubtestType_" + subTestId);
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

function getAllQuestionBySubtest(event) {
var span = event.target;
var subtestId = span.id.split('-')[1];

var isOpenSubTest = document.getElementById("isOpenSubtestType_"
+ subtestId);

var isOpenSubTestValue = isOpenSubTest.value;

if (isOpenSubTestValue === "false") {
$
.ajax({
type : "GET",
url : "./getAllQuestionBySubTestId",
data : "subtestId=" + subtestId,
success : function(response) {
if (response != "") {
values = response.split(",");
var questionObject = response.split("_");

var questionCode = questionObject[0];
var unList = document.createElement("ul");
unList.style.listStyleType = 'none';
for (var i = 0; i < values.length; i++) {
var list = document.createElement("li");
list.style.listStyleType = 'none';
var questionId = values[i];
var questionIdWithCode = '"' 
+ questionId + '"';

var questionIdWithCodeObject = '_'
+ questionId;

var qId = questionId.split("_");
var qIds = qId[1];
list.innerHTML = "<input type='checkbox' id='question_"
+ questionId
+ "' value='"
+ questionId
+ "' onclick='selectQuestionOfSubtest("
+ questionIdWithCode
+ ")' >"
+ "<span onclick='openModal("
+ qIds
+ ")'>"
+ questionId
+ "</span>  ";
if (subtestId == sid) {
//questionIds.push(questionId); 
                        list.querySelector("input").checked = true;
                    }
unList.appendChild(list);
}
//getSelectedQuestionsBySubTestId();
var li = span.parentNode;
li.appendChild(unList);
isOpenSubTest.value = "true";
}
}

});
} else {
var li = span.parentNode;
var unList = li.querySelector("ul");
if (unList) {
li.removeChild(unList);
}
isOpenSubTest.value = "false";
}
}

function selectQuestionOfSubtest(questionIdWithCode) {
var index = questionsubIds.indexOf(questionIdWithCode);
if (index > -1) {
questionsubIds.splice(index, 1);
} else {
questionsubIds.push(questionIdWithCode.toString());
}
getSelectedQuestionsBySubTestId();
}

function submitForm() {
const form = document.getElementById('formId');
const hiddenField = document.getElementById('questionArrays');
hiddenField.value = questionsubIds;
form.submit();
}



function getSelectedQuestionsBySubTestId() {
var selectedSubQuestionsId = document.getElementById("selectedSubQuestionsId");
selectedSubQuestionsId.innerHTML = '';
for (var i = 0; i < questionsubIds.length; i++) {
var list = document.createElement("li");
list.innerHTML = "<div>" + questionsubIds[i] + "</div>";
console.log(questionsubIds[i]);
selectedSubQuestionsId.appendChild(list);
}

}

var modal = document.getElementById("myModal");

var span = document.getElementsByClassName("close")[0];

function openModal(qIds) {
$.ajax({
type : "GET",
url : "./getQuestionBodyById",
data : "questionId=" + qIds,
success : function(response) {
/* var modalBodyContent.innerHTML =response; */

var modalBody = document.getElementById("modal-body-2");
modalBody.innerHTML = response;

modal.style.display = "block";
}
});

}

function closeModal() {
modal.style.display = "none";

var modalBody = document.getElementById("modal-body-2");
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
<script>
document.addEventListener("DOMContentLoaded",() => {
setTimeout(function(){
document.getElementById('alertId').style.display='none';
},3000);
});

window.onload = function() {
	
questionsubIds = JSON.parse('${questionSubJson}');
getSelectedQuestionsBySubTestId();
  
};

</script>
</html>