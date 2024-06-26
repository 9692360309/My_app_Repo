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
			<li class="active"><a data-toggle="tab" href="#manage">Manage Users</a></li>
			<li><a data-toggle="tab" href="#add">Add a user</a></li>
			<li><a data-toggle="tab" href="#edit">Edit a user</a></li>
			<li><a data-toggle="tab" href="#roles">Manage roles</a></li>
			<li><a data-toggle="tab" href="#rights">Manage Access Rights</a></li>

		</ul>
		
		<div class="tab-content">
			<!-- for manage users -->
			<div id="manage" class="tab-pane fade in active">
				<div class="container mt-5">
					<table class="table table-stripped" id="RegistrationTable" border="1">
			<thead>
				<tr>
					<th>Sl#</th>
					<th>Name</th>
					<th>Email</th>
					<th>Mobile No</th>
					<th>Gender</th>
					<th>Address</th>
					<th>Action</th>
				</tr>					
			</thead>
			<tbody>
				
				
				<c:forEach items="${allUser}" var="user" varStatus="count">
				<tr>
					<td>${count.count}</td>
					<td>${user.name}</td>
					<td>${user.email}</td>
					<td>${user.mobileNo}</td>
					<td>${user.gender}</td>
					<td>${user.userAddress}</td>
					<td><a onclick="return confirm('Are you want to delete your Details');" href="./deleteUser?userId=${user.userId}"><i class="fas fa-trash text-danger" style="font-size: 30px"></i></a></td>
				</tr>
				</c:forEach>
				
			</tbody>
		    </table>
				</div>
			
			
			</div>
			
			
			<div id="add" class="tab-pane fade">


			<div class="container">
				
					<form action="./saveUserDetails" method="post" onsubmit="return userFormValidation()">

						<div class="container" style="margin-top: 25px; border: 1px solid black;">
							<p align="right">
								<span class="text-danger">*</span> indicates mandatory fields
							</p>
							
								<div class="form-group col-md-6 offset-md-3">
									<label>Name :<span
						class="text-danger">*</span></label> <input type="text"
										name="name" id="name" class="form-control">
									<span id="nameEr" class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>User Name :<span
						class="text-danger">*</span></label> <input type="text"
										name="username" id="username" class="form-control">
									<span id="usernameEr" class="text-danger font-weight-bold"></span>
								</div>
								
								
								
								<div class="form-group col-md-6 offset-md-3">
									<label>Email :<span
						class="text-danger">*</span></label> <input type="text" name="email"
										id="email" class="form-control"> 
										<span id="emailEr" class="text-danger font-weight-bold"></span>
								</div>
								<div class="form-group col-md-6 offset-md-3">
									<label>Mobile No:<span
						class="text-danger">*</span></label> <input type="number" name="mobileNo"
										id="mobileNo" class="form-control"> <span
										id="mobileNoEr" class="text-danger font-weight-bold"></span>
								</div>
							

						
								<div class="form-group col-md-6 offset-md-3">
									<label>Gender :<span class="text-danger">*</span></label> <br> 
										<input type="radio"	name="gender" id="gender" value="Female">Female 
										<input type="radio" name="gender" id="gender" value="Male">Male 
										<br><span id="genderEr" class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>Choose Role:<span
						class="text-danger">*</span></label><select
								id="role" name="role" class="form-control">
								<option value="0">Select</option>
								<option value="101">Admin</option>
								<option value="102">Proctor</option>
								<option value="103">Hr</option>
							</select> <span
										id="roleEr" class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>Address :<span class="text-danger">*</span></label> <br> 
										<textarea name="userAddress" id="userAddress" class="form-control"></textarea>
										<span id="addressEr" class="text-danger font-weight-bold"></span>
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
				
					<form action="./saveUserDetails" method="post">

						<div class="container" style="margin-top: 25px; border: 1px solid black;">
							<p align="right">
								<span class="text-danger">*</span> indicates mandatory fields
							</p>
							<h3>Edit User</h3>
							
							<div class="form-group col-md-6 offset-md-3">
									<label>Enter UserId for Edit :<span
						class="text-danger">*</span></label> <input type="text"
										name="userId" id="userId" class="form-control" oninput="autoFillUserDetails()">
									<span id="candidEr" class="text-danger font-weight-bold"></span>
								</div>
							
								<div class="form-group col-md-6 offset-md-3">
									<label>Name :<span
						class="text-danger">*</span></label> <input type="text"
										name="name" id="fname" class="form-control">
									<span id="nameEr" class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>User Name :<span
						class="text-danger">*</span></label> <input type="text"
										name="username" id="fusername" class="form-control">
									<span id="usernameEr" class="text-danger font-weight-bold"></span>
								</div>
								
								
								
								<div class="form-group col-md-6 offset-md-3">
									<label>Email :<span
						class="text-danger">*</span></label> <input type="text" name="email"
										id="femail" class="form-control"> 
										<span id="emailEr" class="text-danger font-weight-bold"></span>
								</div>
								<div class="form-group col-md-6 offset-md-3">
									<label>Mobile No:<span
						class="text-danger">*</span></label> <input type="number" name="mobileNo"
										id="fmobileNo" class="form-control"> <span
										id="mobileNoEr" class="text-danger font-weight-bold"></span>
								</div>
							

						
								<div class="form-group col-md-6 offset-md-3">
									<label>Gender :<span class="text-danger">*</span></label> <br> 
										<input type="radio"	name="gender" id="fgender" value="Female">Female 
										<input type="radio" name="gender" id="fgender" value="Male">Male 
										<br><span id="genderEr" class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>Choose Role:<span
						class="text-danger">*</span></label><select
								id="frole" name="role" class="form-control">
								<option value="0">-select-</option>
								<option value="101">Admin</option>
								<option value="102">Proctor</option>
								<option value="103">Hr</option>
							</select> <span
										id="roleEr" class="text-danger font-weight-bold"></span>
								</div>
								
								<div class="form-group col-md-6 offset-md-3">
									<label>Address :<span class="text-danger">*</span></label> <br> 
										<textarea name="userAddress" id="fuserAddress" class="form-control"></textarea>
										<span id="addressEr" class="text-danger font-weight-bold"></span>
								</div>
							
							<div class="form-group col-md-6 offset-md-3" align="center">
								<input type="submit" id="tabOneSubmit" onclick="return confirm('Are you want to Save your Details');" value="Submit"  class="btn btn-success">&nbsp;&nbsp;
								<input type="reset" value="Reset" class="btn btn-danger">
									
							</div>
						</div>

					</form>
					</div>
		 	
		 </div>
		 <div id="roles" class="tab-pane fade">
		 	manage role here
		 </div>
		
		<div id="rights" class="tab-pane fade">
			rights
		 </div>
	</div>
		<div class="footer">
          <p>All Right Reserved @ Online Examination System</p>
      	</div>

