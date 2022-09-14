<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Stock To Be Sale Listing</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="/css/styles.css"> 
</head>
<body>
<div class="container">
	<div class="container1">
		<h1>Welcome, <c:out value="${user.userName}"/></h1>
		<a href="/users">log out</a>
	</div>
	
	<table class="table table-striped">
		<tr>
			<th>Seller</th>  <!-- table header -->
			<th>Company</th>
			<th>Shares</th>
			<th>Price Per Share</th>
			<th>Date Listed</th>
		</tr>
		
	<c:forEach var="stock" items="${listings}">
		<tr>
			<td><c:out value="${stock.registration.userName}"/></td>
			<td><a href="listings/${stock.id}"><c:out value="${stock.compName}"/></a></td>
			<td><c:out value="${stock.shares}"/></td>
			<td>$<c:out value="${stock.pps}"/></td>
			<td><c:out value="${stock.listedDate}"/></td>
		</tr>	
	</c:forEach>
	</table>		

	<button class="longbtn"><a href="/listings/new">Add stocks for sale</a></button>
</div>
</body>
</html>