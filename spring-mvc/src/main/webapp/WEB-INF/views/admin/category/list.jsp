<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewURL" value="/admin-category"/>
<c:url var="APIurl" value="/api/category"/>
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
			<li class="breadcrumb-item active">Danh sách danh mục</li>
		</ol>

		<!-- DataTables Example -->
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table"></i> Danh sách danh mục
			</div>
			<div style="margin: 10px 20px 0 auto;" class="widget-box table-filter">
				<div class="table-btn-controls">
					<div class="pull-right tableTools-container">
						<div class="dt-buttons btn-overlap btn-group">
							<a flag="info"
								class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Thêm danh mục'
								href='<c:url value="/admin-category/create"/>'> <span>
									<i class="fa fa-plus-circle bigger-110 purple"></i>
							</span>
							</a>
							<form action="/api/deleteCategory" method="POST">
							<input type="hidden" name="ids" id="ids" >
								<button id="btnDelete" type="submit"
								class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Xóa danh mucj'>
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
								<th>Mã danh mục</th>
								<th>Tên danh mục</th>
								<th>Mã code</th>
								<th>Hình đại diện</th>
								<th>Ngày tạo</th>
								<th>Thao tác</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="item" items="${model.listResult}">
								<tr>
								<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
									<td>${item.id}</td>
									<td>${item.name}</td>
									<td>${item.code}</td>
									<td> <img alt="photo" style="width:50px; height:50px;" src="<c:url value='/template/admin/thumbnail/${item.thumbnail }'/>">  </td>
									<td>${item.createdDate}</td>
									<td><c:url var="editURL" value="/admin-category/create">

											<c:param name="id" value="${item.id}" />
										</c:url> <a class="btn btn-sm btn-primary btn-edit"
										data-toggle="tooltip" title="Cập nhật danh mục"
										href='${editURL}'><i class="fas fa-pen-square"></i></i> </a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<form action="<c:url value='/admin-category'/>" id="formSubmit" method="get">
						<ul class="pagination" id="pagination"></ul>
						<input type="hidden" value="" id="page" name="page"/>
						<input type="hidden" value="" id="limit" name="limit"/>
					
					</form>
					
				</div>
				
			</div>

		</div>
	</div>
	<script>
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
	function deleteNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
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