<div class="footer">
    <p>All Right Reserved @ Online Examination System</p>
</div>
</body>
<script>

function userFormValidation() {

	
	var vName = document.getElementById("name").value;
	var vusername = document.getElementById("username").value;
	var vemail = document.getElementById("email").value; 
	var vmobileNo = document.getElementById("mobileNo").value;
	var vgender = document.getElementById("gender").value;
	var vrole = document.getElementById("role")
	var vaddress = document.getElementById("userAddress").value; 


    var nameCheck = /^[A-Za-z. ]{3,}$/;
    var usernameCheck = /^[A-Za-z. ]{3,}$/;
    var emailCheck = /^[a-z0-9]{3,}@[a-z]{3,}[.]{1}[a-z.]{2,6}$/;
    var mobileCheck = /^[6789][0-9]{9}$/ ;
    var addressCheck = /^[A-Za-z., ]{6,}$/;


    if(nameCheck.test(vName)){
		document.getElementById("nameEr").innerHTML = " ";
		}
	else{
		document.getElementById("nameEr").innerHTML = " ** UserName must contains 3 character and only alphabets ";
		return false;
		} 
    if(usernameCheck.test(vusername)){
		document.getElementById("usernameEr").innerHTML = " ";
		}
	else{
		document.getElementById("usernameEr").innerHTML = " ** UserName must contains 3 character and only alphabets ";
		return false;
		}
    if(emailCheck.test(vemail)){
		document.getElementById("emailEr").innerHTML = " ";
		}
	else{
		document.getElementById("emailEr").innerHTML = " ** Please provide valid email ";
		return false;
		}
    if(mobileCheck.test(vmobileNo)){
		document.getElementById("mobileNoEr").innerHTML = " ";
		}
	else{
		document.getElementById("mobileNoEr").innerHTML = " ** Please provide valid mobileNo and it should be indian standard ";
		return false;
		} 
    if(addressCheck.test(vaddress)){
		document.getElementById("addressEr").innerHTML = " ";
		}
	else{
		document.getElementById("addressEr").innerHTML = " ** Please provide Address Details and Address must contain atleast 6 letters !!";
		return false;
		}
	if(vgender.equals(null)){
		document.getElementById("genderEr").innerHTML = " ";
		}
	else{
		document.getElementById("genderEr").innerHTML = " ** Choose gender !!";
		}
	if(vrole==0){
		document.getElementById("roleEr").innerHTML = " ";
		}
	else{
		document.getElementById("roleEr").innerHTML = " ** Please Select gender !!";
		}
	
   
   
    
}

</script>

<script type="text/javascript">
	function autoFillUserDetails(){
	$.ajax({
		url : "getUserById",
		type : "POST",
		data : "userId=" + parseInt($('#userId').val()),
		success : function(res) {
			$('#fname').val(res.name);
			$('#fusername').val(res.username);
			$('#femail').val(res.email);
			$("#fmobileNo").val(res.mobileNo);
			$('#fgender').val(res.gender);
			$('#frole').val(res.role.roleId);
			$('#fuserAddress').val(res.userAddress);

		}
	});
}
</script>
</html>
