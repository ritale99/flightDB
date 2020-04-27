<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/HTMLTable.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Showing Sales Report</title>
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
				//Landing on this page will automatically generate customer revenue
				//Match by flightID
				String str0 = "SELECT user_name, profits FROM users ORDER BY profits DESC";
				System.out.println("Works up to checkpoint:2 ");
				System.out.println(str0);
				PreparedStatement stmt0 = con.prepareStatement(str0);
			
				ResultSet flights0 = stmt0.executeQuery();
			
				while (flights0.next()) {
					out.print("<table>");
						out.print("</tr>");
							out.print("<th>Customer Name</th>");
							out.print("<th>Customer Profits</th>");
					
						out.print("</tr>");
					//parse out the results
						out.print("<tr>");
						out.print("<td>");
							out.print(flights0.getString("user_name"));
						out.print("</td>");	
						out.print("<td>");	
							out.print(flights0.getString("profits"));
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
		    	window.location.href = "salesReportForm.jsp";
			</script>
			<%			
		}
	%>
	
		
		<a href="salesReportForm.jsp">Want to go back?</a>
		
		

</body>
</html>