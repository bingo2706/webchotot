<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewURL" value="/admin-new"/>
<c:url var="APIurl" value="/api/new"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách tin tức</title>
</head>
<body>
	<div class="container-fluid">

		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
			<li class="breadcrumb-item active">Danh sách sản phẩm</li>
		</ol>
<div id="message"
		   style=" margin-left:20px; display: none"
			class="alert alert-success col-4"></div>
		<!-- DataTables Example -->
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table"></i> Danh sách sản phẩm
			</div>
			<div style="margin: 10px 20px 0 auto;" class="widget-box table-filter">
				<div class="table-btn-controls">
					<div class="pull-right tableTools-container">
						<div class="dt-buttons btn-overlap btn-group">
							<a flag="info"
								class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Thêm bài viết'
								href='<c:url value="/admin-new/create"/>'> <span>
									<i class="fa fa-plus-circle bigger-110 purple"></i>
							</span>
							</a>
							<form action="/api/deleteProduct" method="POST">
							<input type="hidden" name="ids" id="ids" >
							<input type="hidden" value="admin" name="type"/>
								<button id="btnDelete" type="submit"
								class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Xóa sản phẩm'>
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
								<th>Mã bài viết</th>
								<th>Tên bài viết</th>
								<th>Hình đại diện</th>
								<th>Danh mục</th>
								<th>Lượt xem</th>
								<th>Ngày tạo</th>
								<th>Thao tác</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="item" items="${model.listResult}">
								<tr>
								<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
									<td>${item.id}</td>
									<td>${item.title}</td>
								
									<td> <img alt="photo" style="width:50px; height:50px;" src="<c:url value='/template/admin/thumbnail/${item.thumbnail }'/>">  </td>
									<td>${item.categoryName}</td>
									<td>${item.view }</td>
									<td>${item.createdDate}</td>
									<td>
										
										
										<c:url var="viewDetail" value="/admin-new/detail">

											<c:param name="id" value="${item.id}" />
										</c:url> <a 
										href='${viewDetail}'>Xem </a>
										
										<c:url var="editProduct" value="/admin-new/create">

											<c:param name="id" value="${item.id}" />
										</c:url> <a 
										href='${editProduct}'>Chỉnh sửa </a>
										<c:url var="addProductDetail" value="/admin-new/detail/create">

											<c:param name="id" value="${item.id}" />
										</c:url> <a 
										href='${addProductDetail}'>Thêm chi tiết </a>
										
										<c:url var="editImg" value="/admin-slide/create">

											<c:param name="id" value="${item.id}" />
										</c:url> <a 
										href='${editImg}'> Tạo Slide </a>
										</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<form action="<c:url value='/admin-new'/>" id="formSubmit" method="get">
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
	
	
	});
	
	</script>
</body>

</html>