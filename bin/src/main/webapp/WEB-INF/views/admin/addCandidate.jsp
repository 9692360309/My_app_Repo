<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="navbar.jsp" %>
<!-- ......................for nav tab bar.............................................. -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>

<script src='https://kit.fontawesome.com/a076d05399.js'
crossorigin='anonymous'></script>

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
</head>
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
<body>
	
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#manage" id="manageId" onclick="openManage()">Manage Candidate</a></li>
			<li><a data-toggle="tab" href="#add" id="addId" onClick="openAdd()">Add a Candidate</a></li>
			<li><a data-toggle="tab" href="#edit" id="editId" onClick="openEdit()" >Edit a Candidate</a></li>
			<li><a data-toggle="tab" href="#excel" id="excelId" onClick="openExcel()">Add Candidate By Excel</a></li>

		</ul>
		
		<div class="tab-content">
			<!-- for manage users -->
			<div id="manage" class="tab-pane fade in active">
				<div class="container mt-5">
				<a href="./candidate/export/excel"><i class="fas fa-file-excel fa-3x"  style="color: green" aria-hidden="true"></i></a>
					<table class="table table-stripped" id="RegistrationTable" border="1">
			<thead>
				<tr>
					<th>Sl#</th>
					<th>Name</th>
					<th>Email</th>
					<th>Mobile No</th>
					<th>Date of Exam</th>
					<th>Exam Id</th>
					<th>Address</th>
					<th>Action</th>
				</tr>					
			</thead>
			<tbody>
				
				
				<c:forEach items="${allCandidate}" var="candidate" varStatus="count">
				<tr>
					<td>${count.count}</td>
					<td>${candidate.candname}</td>
					<td>${candidate.candidateemail}</td>
					<td>${candidate.candMobile}</td>
					<td>${candidate.dateexam}</td>
					<td>${candidate.exam.examId }
					<td>${candidate.address}</td>
					<td><a onclick="return confirm('Are you want to delete your Details');" href="./deleteCandidate?candid=${candidate.candid}"><i class="fas fa-trash text-danger" style="font-size: 30px"></i></a>&nbsp;&nbsp;
					<a href="/exam/updateCandidate?candid=${candidate.candid}" onClick="openEditVisible()" class="${key2}"><i class="fas fa-pen-nib text-warning" style="font-size: 30px"></i></a></td>
				</tr>
				</c:forEach>
				
			</tbody>
		    </table>
				</div>
			
			
			</div>
			
			
			<div id="add" class="tab-pane fade">


			<div class="container ">
				
					<form action="./saveCandidateDetails" method="post">

						<div class="container" style="margin-top: 25px; border: 1px solid black;">
							<p align="right">
								<span class="text-danger">*</span> indicates mandatory fields
							</p>
								<div class="form-group col-md-6 offset-md-3">
								<label>Select Exam Code :<span class="text-danger">*</span></label>
								<select class="form-control" name="examCode">
									<option value="0">-select-</option>

										<c:forEach items="${codelist}" var="exam">
									<option value="${exam.examId}">${exam.examCode}</option>
								    </c:forEach>
								</select>
								</div>
								
								
								<div class="form-group col-md-6 offset-md-3">
									<label>Candidate Name :<span
						class="text-danger">*</span></label> <input type="text"
										name="candname" id="candname" class="form-control">
									<span id="applicantNameEr" class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>User Name :<span
						class="text-danger">*</span></label> <input type="text"
										name="candusername" id="candusername" class="form-control">
									<span id="applicantNameEr" class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>Email :<span
						class="text-danger">*</span></label> <input type="text" name="candidateemail"
										id="candidateemail" class="form-control"> <span id="emailEr"
										class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>Mobile No:<span
						class="text-danger">*</span></label> <input type="number" name="candMobile"
										id="candMobile" class="form-control" onclick="validate()"> <span
										id="mobileNoEr" class="text-danger font-weight-bold"></span>
								</div>
						
								<div class="form-group col-md-6 offset-md-3">
									<label>Date of Birth:<span
						class="text-danger">*</span></label> <input type="Date" name="canddob"
										id="canddob" class="form-control" value="${cand.canddob}"> <span id="dobEr"
										class="text-danger font-weight-bold"></span>
								</div>
							
							<div class="form-group col-md-6 offset-md-3">
									<label>Date of Exam:<span
						class="text-danger">*</span></label> <input type="Date" name="dateexam"
										id="dateexam" class="form-control" value="${cand.canddob}"> <span id="dobEr"
										class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>Address :<span class="text-danger">*</span></label> <br> 
										<textarea name="address" id="address" class="form-control"></textarea>
								</div>
								
								
							
							<div class="form-group col-md-6 offset-md-3" align="center">
								<input type="submit" id="tabOneSubmit" onclick="return confirm('Are you want to Save your Details');" value="Submit"  class="btn btn-success">&nbsp;&nbsp;
								<input type="reset" value="Reset" class="btn btn-danger">
									
							</div>
						</div>

					</form>
					</div>
		
		 </div>
		 
		 <div id="edit" class="tab-pane fade">	
		 	<div class="container">
				
					<form action="./saveCandidateDetails" method="post">

						<div class="container" style="margin-top: 25px; border: 1px solid black;">
							<p align="right">
								<span class="text-danger">*</span> indicates mandatory fields
							</p>
							<h3>Edit Candidate</h3>
									
									
								
								<div class="form-group col-md-6 offset-md-3">
									<input type="hidden"
										name="candid" id="candid" class="form-control" value="${cand.candid}">
									<span id="candidEr" class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
								<label>Select Exam Code :<span class="text-danger">*</span></label>
								<select class="form-control" name="examCode">
									<option value="0">-select-</option>

										<c:forEach items="${codelist}" var="exam">
									<option value="${exam.examId}" <c:if test="${exam.examId eq cand.exam.examId}">selected='selected'</c:if>>${exam.examCode}</option>
								    </c:forEach>
								</select>
								</div>
							
								<div class="form-group col-md-6 offset-md-3">
									<label>Candidate Name :<span
						class="text-danger">*</span></label> <input type="text"
										name="candname" id="candname" class="form-control" value="${cand.candname}">
									<span id="applicantNameEr" class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>User Name :<span
						class="text-danger">*</span></label> <input type="text"
										name="candusername" id="candusername" class="form-control" value="${cand.candusername}">
									<span id="applicantNameEr" class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>Email :<span
						class="text-danger">*</span></label> <input type="text" name="candidateemail"
										id="candidateemail" class="form-control"  value="${cand.candidateemail}"> <span id="emailEr"
										class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>Mobile No:<span
						class="text-danger">*</span></label> <input type="number" name="candMobile"
										id="candMobile" class="form-control"  value="${cand.candMobile}"> <span
										id="mobileNoEr" class="text-danger font-weight-bold"></span>
								</div>
						
								<div class="form-group col-md-6 offset-md-3">
									<label>Date of Birth:<span
						class="text-danger">*</span></label> <input type="Date" name="canddob"
										id="canddob" class="form-control" value="${cand.canddob}"> <span id="dobEr"
										class="text-danger font-weight-bold"></span>
								</div>
							
							<div class="form-group col-md-6 offset-md-3">
									<label>Date of Exam:<span
						class="text-danger">*</span></label> <input type="Date" name="dateexam"
										id="dateexam" class="form-control" value="${cand.dateexam}"> <span id="dobEr"
										class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>Address :<span class="text-danger">*</span></label> <br> 
										<textarea name="address" id="address" class="form-control">${cand.address}</textarea>
								</div>
								
								
							
							<div class="form-group col-md-6 offset-md-3" align="center">
								<input type="submit" id="tabOneSubmit" onclick="return confirm('Are you want to Save your Details');" value="Submit"  class="btn btn-success">&nbsp;&nbsp;
								<input type="reset" value="Reset" class="btn btn-danger">
									
							</div>
						</div>

					</form>
					</div>
		 </div>
		 
		
		<div id="excel" class="tab-pane fade">
			<div class="container">
			<h2 class="text-danger text-center font-weight-bold">Add Candidate By Candidate</h2>
			<div class="container" style="margin-top: 25px; border: 1px solid black; background-color: #eee">
				<form action="./getCandidateByExcel" method="post" enctype="multipart/form-data">
		
				<div class="form-group col-md-6 offset-md-3">
					<label>Upload Candidate List :<span class="text-danger">*</span></label> 
					<input type="file" name="excelfile" id="excelfile" class="form-control">
				</div>
				<div class="form-group col-md-6 offset-md-3" align="center">
				<input type="submit" id="tabOneSubmit" onclick="return confirm('Are you want to Save your Details');"class="btn btn-success">
				</div>
				
				</form>
			</div>
		 </div>
		</div>
		
		</div>
		
		<div class="footer">
          <p>All Right Reserved @ Online Examination System</p>
      	</div>
		
