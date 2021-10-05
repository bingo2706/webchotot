<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.laptrinhjavaweb.util.SecurityUtils" %>
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
                    <form id="formSubmit" action="/api/changepassword" method="post">
                        <h3 class="register-heading">Thay đổi mật khẩu</h3>
                        
                        <div class="row register-form">
                         
						<div id="message" style="margin-bottom: 18px;margin-left: 191px; display:none" class="alert alert-danger"></div>
							
				    		
                            <div style="margin-left:177px;" class="col-md-6">
                               <div class="form-group">
                                    <input type="password"  asp-for="UserName" class="form-control"  name="oldpassword" placeholder="Nhập mật khẩu cũ"  />
                                </div>
                                <div class="form-group">
                                    <input type="password" id="oldpassword" asp-for="UserName" class="form-control"  name="password" placeholder="Nhập mật khẩu mới*"  />
                                </div>
                                <div class="form-group">
                                    <input type="password" id="newpassword" asp-for="UserName" class="form-control"  name="confirmpassword" placeholder="Nhập lại mật khẩu*"  />
                                </div>
                                <security:authentication property="principal" var="user"/>
                                <input type="hidden" name="id" value=${user.id } />
								  <input onclick="handleChangePassword()"  type="button" class="btnRegister" value="Submit" />
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
		function handleChangePassword(){
			let oldpassword = document.getElementById("oldpassword").value;
			let newpassword = document.getElementById("newpassword").value;
			
			if(oldpassword === newpassword ){
				document.getElementById("formSubmit").submit();
				
			}
			else{
				document.getElementById("message").innerHTML = "Nhập lại mật khẩu không đúng"; 
				
				document.getElementById("message").style.display = "block";
				setTimeout(function() {
					$(".alert").fadeOut();
				}, 3000);
				
			}
		}
	</script>
</body>

</html>