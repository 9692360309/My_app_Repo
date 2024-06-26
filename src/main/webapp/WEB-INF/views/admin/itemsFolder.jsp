<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="navbar.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Option 1: Include in HTML -->


<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<link
	href="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.12/dist/sweetalert2.min.css
"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.12/dist/sweetalert2.all.min.js
"></script>
<style>
/* Remove default bullets */
/* Style the caret/arrow */
.caret {
	cursor: pointer;
	user-select: none; /* Prevent text selection */
}

/* Create the caret/arrow with a unicode, and style it */
.caret::before {
	content: "\27A4";
	color: blue;
	display: inline-block;
	margin-right: 6px;
}

/* Rotate the caret/arrow icon when clicked on (using JavaScript) */
.caret-down::before {
	transform: rotate(90deg);
}

/* Hide the nested list */
.nested {
	display: none;
}

/* Show the nested list when the user clicks on the caret/arrow (with JavaScript) */
.active {
	display: block;
}
</style>

</head>
<style>
.sidebar {
	width: 20%;
	height: 60%;
	position: absolute;
	padding-top: 0px 10px;
	z-index: 9999999999999999999999999999;
	overflow-y: scroll;
	overflow-x: scroll;
}

.sidebar2 {
	width: 20%;
	background: #eee;
	height: 29%;
	bottom: 0px;
	position: fixed;
	padding-top: 0px 10px;
	padding: 5px;
	z-index: 9999999999999999999999999999;
}

.footer {
	clear: both;
	position: fixed;
	bottom: 0;
	width: 100%;
	background-color: #23395d;
	text-align: center;
	text-decoration: white;
	color: white;
}

.box {
	height: 50%;
	width: 50%;
	padding: 3px;
	border: 1px solid gray;
	margin-top: 20px;
	background-color: white;
}

.adressNav {
	background-color: lightblue;
	margin-left: 300px;
}

#folderImg {
	height: 30px;
	width: 30px;
}

/* The Modal (background) */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

/* Modal Content/Box */
.modal-content {
	background-color: #23395d;
	color: white;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	margin: 15% auto;
}

/* Close Button */
.close {
	margin: right;
	align-items: right;
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
	float: right;
	justify-content: right;
	display: flex;
}

