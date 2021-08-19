<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link"
				href="<c:url value='/admin-home'/>"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Trang chủ</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>Quản lý sản phẩm</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					
					<a class="dropdown-item" href="<c:url value='/admin-new?page=1&limit=5'/>">Danh sách sản phẩm</a> <a
						class="dropdown-item" href='<c:url value="/admin-new/create"/>'>Tạo mới</a>
				</div>
				</li>
				<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>Quản lý danh mục</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					
					<a class="dropdown-item" href="<c:url value='/admin-category?page=1&limit=5'/>">Danh sách danh mục</a> <a
						class="dropdown-item" href='<c:url value="/admin-category/create"/>'>Tạo mới</a>
				</div>
				</li>
					<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>Quản lý người dùng</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					
					<a class="dropdown-item" href="<c:url value='/admin-user?page=1&limit=5'/>">Danh sách người dùng</a> <a
						class="dropdown-item" href='<c:url value="/admin-user/create"/>'>Tạo mới</a>
				</div>
				</li>
					<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>Quản lý trình chiếu</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					
					<a class="dropdown-item" href="<c:url value='/admin-slide?page=1&limit=5'/>">Danh sách trình chiếu</a> <a
						class="dropdown-item" href='<c:url value="/admin-slide/create"/>'>Tạo mới</a>
				</div>
				</li>
		</ul>
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Đăng xuất?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Bạn có chắc chắn muốn đăng xuất</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="<c:url value='/thoat'/>">Đăng xuất</a>
				</div>
			</div>
		</div>
	</div>