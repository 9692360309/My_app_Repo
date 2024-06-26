<%@page import="java.util.List"%>
<%@page import="com.csmtech.bean.QuestionBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	List<QuestionBean> quests = (List<QuestionBean>) session.getAttribute("quests");
%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
<link
	rel="https://cdnjs.datatables/1.12.1/css/dataTables.bootstrap4.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<style>
.choose {
	animation: colorChange 5s infinite;
}

#redsquare {
	height: 100%;
	width: 10%;
}

#greensquare {
	height: 90%;
	width: 7%;
}

#orangeBox {
	height: 100%;
	width: 12%;
}

#graysquare {
	height: 90%;
	width: 7%;
}

.timer-minutes {
	font-size: 24px;
	font-weight: bold;
	color: black;
}

.timer-divider {
	font-size: 24px;
	margin: 0 4px;
	color: gray;
}

.timer-seconds {
	font-size: 24px;
	font-weight: normal;
	color: Black;
}

.top {
	height: 4em;
}

.quesbox {
	margin-left: -2px;
	height: 450px;
	width: 905px;
	overflow: scroll;
}

#logoImg {
	height: 30px;
	width: 150px;
	margin-top: 10px;
	background-color: white;
}

.top {
	height: 4em;
}

.box {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 10px;
	margin-top: 10px;
}

.box button {
	width: 40px;
	height: 40px;
	border: none;
	border-radius: 50%;
	background-color: #71797E;
	color: white;
	font-weight: bold;
	font-size: 16px;
	box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
}

.box button.answered {
	background-color: green;
	color: white;
}

.box button.skipped {
	background-color: red;
	color: white;
}

.box button.marked {
	background-color: orange;
	color: white;
}

.box button:hover {
	background-color: #4c5459;
}

.top {
	height: 4em;
}

.quesbox {
	margin-left: 2px;
	height: 450px;
	width: 900px;
	overflow: scroll;
}

.time {
	height: 4em;
}

.marks {
	height: 450px;
}

.box {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 10px;
	margin-top: 10px;
}

.box button {
	width: 40px;
	height: 40px;
	border: none;
	border-radius: 50%;
	background-color: #71797E;
	color: white;
	font-weight: bold;
	font-size: 16px;
	box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
}

.box button.answered {
	background-color: green;
	color: white;
}

.box button.skipped {
	background-color: red;
	color: white;
}

.box button.marked {
	background-color: orange;
	color: white;
}

.box button:hover {
	background-color: #4c5459;
}
/*  csm */
.tx {
	text-transform: uppercase;
	font-family: verdana;
	font-size: 1.5em;
	font-weight: 700;
	color: #f5f5f5;
	text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.2), 3px 3px 3px
		rgba(0, 0, 0, 0.2), 4px 4px 4px rgba(0, 0, 0, 0.2);
}
/* chose a q*/
.tx1 {
	text-transform: uppercase;
	font-family: verdana;
	font-size: 1.5em;
	font-weight: 700;
	color: #000000;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
}

/* CSS */
.button-71 {
	background-color: #00d055;
	border: 0;
	border-radius: 56px;
	color: #fff;
	cursor: pointer;
	display: inline-block;
	font-family: system-ui, -apple-system, system-ui, "Segoe UI", Roboto,
		Ubuntu, "Helvetica Neue", sans-serif;
	font-size: 18px;
	font-weight: 600;
	outline: 0;
	padding: 16px 21px;
	position: relative;
	text-align: center;
	text-decoration: none;
	transition: all .3s;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
}

.button-71:before {
	background-color: initial;
	background-image: linear-gradient(#fff 0, rgba(255, 255, 255, 0) 100%);
	border-radius: 125px;
	content: "";
	height: 50%;
	left: 4%;
	opacity: .5;
	position: absolute;
	top: 0;
	transition: all .3s;
	width: 92%;
}

.button-71:hover {
	box-shadow: rgba(255, 255, 255, .2) 0 3px 15px inset, rgba(0, 0, 0, .1)
		0 3px 5px, rgba(0, 0, 0, .1) 0 10px 13px;
	transform: scale(1.05);
}

@media ( min-width : 768px) {
	.button-71 {
		padding: 2px 48px;
	}
}

#tophead {
	background-color: blue;
	color: cornsilk;
	text-align: center;
}