.close:hover, .close:focus {
	color: red;
	text-decoration: none;
	cursor: pointer;
}
</style>
<body>

	<div>
		<div class="sidebar">
			<div>
				<ul style="list-style: none;">
					<li><span id="item-${items.itemId}" class="caret"
						onclick="getItems(event)">Category</span> <input type="hidden"
						id='isOpenItem_' value="false"></li>
				</ul>



			</div>


		</div>
		<c:if test="${adressNav ne null }">

			<div class="adressNav">

				<span><i class="bi bi-folder-fill fa-2px text-warning"></i>items/
				</span>
				<c:if test="${itemNav eq 'yes'}">
					<a style="text-decoration: none" class="text-dark"
						href="./getItemList"><span> ${itemName} /</span></a>
				</c:if>
				<c:if test="${type ne null }">
					<a style="text-decoration: none" class="text-dark"
						href="./showQuestionType?itemId=${itemData}"><span>${subItem }
							/</span></a>
				</c:if>
				<c:if test="${question ne null }">
					<a style="text-decoration: none" class="text-dark"
						href="./showSubItem?questionTypeId=${qTypeData}"><span>${subItemId }</span></a>
				</c:if>

			</div>
		</c:if>
	</div>
	<div class="container">

		<script>
    // Check if the invalidFname flash attribute is set
   
 
	</script>

		<div class="container"
			style="margin-top: 25px; margin-left: 150px; margin-right: 50px; border: 1px solid black;">
			<p align="right">
				<span class="text-danger">*</span> indicates mandatory fields
			</p>
			<div class="card text-center"
				style="margin-right: 5rem; margin-left: 5rem;">
				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item"><a class="nav-link active" id="addId"
							onclick="openAddItems()">Add Category</a></li>
						<li class="nav-item"><a class="nav-link" id="subItemId"
							onclick="openSubItem()">Add SubCategory</a></li>
						<li class="nav-item"><a class="nav-link" id="addQuestionId"
							onclick="questionEnter()">Add Questions</a></li>
						<li class="nav-item"><a class="nav-link"
							id="addQuestionByExcelId" onclick="addQuestionsByExcel()">Add
								Questions By Excel</a></li>
					</ul>
				</div>

				<div id="add">

					<form id="additemId">
						<input type="hidden" name="itemId">
						<div class="card-body">

							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Add Category :<span class="text-danger">*</span></label>
								<input type="text" id="itemName" class="form-control"> <span
									id="itemNameEr" class="text-danger font-weight-bold"></span>
							</div>
							<div class="form-group col-md-6 offset-md-3" align="center">
								<button id="addItemBtn" class="btn btn-success">Submit</button>
								<button type="reset" class="btn btn-danger">Reset</button>

							</div>
						</div>
					</form>
				</div>


				<div id="subItem">
					<form method="post">
						<div class="container">
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Category Name<span
									class="text-danger">*</span>
								</label> <select class="form-control" name="itemName" id="itemId">
									<option value="0">--select--</option>
									<c:forEach items="${itemListsss}" var="item">
										<option value="${item.itemId}">${item.itemName}</option>
									</c:forEach>
								</select><span id="iEr" class="text-danger font-weight-bold"></span>
							</div>
							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Question Type :<span class="text-danger">*</span></label>
								<select name="type" class="form-control" id="typeId">
									<option value="0">--Select--</option>
									<c:forEach items="${questionTypeList}" var="qt">
										<option value="${qt.questionTypeId}">${qt.questionTypeName}</option>
									</c:forEach>
								</select> <span id="qtEr" class="text-danger font-weight-bold"></span>
							</div>

							<div class="form-group col-md-6 offset-md-3">
								<label class="font-weight-bold">Add SubCategory :<span
									class="text-danger">*</span></label> <input type="text"
									name="subItemName" id="subItemNameId" class="form-control">
								<span id="subItemNameEr" class="text-danger font-weight-bold"></span>
							</div>
							<div class="form-group col-md-6 offset-md-3" align="center">
								<input type="button" id="tabOneSubmit" value="Submit"
									class="btn btn-success" onclick="return checkSubItem();">&nbsp;&nbsp;
								<input type="reset" value="Reset" class="btn btn-danger">

							</div>


						</div>
					</form>

				</div>


				<div id="addQuestion">

					<form>
						<input type="hidden" name="optionValues" id="optionValues">
						<div class="form-group col-md-6 offset-md-3">
							<label class="font-weight-bold">Category Name<span
								class="text-danger">*</span>
							</label> <select class="form-control" name="iId" id="itemId">
								<option value="0">-select-</option>
								<c:forEach items="${itemListsss}" var="item">
									<option value="${item.itemId}">${item.itemName}</option>
								</c:forEach>
							</select><span id="itEr" class="text-danger font-weight-bold"></span>
						</div>

						<div class="form-group col-md-6 offset-md-3">
							<label class="font-weight-bold">Question Type :<span
								class="text-danger">*</span></label> <select class="form-control"
								id="typeId" name="type" onchange="getSubItemByqId()">
								<option value="0">-Select-</option>
								<c:forEach items="${questionTypeList}" var="qt">
									<option value="${qt.questionTypeId}">${qt.questionTypeName}</option>
								</c:forEach>
							</select> <span id="qEr" class="text-danger font-weight-bold"></span>
						</div>

						<div class="form-group col-md-6 offset-md-3">
							<label class="font-weight-bold">SubCategory Name<span
								class="text-danger">*</span>
							</label> <select class="form-control" name="sName" id="sNameId">
								<option value="0">-select-</option>
							</select>
						</div>

						<div class="form-group col-md-6 offset-md-3">
							<label class="font-weight-bold">Question Text :<span
								class="text-danger">*</span></label> <input type="text"
								name="questionText" id="questionTextId" class="form-control">
							<span id="questionTextEr" class="text-danger font-weight-bold"></span>
						</div>

						<div class="form-group col-md-6 offset-md-3" id="options">
							<div class="name-list">
								<label for="option1" class="font-weight-bold">Option :</label> <input
									type="checkbox" name="cb"> <input type="text"
									id="option1" name="opt" onclick="getCheckbox(this)"> <span id="optionEr"
									class="text-danger font-weight-bold"></span>
								<button onclick="deleteRow(this)">
									<i class="fa far fa-minus-circle"></i>
								</button> 

								<br>
							</div>
							<div class="name-list">
								<label for="option2" class="font-weight-bold">Option :</label> <input
									type="checkbox" name="cb"> <input type="text"
									id="option2" name="opt" onclick="getCheckbox(this)"> <span id="option2Er"
									class="text-danger font-weight-bold"></span>
								<button onclick="deleteRow(this)">
									<i class="fa far fa-minus-circle"></i>
								</button>

								<br>
							</div>

						</div>


						<div class="form-group col-md-6 offset-md-3" id="addbtn">
							<a class="btn btn-info sign-bttn" onclick="addRowAfter()">+</a>
						</div>
                       <div class="form-group col-md-6 offset-md-3" id="correctans">
							<label class="font-weight-bold">Correct Answer :<span
								class="text-danger">*</span></label> <input type="text"
								name="correctAns" id="correctAnsId" class="form-control">
							<span id="applicantNameEr" class="text-danger font-weight-bold"></span>
						</div>

						<div class="form-group col-md-6 offset-md-3" align="center">
							<input type="button" onclick="return addQuestionBtn()"
								value="Submit" class="btn btn-success">&nbsp;&nbsp; <input
								type="reset" value="Reset" class="btn btn-danger">

						</div>
					</form>
				</div>


				<div id="addQuestionByExcel">

					<div class="container">
						<div class="container"
							style="margin-top: 25px; border: 1px solid black; background-color: #eee">
							<form">

								<div class="form-group col-md-6 offset-md-3">
									<label class="font-weight-bold">Category Name<span
										class="text-danger">*</span>
									</label> <select class="form-control" name="itId" id="itId">
										<option value="0">-select-</option>
										<c:forEach items="${itemListsss}" var="item">
											<option value="${item.itemId}">${item.itemName}</option>
										</c:forEach>
									</select><span id="itemListEr" class="text-danger font-weight-bold"></span>
								</div>

								<div class="form-group col-md-6 offset-md-3">
									<label class="font-weight-bold">Question Type :<span
										class="text-danger">*</span></label> <select class="form-control"
										id="qtypeId" name="qtypeId"
										onchange="getSubItemByqIdByExcel();">
										<option value="0">-Select-</option>
										<c:forEach items="${questionTypeList}" var="qt">
											<option value="${qt.questionTypeId}">${qt.questionTypeName}</option>
										</c:forEach>
									</select> <span id="questionTypeListEr"
										class="text-danger font-weight-bold"></span>
								</div>
								<div class="form-group col-md-6 offset-md-3">
									<label class="font-weight-bold">SubCategory Name<span
										class="text-danger">*</span>
									</label> <select class="form-control" name="subName" id="subNameId">
										<option value="0">-select-</option>
									</select><span class="text-danger font-weight-bold"></span>
								</div>


								<div class="form-group col-md-6 offset-md-3">
									<label class="font-weight-bold">Upload Questions List :<span
										class="text-danger">(upload excel as given
											format)Please Select Question Type Before download Excel
											format <a id="downloadLink" onclick="showDownloadLink();"><i
												class="fa-sharp fa-solid fa-file-excel"
												style="color: green; cursor: pointer;">download excel</i></a>
									</span></label> <input type="file" name="excelQuestionfile"
										id="excelQuestionfile" class="form-control"><span
										id="excelQuestionfileEr" class="text-danger font-weight-bold"></span>
								</div>
								<div class="form-group col-md-6 offset-md-3" align="center">
									<input type="button" id="tabOneSubmit" class="btn btn-success"
										onclick="return excelFilePost();" value="Submit">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<div id="modal-body"></div>
		</div>
	</div>


	<div class="footer">
		<p>@CSM All Right Reserved @ Online Examination System</p>
	</div>
