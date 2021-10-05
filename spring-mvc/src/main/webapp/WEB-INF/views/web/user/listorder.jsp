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
  <h3 class="heading">Danh sách đơn đặt phòng</h3>
  <table class="table">
  <tr>
  
  	<th>Mã đơn</th>
	<th>Tên khách hàng</th>
	<th>Email</th>
	<th>Số điện thoại</th>
	<th>Địa chỉ</th>
	<th>Mã phòng</th>
  </tr>
  <c:forEach var="item" items="${model}">
  	<tr>
  		
 		<td>${item.id }</td>
 		<td>${item.fullname }</td>
 		<td>${item.email }</td>
 		<td>${item.phonenumber }</td>
 		<td>${item.address }</td>
 		<td>${item.productId }</td>
 		
 	</tr>
  </c:forEach>
 	
 	
  
</table>
  <div class="box-button">
 	
 	 <security:authentication property="principal" var="user"/>
 	
 	
 	<a href="<c:url value="/user/info?id=${user.id }"/>" style="margin-left:10px;" class="btn btn-blue">Quay lại</a>
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