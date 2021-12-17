<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/new"/>
<c:url var="NewURL" value="/admin-new"/>
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
  					 <li style="margin-left:8px;" class="active">Chỉnh sửa bài viết</li> 
  					</c:if>
                         <c:if test="${empty model.id }">
  					 <li style="margin-left:8px;" class="active">Thêm mới bài viết</li> 
  					</c:if>
              
            </ul><!-- /.breadcrumb -->
        </div>
     
     	
     
     
      		<form:form style="margin: 40px; width:40%;" action="/api/createProduct" method="POST" modelAttribute="model" id="formSubmit">
  <div class="form-group">
    <label for="title">Tên bài viết</label>
    <input type="text" class="form-control" id="title" name="title" value="${model.title }" >
  
  </div>
   <div class="form-group">
    <label for="exampleFormControlSelect1">Danh mục</label>
    <form:select class="form-control" id="exampleFormControlSelect1" path="categoryCode">
      	<form:option value="" label="-- Chọn danh mục --" />
      	<form:options items="${categories}" />
    </form:select>
  </div>
  <c:if test="${empty model.id }">
  	  <div class="form-group">
    <label for="thumbnail">Hình đại diện</label>
    <input type="file" class="form-control" id="uploadImage" name="uploadImage"  >
    <input type="hidden" class="form-control" id="thumbnail" name ="thumbnail" >
    <input type="hidden" class="form-control" id="base64" name="base64">
  </div>
  </c:if>

 <div class="form-group">
    <label for="shortDescription">Mô tả ngắn</label>
    <input type="text" class="form-control" id="shortDescription" name="shortDescription" value="${model.shortDescription }" >
  </div>
  <c:if test="${empty model.id }">
  <div class="form-group">
    <label for="shortDescription">Nội dung</label>
    <textarea style="width: 614.4px;height: 175px" rows="" cols="" class="form-control" id="content" name="content" >${model.content }</textarea>
  </div>
  </c:if>
  <div class="form-group">
    <label for="shortDescription">Địa chỉ</label>
    <input type="text" class="form-control" id="address" name="address" value="${model.address }" >
  </div>
  <c:if test="${empty model.id }">
  <div class="form-group">
    <label for="shortDescription">Tên loại phòng</label>
    <input type="text" class="form-control"  name="name" value="${model.name }" >
  </div>
  <div class="form-group">
    <label for="shortDescription">Giá gốc</label>
    <input type="number" class="form-control" id=originalPrice name="originalPrice" value="${model.originalPrice }" >
  </div>
  <div class="form-group">
    <label for="shortDescription">Giá hiện tại</label>
    <input type="number" class="form-control" id=price name="price" value="${model.price }" >
  </div>
  <div class="form-group">
    <label for="shortDescription">Số lượng tồn</label>
    <input type="number" class="form-control" id=stock name="stock" value="${model.stock }" >
  </div>
  <div class="form-group">
    <label for="shortDescription">Diện tích</label>
    <input type="number" class="form-control" id=acreage name="acreage" value="${model.acreage }" >
  </div>
   </c:if>
   
   
  <c:if test="${not empty model.id }">
  		<button type="submit" class="btn btn-primary" id="btnAddOrUpdateNew">Cập nhật phòng</button>
  </c:if>
  <c:if test="${empty model.id }">
  		<button type="submit" class="btn btn-primary" id="btnAddOrUpdateNew">Thêm phòng</button>
  </c:if>
  <c:if test="${not empty model.id }">
   <input type="hidden" value="${model.id}" id="id" name="id"/>
   </c:if>
   <input type="hidden" value="1" id="status" name="status"/>
   <input type="hidden" value="admin" name="type"/>
   
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
	 // VALIDATOR
	 
	 
	      $("#formSubmit").validate({
		 rules: {
			 title: {
			      required: true
			    },
			
			shortDescription: {
				  required: true,
				  
			},
			address: {
			      required: true,
			     
			    },
			name: {
				required: true,
				
				 },
		    content: {
			      required: true
					 },
			originalPrice: {
				 required: true,
					     
					    },
			 price: {
				required: true,
						
						 },
			stock: {
				required: true
				},
				uploadImage:{
					required: true
				},
			acreage: {
					required: true
					},	
					calc_shipping_provinces: {
						required: true
						},		
						calc_shipping_district: {
							required: true
							},	
		},
			 
			messages:{
				 title: {
				      required: "Tên phòng không được bỏ trống"
				    },
				
				shortDescription: {
					  required: "Mô tả ngắn không được bỏ trống",
					  
				},
				address: {
				      required: "Địa chỉ không được bỏ trống",
				     
				    },
				name: {
					required: "Tên loại phòng không được bỏ trống",
					
					 },
			    content: {
				      required: "Nội dung không được bỏ trống"
						 },
				originalPrice: {
					 required: "Giá tiền gốc không được bỏ trống",
						     
						    },
				 price: {
					required: "Giá tiền hiện tại không được bỏ trống",
							
							 },
				stock: {
					required: "Số lượng không được bỏ trống"
					},
					uploadImage: {
						required: "Bạn chưa chọn hình"
						},	
				acreage: {
						required: "Diện tích không được bỏ trống"
						},	
						calc_shipping_provinces: {
							required: "Thành phố không được bỏ trống"
							},		
							calc_shipping_district: {
								required: "Quận huyện không được bỏ trống"
								},	
			},
	 
		 submitHandler: function(form) {
			 form.submit();
		    
		  }
		 });
	</script>
</body>
</html>