</body>
<script type="text/javascript">


//excel post 
function excelFilePost(){
	
	let itId = $("#addQuestionByExcel #itId").val();
	let qtypeId = $("#addQuestionByExcel #qtypeId ").val();
	let subName = $("#addQuestionByExcel #subNameId").val();
  let excelFile =  $("#addQuestionByExcel #excelQuestionfile");
if(itId == '0'){
	Swal.fire('Failed','Category is Required','error')
	return false;
}else if(qtypeId == "0"){
	Swal.fire('Failed','QuestionType is Required','error')
	return false;
}
else if(excelFile.val() == ''){
	Swal.fire('Failed','ExcelFile is Required','error');
	return false;
}else if (excelFile.val() != ''){
	const fileName = excelFile[0].files[0].name;
	if(fileName.endsWith(".xls") || fileName.endsWith(".xlsx")){}
	else{
		Swal.fire('Failed','Only .xls, xlsx file required','error');
			return false;
	}
}


 if(true){
    const form = new FormData();
			form.append("itId", itId);
			form.append("qtypeId", qtypeId);
			form.append("subName", subName);
			form.append("excelQuestionfile", $("#excelQuestionfile")[0].files[0]);

			const settings = {
			  "async": true,
			  "crossDomain": true,
			  "url": "getQuestionsByExcel",
			  "method": "POST",
			  "headers": {
			    "Accept": "*/*"
			  },
			  "processData": false,
			  "contentType": false,
			  "mimeType": "multipart/form-data",
			  "data": form
			};

			$.ajax(settings).done(function (response) {
				
				console.log(response);
			   if(response == 'failed'){
				  Swal.fire('failed','Error Found','error');
				  return false;
				  }
			   else if(response == 'columnsNotEqual'){
					  Swal.fire('failed','All Required Columns Not Present','error');
					  return false;
				  }
			  else if(response.startsWith("Columns")){
				  Swal.fire('failed', '<div style="color:red;font-weight:Bold">'+response+'</div>' +' <div style="color:red;font-weight:Bold;">Incorrect </div> <h6 style="color:green;"> Required Columns Question Text, Option 1, Option 2, Option 3, Option 4, Option 5, Correct Answer </h6>','error');
				  return false;
				  }
			  else if(response == 'success'){
					  Swal.fire('saved','ExcelFile is saved successfully','success');
					  }
			}).fail(function() {
				 Swal.fire({
						icon : 'error',
						title : 'failed',
						text : 'Error Found '
					});
			  });
        
}
	
}


function getSubItemByqIdByExcel() {
	
	var typeId = $("#addQuestionByExcel #qtypeId ").val();
	var itemId = $("#addQuestionByExcel #itId").val();
	$.ajax({
		type : "GET",
		url : "./getSubItemListByQuestionTypeId",
		data : "questionTypeId=" + typeId + "&itemId=" + itemId,
		success : function(response) {
			$("#addQuestionByExcel #subNameId").html(response);
		}	
	});

}



