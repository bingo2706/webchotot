<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/detail"/>
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
        <form:form modelAttribute="model" action="/api/createDetail" method="POST" class="contact100-form validate-form" id="formSubmit">
             <c:if test="${empty model.id }">
            <span class="contact100-form-title">
                Thêm chi tiết sản phẩm
            </span>
            </c:if>
            <c:if test="${not empty model.id }">
            <span class="contact100-form-title">
                Chỉnh sửa chi tiết phòng
            </span>
            </c:if>
            <div asp-validation-summary="ModelOnly" class="text-danger"></div>  
             <p style="font-size:24px; color:black; font-weight:700;">Thông tin chi tiết</p>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Tên loại phòng</span>
                <input class="input100" asp-for="SeoAlias" name="name" value="${model.name }">
                <span class="focus-input100"></span>
                <span asp-validation-for="SeoAlias" class="text-danger"></span>
            </div>
             <div class="wrap-input100 validate-input">
                <span class="label-input100">Nội dung</span>
                <textarea class="input100" asp-for="Description" name="content" rows="5">${model.content }</textarea>
                <span class="focus-input100"></span>
                <span asp-validation-for="Description" class="text-danger"></span>
            </div>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Giá gốc</span>
                <input class="input100" asp-for="SeoDescription" type="number" name="originalPrice" value="${model.originalPrice }">
                <span class="focus-input100"></span>
                <span asp-validation-for="SeoDescription" class="text-danger"></span>
            </div>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Giá hiện tại</span>
                <input class="input100" asp-for="Price" type="number" name="price"  value="${model.price }">
                <span class="focus-input100"></span>
                <span asp-validation-for="Price" class="text-danger"></span>
            </div>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Số lượng tồn</span>
                <input class="input100" asp-for="Stock" type="number" name="stock" value="${model.stock }">
                <span class="focus-input100"></span>
                <span asp-validation-for="Stock" class="text-danger"></span>
            </div>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Diện tích</span>
                <input class="input100" asp-for="Length" type="number" name="acreage" value="${model.acreage }">
                <span class="focus-input100"></span>
                <span asp-validation-for="Length" class="text-danger"></span>
            </div>
         <input type="hidden" value="${model.id}" id="id" name="id"/>
         <input type="hidden" value="${model.productId}" id="produtId" name="productId"/>
		 <input type="hidden" value="web" name="type"/>
          
            <div class="container-contact100-form-btn">
                <div class="wrap-contact100-form-btn">
                    <div class="contact100-form-bgbtn"></div>
                     
                   
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