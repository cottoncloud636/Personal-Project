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
<title>Display each stock</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="/css/styles.css"> 
</head>

<body>
<div class="bigcontainer">
	<div>
		<h1><c:out value="${list.registration.userName}"/>'s stock</h1>
		<a href="/home">dashboard</a>
	</div>
	
	<div>
		<p>Stock Company: <c:out value="${list.compName}"></c:out></p>
		<p>Shares: <c:out value="${list.shares}"/></p>
		<p>Price: <c:out value="${list.pps}"/></p>
		<p>Shares: <c:out value="${list.listedDate}"/></p>
		
	</div>	
	
	<a href="/listings/${list.id}/edit">edit</a>
	
	<form action="/listings/${list.id}" method="post">
    	<input type="hidden" name="_method" value="delete">
    	<input type="submit" value="delete">
	</form>
</div>
</body>
</html>