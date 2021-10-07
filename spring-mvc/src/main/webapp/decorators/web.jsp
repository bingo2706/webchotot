<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>

<!-- Bootstrap core CSS -->
<%-- <link href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css"> --%>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<!-- Custom styles for this template -->
<link href="<c:url value='/template/web/assets/css/style.css'/>" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/common/web/header.jsp" %>

	<dec:body/>

	<!-- Footer -->
	<%@ include file="/common/web/footer.jsp" %>

	<!-- Bootstrap core JavaScript -->
	
	<script src="<c:url value='/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

	<script src="<c:url value='/template/web/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/template/paging/jquery.twbsPagination.js'/>"></script>
	 
    <script src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
	
	<script src="<c:url value='/template/web/assets/js/validate.js'/>"></script>
	<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
		(function(){
		var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
		s1.async=true;
		s1.src='https://embed.tawk.to/615eb36286aee40a57355c47/1fhcupehh';
		s1.charset='UTF-8';
		s1.setAttribute('crossorigin','*');
		s0.parentNode.insertBefore(s1,s0);
		})();
</script>
<!--End of Tawk.to Script-->
</body>
</html>