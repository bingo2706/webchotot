<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
    <c:url var="APIurl" value="/api/user"/>
    <c:url var="NewURL" value="/dang-nhap"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
<title>Đăng kí tài khoản</title>
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
                    <form id="formSubmit" action="/api/createUser" method="POST" >
                        <h3 class="register-heading">Đăng ký tài khoản</h3>
                        <div class="row register-form">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" asp-for="FirstName" name="fullname" class="form-control" placeholder="Full Name *" />
                                </div>
                                <div class="form-group">
                                    <input type="text" asp-for="username" name="username" class="form-control" placeholder="UserName *"  />
                                </div>
                                <div class="form-group">
                                    <input type="password" asp-for="Password" name="password" class="form-control" placeholder="Password *"  />
                                </div>
                    			 <input type="hidden" name="thumbnail" value="defaultAvatar.jpg" />
									 <input type="hidden" name="roleCode" value="USER"   />
                            </div>
                            <div class="col-md-6">
                              
                                <div class="form-group">
                                    <input type="email" asp-for="Email" name="email" class="form-control" placeholder="Your Email *"  />
                                </div>
                                <div class="form-group">
                                    <input type="text" asp-for="PhoneNumber" name="phonenumber"  name="txtEmpPhone" class="form-control" placeholder="Your Phone *"  />
                                </div>
                                <div class="form-group">
                                    <input type="date" asp-for="Dob" name="dob" class="form-control" placeholder="Your Dob *"  />
                                </div>
                                <input type="hidden" name="status" value="1">
                                <input type="hidden" name="type" value="create">
                                <input type="submit" id="btnAddOrUpdateNew" class="btnRegister" value="Register" />
                            </div>
                        </div>
                    </form>
                    
                </div>

            </div>
        </div>
    </div>

</div>
	</div>
	
   <script>
   $("#formSubmit").validate({
		 rules: {
			 fullname: {
			      required: true
			    },
			 username:{
				required: true
			},
			password: {
				  required: true,
				  minlength:6
			},
			email: {
			      required: true,
			      email:true
			    },
			phonenumber: {
				   required: true,
				   minlength:10
				 },
				 dob: {
					   required: true
					 },
		},
			 
			messages:{
				fullname:{
					required:"Bạn chưa nhập họ tên"
				},
				username:{
					required:"Bạn chưa nhập tên đăng nhập"
				},
				password: {
					  required: "Bạn chưa nhập mật khẩu",
					  minlength:"Mật khẩu tối thiểu 6 kí tự"
				},
				email: {
				      required: "Bạn chưa nhập email",
				      email:"Email chưa đúng định dạng"
				    },
				phonenumber: {
					  required: "Bạn chưa nhập số điện thoại",
					  minlength:"Số điện thoại tối thiểu 10 số"
					    },   
				 dob: {
						required: "Bạn chưa chọn ngày sinh"
						},
			},
	 
		 submitHandler: function(form) {
			 form.submit();
		    
		  }
		 });
   </script>
</body>
</html>