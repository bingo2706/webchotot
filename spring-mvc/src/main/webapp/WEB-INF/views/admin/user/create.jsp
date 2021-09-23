<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/user"/>
<c:url var="NewURL" value="/admin-user"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tạo sản phẩm</title>
</head>
<body>
<div style="display:flex; flex-direction: column;">
	<div style="width:100vw;" class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
               
                     <c:if test="${not empty model.id }">
  					 <li style="margin-left:8px;" class="active">Chỉnh sửa người dùng</li> 
  					</c:if>
                         <c:if test="${empty model.id }">
  					 <li style="margin-left:8px;" class="active">Thêm mới người dùng</li> 
  					</c:if>
              
            </ul><!-- /.breadcrumb -->
        </div>
     
     	
     
     
      		<form:form style="margin: 40px; width:40%;" action="/api/createUser" method="POST" modelAttribute="model" id="formSubmit">
  <div class="form-group">
    <label for="username">Tên người dùng</label>
    <input type="text" class="form-control" id="username" name="username" value="${model.username }" >
  
  </div>
   <div class="form-group">
    <label for="exampleFormControlSelect1">Phân quyền</label>
    <form:select class="form-control" id="exampleFormControlSelect1" path="roleCode">
      	<form:option value="" label="-- Chọn thể loại --" />
      	<form:options items="${roles}" />
    </form:select>
  </div>
  <c:if test="${empty model.id }">
   <div class="form-group">
   <label for="shortDescription">Hình đại diện</label>
    <input type="file" class="form-control" id="uploadImage"  >
    <input type="hidden" class="form-control" id="thumbnail" name ="thumbnail" >
    <input type="hidden" class="form-control" id="base64" name="base64">
  </div>
  </c:if>
   <c:if test="${not empty model.id }">
  	  <div class="form-group">
   
    <input type="hidden" class="form-control" id="uploadImage" name="thumbnail" value="${model.thumbnail }" >
  </div>
   </c:if>

 <div class="form-group">
    <label for="shortDescription">Họ và tên</label>
    <input type="text" class="form-control" id="fullname" name="fullname" value="${model.fullname }" >
  </div>
  <c:if test="${empty model.id }">
 <div class="form-group">
    <label for="shortDescription">Ngày sinh</label>
    <input type="date" class="form-control" id="dob" name="dob" value="${model.dob }" >
  </div>
   </c:if>
  
   
  <c:if test="${empty model.id }">
  <div class="form-group">
    <label for="shortDescription">Mật khẩu</label>
    <input type="password" class="form-control" id="password" name="password" value="${model.password }" >
  </div>
    </c:if>
  <div class="form-group">
    <label for="shortDescription">Email</label>
    <input type="email" class="form-control" id=email name="email" value="${model.email }" >
  </div>
  <div class="form-group">
    <label for="shortDescription">Số điện thoại</label>
    <input type="number" class="form-control" id=phonenumber name="phonenumber" value="${model.phonenumber }" >
  </div>
 <input type="hidden" value="admin" name="type"/>
  
  <c:if test="${not empty model.id }">
  		<button type="submit" class="btn btn-primary" id="btnAddOrUpdateNew">Cập nhật tài khoản</button>
  </c:if>
  <c:if test="${empty model.id }">
  		<button type="submit" class="btn btn-primary" id="btnAddOrUpdateNew">Thêm tài khoản</button>
  </c:if>
  <c:if test="${not empty model.id }">
   <input type="hidden" value="${model.id}" id="id" name="id"/>
    </c:if>
   <input type="hidden" value="1" id="status" name="status"/>
</form:form>
</div>
	<script type="text/javascript">
	var dataArray = {};
	$('#uploadImage').change(function () {
		
	    var files = $(this)[0].files[0];
	    if (files != undefined) {
            var reader = new FileReader();
            reader.onload = function(e) {
                dataArray["base64"] = e.target.result;
                dataArray["name"] = files.name;
              
            };
            reader.readAsDataURL(files);
		}
	    console.log(dataArray);
    });
	 $('#btnAddOrUpdateNew').click(function (e) {
		 var name = dataArray.name;
		 var base64 = dataArray.base64;
		 document.querySelector("#thumbnail").value = name;
		 document.querySelector("#base64").value = base64;
	       
	    });
	 function addNew(data) {
	        $.ajax({
	            url: '${APIurl}',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${NewURL}?page=1&limit=5";
	            },
	            error: function (error) {
	            	window.location.href = "${NewURL}?page=1&limit=5";
	            }
	        });
	    }
	    function updateNew(data) {
	        $.ajax({
	            url: '${APIurl}',
	            type: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${NewURL}?page=1&limit=5";
	            },
	            error: function (error) {
	            	window.location.href = "${NewURL}?page=1&limit=5";
	            }
	        });
	    }
	</script>
</body>
</html>