<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get Sales Report</title>
</head>
<body>


	<p class="app-name">Filter By...</p>
	<div class="login-page">
		<div class="form">
			<form method="get" action="monthlyReport.jsp" enctype=text/plain>
				<select type="text" name="month">
					<option>January</option>
					<option>February</option>
					<option>March</option>
					<option>April</option>
					<option>May</option>
					<option>June</option>
					<option>July</option>
					<option>August</option>
					<option>September</option>
					<option>October</option>
					<option>November</option>
					<option>December</option>
				</select>
				<select type="text" name="year">
					<option>2001</option>
					<option>2002</option>
					<option>2003</option>
					<option>2004</option>
					<option>2005</option>
					<option>2006</option>
					<option>2007</option>
					<option>2008</option>
					<option>2009</option>
					<option>2010</option>
					<option>2011</option>
					<option>2012</option>
					<option>2013</option>
					<option>2014</option>
					<option>2015</option>
					<option>2016</option>
					<option>2017</option>
					<option>2018</option>
					<option>2019</option>
					<option>2020</option>
					<input id= "submit" type='submit' name="submit" value="SUBMIT" buttonstyle="background-color: #008CBA;">
					<input id="button" type="button" value ="GO BACK" onclick="window.location.href = 'managerLandingPage.jsp'">
				</select>
			</form>
		</div>
		;
	</div>
	