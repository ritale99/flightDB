<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
			
			
			
				//Get parameters from the HTML form at the roundTripForm.jsp
				String takeoffd1 = request.getParameter("take_off_date");
				String takeoffd2 = request.getParameter("take_off_date_2");
				String arrived1 = request.getParameter("arrive_date");
				String arrived2 = request.getParameter("arrive_date_2");
				String departing_port = request.getParameter("depport");
				String arriving_port = request.getParameter("arrivport");
				String flight1id;
				String flight2id;
				String flight3id;
				String flight4id;
				String flight5id;
				String flight6id;
		    
				List<String> list = new ArrayList<String>();

				System.out.println("Works up to checkpoint:1 ");
				
				//Check to see matches of the first to go plane
				String str0 = "SELECT FlightDate.flight_id, flights.fare_first, flights.flight_type, FlightDate.depart_date, FlightDate.arrive_date, flights.arrive_aid, flights.depart_aid  " +
				"FROM flights, FlightDate " + 
				"WHERE flights.flight_num = FlightDate.flight_id "+ 
						"and FlightDate.depart_date >= ? " +
						"and FlightDate.depart_date <= ? " +
						"and flights.depart_aid = ? " +
						"and flights.arrive_aid = ?";
				System.out.println("Works up to checkpoint:2 ");
				
				PreparedStatement stmt = con.prepareStatement(str0);
				stmt.setString(1, takeoffd1);
				stmt.setString(2, takeoffd2);
				stmt.setString(3, departing_port);
				stmt.setString(4, arriving_port);
				ResultSet flightsAB = stmt.executeQuery();
				
				System.out.println("Works up to checkpoint:4 ");
	
				
			
			//then we can proceed to display the results later...
				 if (flightsAB.next()) {
					 
					 String str2 = 	"SELECT FlightDate.flight_id, flights.fare_first, flights.flight_type, FlightDate.depart_date, FlightDate.arrive_date " +
								"from FlightDate, flights " +
								"WHERE FlightDate.flight_id = flights.flight_num "+
								"and FlightDate.depart_date >= ? " +
								"and FlightDate.depart_date <= ? " +
								"and flights.arrive_aid = ? " +
								"and flights.depart_aid = ? ";
						
							PreparedStatement stmt2 = con.prepareStatement(str2);
							stmt2.setString(1, arrived1);
							stmt2.setString(2, arrived2);
							stmt2.setString(3, departing_port);
							stmt2.setString(4, arriving_port);
							ResultSet flightsBA = stmt2.executeQuery();
					
					
					out.print("<table>");
						out.print("</tr>");
							out.print("<th>FlightId</th>");
							out.print("<th>Fare</th>");
							out.print("<th>Flight Type</th>");
							out.print("<th>Depart</th>");
							out.print("<th> Arrive </th>");
							out.print("<th>Departing Airport</th>");
							out.print("<th> Arriving Airport </th>");				
							out.print("</tr>");
					
					while(flightsBA.next()){
						
						out.print("<tr>");
						out.print("<td>");
							out.print(flightsAB.getString("FlightDate.flight_id"));
						out.print("</td>");	
						out.print("<td>");	
							out.print(flightsAB.getString("flights.fare_first"));
						out.print("</td>");
						out.print("<td>");	
							out.print(flightsAB.getString("flights.flight_type"));
						out.print("</td>");
						out.print("<td>");	
						out.print(flightsAB.getString("FlightDate.depart_date"));
						out.print("</td>");			
					out.print("<td>");	
					out.print(flightsAB.getString("FlightDate.arrive_date"));
					out.print("</td>");	
					out.print("<td>");	
					out.print(flightsAB.getString("flights.depart_aid"));
					out.print("</td>");			
					out.print("<td>");	
					out.print(flightsAB.getString("flights.arrive_aid"));
					out.print("</td>");	
					out.print("</tr>");
				//out.print("</table>");
					out.print("<tr>");
					out.print("<td>");
						out.print(flightsBA.getString("FlightDate.flight_id"));
					out.print("</td>");	
					out.print("<td>");	
						out.print(flightsBA.getString("flights.fare_first"));
					out.print("</td>");
					out.print("<td>");	
						out.print(flightsBA.getString("flights.flight_type"));
					out.print("</td>");
					out.print("<td>");	
					out.print(flightsAB.getString("FlightDate.depart_date"));
				out.print("</td>");			
				out.print("<td>");	
				out.print(flightsAB.getString("FlightDate.arrive_date"));
			out.print("</td>");		
			out.print("<td>");	
			out.print(flightsAB.getString("flights.arrive_aid"));
		out.print("</td>");			
		out.print("<td>");	
		out.print(flightsAB.getString("flights.depart_aid"));
	out.print("</td>");	
				out.print("</tr>");
			out.print("</table>");
					
					}
						
}
				
		 	//we need the reservation feature as well!!
 			//also need to check the sql here to make sure it matches correctly
 
 			
 			
			con.close();

		}catch (Exception e) {
			out.print("failed");
			%>
			<script> 
		    	alert("Sorry, unexcepted error happened.");
		    	window.location.href = "roundTripForm.jsp";
			</script>
			<%			
		}
	%>

</body>
</html>