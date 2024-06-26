<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page here</title>
<%@ include file="navbar.jsp" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
<style>
.footer{
position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color:#23395d;
   color:black;
   text-align: center;

}
</style>

</head>
<body>
<div id="alertId">
		<c:if test="${alert eq 'success'}">
			<script type="text/javascript">
				swal({
					title : "Admin Login Successful!",
					text : "Click Ok to Continue !",
					icon : "success",
					button : "OK",
				});
			</script>
		</c:if>
	</div>

<!-- ... Existing code ... -->
<div class="container">
    <h2 style = "text-align:center;color:Blue;">Module Information</h2>
    <table class="table">
        <thead>
            <tr>
                <th style = "text-align:center;">ModuleName</th>
                <th style = "text-align:center;">Functionality</th>
        
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="font-weight-bold" style = "color:#0878A4;">Category:</td>
                <td>In our Category Module we are adding Category, it is basicaly a Question Bank in which there are number of questions 
from multiple topics. We can create a sub Category also if want to add sub topic in the particular topic. Then we can add 
question in that category and Sub Category. We can add multiple questions at a time in the particular topic by Excel Upload.</td>
                
                </tr>
                <tr>
                <td class="font-weight-bold" style = "color:#0878A4;">Set Of Questions:</td>
                <td>In this module we add the questions from multiple Categories(topic) in a particular set for the candidates.
Firstly we can create Test in which we have to add the name of the Test example: FresherRecrutiment, ExperincedRecruitment etc.
then we have to add a subTest which is the set we want to create and add questions in that Set.
We can add questions by two ways on by selecting questions from category and one by selecting questions from the existing set.
                </td>
                </tr>
                <tr>
                <td class="font-weight-bold" style = "color:#0878A4;">Add Candidate:</td>
                <td>In this Module we will add the candidates in the particular batch and then we will assign a particular set to that group of candidates.
We will select the particular College and add then create a batch in the college, we are creating a batch in the college because if there are many Candidates then there is problem. We can add Candidates by excel if we have to add multiple candidates in the batch.
In Configure Tab we add single candidates also.After adding candidates we will assign the particular set of questions to the batch and date time of the exam there login time and end time.
There is the Send Email Tab where we are sending the mail to candidates about there login Credentials and the date and time of exam.
                </td>
                </tr>
                <tr>
                <td class="font-weight-bold" style = "color:#0878A4;">Add College:</td>
                <td>The "Add College" module lets users input vital college details for placement purposes, including college name, placement officer info, and address.
The "Send Message" feature enables communication with specific placement officers. Admin select a college,auto-retrieving officer contacts, compose messages, 
and attach files. This streamlines information sharing, enhancing placements.</td>
</tr>
<tr>
                <td class="font-weight-bold" style = "color:#0878A4;">Result module:</td>
                <td >After exams, this module displays results and provides an option to download them in Excel. It's user-friendly and convenient for 
accessing and sharing post-exam outcomes.</td>
            </tr>
            
        </tbody>
    </table>
</div>

<!-- ... Rest of the code ... -->

<div class="footer">
    <p>All Right Reserved @ Online Examination System</p>
</div>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded",() => {
		setTimeout(function(){
			document.getElementById('alertId').style.display='none';
		},3000);
	});

</script>
</body>
</html>