<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Thay đổi mật khẩu</title>
</head>
<body>

	 
	
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<div style="padding-top: 140px;">
		<div style="margin-bottom: 40px; margin-top: 0px; padding-top: 50px;" class="container register">
    <div class="row">
        <div class="col-md-3 register-left">
            <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
            <h3>Welcome</h3>

        </div>
        <div class="col-md-9 register-right">
            <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <form action="j_spring_security_check" method="post">
                        <h3 class="register-heading">Thay đổi mật khẩu</h3>
                        
                        <div class="row register-form">
                         <c:if test="${param.incorrectAccount != null}">
						<div style="margin-bottom: 18px;margin-left: 191px;" class="alert alert-danger">Tài khoản hoặc mật khẩu
							không đúng</div>
							</c:if>
				    		<c:if test="${param.accessDenied != null}">
										<div style="margin-bottom: 18px;margin-left: 191px;" class="alert alert-danger">
										Bạn không có quyền truy cập vào trang này
											</div>
									</c:if>
                            <div style="margin-left:177px;" class="col-md-6">
                               
                                <div class="form-group">
                                    <input type="text" asp-for="UserName" class="form-control"  name="email" placeholder="Nhập mật khẩu mới*"  />
                                </div>
								  <input type="submit" class="btnRegister" value="Gửi email" />
                            </div>
                          
                        </div>
                    </form>
                    
                </div>

            </div>
        </div>
    </div>

</div>
	</div>
	
	<script type="text/javascript">
		setTimeout(function() {
			$(".alert").fadeOut();
		}, 1500);
	</script>
</body>

</html>