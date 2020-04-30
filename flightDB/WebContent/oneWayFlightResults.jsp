<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
    history.forward();
</script>
<link rel="stylesheet" type="text/css" href="css/HTMLTable.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Showing One Way Flight Search Results</title>
</head>
<body>
	<%

		try {
			//Database connection
			String url = "jdbc:mysql://localhost:3306/cs336project";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "password");
			Statement stmt = con.createStatement();
			
			//Get parameters from the HTML form at the OneWayForm.jsp
			String takeoffd1 = request.getParameter("take_off_date");
			String flightid = request.getParameter("flight_id");
			String departing_port = request.getParameter("depport");
			String arriving_port = request.getParameter("arrivport");
		    
			//We want to set some session attributes as well	
			//this helps to find additional dates close to the current one, as well as multi-stop flights
			session.setAttribute("departing_port", departing_port);	
			session.setAttribute("arriving_port", arriving_port);	
			session.setAttribute("takeOffDate", takeoffd1);	
			session.setAttribute("flightid", flightid);	
				
			//Match by flightID
			String str0 = "SELECT FlightDate.flight_id, flights.fare_first, flights.flight_type, FlightDate.depart_date, FlightDate.arrive_date, flights.depart_aid, flights.arrive_aid "
			+ "FROM flights, FlightDate " + "WHERE flights.flight_num = FlightDate.flight_id  AND FlightDate.flight_id = ? AND flights.num_seats > 0;";
		
			PreparedStatement stmt0 = con.prepareStatement(str0);
			stmt0.setString(1, flightid);
			ResultSet flights0 = stmt0.executeQuery();
			
			int u_id = (Integer) session.getAttribute("user_id");
				
			//Create the table
			out.print("<table>");
			out.print("</th>");
			out.print("<th>FlightId</th>");
			out.print("<th>Fare</th>");
			out.print("<th>Flight Type</th>");
			out.print("<th>Depart</th>");
			out.print("<th>Arrive</th>");
			out.print("<th>Departing Airport</th>");
			out.print("<th>Arriving Airport </th>");
			out.print("</th>");
					
				while (flights0.next()) {
					 
					//parse out the results
						out.print("<tr>");
						out.print("<td>");
							out.print(flights0.getString("FlightDate.flight_id"));
						out.print("</td>");	
						out.print("<td>");	
							out.print(flights0.getString("flights.fare_first"));
						out.print("</td>");
						out.print("<td>");	
							out.print(flights0.getString("flights.flight_type"));
						out.print("</td>");
						out.print("<td>");	
							out.print(flights0.getString("FlightDate.depart_date"));
						out.print("</td>");			
						out.print("<td>");	
							out.print(flights0.getString("FlightDate.arrive_date"));
						out.print("</td>");	
						out.print("<td>");	
							out.print(flights0.getString("flights.depart_aid"));
						out.print("</td>");			
						out.print("<td>");	
							out.print(flights0.getString("flights.arrive_aid"));
						out.print("</td>");	
						out.print("</tr>");
				}
				
			//Now we need the more advanced query by the date and airport search
 			String str2 = "SELECT FlightDate.flight_id, flights.fare_first, flights.flight_type, FlightDate.depart_date, FlightDate.arrive_date, flights.depart_aid, flights.arrive_aid " + "FROM flights, FlightDate " + "WHERE flights.flight_num = FlightDate.flight_id AND flights.depart_aid = ? " 
 			+  " AND flights.arrive_aid = ? AND FlightDate.depart_date = ? AND flights.num_seats > 0;";
 
 			PreparedStatement stmt2 = con.prepareStatement(str2);
 			stmt2.setString(1,departing_port);
 			stmt2.setString(2,arriving_port);
 			stmt2.setString(3,takeoffd1);
 			ResultSet flights2 = stmt2.executeQuery();
 			
 				while (flights2.next()){
				
				//parse out the results
					out.print("<tr>");
					out.print("<td>");
						out.print(flights2.getString("FlightDate.flight_id"));
					out.print("</td>");	
					out.print("<td>");	
						out.print(flights2.getString("flights.fare_first"));
					out.print("</td>");
					out.print("<td>");	
						out.print(flights2.getString("flights.flight_type"));
					out.print("</td>");
					out.print("<td>");	
						out.print(flights2.getString("FlightDate.depart_date"));
					out.print("</td>");			
					out.print("<td>");
						out.print(flights2.getString("FlightDate.arrive_date"));
					out.print("</td>");	
					out.print("<td>");	
						out.print(flights2.getString("flights.depart_aid"));
					out.print("</td>");			
					out.print("<td>");	
						out.print(flights2.getString("flights.arrive_aid"));
					out.print("</td>");	
					out.print("</tr>");
 				}
				
				out.print("</table>");	
 			
			con.close();

		}catch (Exception e) {
			out.print("failed");
			%>
			<script> 
		    	alert("Sorry, unexcepted error happened.");
		    	window.location.href = "OneWayForm.jsp";
			</script>
			<%			
		}
	
	%>

			
	
	 <br>Type out the flightId of the flight you would like to book!
		<form action="booking_OW.jsp">
			<br><input type="text" placeholder="flight ID" name="flightnum" required> <br>
		<br>How many Passengers for your reservation?<br>
			<br><input type="text" placeholder="number Passengers" name="passengersNum" required> 
		<br>What is the departure date?<br>
			<br><input type="text" placeholder="YEAR-MM-DD" name="departure" required> 
			<br><button type="submit">Book</button>		
		</form>
		
		<h2>More Flights...</h2>
		<a href="moreFlights.jsp" >Want to fly earlier or later?</a>
		<br><a href="">Want to view multi-city flights?</a> </br>
		<br><a href="OneWayForm.jsp">Want to go back?</a> </br>
		
		

</body>
</html>