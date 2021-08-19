<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<title>Trang chủ</title>

</head>

<body>
	<div style="padding-top:100px;" class="box-app">
        <div class="box-slider">
            <div class="owl-carousel owl-theme slider">
            <c:forEach var="item" items="${slides.listResult }">
            		 <div class="item">
                    <a href="<c:url value='/product/detail?id=${item.productId }'/>"><img src="<c:url value='/template/admin/thumbnail/${item.thumbnail }'/>" alt="photo"></a>
                </div>
            </c:forEach>
               
               
            </div>
        </div>
       <div class="box-category">
           <p class="category__heading">Khám phá danh mục</p>
           <div class="category-slider ">
           <c:forEach var="item" items="${categories.listResult }">
           	 <div class="category-item">
                   <a href="<c:url value='/product-index?categoryID=${item.id}'/>">
                       <img src="<c:url value='/template/admin/thumbnail/${item.thumbnail }'/>" alt="">
                       <span>${item.name }</span>
                   </a>
               </div>
           </c:forEach>
              
           
            
       </div>
       </div>
       <div class="box-select">
        <p class="category__heading">Lọc phòng theo khu vực</p>
       <div class="box-filter">
        <select id="province" name="calc_shipping_provinces" required="">
            <option value="">Tỉnh / Thành phố</option>
          </select>
          <select id="district" name="calc_shipping_district" required="">
            <option value="">Quận / Huyện</option>
          </select>
          <form  action="product-index" method="get">
                <input type="number" name="price-min" class="price-min" placeholder="Giá min">
            <input type="number" name="price-max" class="price-max" placeholder="Giá max">
            <input id="address" name="address" type="hidden" value="">
           
            <button type="submit" class="btn-filter" onclick="myFunction1()">Tìm</button>
          </form>
       </div>
           
            
          

        
       </div>
       <div class="box-product">
        <p class="category__heading">Tin đăng cho bạn</p>
       
            <div class="box-flex">
            <c:forEach var="item" items="${model.listResult }">
            	<div class="box-full-flex">
                    <div class="box-item">
                        <div class="box-item__photo">
                            <a style="position: relative;" href="<c:url value='/product/detail/?id=${item.id }'/>">
                                <img src="<c:url value='/template/admin/thumbnail/${item.thumbnail }'/>" alt="" class="box-item__img">
                                <img class="icon-heart"  src="https://static.chotot.com/storage/chotot-icons/next/save-ad.svg" alt="photos">
                            </a>
                        </div>
                        <div class="box-item__caption">
                            <p class="box-item__name">${item.title }</p>
                            <p class="box-item__size">${item.listDetail.get(0).acreage } m2</p>
                            <p style="text-decoration: line-through;color: #8d8a8a; font-weight: 500; font-size: 1.2rem;" class="box-item-oriPrice">${item.listDetail.get(0).originalPrice } vnđ/tháng</p>
                            <p class="box-item__price">${item.listDetail.get(0).price } vnđ/tháng</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
                
               
            </div>    
            <form action="<c:url value='/trang-chu'/>" id="formSubmit" method="get">
						<ul class="pagination" id="pagination"></ul>
						<input type="hidden" value="" id="page" name="page"/>
						<input type="hidden" value="" id="limit" name="limit"/>
					
					</form>
            </div>
             
    </div>
   
	
<script>
$(function () {
	var currentPage = ${model.page};
	var totalPage = ${model.totalPage};
	var limit = 10;
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
localStorage.setItem("address_1_saved", "")
localStorage.setItem("address_2_saved", "")
localStorage.setItem("district","")
		
		function myFunction1(){
			var p = document.getElementById("province");
			var d = document.getElementById("district");
			var province = p.options[p.selectedIndex].text;
			var district = d.options[d.selectedIndex].text;
			if(district == "Quận / Huyện"){
				district = "";
			}
			if(province == "Tỉnh / Thành phố"){
				province = "";
			}
			var address = district+", "+province;
			document.getElementById("address").value = address;
		}
	</script>
</body>

</html>