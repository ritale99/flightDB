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
<title>Viewing Results </title>
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
			int u_id = (Integer) session.getAttribute("user_id");
			 if (u_id == 0){
				 %> 
					<!-- if error, show the alert and go back --> 
					<script> 
					    alert("Sorry, session Invalidated!, Please log in Again.");
					    window.location.href = "logout.jsp";
					</script>
				<%
			}
			 
			String string = "SELECT COUNT(*) FROM Reservations WHERE customer='" + u_id + "';";
			ResultSet resCount = stmt.executeQuery(string);
			resCount.next();
			if(resCount.getInt(1) == 0){
				%>
					<h2 style="text-align:center;" style="font-family:arial,sans-serif;" > OH NO! Looks like you don't have any reservations, please come back when you make some!</h2>
				<%
			}else{
				%>
					<h2>Click on the Itineraries for more information on your reservations! </h2><br>
					<a href="itineraries.jsp">Itineraries Information</a>
				<%
			}
			
			
			String stringy = "SELECT R.res_num, R.res_date, R.res_fare, R.res_tot FROM Reservations R WHERE R.customer='" + u_id + "' ORDER BY R.res_date;";
			System.out.println(stringy);
			ResultSet reservations = stmt.executeQuery(stringy);
		    
			out.print("<table>");
			out.print("</th>");
				out.print("<th>Reservation number</th>");
				out.print("<th>Date Reserved</th>");
				out.print("<th>Ticket Price (per passenger)</th>");
				out.print("<th>Total Fare Price</th>");
			out.print("</th>");
			while (reservations.next()) {
				//parse out the results
					out.print("<tr>");
						out.print("<td>");
							out.print(reservations.getString("R.res_num"));
						out.print("</td>");	
						out.print("<td>");
							out.print(reservations.getString("R.res_date"));
						out.print("</td>");	
						out.print("<td>");	
							out.print(reservations.getString("R.res_fare"));
						out.print("</td>");	
						out.print("<td>");	
						out.print(reservations.getString("R.res_tot"));
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
		    	window.location.href = "customerLandingPage.jsp";
			</script>
			<%	
		}
	
		%>
		<a href="customerLandingPage.jsp">Want to go back?</a>
		
		

</body>
</html>