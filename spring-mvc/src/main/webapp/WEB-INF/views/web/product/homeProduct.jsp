<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/common/taglib.jsp" %>
		<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<title>Trang chủ</title>

</head>

<body>
	<div style="padding-top:100px;" class="box-app">
   
       <div class="box-category">
           <p class="category__heading">Khám phá danh mục</p>
           <div class="category-slider ">
           <c:forEach var="item" items="${categories.listResult }">
           	 <div class="category-item">
                   <a href="<c:url value='/product-index?categoryID=${item.id }'/>">
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
          <form  action="product-index">
                <input type="number" name="price-min" class="price-min" placeholder="Giá min">
            <input type="number" name="price-max" class="price-max" placeholder="Giá max">
              <input id="address" name="address" type="hidden" value="">
           
            <button  class="btn-filter" onclick="myFunction1()">Tìm</button>
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
                            <c:if test="${item.status != -1}">
                             <p class="box-item__size">${item.listDetail.get(0).acreage } m2</p>
                            <p style="text-decoration: line-through;color: #8d8a8a; font-weight: 500; font-size: 1.2rem;" class="box-item-oriPrice"><f:formatNumber value="${item.listDetail.get(0).originalPrice }" type="currency"/> đ/tháng</p>
                            <p class="box-item__price"><f:formatNumber value="${item.listDetail.get(0).price }" type="currency"/> đ/tháng</p>
                            </c:if>
                            <c:if test="${item.status == -1}">
                             <p class="box-item__size">${item.acreage } m2</p>
                            <p style="text-decoration: line-through;color: #8d8a8a; font-weight: 500; font-size: 1.2rem;" class="box-item-oriPrice"><f:formatNumber value="${item.originalPrice }" type="currency"/> đ/tháng</p>
                            <p class="box-item__price"><f:formatNumber value="${item.price }" type="currency"/> đ/tháng</p>
                            </c:if>
                            
                        </div>
                    </div>
                </div>
            </c:forEach>
                
               
            </div>    
            </div>
    </div>
	
<script>

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
			console.log(address);
			document.getElementById("address").value = address;
		}
	</script>
</body>

</html>