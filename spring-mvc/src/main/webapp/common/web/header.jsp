<%@ page import="com.laptrinhjavaweb.util.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div style="position: relative;" class="box-header">

    </div>
    <header style="position: fixed;" class="header">
        <div class="header__no-search">
            <div class="header__logo">
               <a href="<c:url value='/trang-chu?page=1&limit=10'/>" style="text-decoration: none; height: 100%;" href=""> <i style="color: #fff;font-size: 2.2rem; margin-right: 8px;" class="fas fa-map-marked-alt"></i>
                <span style="color: #fff; font-size: 2rem; font-weight: 700;">PITSTAY</span></a>
            </div>
            <div class="header__nav">
                <ul class="header__list">
                    <li class="header__item">
                        <a href="<c:url value='/trang-chu?page=1&limit=10'/>" class="">
                            <svg class="appWrapper-Header-icon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="30" viewBox="0 0 30 30"><defs><path d="M0 0h22.624v24.578H0z"></path></defs><g fill="none" fill-rule="evenodd"><g transform="translate(3.692 2.615)"><path class="svg-fill" fill="#000" d="M21.188 23.142h-5.42v-5.115c0-1.23-.45-2.386-1.27-3.255a4.34 4.34 0 0 0-3.186-1.384 4.34 4.34 0 0 0-3.186 1.384 4.719 4.719 0 0 0-1.27 3.255v5.115h-5.42V9.559L11.313 1.7l9.876 7.858v13.583zm1.235-14.437L11.608.101A.55.55 0 0 0 11.313 0a.575.575 0 0 0-.297.1L.202 8.706A.548.548 0 0 0 0 9.134v14.918c0 .275.236.526.496.526h7.3c.26 0 .497-.25.497-.526v-6.025c0-.863.312-1.669.878-2.27a2.92 2.92 0 0 1 2.141-.933 2.92 2.92 0 0 1 2.141.933c.567.601.879 1.407.879 2.27v6.025c0 .275.236.526.496.526h7.3c.26 0 .496-.25.496-.526V9.134a.552.552 0 0 0-.201-.429z"></path></g><path stroke="#FFF" stroke-width=".5" d="M1 1h28v28H1z" opacity=".01"></path></g></svg>
                            <span>Trang chủ</span>
                        </a>
                    </li>
                    <li class="header__item">
                        <a href="" class="">
                            <svg class="appWrapper-Header-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30"><g fill="none" fill-rule="evenodd"><path stroke="#000" stroke-width=".5" d="M1 1h28v28H1z" opacity=".01"></path><g class="svg-fill" fill="#000"><path d="M10.007 13.528c1.42.346 2.998.528 4.581.528 2.287 0 4.535-.382 6.17-1.05a6.54 6.54 0 0 0 .157-.066l.033-.015-.115-.247.15.23.418-.21-.135-.238.169.218.112-.066-.141-.233.165.219.433-.294.528-.464c.369.736.992 1.27 1.508 1.712l.221.191a7.999 7.999 0 0 1 .975 3.8c0 4.424-3.738 8.162-8.162 8.162-4.424 0-8.162-3.738-8.162-8.162a7.99 7.99 0 0 1 1.095-4.015zm-5.465-4.9l.232-.141a8.086 8.086 0 0 1-.217-.403l-.017-.032a10.24 10.24 0 0 1-.448-1.03 6.989 6.989 0 0 0 2.028.831 1.23 1.23 0 0 0 1.382-.646l.984.237-.73-.382c1.734-.037 3.481-.766 5.172-1.471 1.276-.532 2.48-1.034 3.55-1.192.671-.1 1.308-.15 1.892-.15 1.631 0 2.86.386 3.552 1.114.464.489.68 1.129.64 1.9a1.23 1.23 0 0 0 .734 1.186c.438.19.972.097 1.32-.226.126.099.27.172.427.216.413.115.652.216.801.338.159.13.313.364.502.76.876 1.832.478 2.79-.181 4.376a5.915 5.915 0 0 0-.018.045c-.126-.435-.291-.77-.587-1.054a11.595 11.595 0 0 0-.546-.488c-.516-.442-1.049-.898-1.231-1.458a1.222 1.222 0 0 0-2.107-.401l-.385.399-.734.497.127.24-.15-.228-.223.106c-.04.018-.08.035-.12.05-1.46.597-3.503.94-5.603.94-1.589 0-3.253-.195-4.567-.534a1.236 1.236 0 0 0-.937.137c-.232.14-.34.38-.633 1.022l-.143.313c-.19-.714-.428-1.595-.605-2.055a1.228 1.228 0 0 0-.52-.614c-.8-.473-1.456-1.03-1.952-1.659a4.43 4.43 0 0 1-.077-.1l-.076-.106a4.514 4.514 0 0 1-.149-.222 6.617 6.617 0 0 1-.15-.25l-.191.11.187-.114-.233.14zm23.154.264c-.213-.448-.417-.783-.66-1.045l.62.31-.62-.883c-.345-.49-.967-.77-1.708-.77-.463 0-.914.107-1.274.295-.06-.958-.417-1.802-1.048-2.466-1.296-1.364-3.68-1.867-6.747-1.414-1.254.185-2.602.747-3.906 1.291-1.6.667-3.255 1.357-4.734 1.357-1.042 0-1.911-.342-2.67-1.06L4.91 4.47l-.05.052-.029.003.06-.074-.09-.09-.554-.577.086.795.009.065c.039.248.15.516.327.793.069.11.147.218.232.325-.886-.538-1.602-1.343-2.17-2.43l-.31-.595-.192.644c-.472 1.586.234 3.879.977 5.349l.02.046.005.005a12.667 12.667 0 0 0 .252.464l.084.14.014.023a6.735 6.735 0 0 0 .27.416l.016.022a6.066 6.066 0 0 0 .189.253c.593.75 1.36 1.413 2.283 1.97.895 2.367 1.099 4.39 1.145 5.17-.004.1-.005.202-.005.304 0 5.2 4.394 9.594 9.594 9.594 5.201 0 9.595-4.394 9.595-9.594 0-.133-.003-.265-.009-.396.21-1.031.554-1.859.887-2.66.704-1.696 1.312-3.16.15-5.595z"></path><path d="M13.917 17.674a1.052 1.052 0 0 0 0-2.1 1.052 1.052 0 0 0 0 2.1M20.463 17.674a1.052 1.052 0 0 0 0-2.1 1.052 1.052 0 0 0 0 2.1M17.135 23.586c1.97 0 3.767-.987 4.69-2.576a.718.718 0 0 0-1.24-.72c-.667 1.149-1.989 1.863-3.45 1.863-1.462 0-2.784-.714-3.451-1.863a.711.711 0 0 0-.436-.332.717.717 0 0 0-.803 1.052c.922 1.589 2.72 2.576 4.69 2.576"></path></g></g></svg>
                            <span>Tôi bán</span>
                        </a>
                    </li>
                    <li class="header__item">
                        <a href="" class="">
                            <svg class="appWrapper-Header-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19 24"><g fill="none" fill-rule="evenodd"><path stroke="#000" stroke-width=".5" d="M1 1h16.762v21.79H1z" opacity=".01"></path><path class="svg-fill" fill="#000" d="M14.535 9.996l-.03 8.149H4.207l-.03-8.148c0-2.953 2.226-5.181 5.179-5.183 2.952.002 5.18 2.23 5.18 5.182zm-3.775 9.296c-.194.635-.75 1.066-1.404 1.067-.654-.001-1.21-.432-1.404-1.067h2.808zm5.88-1.147h-.947l-.01-8.17c0-3.381-2.409-6-5.746-6.277v-.873c0-.37-.292-.566-.582-.568-.288.002-.58.198-.58.568v.873c-3.337.276-5.746 2.896-5.746 6.277l-.01 8.17H2.07c-.373 0-.568.293-.568.584 0 .29.195.584.568.584h4.692a2.642 2.642 0 0 0 2.593 2.215 2.641 2.641 0 0 0 2.593-2.215h4.692c.373 0 .568-.294.568-.584s-.195-.584-.568-.584z"></path></g></svg>
                            <span>Thông báo</span>
                        </a>
                    </li>
                    <li class="header__item">
                        <div class="box-dropdown">
                            <svg class="appWrapper-Header-icon dropdown-toggle" data-toggle="user-menu" xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30"><g fill="none" fill-rule="evenodd"><path stroke="#FFF" stroke-width=".5" d="M1 1h28v28H1z" opacity=".01"></path><g class="svg-fill" fill="#000"><path d="M6.341 11.77a3.295 3.295 0 1 0 0 6.59 3.295 3.295 0 0 0 0-6.59m0 1.362c1.067 0 1.934.867 1.934 1.933a1.935 1.935 0 0 1-1.934 1.933 1.935 1.935 0 0 1-1.933-1.933c0-1.066.868-1.933 1.933-1.933M14.957 11.77a3.296 3.296 0 1 0 0 6.59 3.296 3.296 0 0 0 0-6.59m0 1.362c1.066 0 1.933.867 1.933 1.933a1.935 1.935 0 0 1-1.933 1.933 1.935 1.935 0 0 1-1.933-1.933c0-1.066.867-1.933 1.933-1.933M23.572 11.77a3.295 3.295 0 1 0 0 6.59 3.295 3.295 0 0 0 0-6.59m0 1.362c1.066 0 1.933.867 1.933 1.933a1.935 1.935 0 0 1-1.933 1.933 1.935 1.935 0 0 1-1.933-1.933c0-1.066.867-1.933 1.933-1.933"></path></g></g></svg>                            <!-- <img src="./assets/tuat.jpg" alt="User image" class="dropdown-toggle" data-toggle="user-menu"> -->     
                            <span class="dropdown-toggle" data-toggle="user-menu">Thêm</span>           
                            <ul id="user-menu" class="dropdown-menu">
                                <li  class="dropdown-menu-item">
                                    <a class="dropdown-menu-link">
                                        <div>
                                            <i class="fas fa-user-tie"></i>
                                        </div>
                                        <span>Tài khoản</span>
                                    </a>
                                </li>
                                <security:authorize access="isAnonymous()">
                                <li  class="dropdown-menu-item">
                                    <a href="<c:url value='/dang-ki'/>" class="dropdown-menu-link">
                                        <div>
                                            <i class="fas fa-sign-out-alt"></i>
                                        </div>
                                        <span>Đăng kí</span>
                                    </a>
                                </li>
                                 </security:authorize>
                              	<security:authorize access="isAuthenticated()">
                                <li  class="dropdown-menu-item">
                                    <a href="<c:url value='/thoat'/>" class="dropdown-menu-link">
                                        <div>
                                            <i class="fas fa-sign-out-alt"></i>
                                        </div>
                                        <span>Đăng xuất</span>
                                    </a>
                                </li>
                                 </security:authorize>
                            </ul>
                        </div>   
                    </li>
                </ul>
            </div>
        </div>
        <div class="header__with-search">
            <div class="header__search-box">
            <form action="/product-index" method="get">
                <div class="header__search-input-wrap">
                <input type="text" class="header__search-input" name="title" placeholder="Tìm kiếm phòng trọ">
                </div>
                 </form>
                <a href="">
                    <button class="header__search-btn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22"><g fill="none" fill-rule="evenodd"><path stroke="#FE9900" stroke-width="1.3" d="M13.59 13.56a6.334 6.334 0 0 1-4.494 1.858 6.33 6.33 0 0 1-4.494-1.858A6.319 6.319 0 0 1 2.74 9.077a6.317 6.317 0 0 1 1.862-4.483 6.335 6.335 0 0 1 4.494-1.856 6.331 6.331 0 0 1 4.494 1.857 6.317 6.317 0 0 1 1.862 4.482 6.317 6.317 0 0 1-1.862 4.483zm.797.25l.318-.41a6.999 6.999 0 0 0 1.486-4.322 7.053 7.053 0 0 0-2.078-5.005A7.073 7.073 0 0 0 9.096 2a7.067 7.067 0 0 0-5.018 2.073A7.053 7.053 0 0 0 2 9.077a7.054 7.054 0 0 0 2.078 5.005 7.072 7.072 0 0 0 5.017 2.073 7.034 7.034 0 0 0 4.327-1.478l.412-.317 5.54 5.526a.388.388 0 0 0 .551 0 .386.386 0 0 0 0-.55l-5.538-5.525z"></path><path stroke="#FFF" stroke-width=".1" d="M1 1h20v20H1z" opacity=".01"></path></g></svg>
                    </button>
                </a>
            </div>
            <security:authorize access="isAnonymous()">
            <div class="header__box-login">
                <a href="<c:url value='/dang-nhap'/>">
                    <svg class="appWrapper-Header-icon login-avatar" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30"><g class="svg-stroke" fill="none" fill-rule="evenodd" stroke="#000" stroke-width="1.2"><circle cx="15" cy="15" r="14.4"></circle><circle cx="15" cy="12" r="4.5"></circle><path d="M25.442 24.63c-1.453-4.536-5.579-7.807-10.442-7.807-4.932 0-9.106 3.365-10.502 8"></path></g></svg>
                    <span>Đăng nhập</span>
                </a>
            </div>
            </security:authorize>
            <security:authorize access="isAuthenticated()">
             <security:authentication property="principal" var="user"/>
            <div class="header__box-login">
                <a href="<c:url value='/user/info?id=${user.id }'/>">
                   <img alt="photo" src="<c:url value='/template/admin/thumbnail/${user.thumbnail }'/>" class="imgAvatar">
                    <span><%=SecurityUtils.getPrincipal().getFullName() %></span>
                </a>
            </div>
            </security:authorize>
            <div class="header__box-upload">
                <a href="<c:url value='/user/dang-tin'/>">
                    <i class="header__box-upload-icon fas fa-upload"></i>
                    <!-- <svg class="appWrapper-Header-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30"><g fill="none" fill-rule="evenodd"><path stroke="#FFBA00" stroke-width=".5" d="M1 1h28v28H1z" opacity=".01"></path><path class="svg-fill" fill="#fff" d="M16.765 2.312a.759.759 0 1 1 0 1.518H6.873a1.88 1.88 0 0 0-1.877 1.877v16.438a1.88 1.88 0 0 0 1.877 1.877H23.31a1.88 1.88 0 0 0 1.877-1.877V11.8a.76.76 0 0 1 1.518 0v10.344a3.399 3.399 0 0 1-3.395 3.395H6.873a3.4 3.4 0 0 1-3.396-3.395V5.707a3.4 3.4 0 0 1 3.396-3.395h9.892zm6.022.21c.273-.1.564-.078.835-.038.276.042.57.205.83.461l.54.54 1.117 1.117c.24.24.394.497.46.766a1.68 1.68 0 0 1-.4 1.545l-.058.062c-.344.352-.7.707-1.048 1.05l-.631.63-6.33 6.328-.488.493-.038.04c-.307.31-.621.628-.939.932-.153.148-.339.219-.619.236l-3.014.184h-.03a.719.719 0 0 1-.484-.218c-.158-.156-.249-.358-.24-.543l.135-3.097c.016-.253.095-.443.248-.598l.157-.16.003-.002.082-.081 5.416-5.415c.576-.577 1.166-1.167 1.747-1.745l1.68-1.682c.144-.146.27-.275.397-.396.188-.181.388-.304.672-.408zm.493 1.428l-.221.219c-.153.151-.306.305-.457.456l-.536.537-8.151 8.152-.086 1.957 1.906-.115.312-.312.226-.224.05-.049.385-.38 8.401-8.403-1.211-1.209a8.233 8.233 0 0 1-.172-.175l-.027-.029c-.065-.068-.13-.137-.2-.206l-.22-.219z"></path></g></svg> -->
                    <span>ĐĂNG TIN</span>
                </a>
            </div>
        </div>
    </header>