function addQuestionBtn(){

	let arr = $("#addQuestion form").serializeArray();
    let optionStr = "";
    let itemId = "";
    let typeId = "";
    let sName = "";
    let questionText = "";
    let correctAns = "";
    $.each(arr, function(index, elem){
        if(elem.name == 'opt'){
            optionStr +=$.trim(elem.value) + "#" ; 
        }
        if(elem.name == 'iId'){
			itemId = $.trim(elem.value);
            }
        if(elem.name == 'type'){
        	typeId = $.trim(elem.value);
            }
        if(elem.name == 'sName'){
			sName = $.trim(elem.value);
            }
        if(elem.name == 'questionText'){
        	questionText = $.trim(elem.value);
            }
    })
    
    
      $.each($("input[name='cb']:checked").next(), function (index, elem) {
        let val = $.trim($(elem).val());
        if(val.length > 0){
        	correctAns += val+"#";
        }
      });
    
    correctAns = correctAns.substring(0, correctAns.length-1);
    
    optionStr =optionStr.substring(0,optionStr.length-1);

    if(correctAns.length == 0){
    	Swal.fire({
    		icon : 'error',
    		title : 'Failed',
    		text : 'Answer Required'
    	});
    	correctAns = "";
    	return false;
        }
  

    if(optionStr.length == 0 || optionStr.includes("##") || optionStr.endsWith("#") ){
    	Swal.fire({
    		icon : 'error',
    		title : 'Failed',
    		text : 'Question Dont Blank'
    	});
    	correctAns = "";
    	return false;
        }
    
    if(itemId == 0 || typeId == 0 || questionText.length == 0){
        Swal.fire({
		icon : 'error',
		title : 'Failed',
		text : 'Item, type, question is Required'
	});
    }else{
        Swal.fire({
        title: 'Do you Save Data?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Save'
      }).then((result) => {
        if (result.isConfirmed) {
          $.ajax({
              url: "saveQuestions",
              type: "POST",
              data: {optionStr, itemId, questionTypeId:typeId, subItemId: sName, questionText,correctAns},
              success: function(response){
                  console.log(response);
                  //response = 'success';
                  if(response == 'success'){
                      Swal.fire(
                      'Saved!',
                      ' Question successfully Saved',
                      'success'
                      ).then((result) => {
                      	//$("body").load("http://localhost:8088/exam/createFolder");
                    	  location.reload();
                    	
                  	});
                  }else if(response == "failed"){
                  	Swal.fire(
                              'error!',
                              '  SubCategory is already Exist',
                              'error'
                              )
                      }
                  else{
                      Swal.fire(
                      'error!',
                      testName+' SubCategory Not Saved',
                      'error'
                      )
                  }
              }
          });
      }else{
      	 Swal.fire(
      			 'Cancelled',
      		      'Your file is safe',
      		      'error'
      		      )
          }
  })
   
    }

	return false;
};





//Add Items 
	$("#addItemBtn").on("click", function(event){
		event.preventDefault();
		let itemName = $("#additemId #itemName").val();
	    itemName = $.trim(itemName);
	    
	    if (!isNaN(itemName.charAt(0))) {
		    Swal.fire('Failed', 'First character cannot be a number', 'error');
		    return false;
		}
	            if(itemName.length == 0){
	                Swal.fire({
								icon : 'error',
								title : 'Failed',
								text : 'Category is Required'
							});
	            }else if(itemName.length > 0){
	                Swal.fire({
	                  title: 'Do you Save Data?',
	                  icon: 'warning',
	                  showCancelButton: true,
	                  confirmButtonColor: '#3085d6',
	                  cancelButtonColor: '#d33',
	                  confirmButtonText: 'Save'
	                }).then((result) => {
	                  if (result.isConfirmed) {
	                    $.ajax({
	                        url: "addItems",
	                        type: "POST",
	                        data: {
	                        	itemName : itemName,
	                            
	                        },
	                        success: function(response){
	                            console.log(response);
	                            //response = 'success';
	                            if(response == 'success'){
	                                Swal.fire(
	                                'Saved!',
	                                itemName+' Category successfully Saved',
	                                'success'
	                                ).then((result) => {
	                                	//$("body").load("http://localhost:8088/exam/createFolder");
	                              	  location.reload();
	                                	
	                                	});
	                                	
	                            }else if(response == "failed"){
	                            	Swal.fire(
	                                        'error!',
	                                        itemName+'  Category is already Exist',
	                                        'error'
	                                        )
	                                }
	                            else{
	                                Swal.fire(
	                                'error!',
	                                itemName+' Category Not Saved',
	                                'error'
	                                )
	                            }
	                        }
	                    }).then(function(data,textSt,xhr){
	        				console.log(textSt);
	        			});
	                }else{
	                	 Swal.fire(
	                			 'Cancelled',
	                		      'Your file is safe',
	                		      'error'
	                		      )
	                    }
	            })
	            
	        }
			
		});


