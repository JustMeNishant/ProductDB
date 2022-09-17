<%@page import="com.spring.main.model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product</title>
</head>
<body>
<h1>Product Details</h1>
<%
	Product e = (Product)request.getAttribute("product");
%>
<%=e %>
</body>
</html>