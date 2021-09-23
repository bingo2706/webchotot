<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/slide"/>
<c:url var="NewURL" value="/admin-slide"/>
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
  					 <li style="margin-left:8px;" class="active">Chỉnh sửa trình chiếu</li> 
  					</c:if>
                         <c:if test="${empty model.id }">
  					 <li style="margin-left:8px;" class="active">Thêm mới trình chiếu</li> 
  					</c:if>
              
            </ul><!-- /.breadcrumb -->
        </div>
     
      		<form:form style="margin: 40px; width:40%;" action="/api/createSlide" method="POST" modelAttribute="model" id="formSubmit">
  <div class="form-group">
    <label for="title">Tên trình chiếu</label>
    <input type="text" class="form-control" id="name" name="name"  >
  
  </div>
 <div class="form-group">
    <label for="shortDescription">Mô tả</label>
    <input type="text" class="form-control" id="description" name="description"  >
  </div>
  <div class="form-group">
    <label for="thumbnail">Hình đại diện</label>
    <input type="file" class="form-control" id="uploadImage" >
    <input type="hidden" class="form-control" id="thumbnail" name ="thumbnail" >
    <input type="hidden" class="form-control" id="base64" name="base64">
  </div>

  <c:if test="${not empty model.id }">
  		<button type="submit" class="btn btn-primary" id="btnAddOrUpdateNew">Cập nhật trình chiếu</button>
  </c:if>
  <c:if test="${empty model.id }">
  		<button type="submit" class="btn btn-primary" id="btnAddOrUpdateNew">Thêm trình chiếu</button>
  </c:if>
  
   <input type="hidden" value="${model.productId}" id="productId" name="productId"/>
   <input type= "hidden" value = 1 id="status" name = "status">
</form:form>
</div>
	<script type="text/javascript">
	var dataArray = {};
	 function getThamSo(nameThamSo) {
	        let thamSo = new URLSearchParams(window.location.search);
	        return thamSo.get(nameThamSo);
	    }
	    var productid = (getThamSo("id"));
	    document.querySelector("#productId").value = productid;
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

	</script>
</body>
</html>