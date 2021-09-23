<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/user"/>
<c:url var="NewURL" value="/trang-chu"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Đăng tin</title>
</head>
<body>
	<link href="<c:url value='/template/web/css/input.css'/>" rel="stylesheet" type="text/css">
		<div style="padding-top: 140px;" class="container-contact100">
    <div class="wrap-contact100">
        <form:form modelAttribute="model" action="/api/createUser" method="POST" class="contact100-form validate-form" id="formSubmit">
            
            <span class="contact100-form-title">
                Chỉnh sửa tài khoản
            </span>
            <div asp-validation-summary="ModelOnly" class="text-danger"></div>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Tên đăng nhập</span>
                <input class="input100" asp-for="Name" id="title" name="username" value="${model.username }">
                <span class="focus-input100"></span>
                <span asp-validation-for="Name" class="text-danger"></span>
            </div>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Họ và tên</span>
                <input class="input100" asp-for="Name" id="title" name="fullname" value="${model.fullname }">
                <span class="focus-input100"></span>
                <span asp-validation-for="Name" class="text-danger"></span>
            </div>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Số điện thoại</span>
                <input class="input100" asp-for="SeoAlias" name="phonenumber" value="${model.phonenumber }">
                <span class="focus-input100"></span>
                <span asp-validation-for="SeoAlias" class="text-danger"></span>
            </div>
           <div class="wrap-input100 validate-input">
                <span class="label-input100">Email</span>
                <input class="input100" asp-for="SeoAlias" name="email" value="${model.email }">
                <span class="focus-input100"></span>
                <span asp-validation-for="SeoAlias" class="text-danger"></span>
            </div>
		   		<div style="display:none;">
		   		 <input type="hidden" class="form-control" id="uploadImage" name="thumbnail" value="${model.thumbnail }" >
			   <input type="hidden" value="${model.id}" id="id" name="id"/>
		          	 <form:select class="form-control" id="exampleFormControlSelect1" path="roleCode">
		      	<form:option value="" label="-- Chọn thể loại --" />
		      	<form:options items="${roles}" />
		    </form:select>
		   		</div>
			   
			  
			   

          
            <div class="container-contact100-form-btn">
                <div class="wrap-contact100-form-btn">
                    <div class="contact100-form-bgbtn"></div>
                    <input type=hidden name="type" value="edit">
                    <button type="submit" id="btnAddOrUpdateNew" class="contact100-form-btn">
                        <span>
                            Submit
                            <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
                        </span>
                    </button>
                </div>
            </div>
        </form:form>
    </div>
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
	      
	    });
	 function addNew(data) {
	        $.ajax({
	            url: '${APIurl}',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${NewURL}?page=1&limit=10";
	            },
	            error: function (error) {
	            	window.location.href = "${NewURL}?page=1&limit=10";
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
	            	window.location.href = "${NewURL}?page=1&limit=10";
	            },
	            error: function (error) {
	            	window.location.href = "${NewURL}?page=1&limit=10";
	            }
	        });
	    }
	   
	    
	</script>
</body>
</html>