<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="candidateNavbar.jsp"%>
</head>
<script>
function startTimer(duration, display) {
var timer = duration, minutes, seconds;
setInterval(function () {
minutes = parseInt(timer / 60, 10);
seconds = parseInt(timer % 60, 10);

minutes = minutes < 10 ? "0" + minutes : minutes;
seconds = seconds < 10 ? "0" + seconds : seconds;

display.textContent = minutes + ":" + seconds;

if (--timer < 0) {
timer = duration;
}
}, 1000);
}

window.onload = function () {
var duration = 60 * 5, // 5 minutes
display = document.querySelector('#time');
startTimer(duration, display);
};
</script>


<body>


<c:forEach items="${examQuestions}" var="question" varStatus="count">
	
	<div class="container" style="margin-top: 25px; border: 4px solid black;">
    <p align="right"><i class="bi bi-stopwatch-fill bi-4px"></i> : <span id="time" > 05:00</span></p>
      <c:forTokens items ="${question}" delims = "," var = "name">
      
        <c:if test="${name.endsWith('?') }">
       <b>${count.count}.<c:out value = "${name}"/><br></b>
        </c:if>
        
        <c:if test="${!name.endsWith('?') }">
        <input type="radio" id="html" name="fav_language" value="<c:out value = "${name}"/>">
        <c:out value = "${name}"/>
         <br>
        </c:if>
        <br>
        
      </c:forTokens>
      <div align="center">
        <input type="submit" id="tabOneSubmit" onclick="return confirm('Are you want to Save your Details');" value="Save"  class="btn btn-success">&nbsp;&nbsp;
		<input type="submit" value="Next" class="btn btn-danger">
		</div>
		
		<!-- pagination -->

				
				
				    </div>`
</c:forEach>


</body>
</html>