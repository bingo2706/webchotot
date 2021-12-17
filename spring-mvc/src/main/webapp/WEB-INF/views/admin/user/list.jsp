<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewURL" value="/admin-user"/>
<c:url var="APIurl" value="/api/user"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách tài khoản</title>
</head>
<body>
	<div class="container-fluid">

		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
			<li class="breadcrumb-item active">Danh sách tài khoản</li>
		</ol>
<div id="message"
		   style=" margin-left:20px; display: none"
			class="alert alert-success col-4"></div>
		<!-- DataTables Example -->
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table"></i> Danh sách tài khoản
			</div>
			<div style="margin: 10px 20px 0 auto;" class="widget-box table-filter">
				<div class="table-btn-controls">
					<div class="pull-right tableTools-container">
						<div class="dt-buttons btn-overlap btn-group">
							<a flag="info"
								class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Thêm tài khoản'
								href='<c:url value="/admin-user/create"/>'> <span>
									<i class="fa fa-plus-circle bigger-110 purple"></i>
							</span>
							</a>
							<form action="/api/deleteUser" method="POST">
							<input type="hidden" name="ids" id="ids" >
								<button id="btnDelete" type="submit"
								class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Xóa tài khoản'>
								<span> <i class="far fa-trash-alt"></i>
								</span>
							</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" width="100%" cellspacing="0">
						<thead>
							<tr>
							<th><input type="checkbox" id="checkAll"></th>
								<th>Mã tài khoản</th>
								<th>Tên tài khoản</th>
								<th>Họ và tên</th>
								<th>Ngày sinh</th>
								<th>Hình đại diện</th>
								<th>Email</th>
								<th>SĐT</th>
								<th>Trạng thái</th>
								<th>Thao tác</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="item" items="${model.listResult}">
								<tr>
								<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
									<td>${item.id}</td>
									<td>${item.username}</td>
									<td>${item.fullname}</td>
									<td>${item.dob }</td>
									<td> <img alt="photo" style="width:50px; height:50px;" src="<c:url value='/template/admin/thumbnail/${item.thumbnail }'/>">  </td>
									<td>${item.email}
									<c:if test="${item.isActiveEmail == 1 && item.email != null}">
										<i class="fas fa-check icon-check"></i>
									</c:if>
									<c:if test="${item.isActiveEmail == 0 && item.email != null}">
									<i class="fas fa-times icon-close"></i>
									</c:if>
									
									</td>
									<td>${item.phonenumber}</td>
									<td>
										<c:if test="${item.status ==0 }">
												Không hoạt động
										</c:if >
										<c:if test="${item.status ==1 }">
												Hoạt động
										</c:if>
									</td >
									<td style="width:14%"><c:url var="editURL" value="/admin-user/create">

											<c:param name="id" value="${item.id}" />
										</c:url> <a 
										href='${editURL}'>Chỉnh sửa</a>		
												<c:url var="activeURL" value="/admin-user/activeUser">

											<c:param name="id" value="${item.id}" />
										</c:url> <a 
										href='${activeURL}'>Kích hoạt</a>								
										</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<form action="<c:url value='/admin-user'/>" id="formSubmit" method="get">
						<ul class="pagination" id="pagination"></ul>
						<input type="hidden" value="" id="page" name="page"/>
						<input type="hidden" value="" id="limit" name="limit"/>
					
					</form>
					
				</div>
				
			</div>

		</div>
	</div>
	<script>
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const message = urlParams.get('message')
	if(message){
		document.getElementById("message").innerHTML = message; 
		
		document.getElementById("message").style.display = "block";
		setTimeout(function() {
			$(".alert").fadeOut();
		}, 3000);
	}
	
	$(function () {
		var currentPage = ${model.page};
		var totalPage = ${model.totalPage};
		var limit = 5;
		window.pagObj = $('#pagination').twbsPagination({
			totalPages: totalPage,
			visiblePages: 10,
			startPage: currentPage,
			onPageClick: function (event, page) {
				if (currentPage != page){
					$('#limit').val(limit);
					$('#page').val(page);
					$('#formSubmit').submit();
				}
				
			}
		});
	});
$("#btnDelete").click(function() {
		
		var ids = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
		document.querySelector("#ids").value = ids;
	
	//	deleteNew(ids);
	});
	
	</script>
</body>

</html>