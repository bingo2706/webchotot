<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
 <%@ page import="com.laptrinhjavaweb.util.SecurityUtils" %>
<c:url var="APIurl" value="/api/new"/>
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
        <form:form modelAttribute="model" action="/api/createProduct" method="POST" class="contact100-form validate-form" id="formSubmit">
             <c:if test="${empty model.id }">
            <span class="contact100-form-title">
                Tạo sản phẩm
            </span>
            </c:if>
            <c:if test="${not empty model.id }">
            <span class="contact100-form-title">
                chỉnh sửa sản phẩm
            </span>
            </c:if>
            <div asp-validation-summary="ModelOnly" class="text-danger"></div>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Tên sản phẩm</span>
                <input class="input100" asp-for="Name" id="title" name="title" value="${model.title }">
                <span class="focus-input100"></span>
                <span asp-validation-for="Name" class="text-danger"></span>
            </div>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Danh mục</span>
                <br>
                 <form:select class="form-control" id="exampleFormControlSelect1" path="categoryCode">
			      	<form:option value="" label="-- Chọn thể loại --" />
			      	<form:options items="${categories}" />
			    </form:select>
                <span class="focus-input100"></span>
                <span asp-validation-for="Address" class="text-danger"></span>
            </div>
            <c:if test="${empty model.id }">
              <div class="wrap-input100 validate-input">
                <span class="label-input100">Ảnh đại diện</span>
                <input class="input100" asp-for="ThumbnailImage" id="uploadImage"  type="file">
                <input type="hidden" class="form-control" id="thumbnail" name ="thumbnail" >
   				 <input type="hidden" class="form-control" id="base64" name="base64">
                <span class="focus-input100"></span>
                <span asp-validation-for="ThumbnailImage" class="text-danger"></span>
            </div>
           </c:if>
             <div class="wrap-input100 validate-input">
                <span class="label-input100">Mô tả ngắn</span>
                <input class="input100" asp-for="SeoTitle" name="shortDescription" value="${model.shortDescription }">
                <span class="focus-input100"></span>
                <span asp-validation-for="SeoTitle" class="text-danger"></span>
            </div>
            <c:if test="${not empty model.id }">
                <div class="wrap-input100 validate-input">
                <span class="label-input100">Địa chỉ</span>
                <input class="input100" asp-for="SeoTitle" name="address" value="${model.address }">
                <span class="focus-input100"></span>
                <span asp-validation-for="SeoTitle" class="text-danger"></span>
                </div>
            </c:if>
             <c:if test="${empty model.id }">
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Địa chỉ</span>
                <br>
                <div style="display:flex;">
                 <select style="margin-left: 0;" id="province" name="calc_shipping_provinces" required="">
		            <option value="">Tỉnh / Thành phố</option>
		          </select>
		          <select id="district" name="calc_shipping_district" required="">
		            <option value="">Quận / Huyện</option>
		          </select>
                </div>
                 
                <input id="address" class="input100" asp-for="SeoTitle" name="address">
                
                <span class="focus-input100"></span>
                <span asp-validation-for="SeoTitle" class="text-danger"></span>
            </div>
          
             <p style="font-size:24px; color:black; font-weight:700;">Thông tin chi tiết</p>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Tên loại phòng</span>
                <input class="input100" asp-for="SeoAlias" name="name">
                <span class="focus-input100"></span>
                <span asp-validation-for="SeoAlias" class="text-danger"></span>
            </div>
             <div class="wrap-input100 validate-input">
                <span class="label-input100">Nội dung</span>
                <textarea class="input100" asp-for="Description" name="content" rows="5"></textarea>
                <span class="focus-input100"></span>
                <span asp-validation-for="Description" class="text-danger"></span>
            </div>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Giá gốc</span>
                <input class="input100" asp-for="SeoDescription" type="number" name="originalPrice">
                <span class="focus-input100"></span>
                <span asp-validation-for="SeoDescription" class="text-danger"></span>
            </div>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Giá hiện tại</span>
                <input class="input100" asp-for="Price" type="number" name="price">
                <span class="focus-input100"></span>
                <span asp-validation-for="Price" class="text-danger"></span>
            </div>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Số lượng tồn</span>
                <input class="input100" asp-for="Stock" type="number" name="stock">
                <span class="focus-input100"></span>
                <span asp-validation-for="Stock" class="text-danger"></span>
            </div>
            <div class="wrap-input100 validate-input">
                <span class="label-input100">Diện tích</span>
                <input class="input100" asp-for="Length" type="number" name="acreage">
                <span class="focus-input100"></span>
                <span asp-validation-for="Length" class="text-danger"></span>
            </div>
          </c:if>
          <c:if test="${not empty model.id }">
		 <input type="hidden" value="${model.id}" id="id" name="id"/>
		 </c:if>
           <input type="hidden" value="1" id="status" name="status"/>
             <input type="hidden" value="web" name="type"/>
              <security:authorize access="isAuthenticated()">
		         <input type="hidden" id="userId" name = "userId" value="<%=SecurityUtils.getPrincipal().getId() %>">
		          </security:authorize>
            <div class="container-contact100-form-btn">
                <div class="wrap-contact100-form-btn">
                    <div class="contact100-form-bgbtn"></div>
                      <c:if test="${empty model.id }">
                    <button type="submit" id="btnAddOrUpdateNew" onclick="myFunction1()" class="contact100-form-btn">
                        <span>
                            Submit
                            <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
                        </span>
                    </button>
                    </c:if>
                     <c:if test="${not empty model.id }">
                    <button type="submit" id="btnAddOrUpdateNew" class="contact100-form-btn">
                        <span>
                            Submit
                            <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
                        </span>
                    </button>
                    </c:if>
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
	     function myFunction1() {
	    	var p = document.getElementById("province");
			var d = document.getElementById("district");
			var province = p.options[p.selectedIndex].text;
			var district = d.options[d.selectedIndex].text;
			if(district == "Quận / Huyện"){
				district = "";
			}
			if(province == "Tỉnh / Thành phố"){
				province = "";
			}
			var address = district+", "+province;
			console.log("123")
			var address1 = document.getElementById("address").value;
			
			document.getElementById("address").value = address1+", "+address;
		
		} 
	    
	</script>
</body>
</html>