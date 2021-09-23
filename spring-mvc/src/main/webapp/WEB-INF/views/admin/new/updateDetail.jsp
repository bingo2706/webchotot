<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/detail"/>
<c:url var="NewURL" value="/admin-new"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tạo chi tiết sản phẩm</title>
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
               
                 
  					 <li style="margin-left:8px;" class="active">Chỉnh sửa bài viết</li> 
  				
              
            </ul><!-- /.breadcrumb -->
        </div>
     
     	
     
     
      		<form:form style="margin: 40px; width:40%;" action="/api/createDetail" method="POST" modelAttribute="model" id="formSubmit">
  <div class="form-group">
    <label for="shortDescription">Tên loại phòng</label>
    <input type="text" class="form-control" id="shortDescription" name="name" value="${model.name }" >
  </div>
    <div class="form-group">
    <label for="shortDescription">Nội dung</label>
    <textarea style="width: 614.4px;height: 175px" rows="" cols="" class="form-control" id="content" name="content" >${model.content }</textarea>
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
 
   
   <input type="hidden" value="admin" name="type"/>
 
  		<button type="submit" class="btn btn-primary" id="btnAddOrUpdateNew">Cập nhật bài viết</button>
 
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