.h1 {
	text-align: center;
}

.question-text {
	font-weight: bold;
	font-size: 20px;
	margin-bottom: 10px;
}

.question-box {
	border: 1px solid #ccc;
	padding: 9px;
	margin-bottom: 20px;
	background-color: #f5f5f5;
}

input[type="radio"] {
	margin-right: 10px;
}

input[type="radio"]:checked+span {
	font-weight: bold;
}

.imgposition {
	
}

/* #myPopup {
position: fixed;
top: 0;
left: 0;
width: 100%;
height: 100%;
background-color: rgba(0, 0, 0, 0.5);
display: flex;
justify-content: center;
align-items: center;
}

#myPopup>div {
background-color: #fff;
padding: 20px;
border-radius: 5px;
text-align: center;
}

#myPopup button {
margin-top: 10px;
}
 */
<!--
#popupContainer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
}

#popupContent {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	text-align: center;
}

#popupContent p {
	font-size: 18px;
	margin-bottom: 10px;
}

#popupContent button {
	font-size: 16px;
	padding: 10px 20px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
</style>
-->
</head>

<body>
	<div class="row" id="tophead"
		style="justify-content: center; align-items: center; display: flex;">
		<!-- <h5>CSM ONLINE WRITTEN TEST</h5> -->
		<h5 class="tx">CSM ONLINE WRITTEN TEST</h5>

	</div>
	<div class="row">
		<div class="col-8">
			<div class="time border m-1 margin-left:1.05rem!important; ">
				<fieldset>
					<fieldset>
						<legend>
							<div class="form-group">
								<div class="row" style="background-color: #003365;"
									id="background">
									<div class="imgposition col-md-2"
										style="margin-left: 1px; margin-bottom: 1em;">
										<img alt="" src="../img/logocsm.png" id="logoImg">
									</div>
									<div class="col">

										<label
											style="font-size: 0.7em; color: white; float: right; margin-top: 1em; margin-right: 3em">
											<b>Name : ${sessionData1.candidateemail}</b>
										</label>
									</div>
								</div>
							</div>
						</legend>
					</fieldset>

				</fieldset>
			</div>
			<div class="mt-1 border quesbox" id="questionContainer"></div>
			<button class="button-71" style="background-color: #71797E;"
				id="clearResponseButton">Clear Response</button>
			<!-- <button class="button-71" style="background-color: #ffc822;"
onclick="markForReview()">Mark For Review & Next</button> -->
			<button class="button-71" style="background-color: #dc3545;"
				onclick="previousQuestion()">Back</button>
			<button class="button-71" style="background-color: #007bff;"
				onclick="nextQuestion()">Save&Next</button>
			<!-- <button class="btn m-1" style="background-color: #71797E;" id="clearResponseButton">Clear
Response</button>
<button class="btn btn-warning m-1">Mark For Review & Next</button>
<button class="btn btn-danger m-1">Back</button>
<button class="btn btn-primary m-">Save&Next</button> -->
		</div>
		<div class="col-4 border">
			<div class="time border m-1 mr-3"
				style="justify-content: center; align-items: center; display: flex;">
				<label id="timer" class="ml-4"
					style="font-size: 20px; text-shadow: 2px 2px 8px rgb(56, 50, 50);"></label>
			</div>
			<div class="marks border mr-2">
				<div class="row">
					<label class="ml-4 d-flex align-items-center"> <img alt=""
						src="../img/greenSQ.png" id="greensquare"
						style="width: 20px; height: 20px;" class="mr-1"> <strong>Answered</strong>
					</label> <label class="ml-2 d-flex align-items-center"> <img alt=""
						src="../img/redsquare.png" id="redsquare"
						style="width: 20px; height: 20px;" class="mr-1"> <strong>Not
							Answered</strong>
					</label>
					<!-- <label class="ml-2 d-flex align-items-center"> <img alt=""
src="../img/orangesquare.png" id="orangeBox"
style="width: 20px; height: 20px;" class="mr-1"> <strong>Not
Visited</strong>
</label>  -->
					<label class="ml-4 d-flex align-items-center"><img alt=""
						src="../img/graysquare.png" id="graysquare"
						style="width: 20px; height: 20px;" class="mr-1"> <strong>
							Not Visited</strong></label>
				</div>

				<div class="choose"
					style="background-color: cyan; text-align: center;">
					<strong class="tx1">Choose a question</strong>
				</div>

				<div class="box">

					<%
						for (int i = 1; i <= quests.size(); i++) {
					%>
					<button onclick="goToQuestion()"><%=i%></button>
					<%
						}
					%>


				</div>

			</div>
			<button class="button-71" role="button"
				onclick="submitQuiz();showPopup()">Submit</button>
			
		</div>
		
	</div>


