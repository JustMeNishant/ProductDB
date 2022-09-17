<%@page import="com.spring.main.model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddProducts</title>

<style type="text/css">
	body{
		margin: 0px;
	}
	.pro_block {
	border: 2px solid #101;
	padding: 20px;
	width: 60%;
	float: left;
	margin: 20px;
	background: yellow;
	
	font-family: monospace;
	font-size: x-medium;
	font-color: black;
}

.pro_block1 {
	border: 3px solid #101;
	padding: 15px;
	width: 30%;
	float: left;
	margin: 10px;
	background: yellow;
	
	font-family: monospace;
	font-size: x-medium;
	font-color: black;
	}
	
</style>
</head>
<body>
<section> 
<div class="pro_block">
	<h1>Add Products</h1>


<%
	List<Product> list = 
	(List<Product>)request.getAttribute("list");
	
	Product product = (Product)request.getAttribute("product");
	for(Product e : list){
%>
	<%=e %>&nbsp;<a href="<%=request.getContextPath() %>/delete-product?id=<%=e.getId() %>" 
		onclick='return confirm("Are you sure you want to delete?")'>delete</a>
		|&nbsp;<a href="edit">Edit </a>
		
	<br />
<% 
	}
%>
</div>
<div class="pro_block1">
	<h3>Add Product </h3>
	<form action="<%=request.getContextPath() %>/insert-product" method="get">
		<label>Name: </label> 
		<input type="text" name="ename">
		<br /><br />
		<label>Price: </label> 
		<input type="number" name="eprice">
		<br /><br />
		<label>Memory: </label> 
		<input type="text" name="ememory">
		<br /><br />
		<label>Ram: </label> 
		<input type="number" name="eram">
		<br /><br />
		<label>Category: </label> 
		<input type="text" name="category">
		<br /><br />
		<input type="submit" value="Edit Product">
		<a href="all-products"> Back to All Product</a>
	</form>
</div>
	

</section>



</body>
</html>