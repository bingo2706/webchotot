<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api/new" />
<c:url var="NewURL" value="/trang-chu" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thông tin tài khoản</title>
</head>
<body>
	<div
		style="padding-top: 140px; display: flex; justify-content: center; flex-direction: column; align-items: center;">
		<h3 class="heading">Thông tin tài khoản</h3>
		<div id="message"
			style="margin-bottom: 18px; margin-right: 541px; display: none"
			class="alert alert-success"></div>
		<table class="table">
			<tr>
				<th>Thuộc tính</th>
				<th>Thông tin</th>

			</tr>
			<tr>
				<td>Tên đăng nhập</td>
				<td>${model.username}</td>
			</tr>
			<tr>
				<td>Họ và tên</td>
				<td>${model.fullname}</td>
			</tr>
			<tr>
				<td>Ngày sinh</td>
				<td>${model.dob}</td>
			</tr>
			<tr>
				<td>Số điện thoại</td>
				<td>${model.phonenumber}</td>
			</tr>
			<tr>
				<td>Email</td>
				<td>${model.email}<c:if
						test="${model.isActiveEmail == 1 && model.email != null}">
						<i class="fas fa-check icon-check"></i>
					</c:if> <c:if test="${model.isActiveEmail == 0 && model.email != null}">
						<i class="fas fa-times icon-close"></i>
						<a
							href="<c:url value="/user/active-email?email=${model.email }"/>">Kích
							hoạt</a>
					</c:if>
				</td>
			</tr>

		</table>
		<div class="box-button">
			<a href="<c:url value="/user/edit?id=${model.id }"/>"
				class="btn btn-green">Chỉnh sửa tài khoản</a> <a
				href="<c:url value="/user/changepassword"/>"
				style="margin-left: 10px;" class="btn btn-red">Đổi mật khẩu</a> <a
				href="<c:url value="/user/product?id=${model.id }"/>"
				style="margin-left: 10px;" class="btn btn-blue">Danh sách sản
				phẩm</a> <a href="<c:url value="/user/list-order?id=${model.id }"/>"
				style="margin-left: 10px;" class="btn btn-orange">Danh sách đặt phòng</a>
		</div>
	</div>
	<script type="text/javascript">
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const message = urlParams.get('message')
		if (message) {
			document.getElementById("message").innerHTML = message;

			document.getElementById("message").style.display = "block";
			setTimeout(function() {
				$(".alert").fadeOut();
			}, 2000);
		}
	</script>
</body>

</html>