</body>
<script type="text/javascript">

// Set the timer duration in seconds
var timerDuration = 60;

// Get the timer element by its ID
var timerElement = document.getElementById("timer");

// Start the timer
var timer = setInterval(
function() {
// Calculate the minutes and seconds remaining
var minutes = Math.floor(timerDuration / 60);
var seconds = timerDuration % 60;

// Display the remaining time
timerElement.innerHTML = "<b>Time Left: </b><span class='timer-minutes'>"
+ minutes
+ "</span><span class='timer-divider'>:</span><span class='timer-seconds'>"
+ (seconds < 10 ? "0" : "") + seconds + "</span>";

// Check if the time left is 2 minutes (120 seconds)
if (timerDuration === 120) {
timerElement.style.color = "red"; // Change the color to red
}

// Decrease the timer duration by 1 second
timerDuration--;

// Check if the timer has reached 0
if (timerDuration < 0) {
clearInterval(timer); // Stop the timer
timerElement.textContent = "Time's Up!"; // Display a message
timerElement.style.color = "black"; // Reset the color
submitQuiz();

}
}, 1000);


function updateBookmarkBox() {
        var bookmarks = document.querySelectorAll(".bookmark");
        for (var i = 0; i < bookmarks.length; i++) {
            var bookmark = bookmarks[i];
            var questionIndex = i + 1;
            var question = quests[i]; // Get the question object from the list of questions

            if (question.answered) {
                bookmark.style.backgroundImage = "url('../img/greenSQ.png')";
            } else if (question.visited) {
                bookmark.style.backgroundImage = "url('../img/orangesquare.png')";
            } else if (question.markedForReview) {
                bookmark.style.backgroundImage = "url('../img/graysquare.png')";
            } else {
                bookmark.style.backgroundImage = "url('../img/redsquare.png')";
            }
        }
    }

    // Call the updateBookmarkBox function initially to set the initial state
    updateBookmarkBox();

 var questions = [
  <%for (int i = 0; i < quests.size(); i++) {%>
    {
      questionId: <%=quests.get(i).getQuestionId()%>,
      questionText: "<%=quests.get(i).getQuestionText()%>",
      option1: "<%=quests.get(i).getOption1()%>",
      option2: "<%=quests.get(i).getOption2()%>",
      option3: "<%=quests.get(i).getOption3()%>",
      option4: "<%=quests.get(i).getOption4()%>",
      correctAns: "<%=quests.get(i).getCorrectAns()%>"
    }<%if (i < quests.size() - 1) {%>,<%}%>
  <%}%>
  ];

 var currentQuestion = 0;
var selectedAnswers = [];
var selectedAnswersWithQuestion = [];
var currentQuestionWithId;
var answeredQuestions = []; // Array to keep track of answered questions
var markedForReview = [];

function displayQuestion() {
  var questionContainer = document.getElementById("questionContainer");
  questionContainer.innerHTML = "";

  var question = questions[currentQuestion];
  currentQuestionWithId = question.questionId;

  var questionText = document.createElement("p");
  questionText.innerHTML = "<strong/><span class='question-number'>Question " + (currentQuestion + 1) + ":</span> " + question.questionText;
  questionContainer.appendChild(questionText);

  var options = [question.option1, question.option2, question.option3, question.option4];

  for (var i = 0; i < options.length; i++) {
    var optionLabel = document.createElement("label");
    var optionRadio = document.createElement("input");
    optionRadio.type = "checkbox";
    optionRadio.name = "answer";
    optionRadio.value = options[i];

    if (options[i] === getSelectedAnswer()) {
      optionRadio.checked = true;
    }

    optionLabel.appendChild(optionRadio);
    optionLabel.appendChild(document.createTextNode(options[i]));

    questionContainer.appendChild(optionLabel);
    questionContainer.appendChild(document.createElement("br"));
  }

  // Check if the current question is marked
  var questionButtons = document.getElementsByClassName('box')[0].getElementsByTagName('button');
  if (questionButtons[currentQuestion].classList.contains('marked')) {
    questionButtons[currentQuestion].classList.remove('marked');
    questionButtons[currentQuestion].classList.add('answered');
  }

  
  
  if (selectedAnswers[currentQuestion]) {
    var selectedAnswer = selectedAnswers[currentQuestion];
    var options = document.querySelectorAll('input[name="answer"]');

    for (var i = 0; i < options.length; i++) {
      if (options[i].value === selectedAnswer) {
        options[i].checked = true;
        break;
      }
    }
  }
   
}
//nextQuestion

