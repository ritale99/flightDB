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
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the HelloWorld.jsp
			
		    
				System.out.println("Works up to checkpoint:1 ");
				
				//Match by flightID
				String str0 = "SELECT FlightDate.flight_id, flights.fare_first, flights.flight_type " + "FROM flights, FlightDate " + "WHERE flights.flight_num = FlightDate.flight_id";
				System.out.println("Works up to checkpoint:2 ");
				
				PreparedStatement stmt0 = con.prepareStatement(str0);
				
				ResultSet flights0 = stmt0.executeQuery();
				
				System.out.println("Works up to checkpoint:4 ");
	
				while (flights0.next()) {
					
					
					out.print("<table>");
						out.print("</tr>");
							out.print("<th>FlightId</th>");
							out.print("<th>Fare</th>");
							out.print("<th>Flight Type</th>");
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
						out.print("</tr>");
					out.print("</table>");
					
					
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
	<a href = "managerLandingPage.jsp">Want to go back?</a>	

</body>
</html>