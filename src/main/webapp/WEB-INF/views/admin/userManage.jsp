<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>manage user</title>
<%@ include file="navbar.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: #23395d;
	color: black;
	text-align: center;
}
</style>
<body>
	<div id="alertId">
		<c:if test="${not empty exist}">
			<script type="text/javascript">
				swal({
					title : "failed !",
					text : "${exist} Already Exist !",
					icon : "error",
					button : "try again!",
				});
			</script>
		</c:if>
		<c:if test="${not empty userAdded}">
			<script type="text/javascript">
				swal({
					title : "Saved",
					text : "Successfully !",
					icon : "success",
					button : "ok!",
				});
			</script>
		</c:if>

		<c:if test="${not empty delete}">
			<script type="text/javascript">
				swal({
					title : "Deleted",
					text : "Successfully !",
					icon : "success",
					button : "ok!",
				});
			</script>
		</c:if>
	</div>
	<div class="card text-center"
		style="margin-right: 5rem; margin-left: 5rem;">
		<div class="card-header">
			<ul class="nav nav-tabs card-header-tabs">
				<li class="nav-item"><a class="nav-link active" id="addId"
					onclick="openAdd()">Add</a></li>
				<li class="nav-item"><a class="nav-link" id="viewId"
					onclick="openView()">View</a></li>
			</ul>
		</div>

		<div>
			<c:if test="${not empty uRegd}">
				<p class="alert alert-success">Regd is saved with Id :
					${uRegd.regdId}</p>
			</c:if>
		</div>


		<div class="card-body">
			<div id="add">
			<h2 class="text-primary font-weight-bold" style="float:center;">Add User</h2>
				<form action="./saveUserDetails" method="post"
					onsubmit="return userFormValidation()">
					<input type="hidden" name="userId" id="userId" value="${us.userId}" autofocus="autofocus">
					<div class="container"
						style="margin-top: 25px; border: 1px solid black;">
						<p align="right">
							<span class="text-danger">*</span> indicates mandatory fields
						</p>

						<div class="form-group col-md-6 offset-md-3">
							<label class="font-weight-bold">Name :<span class="text-danger">*</span></label> <input
								type="text" name="name" id="name" class="form-control"
								value="${us.name}" autofocus="autofocus"> <span id="nameEr"
								class="text-danger font-weight-bold"></span>
						</div>

						<div class="form-group col-md-6 offset-md-3">
							<label class="font-weight-bold">User Name :<span class="text-danger">*</span></label> <input
								type="text" name="username" id="username" class="form-control"
								value="${us.username}" autofocus="autofocus"> <span id="usernameEr"
								class="text-danger font-weight-bold"></span>
						</div>



						<div class="form-group col-md-6 offset-md-3">
							<label class="font-weight-bold">Email :<span class="text-danger">*</span></label> <input
								type="text" name="email" id="email" class="form-control"
								value="${us.email}" autofocus="autofocus"> <span id="emailEr"
								class="text-danger font-weight-bold"></span>
						</div>
						<div class="form-group col-md-6 offset-md-3">
							<label class="font-weight-bold">Mobile No:<span class="text-danger">*</span></label> <input
								type="number" name="mobileNo" id="mobileNo" class="form-control"
								value="${us.mobileNo}" autofocus="autofocus"> <span id="mobileNoEr"
								class="text-danger font-weight-bold"></span>
						</div>



						<div class="form-group col-md-6 offset-md-3">
							<label class="font-weight-bold">Gender :<span class="text-danger">*</span></label> <br>
							<input type="radio" name="gender" id="gender" value="Female"
								value="${us.gender}" autofocus="autofocus">Female <input type="radio"
								name="gender" id="gender" value="Male" value="${us.gender}" autofocus="autofocus">Male
							<br> <span id="genderEr"
								class="text-danger font-weight-bold"></span>
						</div>

						<div class="form-group col-md-6 offset-md-3">
							<label class="font-weight-bold">Choose Role:<span class="text-danger">*</span></label><select
								id="role" name="role" class="form-control"
								value="${us.role.roleId}">
								<option value="0">--select--</option>
								<c:forEach items="${roleList}" var="t">
									<option value="${t.roleId}">${t.roleName}</option>
								</c:forEach>
							</select> <span id="roleEr" class="text-danger font-weight-bold"></span>
						</div>

						<div class="form-group col-md-6 offset-md-3">
							<label class="font-weight-bold">Address :<span class="text-danger">*</span></label> <br>
							<textarea name="userAddress" id="userAddress"
								class="form-control" value="${us.userAddress}" autofocus="autofocus"></textarea>
							<span id="addressEr" class="text-danger font-weight-bold"></span>
						</div>



						<div class="form-group col-md-6 offset-md-3" align="center">
							<input type="submit" id="tabOneSubmit" value="Submit"
								class="btn btn-success">&nbsp;&nbsp; <input type="reset"
								value="Reset" class="btn btn-danger">

						</div>
					</div>

				</form>
			</div>
			<div id="view">
				<h3 class="text-danger">Application Status</h3>
				<div class="h3"></div>

				<table class="table table-stripped" id="RegistrationTable"
					border="1">
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
								<td><a href="./deleteUser?userId=${user.userId}"><i
										class="bi bi-trash text-danger"></i></a> &nbsp; &nbsp;<a
									href="./updateUser?userId=${user.userId}"><i
										class="bi bi-pencil-square"></i></a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
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
		var mobileCheck = /^[6789][0-9]{9}$/;
		var addressCheck = /^[A-Za-z., ]{6,}$/;

		if (nameCheck.test(vName)) {
			document.getElementById("nameEr").innerHTML = " ";
		} else {
			document.getElementById("nameEr").innerHTML = " ** UserName must contains 3 character and only alphabets ";
			return false;
		}
		if (usernameCheck.test(vusername)) {
			document.getElementById("usernameEr").innerHTML = " ";
		} else {
			document.getElementById("usernameEr").innerHTML = " ** UserName must contains 3 character and only alphabets ";
			return false;
		}
		if (emailCheck.test(vemail)) {
			document.getElementById("emailEr").innerHTML = " ";
		} else {
			document.getElementById("emailEr").innerHTML = " ** Please provide valid email ";
			return false;
		}
		if (mobileCheck.test(vmobileNo)) {
			document.getElementById("mobileNoEr").innerHTML = " ";
		} else {
			document.getElementById("mobileNoEr").innerHTML = " ** Please provide valid mobileNo and it should be indian standard ";
			return false;
		}
		if (addressCheck.test(vaddress)) {
			document.getElementById("addressEr").innerHTML = " ";
		} else {
			document.getElementById("addressEr").innerHTML = " ** Please provide Address Details and Address must contain atleast 6 letters !!";
			return false;
		}
		if (vgender.equals(null)) {
			document.getElementById("genderEr").innerHTML = " ";
		} else {
			document.getElementById("genderEr").innerHTML = " ** Choose gender !!";
		}
		if (vrole == 0) {
			document.getElementById("roleEr").innerHTML = " ";
		} else {
			document.getElementById("roleEr").innerHTML = " ** Please Select gender !!";
		}

	}
</script>

<script type="text/javascript">
	function autoFillUserDetails() {
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
<script type="text/javascript">
	$(document).ready(function() {
		$('#view').hide(); // Initially hide the "View" section
	});

	function openAdd() {
		$("#viewId").removeClass('active');
		$("#addId").addClass('active');
		$("#view").hide();
		$("#add").show();
	}

	function openView() {
		$("#addId").removeClass('active');
		$("#viewId").addClass('active');
		$("#add").hide();
		$("#view").show();
	}
</script>
</html>