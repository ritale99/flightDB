<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Search for Flights!</title>
	</head>
	<style>
     
    </style>
	<body>
		<br>
		<h3>What type of flight?</h3>
			<form method="get" action="oneWayFlightResults.jsp" enctype=text/plain>


		<table>
				<tr>
					<!-- textbox for flight search -->
					<tr>
						<td>Departing Airport</td>
						</tr>
						<tr><td>
							<input type="text" name="depport" placeholder="Enter 3 letter Airport ID">
						</td>
					</tr>
					<tr>
						<td>Arriving Airport</td>
						</tr>
						<tr><td>
							<input type="text" name="arrivport" placeholder="Enter 3 letter Airport ID">
						</td>
					</tr>
					<td>Take off date</td>
						</tr>
							<tr>
								
						<td>
								<input type="text" name="take_off_date" placeholder="YEAR-MM-DD"> To:
					 			<input type= "text" name= "take_off_date_2" placeholder="YEAR-MM-DD"> 
							</td> 
						</tr>
						<br>
					<tr>
						  
						<td> Or search by <td>
						 
						<br>
					<tr>
						<td>Flight id</td>
						</tr>
						<tr><td>
							<input type="text" name="flight_id" placeholder="Unique Flight id">
						</td>
					</tr>	
						
											
					
				</table>
				
		<input type = 'submit' name="submit" value = "submit"> 	
			
			</form>
		
		<br>
		<a href="customerLandingPage.jsp">Want to go back?</a>
		
	</body>
</html>