function nextQuestion() {
  var selectedOption = document.querySelector('input[name="answer"]:checked');

  if (selectedOption) {
    // Store the selected answer
    selectedAnswers[currentQuestion] = selectedOption.value;
    selectedAnswersWithQuestion.push({ questionId: currentQuestionWithId, option: selectedOption.value });

    // Check if the current question is in answeredQuestions array
    if (!answeredQuestions.includes(currentQuestion)) {
      answeredQuestions.push(currentQuestion);
    }
    
    // Update the question number button color to green
    var questionButtons = document.getElementsByClassName("box")[0].getElementsByTagName("button");
    questionButtons[currentQuestion].classList.remove("skipped"); // Remove 'skipped' class
    questionButtons[currentQuestion].classList.add("answered"); // Add 'answered' class
  } else {
    // Add a class to mark the skipped question as orange
    var questionButtons = document.getElementsByClassName("box")[0].getElementsByTagName("button");
    questionButtons[currentQuestion].classList.add("skipped");

    // Add the current question to skippedQuestions array if not already present
    if (!answeredQuestions.includes(currentQuestion)) {
      answeredQuestions.push(currentQuestion);
    }
  }

// Move to the next question
  if(currentQuestion< questions.length - 1){
 
  currentQuestion++;
  displayQuestion();
  }else{
  alert("you were reached at the end of the question please submit..")
  }
  
}


function previousQuestion() {
  if (currentQuestion > 0) {
    currentQuestion--;
    displayQuestion();
    setSelectedAnswer();
  }
}
//Event listener for "Clear Response" button
document.getElementById("clearResponseButton").addEventListener("click", clearResponse);

// Function to clear the selected option
function clearResponse() {
  var options = document.querySelectorAll('input[name="answer"]');
  for (var i = 0; i < options.length; i++) {
    options[i].checked = false;
  }
  selectedAnswers[currentQuestion] = null;
  selectedAnswersWithQuestion = selectedAnswersWithQuestion.filter(answer => answer.questionId !== currentQuestionWithId);
}

function markForReview() {
alert("mark")
  var questionButtons = document.getElementsByClassName('box')[0].getElementsByTagName('button');
  var currentButton = questionButtons[currentQuestion];

  if (currentButton.classList.contains('marked')) {
  alert(currentButton)
    // If the current question is already marked, remove it from the markedForReview array and change the button color to default.
    currentButton.classList.remove('marked');
    markedForReview = markedForReview.filter(function (questionIndex) {
      return questionIndex !== currentQuestion;
    });
  } else {
    // If the current question is not marked, add it to the markedForReview array and change the button color to blue.
    currentButton.classList.add('marked');
    markedForReview.push(currentQuestion);
  }
}

function getSelectedAnswer() {
  var selectedOption = document.querySelector('input[name="answer"]:checked');
  return selectedOption ? selectedOption.value : "";
}

