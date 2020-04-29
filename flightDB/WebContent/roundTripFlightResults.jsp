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
				String arrived1 = request.getParameter("arrive_date");
				String flightID = request.getParameter("flightID");
				String departing_port = request.getParameter("depport");
				String arriving_port = request.getParameter("arrivport");
				String flight1id;
				String flight2id;
				String flight3id;
				String flight4id;
				String flight5id;
				String flight6id;
		    
				List<String> list = new ArrayList<String>();

				if(!flightID.equals("")){
					
					//Match by flightID
					String str0 = "SELECT FlightDate.flight_id, flights.fare_first, flights.flight_type, FlightDate.depart_date, FlightDate.arrive_date, flights.depart_aid, flights.arrive_aid "
					+ "FROM flights, FlightDate " + "WHERE flights.flight_num = FlightDate.flight_id  AND FlightDate.flight_id = ? AND flights.num_seats > 0;";
					System.out.println("Works up to checkpoint:2 ");
					
					PreparedStatement stmt0 = con.prepareStatement(str0);
					stmt0.setString(1, flightID);
					ResultSet flights0 = stmt0.executeQuery();
				
					String u_email = (String) session.getAttribute("user_email");
					 System.out.println("Email ISOWR:" + u_email);
					
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
				}
				
				else{
				//Check to see matches of the first to go plane
				String str0 = 
						"SELECT FlightDate.flight_id, flights.fare_first, flights.flight_type, FlightDate.depart_date, FlightDate.arrive_date, flights.arrive_aid, flights.depart_aid  " +
						"FROM flights, FlightDate " + 
						"WHERE flights.flight_num = FlightDate.flight_id "+ 
						"and FlightDate.depart_date = ? " +
						"and flights.depart_aid = ? " +
						"and flights.arrive_aid = ? AND flights.num_seats > 0;";
				
					System.out.println("Works up to checkpoint:2 ");
				
				PreparedStatement stmt = con.prepareStatement(str0);
				stmt.setString(1, takeoffd1);
				stmt.setString(2, departing_port);
				stmt.setString(3, arriving_port);
				
				System.out.println(stmt);
				
				ResultSet flightsAB = stmt.executeQuery();
	
				System.out.println("Works up to checkpoint:2.5 ");
			//then we can proceed to display the results later...
				 if (flightsAB.isBeforeFirst()) {
					 
					 
					 //select the return flights
					 String str2 = 	"SELECT FlightDate.flight_id, flights.fare_first, flights.flight_type, flights.depart_aid, flights.arrive_aid, FlightDate.depart_date, FlightDate.arrive_date " +
								"from FlightDate, flights " +
								"WHERE FlightDate.flight_id = flights.flight_num "+
								"and FlightDate.depart_date = ? " +
								"and flights.arrive_aid = ? " +
								"and flights.depart_aid = ? AND flights.num_seats > 0;";
						
							PreparedStatement stmt2 = con.prepareStatement(str2);
							stmt2.setString(1, arrived1);
							stmt2.setString(2, departing_port);
							stmt2.setString(3, arriving_port);
							System.out.println(str2);
							ResultSet flightsBA = stmt2.executeQuery();
							
							
							System.out.println("Works up to checkpoint:3 ");
					
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
					
					while(flightsAB.next()){
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
					}
					//out.print("</table>");
				while (flightsBA.next()){
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
						out.print(flightsBA.getString("FlightDate.depart_date"));
						out.print("</td>");			
						out.print("<td>");	
						out.print(flightsBA.getString("FlightDate.arrive_date"));
						out.print("</td>");		
						out.print("<td>");	
						out.print(flightsBA.getString("flights.depart_aid"));
						out.print("</td>");			
						out.print("<td>");	
						out.print(flightsBA.getString("flights.arrive_aid"));
						out.print("</td>");	
						out.print("</tr>");
						
					
					}}
				 out.print("</table>");
						
				 System.out.println("Works up to checkpoint:5 ");
				 
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
	<br> Type out the flightId of the flight you would like to book!               

		<form action="booking_RT.jsp">
			<input type="text" placeholder="flight ID" name="flightnum"
				required> <br>
	<br> Type out the flightId of the flight you would like to book on the way back!

		<form action="booking_RT.jsp">
			<input type="text" placeholder="flight ID" name="flightnum2"
				required> <br>				
			<br>How many Passengers for your reservation?
			<input type="text" placeholder="number Passengers" name="passengersNum"
				required> <br>
				
				
			<button type="submit">Book</button>		
			
			<br>
		<a href="roundTripForm.jsp">Want to go back?</a>
			   
		</form>

</body>
</html>