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
<title>Thông tin tài khoản</title>
</head>
<body>
  <div style="padding-top: 140px; display:flex;justify-content: center;flex-direction: column;align-items: center;">
  <h3 class="heading">Danh sách phòng</h3>
  <table class="table">
  <tr>
  <th><input type="checkbox" id="checkAll"></th>
  	<th>Mã phòng</th>
	<th>Tên phòng</th>
	<th>Địa chỉ</th>
	<th>Danh mục</th>
	<th>Ngày tạo</th>
	<th>Thao tác</th>
  </tr>
  <c:forEach var="item" items="${model.listResult}">
  	<tr>
  		<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
 		<td>${item.id }</td>
 		<td>${item.title }</td>
 		<td>${item.address }</td>
 		<td>${item.categoryName }</td>
 		<td>${item.createdDate }</td>
 		<td style="width:15%;">
 		<a href="<c:url value="/user/dang-tin?id=${item.id }"/>">Cập nhật</a>
 		<a href="<c:url value="/user/product/detail?id=${item.id }"/>">Xem</a>
 		<a href="<c:url value="/user/productdetail/create?id=${item.id }"/>">Thêm</a>	
 		</td>
 	</tr>
  </c:forEach>
 	
 	
  
</table>
  <security:authentication property="principal" var="user"/>
 <div class="box-button">
 	<form action="/api/deleteProduct" method="POST">
 	<input type="hidden" name="ids" id="ids" >
 	<input type="hidden" name="type" value="web" >
 	<security:authorize access="isAuthenticated()">
		         <input type="hidden" id="userId" name = "userId" value="<%=SecurityUtils.getPrincipal().getId() %>">
		          </security:authorize>
 	<button id="btnDelete" class="btn btn-red">Xóa</button>
 	
 	</form>
 	
 	<a href="<c:url value="/user/info?id=${user.id }"/>" style="margin-left:10px;" class="btn btn-blue">Quay lại</a>
 </div>
  </div>
  
  
  
  <script type="text/javascript">
  $("#btnDelete").click(function() {
		
		var ids = $('tbody input[type=checkbox]:checked').map(function () {
          return $(this).val();
      }).get();
		document.querySelector("#ids").value = ids;	
	
	//	deleteNew(ids);
	});
	function deleteNew(data) {
      $.ajax({
          url: '${APIurl}',
          type: 'DELETE',
          contentType: 'application/json',
          data: JSON.stringify(data),
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