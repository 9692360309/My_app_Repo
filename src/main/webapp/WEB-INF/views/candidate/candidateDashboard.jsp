<%@page import="java.util.List"%>
<%@page import="com.csmtech.bean.QuestionBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Online Exam Rules and Guidelines</title>
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
<style>
body {
	padding: 50px;
	background-image:
		url("https://www.pngplay.com/wp-content/uploads/6/Exam-Silhouette-Background-PNG-Image.png");
	background-repeat: no-repeat;
	background-size: 35% 100%;
	background-position: top left;
	background-size: 10em;
	opacity: 0.8; /* Adjust the opacity value as needed */
}

.container {
	max-width: 700px;
	margin: 0 auto;
}

.btn-start {
	margin-top: 20px;
}

.blinking {
	animation: blink-animation 1s infinite;
	color: blue;
}

.h1 {
	background-color: transparent;
	width: 20px;
	height: 20px;
	text-align: center;
}


.li {
	text-align: right;
	list-style-position: inside;
}
</style>

</head>
<body>
	<div id="alertId">

		<c:if test="${TimeOut eq 'TimeFailed'}">
			<script type="text/javascript">
				swal({
					title : "Login failed !",
					text : "Invalid credentials !",
					icon : "error",
					button : "try again!",
				});
			</script>
		</c:if>
	</div>

	
	<c:if test="${startExam-currentTime gt 0 }">
	<h1 class="text-right" id="remainTime">
		Exam will Be Start :- <span id="timeid"></span>
	</h1>
	<input type="hidden" value="${startExam }" id="startExam">
	<input type="hidden" value="${currentTime }" id="currentTime">
		<script type="text/javascript">
			
let startExam = $("#startExam").val()/1000;
let currentTime = $("#currentTime").val()/1000;

let diff = startExam-currentTime;
console.log(diff);
let mins = diff;
setInterval(() => {
diff--;

if(diff > mins/2 ){
	$("#timeid").css("color", "green");
    }
if(diff < mins/2 && diff >=  mins/4){
	$("#timeid").css("color", "orange");
    }else
if(diff < mins/4 && diff >= 2){
	$("#timeid").css("color", "red");
    }else
if(diff < 1){
	$("button.btn").removeAttr('disabled', true);
	$("#remainTime").hide();
    }
let sec = Math.floor(diff%60);
let min = Math.floor(diff/60)%60;
let hour =  Math.floor(diff/(60*60))%24;
$("#timeid").text((hour < 10 ? "0"+hour : hour)+":"+(min < 10 ? "0"+min : min)+":"+(sec < 10 ? "0"+sec : sec));
}, 1000);
			</script>
	</c:if>
	
	<div class="container">
		<h1 class="blinking">Online Exam Rules and Guidelines</h1>
		<form method="post" action="./candidateQuestion">
			<ul>
				<li>Please read the following instructions carefully before
					starting the exam:</li>
				<li>You will have a total of <strong>60 minutes</strong> to
					complete the exam.
				</li>
				<li>The exam consists of <strong>multiple-choice
						questions</strong> with only one correct answer.
				</li>
				<li>Each question has a specified <strong>time limit</strong>.
					Once the time is up, the next question will automatically appear.
				</li>
				<li>Make sure you have a <strong>stable internet
						connection</strong> throughout the exam to avoid any disruptions.
				</li>
				<li>Do not <strong>refresh</strong> or <strong>close</strong>
					the exam page during the exam. It may result in disqualification.
				</li>
				<li>Do not use any <strong>external resources</strong> such as
					books, calculators, or websites while taking the exam.
				</li>
				<li>Click the <strong>Start Exam</strong> button when you are
					ready to begin.
				</li>
			</ul>
			
			<c:if test="${startExam-currentTime gt 0 }">
	 			<button class="btn btn-primary btn-start" onclick="startExam()" disabled="disabled">Start
				Exam</button>
	 		</c:if>
	 		
	 		<c:if test="${startExam-currentTime lt 0 and endExam-currentExam gt 0}">
			<button class="btn btn-primary btn-start" >Continue Exam</button>
	 		</c:if>
	 		
	 		<c:if test="${currentTime-endExam gt 0}">
			<c:redirect url="http://localhost:8088/exam/logout"/>
	 		</c:if>
	 		
	</form>
		
	
	</div>



</body>



</html>