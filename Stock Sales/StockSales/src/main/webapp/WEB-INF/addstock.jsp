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
<title>Add Stocks For Sale</title>
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
		<h1>Add Stock</h1>
		<a href="/home">dashboard</a>
	</div>
	
	<form:form action="/listings" modelAttribute="list" method="post">
		<table class="table table-bordered">
			<tr>
				<th><form:label path="compName">Stock Company:</form:label></th>
			 	<form:errors path="compName"/>
				<td><form:input path="compName" type="text" /></td>
			</tr>
			
			<tr>
				<th><form:label path="shares">Shares:</form:label></th>
			 	<form:errors path="shares"/>
				<td><form:input path="shares" type="number"/></td>
			</tr>
			
			<tr>
				<th><form:label path="pps">Price Per Share:</form:label></th>
			 	<form:errors path="pps"/>
				<td><form:input path="pps" type="number"/></td>
			</tr>
			
				<form:errors path="registration"/>
				<form:input type="hidden" path="registration" value="${user.id}"/>
				
				<form:errors path="createdAt"/>
				<form:input type="hidden" path="createdAt" value="${registration.id}"/>
		</table>
		<button class="longbtn">Create</button>
	</form:form>
</div>

</body>
</html>