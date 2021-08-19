<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/img"/>
<c:url var="NewURL" value="/admin-new" />
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
  					 <li style="margin-left:8px;" class="active">Chỉnh sửa hình ảnh</li> 
  					</c:if>
                         <c:if test="${empty model.id }">
  					 <li style="margin-left:8px;" class="active">Thêm hình ảnh</li> 
  					</c:if>
              
            </ul><!-- /.breadcrumb -->
        </div>
      		<form:form style="margin: 40px; width:40%;" modelAttribute="model" id="formSubmit">
  <div class="form-group">
    <label for="title">Tên hình ảnh</label>
    <input type="text" class="form-control" id="title" name="caption" value="" >
  
  </div>
  	<div class="form-group">
    <label for="thumbnail">Hình đại diện</label>
    <input type="file" class="form-control" id="uploadImage" name="thumbnail" value="" >
  </div>

  <c:if test="${not empty model.id }">
  		<button type="submit" class="btn btn-primary" id="btnAddOrUpdateNew">Cập nhật hình ảnh</button>
  </c:if>
  <c:if test="${empty model.id }">
  		<button type="submit" class="btn btn-primary" id="btnAddOrUpdateNew">Thêm hình ảnh</button>
  </c:if>
   <input type="hidden" value="${model.id}" id="id" name="id"/>
</form:form>
</div>
	<script type="text/javascript">
	var dataArray = {};
	 function getThamSo(nameThamSo) {
	        let thamSo = new URLSearchParams(window.location.search);
	        return thamSo.get(nameThamSo);
	    }
	    var productid = (getThamSo("id"));
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
	        e.preventDefault();
	        var data = {};
	        var formData = $('#formSubmit').serializeArray();
	        $.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
	      data["base64"] = dataArray.base64;
	      data["thumbnail"] = dataArray.name;
	      data["productId"] = productid;
	         var id = $('#id').val();
	          if (id == "") {
	            addNew(data);
	        } else {
	            updateNew(data);
	        }    
	        console.log(data);
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