<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
    <%@ page import="com.laptrinhjavaweb.util.SecurityUtils" %>
    	<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
    <c:url var="APIurl" value="/api/comment"/>
    <c:url var="NewURL" value="/product/detail"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<link href="<c:url value='/template/web/css/input.css'/>" rel="stylesheet" type="text/css">

<style>
input.input100 {
    height: 20px;
}
</style>
		 <security:authorize access="isAuthenticated()">
		<input type = hidden id = "nameImg" value = "<%=SecurityUtils.getPrincipal().getThumbnail() %>">
		</security:authorize>
		<security:authorize access="isAnonymous()">
		<input type = hidden id = "nameImg" value = "">
		</security:authorize>
			<div style="padding-top:100px;">
			<ul class="breadcrumb">
        <li><a href="<c:url value='/trang-chu?page=1&limit=10'/>">Trang chủ</a></li>
        <li><a href="<c:url value='/product/detail/?id=${model.id }'/>">${model.title }</a></li>
      </ul>
      <div  class="box-container">
       <c:forEach var="item" items="${model.listDetail }">
        <div class="box-photo-slider ${item.name }">
           <div class="slideshow-container">

					  <!-- Full-width images with number and caption text -->
					 <c:forEach var="img" items="${item.listImg }">
					 	<div class="mySlides fade">
					    <img class="slider-photo" src="<c:url value='/template/admin/thumbnail/${img.thumbnail }'/>" style="width:100%">
					    <div class="text">${img.caption }</div>
					  </div>
					 </c:forEach>
					  
					
					 
					
					  <!-- Next and previous buttons -->
					  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
					  <a class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<br>



              <div class="box-description">
                  <p class="box-description__name">${model.title }</p>
                  <p class="box-description__name">${item.name }</p>
                  <span class="box-description__price"><f:formatNumber value="${item.price }" type="currency"/> đ/tháng
                    </span>
                    <span class="box-description__dtich"> - ${item.acreage } m2</span>
                    <p class="box-description__address">
                        <img src="https://static.chotot.com/storage/icons/logos/ad-param/location.svg" alt="">
                        <span> ${model.address }</span>
                    </p>
                    <p class="box-description__text">
                        ${model.shortDescription }
                    </p>
                    <p class="box-description__text">
                        ${item.content }
                    </p>
                  
              <span style="font-size: 1.4rem;" class="box-description__status-thue"><img class="icon-detail" src="https://static.chotot.com/storage/icons/logos/ad-param/ad_type.png" alt=""> Cho thuê</span>
              <span class="box-description__s"><img class="icon-detail" src="https://static.chotot.com/storage/icons/logos/ad-param/size.png" alt=""> Diện tích: ${item.acreage } m2</span>
              <div style="margin-top: 20px;">
                <span style="font-size: 1.4rem;" ><img class="icon-detail" src="https://static.chotot.com/storage/icons/logos/ad-param/furnishing_rent.png" alt=""> Tình trạng nội thất: Nội thất đầy đủ</span>
                <span style="font-size: 1.4rem; margin-left: 40px;"> <img class="icon-detail" src="https://static.chotot.com/storage/icons/logos/ad-param/deposit.png" alt=""> Số tiền cọc: <f:formatNumber value="${item.price }" type="currency"/> đ/tháng</span>
              </div>
              </div>
              
            </div>
          	 </c:forEach>
        <div class="box-sidebar">
            <a href="<c:url value='/product/userproduct?id=${userModel.id }'/>" class="box-wrapper-info">
                <div class="box-wrapper-img">
                    <img src="<c:url value='/template/admin/thumbnail/${userModel.thumbnail }'/>" alt="photo">
                </div>
                <div class="box-wrapper-name">
                    <div class="box-wrapper-name-top">
                        <span>${userModel.fullname }</span>
                        <button type="button">Xem trang</button>
                    </div>
                    <div class="box-wrapper-name-bottom">
                        <div class="dot">•</div>  <span>Hoạt động 2 ngày trước</span>
                     
                    </div>
                </div>
            </a>
            <div class="box-wrapper-info1">
                <div class="box-wrapper-item1">
                    <p style="margin:0;font-size:1.4rem;">Cá nhân</p>
                    <img height="20px" style="margin-right: 0 !important;margin-top: 4px;" src="https://static.chotot.com/storage/chotot-icons/png/private-grey-icon.png" alt="">
                </div>
                <div class="separete"></div>
                <div class="box-wrapper-item2">
                    <p style="margin-top:0">Phản hồi gọi</p>
                    <span style="color: #222">Thỉnh thoảng</span>
                </div>
            </div>
            <div id="box-showphone" onclick="showPhoneFunction()" class="box-showphone">
                <img class="box-showphone__img" src="https://static.chotot.com.vn/storage/chotot-icons/svg/white-phone.svg" alt="">
                <span>Bấm để hiện số</span>
                
            </div>
            <span id="box-sdt" class="box-sdt">${userModel.phonenumber }</span>
            <br>
           <select name="name" id="box-select" onchange="myFunction1()">
            
            <c:forEach var="item" items="${model.listDetail }">
            <option>${item.name }</option>
           
            </c:forEach>
      
        </select>
        <button style="margin:19px 16px" id="myBtn" class="btn btn-blue">Đặt phòng</button>
        </div>
        
        
        
      </div>	
			</div>
      		<form id="formSubmit" action="/api/createCMT" method="POST">
      			 <div class="CommentBox_commentWrapper__1DJa6">
      			 <security:authorize access="isAuthenticated()">
      			 <security:authentication property="principal" var="user"/>
      			 
		            <img src="<c:url value='/template/admin/thumbnail/${user.thumbnail }'/>" class="CommentBox_myAvatar__1FOjI" alt="T">
		           </security:authorize>
		            <div class="Text_text__3oSpA CommentBox_commentInput__30TvY input-cmt" onclick="displayInputCmt()"  tabindex="0" contenteditable="true" placeholder="ácb" role="textbox" aria-multiline="true" spellcheck="false"></div>
		            <div class="CommentBox_actionWrapper__1nUDG hide actionInput"><button type="button" onclick="removeActionInput()" class="CommentBox_cancel__3l5lU">Hủy</button><button id="button-save" type="submit" class="CommentBox_ok__3ir78">Bình luận</button></div>
		        </div>
		        <security:authorize access="isAuthenticated()">
		         <input type="hidden" id="userId" name = "userId" value="<%=SecurityUtils.getPrincipal().getId() %>">
		          </security:authorize>
                 <input type="hidden" id="productId" name = "productId" value=${model.id }>
                 <input type="hidden" id="content" name = "content">
      		</form>
      	  
      </div>
      <div id ="cmt-box">
      		  <c:forEach var="item" items="${cmt.listResult }">
      		 <div class="Comment_detailComment__2QNx3 cmt_${item.id }">
            <div class="Comment_avatarWrap__3B6nj">
                <img class="Comment_avatar__2AN5T" src="<c:url value='/template/admin/thumbnail/${item.thumbnail }'/>" alt="T">
            </div>
            <div class="Comment_commentBody__1ntR8">
                <div class="Comment_commentContent__sui6z">
                    <h5 class="Comment_commentAuthor__1DMry">${item.nameUser }</h5>
                    <div class="Comment_commentText__3TvGl">
                        <span>${item.content}</span>
                    </div>
                  
            </div>
            <div class="Comment_commentTime__25oQ6 noselect">
                <p class="Comment_createdAt__3HtoE">
                    <span class="Comment_iconWrapper__2ubwt">
                        <span class="Comment_likeComment__GY1kj" aria-expanded="false">
                            Thích</span>
                        </span>·
                        <span class="Comment_replyComment__iW7KQ">
                            Trả lời</span>
                           <c:if test="${item.userId ==  user.id}">
                            <span onclick="deleteFunc(${item.id})" class="Comment_replyComment__iW7KQ">
                            Xóa</span> 
                            </c:if>
                            · ${item.createdDate }</p>
                        </div>
                    </div>
                </div>
      </c:forEach>
      </div>
    <form id="deleteCmtForm" action="/api/deleteCMT" method="POST">
    <input type="hidden" id="idCMT" name="id">
    <input type="hidden" id="productIdOfCMT" value=${model.id } name="productId">
    </form>
       <!-- Button trigger modal -->
	
		

