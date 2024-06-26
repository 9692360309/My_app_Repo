<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="navbar.jsp"%>
</head>
<body>
<div>
	<div class="container"
			style="margin-top: 25px; border: 1px solid black;">
		
		
        <strong>${question.questionText}</strong><br><br>
       
        <c:if test="${question.option1 ne null}">
        	<input type="radio" id="html" name="fav_language" value="<c:out value="${question.option1}"/>">
        	<c:out value="${question.option1}"/>
        </c:if>
        <br><br>
        <c:if test="${question.option2 ne null}">
        	<input type="radio" id="html" name="fav_language" value="<c:out value="${question.option2}"/>">
        	<c:out value="${question.option2}"/>
        </c:if>
        <br><br>
        <c:if test="${question.option3 ne null}">
        	<input type="radio" id="html" name="fav_language" value="<c:out value="${question.option3}"/>">
        	<c:out value="${question.option3}"/>
        </c:if>
        <br><br>
        <c:if test="${question.option4 ne null}">
        	<input type="radio" id="html" name="fav_language" value="<c:out value="${question.option4}"/>">
        	<c:out value="${question.option4}"/>
        </c:if>
        <br><br>
        <c:if test="${question.option5 ne null}">
        <input type="radio" id="html" name="fav_language" value="<c:out value="${question.option5}"/>">
        	<c:out value="${question.option5}"/>
        </c:if>
           
      <div align="right">
      	<a class="btn btn-primary" href="./goBack">Back</a>
      </div>
		
	</div>
</div>
</body>
</html>