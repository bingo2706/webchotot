<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<c:url var="NewURL" value="/admin-new"/>
<c:url var="APIurl" value="/api/detail"/>
<c:url var="APIurlImg" value="/api/img"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách chi tiết sản phẩm</title>
</head>
<body>
	<div class="container-fluid">

		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
			<li class="breadcrumb-item active">Danh sách chi tiết sản phẩm</li>
		</ol>

		<!-- DataTables Example -->
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table"></i> Danh sách chi tiết sản phẩm
			</div>
			<div style="margin: 10px 20px 0 auto;" class="widget-box table-filter">
				<div class="table-btn-controls">
					<div class="pull-right tableTools-container">
						<div class="dt-buttons btn-overlap btn-group">
							<a flag="info"
								class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Thêm chi tiết'
								href='<c:url value="/admin-new/create"/>'> <span>
									<i class="fa fa-plus-circle bigger-110 purple"></i>
							</span>
							</a>
							<form action="/api/deleteDetail" method="POST">
							<input type="hidden" name="ids" id="ids" >
							<input type="hidden" value="admin" name="type"/>
								<button id="btnDelete" type="submit"
								class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Xóa chi tiết'>
								<span> <i class="far fa-trash-alt"></i>
								</span>
							</button>
							</form>
							<form action="/api/deleteImg" method="POST">
							<input type="hidden" name="ids" id="idsIMG" >
								<input type="hidden" value="admin" name="type"/>
							<button style="background-color: #c82333;border-color: #bd2130;" id="btnDeleteImg" type="submit"
								class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Xóa hình ảnh'>
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
								<th>Mã chi tiết</th>
								<th>Tên loại phòng</th>
								<th>Hình đại diện</th>
								<th>Giá hiện tại</th>
								<th>Giá gốc</th>
								<th>Diện tích</th>
								<th>Số lượng</th>
								<th>Thao tác</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="item" items="${model.listDetail}">
								<tr>
								<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
									<td>${item.id}</td>
									<td>${item.name}</td>
								
									<td> 
									<c:forEach var="img" items="${item.listImg}">
									<img class="img-${img.id }" onclick="myFunction1(${img.id})" alt="photo${img.id }" style="width:50px; height:50px;" src="<c:url value='/template/admin/thumbnail/${img.thumbnail }'/>">
									 
									</c:forEach>
									 </td>
									<td><f:formatNumber value="${item.price}" type="currency"/> VNĐ</td>
									<td><f:formatNumber value="${item.originalPrice}" type="currency"/>  VNĐ</td>
									<td>${item.acreage}</td>
									<td>${item.stock}</td>
									
									<td>
										
										
										<c:url var="editImg" value="/admin-new/addImg">

											<c:param name="id" value="${item.id}" />
										</c:url> <a class="btn btn-sm btn-primary btn-edit"
										data-toggle="tooltip" title="Thêm hình ảnh"
										href='${editImg}'><i class="fas fa-pen-square"></i></i> </a>
										
										<c:url var="editImg" value="/admin-new/detail/update">

											<c:param name="id" value="${item.id}" />
										</c:url> <a class="btn btn-sm btn-primary btn-edit"
										data-toggle="tooltip" title="Cập nhật chi tiết"
										href='${editImg}'><i class="fas fa-pen-square"></i></i> </a>
										
										
										</td>
										
										
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
	/* $(function () {
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
	}); */
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