<!-- The Modal -->
		<div id="myModal" class="modal">
		
			  <!-- Modal content -->
			  <div class="modal-content">
			    <div class="modal-header">
			      <span class="close">&times;</span>
			      <h2>Để lại thông tin của quý khách</h2>
			    </div>
			    <div class="modal-body">
			     <form action="/order" method="post" class="contact100-form validate-form">
					<div class="wrap-input100 validate-input">
						<span class="label-input100">Họ và tên</span> <input
							class="input100" asp-for="Name" id="title" name="fullname" placeholder="Nhập họ và tên của bạn"
							/> <span class="focus-input100"></span>
						<span asp-validation-for="Name" class="text-danger"></span>
					</div>
					<div class="wrap-input100 validate-input">
						<span class="label-input100">Email</span> <input
							class="input100" asp-for="Name" id="title" name="email" placeholder="Nhập email của bạn"
							/> <span class="focus-input100"></span>
						<span asp-validation-for="Name" class="text-danger"></span>
					</div>
					<div class="wrap-input100 validate-input">
						<span class="label-input100">Số điện thoại</span> <input
							class="input100" asp-for="Name" id="title" name="phonenumber" placeholder="Nhập số điện thoại của bạn"
							/> <span class="focus-input100"></span>
						<span asp-validation-for="Name" class="text-danger"></span>
					</div>
					<div class="wrap-input100 validate-input">
						<span class="label-input100">Địa chỉ</span> <input
							class="input100" asp-for="Name" id="title" name="address" placeholder="Nhập địa chỉ của bạn"
							/> <span class="focus-input100"></span>
						<span asp-validation-for="Name" class="text-danger"></span>
					</div>
					<input type="hidden" name="productId" value=${model.id } />
					<button style="margin-bottom:10px" class="btn btn-red">Gửi thông tin</button>
				</form>
			    </div>
			  
		  </div>
		
		</div>
	
      
       <script>
      var nameImg = document.querySelector("#nameImg").value;
      
  
       

       function displayInputCmt(){
           document.querySelector(".actionInput").classList.remove("hide");
           document.querySelector(".CommentBox_ok__3ir78").style.backgroundColor = "#F05123";
       }
       function removeActionInput(){
        document.querySelector(".actionInput").classList.add("hide");
        document.querySelector(".input-cmt").innerText = "";
       }
       
       
       
       
       var boxSlider = document.querySelectorAll(".box-photo-slider");
       boxSlider[0].classList.add("hienthi")
                       var slideIndex = 1;
               showSlides(slideIndex);

               // Next/previous controls
               function plusSlides(n) {
               showSlides(slideIndex += n);
               }

               // Thumbnail image controls
               function currentSlide(n) {
               showSlides(slideIndex = n);
               }

               function showSlides(n) {
                   var i;
             
                   var slides = document.querySelectorAll(".hienthi > .slideshow-container > .mySlides");
                   
          
             
               var dots = document.getElementsByClassName("dot");
               if (n > slides.length) {slideIndex = 1}
               if (n < 1) {slideIndex = slides.length}
               for (i = 0; i < slides.length; i++) {
                   slides[i].style.display = "none";
               }
               for (i = 0; i < dots.length; i++) {
                   dots[i].className = dots[i].className.replace(" active", "");
               }
               slides[slideIndex-1].style.display = "block";
               dots[slideIndex-1].className += " active";
               }


       var options = document.querySelectorAll("#box-select option")
		
                function myFunction1(){
                    var value = document.querySelector("#box-select").value;
                    console.log("123")
                       for(let i =0; i<boxSlider.length;i++){
                           if(boxSlider[i].className.includes(value)){
                               document.querySelector(".box-photo-slider.hienthi").classList.remove('hienthi');
                               boxSlider[i].classList.add('hienthi');
                               var slideIndex = 0;
                               showSlides(slideIndex);
                           
                           }
                       }
                   
       }
       if(localStorage.getItem("flag") == 1){
          	var id = localStorage.getItem("id");
          	var elmnt = document.querySelector(".content_"+id);
          
          	
          	localStorage.setItem("flag", 0);
          	
          }
       $('#button-save').click(function (e) {
         
           var content = document.querySelector(".input-cmt").textContent;
           document.querySelector("#content").value = content;
    //       addNew(data);
           
       });
       $('.edit-button').click(function (e) {
       	 e.preventDefault();    
       });
       function btn_editFunc(id){
       	var data = {};
       	var formData = $('#formEdit_'+id).serializeArray();
           $.each(formData, function (i, v) {
               data[""+v.name+""] = v.value;
           });
           
           updateNew(data);
       }
       function editClick(id){
       	 var data = {};
            var formData = $('#editForm_'+id).serializeArray();
            $.each(formData, function (i, v) {
                data[""+v.name+""] = v.value;
            });     
            addNew(data);
       }
 
       
   	function deleteFunc(id){
   		document.getElementById("idCMT").value = id;
   		document.getElementById("deleteCmtForm").submit();
	//	deleteNew(id);
	}
	
       function DisplayEdit(id) {
       	document.querySelector(".boxedit_"+id).style.display = "block";
          
       }
       function Edit(id) {
           document.querySelector(".content_"+id).style.display = "none";
           document.querySelector(".content_input_"+id).style.display = "block";
           document.querySelector(".edit_"+id).style.display = "block";
           document.querySelector(".content_input_"+id).innerText = document.querySelector(".content_"+id).textContent;
       }
       var modal = document.getElementById("myModal");
       var btn = document.getElementById("myBtn");
      var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal 
	    btn.onclick = function() {
	      modal.style.display = "block";
	    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }
     </script>
</body>
</html>