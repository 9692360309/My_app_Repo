<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<%@ include file="navbar.jsp"%>
<body>




<div class="container mt-4">
<h3>Setting The Exam</h3>
<p align="right">
<span class="text-danger">*</span> indicates mandatory fields
</p>
<div class="container" style="margin-top: 25px; border: 1px solid black;">
<form action="./saveExamDetails" method="post">
<div class="row">
                <div class="form-group col-md-6 ">
                    <label for="">Exam Name <span style="color:red">*</span></label>
                    <input type="text" name="examName" id="examName" class="form-control " placeholder="Enter Here">
                </div>
                <div class="form-group col-md-6">
                    <label for="">Exam Code <span style="color:red">*</span></label>
                    <input type="text" name="examCode" id="examCode" class="form-control " placeholder="Enter Here">
                </div>
                
                <div class="form-group col-md-6">
                    <label for="">Time Limit In Munints <span style="color:red">*</span></label>
                    <input type="number" name="timeLimit" id="timeLimit" class="form-control " placeholder="Enter Here">
                </div>
                
                <div class="form-group col-md-6">
                    <label for="">Pass score <span style="color:red">*</span></label>
                    <input type="number" name="passScore" id="passScore" class="form-control " placeholder="Enter Here">
                </div>
                 <div class="form-group col-md-6">
                    <label for="">total score <span style="color:red">*</span></label>
                    <input type="number" name="totalScore" id="totalScore" class="form-control " placeholder="Enter Here">
                </div>
                
                <div class="form-group col-md-6">
                    <label for="">Description <span style="color:red">*</span></label>
                    <textarea name="description" id="description" class="form-control " placeholder="Enter Here"></textarea>
                </div>
          </div>  
                <div class="btnhold mt-3 text-center">
<input type="submit" class="btn btn-primary mr-3">
                 <input type="reset" class="btn btn-danger">
                 </div>
                
                
              

</form>
</div>
</div>
</body>
</html>