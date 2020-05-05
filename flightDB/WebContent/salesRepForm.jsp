  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get Sales Report</title>
</head>
<body>


	<p class="app-name">Filter By...</p>
	<div class="login-page">
		<div class="form">
			<form method="get" action="salesRepResults.jsp" enctype=text/plain>
				<select type="text" name="filter"placeholder="Enter 3 letter Airport ID">
					<option>By Flight</option>
					<input id= "submit" type='submit' name="submit" value="SUBMIT" buttonstyle="background-color: #008CBA;">
					<input id="button" type="button" value ="GO BACK" onclick="window.location.href = 'customerLandingPage.jsp'">
				</select>
			</form>
		</div>
		;
	</div>