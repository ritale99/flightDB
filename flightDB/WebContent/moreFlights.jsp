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
		    
			//We want to get the session attributes we created
			 String departing_port = (String) session.getAttribute("departing_port");
			 String arriving_port = (String) session.getAttribute("arriving_port");
			 String takeoffd1 = (String) session.getAttribute("takeOffDate");
			 String flightid = (String) session.getAttribute("flightid");
	
			//Now we need the more advanced query by the date and airport search
 			String str2 = "SELECT FlightDate.flight_id, flights.fare_first, flights.flight_type, FlightDate.depart_date, FlightDate.arrive_date, flights.depart_aid, flights.arrive_aid " + 
			"FROM flights, FlightDate " + "WHERE flights.flight_num = FlightDate.flight_id AND flights.depart_aid = ? " 
 			+  " AND flights.arrive_aid = ? AND FlightDate.depart_date < DATE_ADD('" +takeoffd1+ "', INTERVAL  7 DAY) AND FlightDate.depart_date > DATE_SUB('" +takeoffd1+ "', INTERVAL  7 DAY)" + 
			"AND FlightDate.depart_date <> '" + takeoffd1 + "';";
 
 			PreparedStatement stmt2 = con.prepareStatement(str2);
 			stmt2.setString(1,departing_port);
 			stmt2.setString(2,arriving_port);
 			System.out.println(str2);
 			ResultSet flights2 = stmt2.executeQuery();
			
 			//Create the table
			out.print("<table>");
			out.print("</tr>");
			out.print("<th>FlightId</th>");
			out.print("<th>Fare</th>");
			out.print("<th>Flight Type</th>");
			out.print("<th>Depart</th>");
			out.print("<th>Arrive</th>");
			out.print("<th>Departing Airport</th>");
			out.print("<th>Arriving Airport </th>");
			out.print("</tr>");
 			
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
		
				 
				//Removal of the attributes for future search 
				//request.getSession().removeAttribute("departing_port");
				//request.getSession().removeAttribute("arriving_port");		
				//request.getSession().removeAttribute("takeOffDate");		
				//request.getSession().removeAttribute("flightid");		

			con.close();

		}catch (Exception e) {
			out.print("failed");
			%>
			<script> 
		    	alert("Sorry, unexcepted error happened.");
		    	window.location.href = "oneWayFlightResults.jsp";
			</script>
			<%			
		}
	
	%>

			
	
	<br><a href="OneWayForm.jsp">Want to go back?</a> </br>
		
</body>
</html>