</body>

<script type="text/javascript">
	function autoFillCandidateDetails(){
	$.ajax({
		url : "getCandidateById",
		type : "POST",
		data : "candid=" + parseInt($('#candid').val()),
		success : function(res) {
			$('#fcandname').val(res.candname);
			$('#fcandusername').val(res.candusername);
			$('#fcandidateemail').val(res.candidateemail);
			$("#fcandMobile").val(res.candMobile);
			$('#fcanddob').val(res.canddob);
			$('#fdateexam').val(res.dateexam);
			$('#faddress').val(res.address);

		}
	});
}


     $(document).ready(function (){
        $('#manage').show();
        $('#add').hide();
        $('#edit').hide();
        $('#excel').hide();
    }); 

    function openManage(){
        $('#manage').show()();
        $('#add').hide();
        $('#edit').hide();
        $('#excel').hide();

        $('#manageId').addClass("active");
        $('#addId').removeClass("active");
        $('#editId').removeClass("active");
        $('#excelId').removeClass("active");
       
    }
    function openAdd(){
    	 $('#manage').hide();
         $('#add').show();
         $('#edit').hide();
         $('#excel').hide();

         $('#manageId').removeClass("active");
         $('#addId').addClass("active");
         $('#editId').removeClass("active");
         $('#excelId').removeClass("active");
    }
    function openEdit(){
   	 $('#manage').hide();
        $('#add').hide();
        $('#edit').show();
        $('#excel').hide();

        $('#manageId').removeClass("active");
        $('#addId').removeClass("active");
        $('#editId').addClass("active");
        $('#excelId').removeClass("active");
   }
    function openExcel(){
   		 $('#manage').hide();
        $('#add').hide();
        $('#edit').hide();
        $('#excel').show();

        $('#manageId').removeClass("active");
        $('#addId').removeClass("active");
        $('#editId').removeClass("active");
        $('#excelId').addClass("active");
   }

	
</script>

</html>