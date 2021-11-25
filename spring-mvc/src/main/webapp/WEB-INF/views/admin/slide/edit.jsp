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
               
                    
  					 <li style="margin-left:8px;" class="active">Chỉnh sửa trình chiếu</li> 
  					
              
            </ul><!-- /.breadcrumb -->
        </div>
     
      		<form:form style="margin: 40px; width:40%;" action="/api/createSlide" method="POST" modelAttribute="model" id="formSubmit">
  <div class="form-group">
    <label for="title">Tên trình chiếu</label>
    <input type="text" class="form-control" id="name" name="name" value="${model.name }"  >
  
  </div>
 <div class="form-group">
    <label for="shortDescription">Mô tả</label>
    <input type="text" class="form-control" id="description" name="description"  value="${model.description }" >
  </div>
  
  
  		<button type="submit" class="btn btn-primary" id="btnAddOrUpdateNew">Cập nhật trình chiếu</button>
  
    
   <input type="hidden" value="${model.id}" id="id" name="id"/>
 
  
</form:form>
</div>
	<script type="text/javascript">
	

	</script>
</body>
</html>