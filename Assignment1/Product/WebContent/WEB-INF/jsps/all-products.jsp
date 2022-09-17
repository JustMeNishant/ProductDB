<%@page import="com.spring.main.model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Products</title>
<br></br>
<style type="text/css">
body {
	margin: 0px;
}

.emp_block {
	border: 2px solid #101;
	padding: 20px;
	width: 60%;
	float: left;
	margin: 20px;
	background: #00FFFF;
	font-family: monospace;
	font-size: x-medium;
	font-color: white;
}

.opt1 {
	display: inline-block;
	padding-right: 5px;
}
div {text-align: center;}
.emp_block1 {
	border: 3px solid #101;
	padding: 15px;
	width: 30%;
	float: left;
	margin: 10px;
	background: black;
	font-family: monospace;
	font-size: x-medium;
	font-color: white;
}

.pro_block {
	border: 3px solid #101;
	padding: 15px;
	width: 30%;
	float: left;
	margin: 10px;
	background: #99FFFF;
	font-family: monospace;
	font-size: x-medium;
	font-color: black;
}
</style>

</head>
<body>
	<section>
		<div class="emp_block">
			<h1 style="float: left" "padding-left"="5px">
				Vendor Home  </span>
			</h1>

			<h1>
				<a href="addedit"> Add Product </a> <span style="float: left"></span>

				<br> </br>

				<%
					List<Product> list = (List<Product>) request.getAttribute("list");

					Product product = (Product)request.getAttribute("product");
					
				for (Product e : list) {%>
			
				<div class="pro_block" >
				
					<h3><%=e.getName()%></h3><%=e.getDescrib()%>&nbsp;<br></br>INR
					<%=e.getPrice()%>&nbsp;<br></br> Category:<%=e.getCategory()%><br></br>
					<a
						href="<%=request.getContextPath()%>/delete-product?id=<%=e.getId()%>"
						onclick='return confirm("Are you sure you want to delete?")'>delete</a>
					|&nbsp;<a href="addedit">Edit </a>
					
				</div>
<%
					}
				%>
				
				
			<h6>Made By Nishant</h6>
	</section>

</body>
</html>