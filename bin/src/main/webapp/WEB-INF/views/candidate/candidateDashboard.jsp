<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="candidateNavbar.jsp"%>
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
<link
rel="https://cdnjs.datatables/1.12.1/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
<!-- ......................for nav tab bar.............................................. -->
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div>

<h2 class="text-center bg-secondary" >Rules to follow during all online proctored exams:</h2>

<ul>
<li>You must use a functioning webcam and microphone</li>
<li>No cell phones or other secondary devices in the room or
test area</li>
<li>Your desk/table must be clear or any materials except your
test-taking device</li>
<li>No one else can be in the room with you</li>
<li>No talking</li>
<li>The testing room must be well-lit and you must be clearly
visible</li>
<li>No dual screens/monitors</li>
<li>Do not leave the camera</li>
<li>No use of additional applications or internet</li>
 
</ul>
<!-- <form action="./takeExam/0" method="post">
<div class= text-center> <button type="submit" class="btn btn-primary">Start Exam</button></div>
</form> -->
<div class= text-center>
	<a onclick="return confirm('Are you want to start your Exam')" href="./startExam" class="btn btn-primary">Start Exam</a>
</div>

</body>
</html>