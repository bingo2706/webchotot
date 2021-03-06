<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewURL" value="/admin-slide"/>
<c:url var="APIurl" value="/api/slide"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách trình chiếu</title>
</head>
<body>
	<div class="container-fluid">

		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
			<li class="breadcrumb-item active">Danh sách trình chiếu</li>
		</ol>
	<div id="message"
		   style=" margin-left:20px; display: none"
			class="alert alert-success col-4"></div>
		<!-- DataTables Example -->
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table"></i> Danh sách trình chiếu
			</div>
			<div style="margin: 10px 20px 0 auto;" class="widget-box table-filter">
				<div class="table-btn-controls">
					<div class="pull-right tableTools-container">
						<div class="dt-buttons btn-overlap btn-group">
							
							<form action="/api/deleteSlide" method="POST">
							<input type="hidden" name="ids" id="ids" >
								<button id="btnDelete" type="submit"
								class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Xóa trình chiếu'>
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
								<th>Mã trình chiếu</th>
								<th>Tên trình chiếu</th>
								<th>Mô tả</th>
								<th>Hình đại diện</th>
								<th>Mã sản phẩm</th>
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
									<td>${item.description}</td>
									<td> <img alt="photo" style="width:50px; height:50px;" src="<c:url value='/template/admin/thumbnail/${item.thumbnail }'/>">  </td>
									<td>${item.productId}</td>
									<td>${item.createdDate}</td>
									<td><c:url var="editURL" value="/admin-slide/edit">

											<c:param name="id" value="${item.id}" />
										</c:url> <a 
										href='${editURL}'>Chỉnh sửa </a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<form action="<c:url value='/admin-slide'/>" id="formSubmit" method="get">
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