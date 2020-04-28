<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Details</title>
</head>
<body>


	<p class="app-name">Find Reservations by Flight Number or Customer
		Name!</p>


	<div class="login-page">
		<div class="form">
			<form method="get" action="listAllFlights.jsp"
				enctype=text/plain>
				<select type="text" name="flight_option" placeholder="">
					<option>Filter Flights...</option>
					<option>By Airport</option>
					<option>By Departure/Arrival Status</option>
					<option>By Customer Reservations</option>
					<input id="submit" type='submit' name="submit" value="SUBMIT">
					</pre>
					<input id="button" type="button" value ="GO BACK" onclick="window.location.href = 'managerLandingPage.jsp'">
			</form>

		</div>
</body>
</html>