function checkSubItem(){
	
	let itemName = $("#itemId").val();
    itemName = $.trim(itemName);
    let type = $("#typeId").val();
    type =    $.trim(type);
    let subItemName =$("#subItemNameId").val();
    subItemName = $.trim(subItemName);

if(itemName == 0 || type == 0 || subItemName.length == 0){
	Swal.fire({
		icon : 'error',
		title : 'Failed',
		text : 'All field is Required'
	});
	
}else{
    Swal.fire({
        title: 'Do you Save Data?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Save'
      }).then((result) => {
        if (result.isConfirmed) {
          $.ajax({
              url: "addSubItem",
              type: "POST",
              data: {
            	  subItemName: subItemName,
            	  itemName: itemName,
            		  type: type,
                  
              },
              success: function(response){
                  console.log(response);
                  //response = 'success';
                  if(response == 'success'){
                      Swal.fire(
                      'Saved!',
                      subItemName+' SubCategory successfully Saved',
                      'success'
                      ).then((result) => {
                    	//$("body").load("http://localhost:8088/exam/createFolder");
                    	  location.reload();
                  	});
                  }else if(response == "failed"){
                  	Swal.fire(
                              'error!',
                              subItemName+'  SubCategory is already Exist',
                              'error'
                              )
                      }
                  else{
                      Swal.fire(
                      'error!',
                      testName+' SubCategory Not Saved',
                      'error'
                      )
                  }
              }
          });
      }else{
      	 Swal.fire(
      			 'Cancelled',
      		      'Your file is safe',
      		      'error'
      		      )
          }
  })
  
}
    
   return false;
	
}

        $("#options").hide();
        $("#addbtn").hide();
        $("#addQuestion #typeId").on("change", function(){
         	if($("#addQuestion #typeId").val() == 1){
         	 	alert($("#addQuestion #typeId").val()+" is the value");
         	 	 $("#options").hide();
                 $("#addbtn").hide();
                 $("#correctans").show();
         		
         	}
         	else if($("#addQuestion #typeId").val() == 2){
         		alert($("#addQuestion #typeId").val()+" is the value");
         		 $("#options").show();
                 $("#addbtn").show(); 
         		$("#correctans").show();
         	}
        

         	function optioncheck(){
                let arr = $("form").serializeArray();
                let optionStr = "";
                $.each(arr, function(index, elem){
                    if(elem.name == 'opt'){
                        optionStr +=elem.value + "#" ; 
                    }
                })
                
                let option1 =optionStr.substring(0,optionStr.length-1);

                $("#optionValues").val(option1);
                console.log(option1);
            }

         	
         	function getCheckbox(value) {
                let selectedOptions = [];
                $("input[name='cb']:checked").each(function () {
                    selectedOptions.push($(this).next().val());
                });

                $("#correctAnsId").val(selectedOptions.join("#"));
            }
        
        })

        
        function addRowAfter(){
  	      var options = $('#options');
            var optionLength = options.children().length;
              optionLength++;
                var rowHtml= '<div class="name-list"><label for="option'+optionLength+'" class="font-weight-bold">Option :</label> <input type="checkbox" name="cb" onclick="getCheckbox(this)"> <input type="text" id="option'+optionLength+'" name="opt"> <button onclick="deleteRow(this)"> <i class="fa far fa-minus-circle"></i> </button> <br></div>';
                options.append(rowHtml);

          if(optionLength < 3){
  	            $("#options").children().find("button").hide();
                  $("#addbtn").show();
  	        }else if(optionLength >= 3 && optionLength < 5){
                  $("#options").children().find("button").show();
                  $("#addbtn").show();
              }else if(optionLength == 5) {
                  $("#options").children().find("button").show();
                  $("#addbtn").hide();
              }
  	    }

          if($('#options').children().length < 3){
              $("#options").children().find("button").hide();
          }else{
              $("#options").children().find("button").show();
          }

        function deleteRow(ele){
            $(ele).parent().remove();
	        var options = $('#options');
            var optionLength = options.children().length;

	        if(optionLength < 3){
	            $("#options").children().find("button").hide();
                $("#addbtn").show();
	        }else if(optionLength >= 3 && optionLength < 5){
                $("#options").children().find("button").show();
                $("#addbtn").show();
            }else if(optionLength == 5) {
                $("#options").children().find("button").show();
                $("#addbtn").hide();
            }

	    }

        function getSubItemByqId() {
			 var typeId = $("#addQuestion #typeId").val();
			var itemId = $("#addQuestion #itemId").val();
			
			$.ajax({
				type : "GET",
				url : "./getSubItemListByQuestionTypeId",
				data : "questionTypeId=" + typeId + "&itemId=" + itemId,
				success : function(response) {

					$("#addQuestion #sNameId").html(response);
				}	
			});
 
		}
    </script>



<script type="text/javascript">
	$(document).ready(function() {
		$('#add').show();
		$('#subItem').hide();
		$('#addQuestion').hide();
		$("#addQuestionByExcel").hide();
		$.ajax({
			type : "GET",
			url : "./getTabInfo",
			success : function(response) {
				t = response;
				/* var modalBodyContent.innerHTML =response; */
				if (t == 1) {
					openAddItems();
				} else if (t == 2) {
					openSubItem();
				} else if (t == 3) {
					questionEnter();
				} else if (t == 4) {
					addQuestionsByExcel();
				}
				console.log("yes its here " + response);
			}
		});

		/* 
		 if ($("#addQuestionId").hasClass('active')) {
		 questionEnter(); // Call the questionEnter() function to show the 'Add Questions' content
		 } */

	});
	function openAddItems() {
		$("#addId").addClass('active')
		$("#subItemId").removeClass('active')
		$("#addQuestionId").removeClass('active')
		$("#addQuestionByExcelId").removeClass('active')

		$("#add").show();
		$("#subItem").hide();
		$("#addQuestion").hide();
		$("#addQuestionByExcel").hide();
		$.ajax({
			type : "GET",
			url : "./getTabInfo",
			data : "Tab=" + 1,
			success : function(response) {
				/* var modalBodyContent.innerHTML =response; */
				console.log(response + " is submitted");
			}
		});
	}

	function openSubItem() {
		$("#addId").removeClass('active')
		$("#subItemId").addClass('active')
		$("#addQuestionId").removeClass('active')
		$("#addQuestionByExcelId").removeClass('active')

		$("#add").hide();
		$("#subItem").show();
		$("#addQuestion").hide();
		$("#addQuestionByExcel").hide();
		$.ajax({
			type : "GET",
			url : "./getTabInfo",
			data : "Tab=" + 2,
			success : function(response) {
				
				console.log(response + " is submitted");
			}
		});
	}

	function questionEnter() {
		$("#addId").removeClass('active')
		$("#subItemId").removeClass('active')
		$("#addQuestionId").addClass('active')
		$("#addQuestionByExcelId").removeClass('active')

		$("#add").hide();
		$("#subItem").hide();
		$("#addQuestion").show();
		$("#addQuestionByExcel").hide();
		$.ajax({
			type : "GET",
			url : "./getTabInfo",
			data : "Tab=" + 3,
			success : function(response) {
				/* var modalBodyContent.innerHTML =response; */
				console.log(response + " is submitted");
			}
		});
	}

	function addQuestionsByExcel() {
		$("#addId").removeClass('active')
		$("#subItemId").removeClass('active')
		$("#addQuestionId").removeClass('active')
		$("#addQuestionByExcelId").addClass('active')

		$("#add").hide();
		$("#subItem").hide();
		$("#addQuestion").hide();
		$("#addQuestionByExcel").show();
		$.ajax({
			type : "GET",
			url : "./getTabInfo",
			data : "Tab=" + 4,
			success : function(response) {
				/* var modalBodyContent.innerHTML =response; */
				console.log(response + " is submitted");
			}
		});
	}

	// Update the code below
