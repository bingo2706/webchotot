<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
	<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<c:url var="APIurl" value="/api/detail"/>
<c:url var="NewURL" value="/trang-chu"/>
<c:url var="APIurlImg" value="/api/img"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Danh sách chi tiết phòng</title>
</head>
<body>
  <div style="padding-top: 140px; display:flex;justify-content: center;flex-direction: column;align-items: center;">
  <h3 class="heading">Danh sách chi tiết phòng</h3>
  <table class="table">
  <tr>
  		<th><input type="checkbox" id="checkAll"></th>
  		<th>Mã chi tiết</th>
		<th>Tên loại phòng</th>
		<th>Hình đại diện</th>
		<th>Giá hiện tại</th>
		<th>Giá gốc</th>
		<th>Diện tích</th>
		<th>Số lượng</th>
		<th>Thao tác</th>
  </tr>
  <c:forEach var="item" items="${model.listDetail}">
  	<tr>
  	<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
 		<td>${item.id }</td>
 		<td>${item.name }</td>
 		<td>
 		<c:forEach var="img" items="${item.listImg}">
		<img class="img-${img.id }" onclick="myFunction1(${img.id})" alt="photo${img.id }" style="width:50px; height:50px;" src="<c:url value='/template/admin/thumbnail/${img.thumbnail }'/>">				
		</c:forEach>
		<td style="width:18%;"><f:formatNumber value="${item.price}" type="currency"/> đ/tháng</td>
		<td style="width:18%;"><f:formatNumber value="${item.originalPrice}" type="currency"/> đ/tháng</td>
		<td>${item.acreage}</td>
        <td>${item.stock}</td>
	
 		<td style="width:15%;">
 		<a href="<c:url value="/user/productdetail/update?id=${item.id }"/>">Cập nhật</a>
 		<a href="<c:url value="/user/product/addImg?id=${item.id }&pdId=${model.id }"/>">Thêm ảnh</a>	
 		</td>
 	</tr>
  </c:forEach>
 	
 	
  
</table>
  <security:authentication property="principal" var="user"/>
 <div class="box-button">
 <form action="/api/deleteDetail" method="POST">
 	<input type="hidden" name="type" value="web">
 	<input type="hidden" name="ids" id="ids" >
 	<input type="hidden" name="productId" value="${model.id }">
   <button id="btnDelete" class="btn btn-red">Xóa</button>
 </form>
  <form action="/api/deleteImg" method="POST">
  <input type="hidden" name="type" value="web">
  <input type="hidden" name="productId" value="${model.id }">
  <input type="hidden" name="ids" id="idsIMG" >
   <button style="margin-left:10px;" id="btnDeleteImg" class="btn btn-orange">Xóa ảnh</button>
  </form>
   
 	<a href="<c:url value="/user/product?id=${user.id }"/>" style="margin-left:10px;" class="btn btn-blue">Quay lại</a>
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
	var numberArr = [];
	function myFunction1(id) {
	
		 if (document.querySelector(".border-black")) {
	            document.querySelector(".border-black").classList.remove("border-black");
	           
	        }

	        document.querySelector(`.img-\${id}`).classList.add("border-black")
	         numberArr.pop();
        numberArr.push(id);
		 console.log(numberArr);
	}
	$("#btnDeleteImg").click(function() {
		document.querySelector("#idsIMG").value = numberArr
	});
	function deleteIMG(data) {
        $.ajax({
            url: '${APIurlImg}',
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