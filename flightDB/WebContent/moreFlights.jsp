<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>More flights...</title>
</head>
<script>
    history.forward();
</script>
<link rel="stylesheet" type="text/css" href="css/HTMLTable.css">
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
		//Get the combobox from the HelloWorld.jsp
		
			//Get parameters from the HTML form at the OneWayForm.jsp
			String takeoffd1 = request.getParameter("take_off_date");
			String takeoffd2 = request.getParameter("take_off_date_2");
			String flightid = request.getParameter("flight_id");
			String departing_port = request.getParameter("depport");
			String arriving_port = request.getParameter("arrivport");
	    
			System.out.println("Works up to checkpoint:1 ");
			
			//Match by flightID
			String str3 = "SELECT FlightDate.flight_id, flights.fare_first, flights.flight_type, FlightDate.depart_date, FlightDate.arrive_date, flights.depart_aid, flights.arrive_aid " + "FROM flights, FlightDate " + "WHERE flights.flight_num = FlightDate.flight_id AND flights.depart_aid = ? " 
 			+  " AND flights.arrive_aid = ? AND FlightDate.depart_date >= ? AND FlightDate.depart_date <= ? AND flights.num_seats > 0;";		
			System.out.println("Works up to checkpoint:2 ");
			
			PreparedStatement stmt0 = con.prepareStatement(str0);
			stmt0.setString(1, flightid);
			ResultSet flights0 = stmt0.executeQuery();
		
			String u_email = (String) session.getAttribute("user_email");
			 System.out.println("Email ISOWR:" + u_email);
			while (flights0.next()) {
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
			//out.print("</table>");
				
		out.print("</table>");
				
				
}
			
 				
 			
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