function setSelectedAnswer() {
  var selectedAnswer = getSelectedAnswer();
  var options = document.querySelectorAll('input[name="answer"]');

  for (var i = 0; i < options.length; i++) {
    if (options[i].value === selectedAnswer) {
      options[i].checked = true;
      break;
    }
  }
}
function submitQuiz() {
/* alert("abc") */
    var selectedOption = document.querySelector('input[name="answer"]:checked');

recall();
   
   /*  if (selectedOption) { */
        // Store the selected answer
        selectedAnswers[currentQuestion] = selectedOption.value;

        // Send the answers to the server
        /*  var selectedAnswersWithQuestion = []; */ 
        selectedAnswersWithQuestion.push({ questionId:  currentQuestionWithId, option: selectedOption.value });

        // Perform an AJAX request to save the answers in the database
   
        $.ajax({
            url: "saveExam", // Replace with the appropriate server-side script or endpoint
            method: "POST",
            contentType: "application/json", // Set the content type to JSON
            data: JSON.stringify(selectedAnswersWithQuestion), // Serialize the data as JSON
            success: function(response) {
            alert(response)
                // Handle the success response
                alert("Answers submitted successfully!");
            
                //window.location.href = "login"; // Redirect to the login endpoint 
                
                 window.onload = function () {
    showPopup();
  }
                
        
 
        
            },
            error: function(xhr, status, error) {
                // Handle the error response
                
                
               // alert("Answers submitted successfully!");
               
               
                window.onload = function () {
    showPopup();
  }
               
              
// window.location.href = "login"; // Redirect to the login endpoint 
 
               
                   

            }
        });
    /* } else {
        alert("Please select an option.");
    } */
}




// Start the quiz
displayQuestion();
 
 
</script>

<script type="text/javascript">

window.addEventListener('DOMContentLoaded', (event) => {
  adjustBoxSize();
});

function adjustBoxSize() {
  var buttons = document.getElementsByClassName('box')[0].getElementsByTagName('button');
  var numRows = Math.ceil(buttons.length / 5); // Adjust the number of columns as per your requirement
  var boxHeight = (numRows * 50) + 20; // Height of each button is 40px + 2 * margin (5px)
  var boxWidth = 250; // Width of the box

  var box = document.getElementsByClassName('box')[0];
  box.style.height = boxHeight + 'px';
  box.style.width = boxWidth + 'px';

  // Add click event listeners to the question number buttons
  for (var i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener('click', function() {
      var questionIndex = parseInt(this.textContent) - 1;
      goToQuestion(questionIndex);
    });
  }
}

function goToQuestion(questionIndex) {
if (questionIndex >= 0 && questionIndex < questions.length) {
    currentQuestion = questionIndex;
    displayQuestion();
  }
}



function showPopup() {
    var popupContainer = document.createElement("div");
    popupContainer.id = "popupContainer";
    popupContainer.style.position = "fixed";
    popupContainer.style.top = "0";
    popupContainer.style.left = "0";
    popupContainer.style.width = "100%";
    popupContainer.style.height = "100%";
    popupContainer.style.backgroundColor = "rgba(0, 0, 0, 0.5)";
    popupContainer.style.display = "flex";
    popupContainer.style.justifyContent = "center";
    popupContainer.style.alignItems = "center";

    var popupContent = document.createElement("div");
    popupContent.id ="popupContent";
    popupContent.style.backgroundColor = "#fff";
    popupContent.style.padding = "20px";
    popupContent.style.borderRadius = "5px";
    popupContent.style.textAlign = "center";
    

    var message = document.createElement("p");
    message.innerHTML = "Thank You For Giving the Exam!  Your Respose Is Submitted Successfully Now You Can Close This page ";

    var okButton = document.createElement("button");
    okButton.innerHTML = "OK";
    okButton.onclick = function () {
      hidePopup();
      redirectToLogin();
    };

    popupContent.appendChild(message);
    popupContent.appendChild(okButton);
    popupContainer.appendChild(popupContent);

    document.body.appendChild(popupContainer);

   
  }

  function hidePopup() {
    var popupContainer = document.getElementById("popupContainer");
    if (popupContainer) {
      popupContainer.parentNode.removeChild(popupContainer);
    }
  }
       function redirectToLogin() {
    window.location.href = "login";
  } 

function recall(){
var currentQuestionIndex = currentQuestion;
    var remainingQuestions = questions.length - currentQuestionIndex - 1; // Subtract 1 because the current question is already displayed.

    var questionButtons = document.getElementsByClassName("box")[0].getElementsByTagName("button");
    var skippedQuestionsCount = 0;

    for (var i = 0; i < questionButtons.length; i++) {
        if (questionButtons[i].classList.contains("skipped")) {
            skippedQuestionsCount++;
        }
    }

    // Display the count in an alert
    alert("u r in question no. :"+(currentQuestion + 1))
    alert("ToTAL:"+questions.length+"| ANS: " + selectedAnswersWithQuestion.length + " | SKIPPED: " + skippedQuestionsCount+"| NOT VISITED"+remainingQuestions);
  
}

 

</script>

</html>
