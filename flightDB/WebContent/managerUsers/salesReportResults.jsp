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
<title>Showing Sales Report For Selected Month</title>
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
			
			
				//Get parameters from the HTML form at the salesReportForm.jsp
				String month = request.getParameter("month");
				System.out.println("the month is:" + month);
				int monthNum = 0;
				//want to convert the month to SQL readable format
				if (month.equals("January")){
					monthNum = 1;
				}
				if (month.equals("February")){
					monthNum = 2;
				}
				if (month.equals("March")){
					monthNum = 3;
				}
				if (month.equals("April")){
					monthNum = 4;
				}
				if (month.equals("May")){
					monthNum = 5;
				}
				if (month.equals("June")){
					monthNum = 6;
				}
				if (month.equals("July")){
					monthNum = 7;
				}
				if (month.equals("August")){
					monthNum = 8;
				}
				if (month.equals("September")){
					monthNum = 9;
				}
				if (month.equals("October")){
					monthNum = 10;
				}
				if (month.equals("November")){
					monthNum = 11;
				}
				if (month.equals("December")){
					monthNum = 12;
				}
				
				System.out.println("Works up to checkpoint:1 ");
				
				//Match by flightID
				String str0 = "SELECT Reservations.res_num, Reservations.res_date, Reservations.customer, Reservations.num_passengers, Trips.flights" +
							" FROM Reservations, Trips WHERE MONTH(res_date) = " + monthNum + " AND Trips.res_num = Reservations.res_num;";
				System.out.println("Works up to checkpoint:2 ");
				System.out.println(str0);
				PreparedStatement stmt0 = con.prepareStatement(str0);
			
				ResultSet flights0 = stmt0.executeQuery();
			
				while (flights0.next()) {
					out.print("<table>");
						out.print("</tr>");
							out.print("<th>Reservation Number</th>");
							out.print("<th>Reservation Date</th>");
							out.print("<th>Customer Email</th>");
							out.print("<th>Number of Passengeres</th>");
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
				
 
 			
			con.close();

		}catch (Exception e) {
			out.print("failed");
			%>
			<script> 
		    	alert("Sorry, unexcepted error happened.");
		    	window.location.href = "salesReportForm.jsp";
			</script>
			<%			
		}
	%>
	
		
		<a href="salesReportForm.jsp">Want to go back?</a>
		
		

</body>
</html>