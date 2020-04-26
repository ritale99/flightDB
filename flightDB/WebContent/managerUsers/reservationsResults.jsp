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


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Showing Reservations Searched by FlightID or Customer Name</title>
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
	
			String name = request.getParameter("name");
			String flight = request.getParameter("flightID");
			
			//if name is not empty then show the reservations by that name
		if (!(name.equals(""))){
				String stringy = "SELECT Reservations.res_num, Reservations.res_date, Reservations.customer, Reservations.num_passengers, Trips.flights" +
						" FROM Reservations,Trips, users WHERE users.user_name = '" + name + "' AND Trips.res_num = Reservations.res_num AND Reservations.customer = users.email;";
				System.out.println(stringy);
				ResultSet flights0 = stmt.executeQuery(stringy);
			    
				
				
				while (flights0.next()) {
					out.print("<table>");
					out.print("</tr>");
						out.print("<th>Reservation Number</th>");
						out.print("<th>Reservation Date</th>");
						out.print("<th>Customer Email</th>");
						out.print("<th>Number of Passengers</th>");
						out.print("<th>Flights</th>");
				
					out.print("</tr>");
				//parse out the results
					out.print("<tr>");
					out.print("<td>");
						out.print(flights0.getString("Reservations.res_num"));
					out.print("</td>");	
					out.print("<td>");	
						out.print(flights0.getString("Reservations.res_date"));
					out.print("</td>");
					out.print("<td>");	
						out.print(flights0.getString("Reservations.customer"));
					out.print("</td>");
					out.print("<td>");	
					out.print(flights0.getString("Reservations.num_passengers"));
					out.print("</td>");			
				out.print("<td>");	
				out.print(flights0.getString("Trips.flights"));
				out.print("</td>");	
				out.print("<td>");	
				out.print("</tr>");
			//out.print("</table>");
				
		out.print("</table>");
					}	
		}
			
		if (!(flight.equals(""))){
			
			String stringy2 = "SELECT Reservations.res_num, Reservations.res_date, Reservations.customer, Reservations.num_passengers, Trips.flights" +
					" FROM Reservations,Trips  WHERE Trips.flights = '" + flight + "' AND Trips.res_num = Reservations.res_num;";
			System.out.println(stringy2);
			ResultSet flights1 = stmt.executeQuery(stringy2);
			while (flights1.next()) {
				out.print("<table>");
				out.print("</tr>");
					out.print("<th>Reservation Number</th>");
					out.print("<th>Reservation Date</th>");
					out.print("<th>Customer Email</th>");
					out.print("<th>Number of Passengers</th>");
					out.print("<th>Flights</th>");
			
				out.print("</tr>");
			//parse out the results
				out.print("<tr>");
				out.print("<td>");
					out.print(flights1.getString("Reservations.res_num"));
				out.print("</td>");	
				out.print("<td>");	
					out.print(flights1.getString("Reservations.res_date"));
				out.print("</td>");
				out.print("<td>");	
					out.print(flights1.getString("Reservations.customer"));
				out.print("</td>");
				out.print("<td>");	
				out.print(flights1.getString("Reservations.num_passengers"));
				out.print("</td>");			
			out.print("<td>");	
			out.print(flights1.getString("Trips.flights"));
			out.print("</td>");	
			out.print("<td>");	
			out.print("</tr>");
		//out.print("</table>");
			
	out.print("</table>");
				}	
			
		}
			
		
 			
			con.close();

		}catch (Exception e) {
			out.print("failed");
			%>
			<script> 
		    	alert("Sorry, unexcepted error happened.");
		    	window.location.href = "managerLandingPage.jsp";
			</script>
			<%			
		}
	%>
	
		
		<a href="managerLandingPage.jsp">Want to go back?</a>
		
		

</body>
</html>