</script>
<script>
	function openSubItemById() {
		var typeId = $("#typeId").val();
		var itemId = $("#iId").val()

		$.ajax({
			type : "GET",
			url : "./getSubItemListByQuestionTypeId",
			data : "questionTypeId=" + typeId + "&itemId=" + itemId,
			success : function(response) {

				$("#sName").html(response);
			}
		});
	}
		function resetForm() {
			  var form = document.getElementById("additemId");
			  form.reset();
			}
		
</script>
<script>
	function showHide() {
		var type = document.getElementById("typeId").value;

		if (type == "2") {
			document.getElementById("options").style.display = "block";
			document.getElementById("text").style.display = "none";
		} else {
			document.getElementById("options").style.display = "none";
			document.getElementById("text").style.display = "block";

		}
	}


	var modal = document.getElementById("myModal");

	var span = document.getElementsByClassName("close")[0];

	function openModalForQuestion(questionId) {

		$.ajax({
			type : "GET",
			url : "./getQuestionBodyForModelById",
			data : "questionId=" + questionId,
			success : function(response) {
				/* var modalBodyContent.innerHTML =response; */

				var modalBody = document.getElementById("modal-body");
				modalBody.innerHTML = response;

				modal.style.display = "block";
			}
		});

	}

	function closeModal() {
		modal.style.display = "none";

		var modalBody = document.getElementById("modal-body");
		modalBody.innerHTML = "";
	}

	span.onclick = function() {
		closeModal();
	};

	window.onclick = function(event) {
		if (event.target == modal) {
			closeModal();
		}
	};

	/* for opening tab when submitted */
	function afterSubmitTabOpened() {

		//alert("let go ")

	}
</script>

