<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//E+N" "http://www.w3.org/TR/html4/loose.dtd">
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
			//Create a connection string
			String url = "jdbc:mysql://localhost:3306/cs336project";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "root", "password");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
	
			//parameters
			String u_email = (String) session.getAttribute("user_email");
			 if (u_email == null || u_email.equals("")){
				 %> 
					<!-- if error, show the alert and go back --> 
					<script> 
					    alert("Sorry, session Invalidated!, Please log in Again.");
					    window.location.href = "logout.jsp";
					</script>
					<%
			 }
			
		
				String stringy = "SELECT FlightDate.arrive_date, FlightDate.depart_date, flights.depart_aid, flights.arrive_aid, Trips.flights, Reservations.res_num, Reservations.res_date, Reservations.num_passengers, flights.flight_type FROM flights, Reservations, FlightDate, Trips WHERE Reservations.customer = '" + u_email + 
						"' AND Trips.res_num = Reservations.res_num AND flights.flight_num = Trips.flights AND FlightDate.flight_id = flights.flight_num;";
				
				System.out.println(stringy);
				ResultSet flights0 = stmt.executeQuery(stringy);
			    
				
				
				while (flights0.next()) {
					out.print("<table>");
						out.print("</tr>");
							out.print("<th>Flight Type</th>");
							out.print("<th>Number of Passengers</th>");
							out.print("<th>Date Reserved</th>");
							out.print("<th>Departure Date</th>");
							out.print("<th>Arrive Date</th>");
							out.print("<th>Depart Airport</th>");
							out.print("<th>Arrive Airport</th>");
						out.print("</tr>");
					//parse out the results
						out.print("<tr>");
						out.print("<td>");
							out.print(flights0.getString("flights.flight_type"));
						out.print("</td>");	
						out.print("<td>");	
							out.print(flights0.getString("Reservations.num_passengers"));
						out.print("</td>");
						out.print("<td>");	
							out.print(flights0.getString("Reservations.res_date"));
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
				//out.print("</table>");
					
			out.print("</table>");
					
					
}	
 			
			con.close();

		}catch (Exception e) {
			out.print("failed");
			%>
			<script> 
		    	alert("Sorry, unexcepted error happened.");
		    	window.location.href = "customerLandingPage.jsp";
			</script>
			<%			
		}
	%>
	
		
		<a href="customerLandingPage.jsp">Want to go back?</a>
		
		

</body>
</html>