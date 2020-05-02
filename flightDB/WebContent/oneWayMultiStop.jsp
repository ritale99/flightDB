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
			//Create a connection to your DB
			String url = "jdbc:mysql://localhost:3306/cs336project";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "password");

			//We want to get the session attributes we created by OneWayForm
			String departing_port = (String) session.getAttribute("departing_port");
			String arriving_port = (String) session.getAttribute("arriving_port");
			String takeoffd1 = (String) session.getAttribute("takeOffDate");
			ResultSet flightsBA = null;
			//Check to see matches of the first to go plane
			String str0 = 
					"SELECT flight_id, fare_first, flight_type, " +
					"depart_date, arrive_date," + 
					"arrive_aid, depart_aid  " +
					"FROM flights, FlightDate " + 
					"WHERE flights.flight_num = FlightDate.flight_id AND flights.num_seats > 0 "+ 
					"AND flights.flight_num in (" + 
						"SELECT flights.flight_num " +  
						"FROM flights, FlightDate " +
						"WHERE FlightDate.flight_id = flights.flight_num and FlightDate.depart_date = '" + takeoffd1 + 
						"' AND flights.depart_aid = '" + departing_port +
						"' AND flights.arrive_aid IN (" +
					 		"SELECT flights.depart_aid FROM flights WHERE flights.arrive_aid = '" + arriving_port +
					 		"') UNION " + 
					 
					 "SELECT flights.flight_num FROM flights, FlightDate " + 
					 "WHERE FlightDate.flight_id = flights.flight_num and FlightDate.depart_date = '" + takeoffd1 +
					 "' AND flights.arrive_aid = '" + arriving_port + 
					 "' AND flights.depart_aid IN (" +
					 	"SELECT flights.arrive_aid FROM flights, FlightDate WHERE FlightDate.flight_ID = flights.flight_num " + 
					 "AND FlightDate.depart_date = '" + takeoffd1 + 
					 "' AND flights.depart_aid = '" + departing_port +
					 "' AND flights.arrive_aid IN (" +
					 		"SELECT flights.depart_aid FROM flights WHERE flights.arrive_aid = '" + arriving_port + "')));"
						;
				
				System.out.println("the first plane is: " + str0);
				Statement stmtx = con.createStatement();
				ResultSet flightsAB = stmtx.executeQuery(str0);
				System.out.println("Works up to checkpoint:2.5 ");
				
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
					System.out.println("Works up to checkpoint:2.8 ");
					//reset the pointers of the resultsets
					flightsAB.beforeFirst(); 
		
				 
					System.out.println("Works up to checkpoint:2.9 ");
				
			
					while(flightsAB.next()){
						 System.out.println("Works up to checkpoint:4.4 ");

						{
								System.out.println("CON ALTURA");
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
								out.print("<tr>");
								 System.out.println("Works up to checkpoint:4.5 ");

							}
							
					
					}
				 out.print("</table>");
						
				 System.out.println("Works up to checkpoint:5 ");
				 
				
	
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
		<br><a href="OneWayForm.jsp">Want to go back?</a> </br>		
</body>
</html>