<script>
	function getItems(event) {
		/// alert("abc");

		var span = event.target;
		var li = span.parentNode;
		//var unList = li.querySelector("ul");
		const elementsToRemove = li.querySelectorAll('ul');
		elementsToRemove.forEach(element => {
		  element.remove();
		});
		var isOpen = span.nextElementSibling;
		var isOpenValue = isOpen.value;

		if (isOpenValue === "false") {
			$.ajax({
				type : "GET",
				url : "./getAllItems",
				success : function(response) {
					//alert(response);
					if(response == ""){
							
						}
					else{
					var values = response.split(",");
					var unList = document.createElement("ul");
					unList.style.listStyleType = 'none';
					document.getElementById("item-").classList
							.add('caret-down');
					for (var i = 0; i < values.length; i++) {
						var itemId = values[i].split("_")[1];
						var itemName = values[i].split("_")[0];

						var list = document.createElement("li");
						list.style.listStyleType = 'none';
						list.innerHTML = '<span class="caret" id="qType-'
								+ itemId + '-' + i
								+ '" onclick="getAllQuestionType(event)">'
								+ itemName + '</span><br/>';
						unList.appendChild(list);

						var newInput = document.createElement("input");
						newInput.setAttribute("type", "hidden");
						newInput.setAttribute("id", "isOpenQuestionType_"
								+ itemId);
						newInput.setAttribute("value", "false");
						unList.appendChild(newInput);
					}

					var li = span.parentNode;
					li.appendChild(unList);
					isOpen.value = "true";
				}
				}
			});
		} else {
			var li = span.parentNode;
			var unList = li.querySelector("ul");
			if (unList) {
				li.removeChild(unList);
			}
			isOpen.value = "false";
		}
		document.getElementById("item-").classList.remove('caret-down');
	}

	function getAllQuestionType(event) {
			var span = event.target;
		{
			span.classList.add('caret-down');
			
			var itemId = span.id.split('-')[1];
			
			var isOpenQuestionType = document
					.getElementById("isOpenQuestionType_" + itemId);
			

			var isOpenQuestionTypeValue = isOpenQuestionType.value;
		
			if (isOpenQuestionTypeValue === "false") {

				$
						.ajax({
							type : "GET",
							url : "./showQuestionTypeById",
							data : "itemId=" + itemId,
							success : function(response) {
								
								var values = response.split(",");
								var unList = document.createElement("ul");
								unList.style.listStyleType = 'none';
								for (var i = 1; i <= values.length; i++) {
									var list = document.createElement("li");
									list.style.listStyleType = 'none';
									
									list.innerHTML = '<span class="myButton"></span></i><span class="caret" id="qType-'
											+ itemId
											+ '-'
											+ i
											+ '"  onclick="getAllsubItem(event)">'
											+ values[i - 1] + '</span><br/>';
									
									unList.appendChild(list);
									var newInput = document
											.createElement("input");
									newInput.setAttribute("type", "hidden");
									newInput.setAttribute("id",
											"isOpenSubItemType_" + itemId + "_"
													+ i);
									newInput.setAttribute("value", "false");
									unList.appendChild(newInput);
								}

								var li = span.parentNode;
								li.appendChild(unList);
								isOpenQuestionType.value = "true";
							}

						});
			} else {
				span.classList.remove('caret-down');
				var li = span.parentNode;
				var unList = li.querySelector("ul");
				if (unList) {
					li.removeChild(unList);
				}
				isOpenQuestionType.value = "false";
			}
			

		}
	}

	function getAllsubItem(event) {
		var span = event.target;
		var itemId = span.id.split('-')[1];
		//alert(itemId);
		var questionTypeId = span.id.split('-')[2];
		//alert(questionTypeId);
		var isOpenSubItemType = document.getElementById("isOpenSubItemType_"
				+ itemId + "_" + questionTypeId);
		var isOpenSubItemTypeValue = isOpenSubItemType.value;

		if (isOpenSubItemTypeValue === "false") {

			
			$
					.ajax({
						type : "GET",
						url : "./getAllsubItem",
						data : "itemId=" + itemId + '&questionTypeId='
								+ questionTypeId,
						success : function(response) {
							//alert(response+"after questiontype");
							if(response == ""){
								}else{
							var ques = response.split(":");
							span.classList.add('caret-down');
							if (ques[0] != "" && ques[1] != "") {
								// Remove existing sub-items if they exist
								$('#subItem-' + itemId + '-' + questionTypeId)
										.parent().remove();
								// Append new sub-items to the list
								var qCode = ques[0].split("_");
								var values = qCode[1].split(",");
								var questionCode = qCode[0];
								var unList = document.createElement("ul");
								unList.style.listStyleType = 'none';
								for (var i = 0; i < values.length - 1; i++) {
									var list = document.createElement("li");
									list.style.listStyleType = 'none';
									list.style.width = '300px';
									var questionId = values[i];
									var questionIdWithCode = '"' + questionCode
											+ '_' + questionId + '"';
									var questionIdWithCodeObject = questionCode
											+ '_' + questionId;
									list.innerHTML = "<span id='question_'"
										+ questionId
										+ " onclick='openModal("
										+ questionId
										+ ")'><i class='fa fa-file-text-o' aria-hidden='true'></i>"
										+ questionCode+"-"+questionId
										+ "</span>  ";
									unList.appendChild(list);
								}
								var li = span.parentNode;
								li.appendChild(unList);
								isOpenSubItemType.value = "true";
								var values = ques[1].split(",");
								var unList = document.createElement("ul");
								unList.style.listStyleType = 'none';
								if (values.length != 0) {
									for (var i = 0; i < values.length; i++) {
										var subItemObject = values[i]
												.split("_");
										if (subItemObject != "") {
											var list = document
													.createElement("li");
											list.style.listStyleType = 'none';
											list.innerHTML = '<span class="caret" id="subItem-'
													+ subItemObject[1]
													+ '-'
													+ questionTypeId
													+ '" onclick="getQuestionBySubItemId(event)">'
													+ subItemObject[0]
													+ '</span><br/>';
											unList.appendChild(list);
											var newInput = document
													.createElement("input");
											newInput.setAttribute("type",
													"hidden");
											newInput.setAttribute("id",
													"isOpenQuestion_"
															+ subItemObject[1]);
											newInput.setAttribute("value",
													"false");
											unList.appendChild(newInput);
										}
									}
								}
								var li = span.parentNode;
								li.appendChild(unList);
								isOpenSubItemType.value = "true";
							} else if (ques[0] == "" && ques[1] != "") {
								// Remove existing sub-items if they exist
								$('#subItem-' + itemId + '-' + questionTypeId)
										.parent().remove();
								// Append new sub-items to the list
								var values = ques[1].split(",");
								var unList = document.createElement("ul");
								unList.style.listStyleType = 'none';
								if (values.length != 0) {
									for (var i = 0; i < values.length; i++) {
										var subItemObject = values[i]
												.split("_");
										if (subItemObject != "") {
											var list = document
													.createElement("li");
											list.style.listStyleType = 'none';
											list.innerHTML = '<span class="caret" id="subItem-'
													+ subItemObject[1]
													+ '-'
													+ questionTypeId
													+ '" onclick="getQuestionBySubItemId(event)">'
													+ subItemObject[0]
													+ '</span><br/>';
											unList.appendChild(list);
											var newInput = document
													.createElement("input");
											newInput.setAttribute("type",
													"hidden");
											newInput.setAttribute("id",
													"isOpenQuestion_"
															+ subItemObject[1]);
											newInput.setAttribute("value",
													"false");
											unList.appendChild(newInput);
										}
									}
								}
								var li = span.parentNode;
								li.appendChild(unList);
								isOpenSubItemType.value = "true";
							} else {
								// Remove existing sub-items if they exist
								$('#subItem-' + itemId + '-' + questionTypeId)
										.parent().remove();
								// Append new sub-items to the list
								var qCode = ques[0].split("_");
								var values = qCode[1].split(",");
								var questionCode = qCode[0];
								var unList = document.createElement("ul");
								unList.style.listStyleType = 'none';
								for (var i = 0; i < values.length - 1; i++) {
									var list = document.createElement("li");
									list.style.listStyleType = 'none';
									list.style.width = '300px';
									var questionId = values[i];
									//alert(questionId);
									var questionIdWithCode = '"' + questionCode
											+ '_' + questionId + '"';
									var questionIdWithCodeObject = questionCode
											+ '_' + questionId;
									list.innerHTML = "<span id='question_'"
										+ questionId
										+ " onclick='openModal("
										+ questionId
										+ ")'><i class='fa fa-file-text-o' aria-hidden='true'></i>"
										+ questionCode+"-"+questionId
										+ "</span>  ";
									unList.appendChild(list);
								}
								var li = span.parentNode;
								li.appendChild(unList);
								isOpenSubItemType.value = "true";
							}
						}
						}
					});
		} else {
			span.classList.remove('caret-down');
			var li = span.parentNode;
			//var unList = li.querySelector("ul");
			const elementsToRemove = li.querySelectorAll('ul');
			elementsToRemove.forEach(element => {
			  element.remove();
			});
			/* console.log(unList + " is the value of ul");
			if (unList) {
				li.removeChild(unList);
			} */
			isOpenSubItemType.value = "false";
		}
	}

	///For Show All Question
	function getQuestionBySubItemId(event) {
		var span = event.target;
		var subitemId = span.id.split('-')[1];

		var questionTypeId = span.id.split('-')[2];

		var isOpenQuestion = document.getElementById("isOpenQuestion_"
				+ subitemId);
		var isOpenQuestionValue = isOpenQuestion.value;

		if (isOpenQuestionValue === "false") {
			span.classList.add('caret-down');
			$
					.ajax({
						type : "GET",
						url : "./getQuestionBySubId",
						data : "questionTypeId=" + questionTypeId
								+ '&subitemId=' + subitemId,
						success : function(response) {

							if (response != "") {
								var questionObject = response.split("_");

								var questionCode = questionObject[0];

								//alert(questionCode);
								//alert(questionObject[1]);
								var values = questionObject[1].split(",");
								//alert(values)
								var unList = document.createElement("ul");///////////
								unList.style.listStyleType = 'none';
								for (var i = 0; i < values.length; i++) {
									var list = document.createElement("li");
									list.style.listStyleType = 'none';
									list.style.width = '300px';
									var questionId = values[i];
									//alert(questionId);
									var questionIdWithCode = '"' + questionCode
											+ '_' + questionId + '"';

									var questionIdWithCodeObject = questionCode
											+ '_' + questionId;

									list.innerHTML = "<span id='question_'"
										+ questionId
										+ " onclick='openModal("
										+ questionId
										+ ")'><i class='fa fa-file-text-o' aria-hidden='true'></i>"
										+ questionCode+"-"+questionId
										+ "</span>  ";
									unList.appendChild(list);

									
								}
								var li = span.parentNode;
								li.appendChild(unList);
								isOpenQuestion.value = "true";
							}
						}

					});
		} else {
			span.classList.remove('caret-down');
			var li = span.parentNode;
			var unList = li.querySelector("ul");
			if (unList) {
				li.removeChild(unList);
			}
			isOpenQuestion.value = "false";
		}
	}

	var modal = document.getElementById("myModal");

	var span = document.getElementsByClassName("close")[0];

	function openModal(questionId) {
		$.ajax({
			type : "GET",
			url : "./getQuestionBodyForModelById",
			data : "questionId=" + questionId,
			success : function(response) {
				/* var modalBodyContent.innerHTML =response; */

				var modalBody = document.getElementById("modal-body");
				modalBody.innerHTML = response;

				modal.style.display = "block";
			}
		});

	}
	function myFunction(item, index) {
		newItem = newItem
				+ '<li><span class="caret" id="qType-'
				+ item.itemId
				+ '" onclick="getAllQuestionType(event)">'
				+ item.itemName
				+ '</span><br/><input type="hidden" id="isOpenQuestionType_' + item.itemId+'"' + ' value="false"></li>';
		//return newItem;
		//console.log(newItem+"her is themaal");
		s += "<option value =" + item.itemId+ ">" + item.itemName + "</option>";
	}

	function closeModal() {
		modal.style.display = "none";

		var modalBody = document.getElementById("modal-body");
		modalBody.innerHTML = "";
	}

	span.onclick = function() {
		closeModal();
	};

	window.onclick = function(event) {
		if (event.target == modal) {
			closeModal();
		}
	};

	//Submit Item
	
	

</script>

<script type="text/javascript">
function showDownloadLink() {


	let itemId = $("#addQuestionByExcel #itId ").val();
	let questionType = $("#addQuestionByExcel #qtypeId ").val();


	if(itemId == '0'){
	Swal.fire(
	    'Error',
	          'Please Select Item',
	          'error'
	          )
	}else if(questionType  == '0'){
	Swal.fire(
	    'Error',
	          'Please Select QuestionType',
	          'error'
	          )
	}else if (questionType == 1) {
	location.href = "./subjectiveQuestions/export/excel";

	}else if (questionType == 2) {

	location.href = "./questions/export/excel";
	} else {
	Swal.fire(
	    'Cancelled',
	          'Your file is safe',
	          'error'
	          )

	}
	}

</script>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", () => {
    setTimeout(function() {
        const alertElement = document.getElementById('alertId');
        if (alertElement) {
            alertElement.style.display = 'none';
        }
    }, 3000);
});
</script>
</html>