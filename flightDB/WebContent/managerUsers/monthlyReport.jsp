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

			String monthString = request.getParameter("month");
			String yearString = request.getParameter("year");
			
			int month = 0;
			int year;
			//Generate month in number
			if(monthString.equals("January")){
				month = 1;
			}
			else if(monthString.equals("February")){
				month = 2;
			}
			else if(monthString.equals("March")){
				month = 3;
			}
			else if(monthString.equals("April")){
				month = 4;
			}
			else if(monthString.equals("May")){
				month = 5;
			}
			else if(monthString.equals("June")){
				month = 6;
			}
			else if(monthString.equals("July")){
				month = 7;
			}
			else if(monthString.equals("August")){
				month = 8;
			}
			else if(monthString.equals("September")){
				month = 9;
			}
			else if(monthString.equals("October")){
				month = 10;
			}
			else if(monthString.equals("November")){
				month = 11;
			}
			else if(monthString.equals("December")){
				month = 12;
			}
			
			year = Integer.parseInt(yearString);
			System.out.println("Successfully parsed month and year");
			
			String str0 = "SELECT R.res_date, U.profits FROM Reservations R JOIN users U ON R.customer = U.email WHERE EXTRACT(MONTH FROM R.res_date) = '" + month + "' AND EXTRACT(YEAR FROM R.res_date)='" + year + "' ORDER BY res_date DESC;";
			System.out.println("Works up to checkpoint:2 ");
			System.out.println(str0);
			PreparedStatement stmt0 = con.prepareStatement(str0);
			ResultSet flights0 = stmt0.executeQuery();
			
			String count = "SELECT COUNT(R.res_date), SUM(R.res_fare) FROM Reservations R WHERE EXTRACT(MONTH FROM R.res_date) ='" + month + "' AND EXTRACT(YEAR FROM R.res_date)='" + year + "' ORDER BY res_date DESC;";
			PreparedStatement stmt1 = con.prepareStatement(count);
			ResultSet countSums = stmt1.executeQuery();
			countSums.next();
			int totalReservations = countSums.getInt("COUNT(R.res_date)");
			double totalProfits = countSums.getDouble("SUM(R.res_fare)");
			
			if(totalReservations > 0){
				out.print("<table>");
					out.print("<tr>");
						out.print("<th>Reservation Date</th>");
						out.print("<th>Fare</th>");
					out.print("</tr>");
				while (flights0.next()) {
					//parse out the results
					out.print("<tr>");
					out.print("<td>");
					out.print(flights0.getString("R.res_date"));
					out.print("</td>");
					out.print("<td>");
					out.print(flights0.getString("R.res_fare"));
					out.print("</td>");
					out.print("</tr>");
				}
					out.print("<tr>");
						out.print("<th>Total Reservations</th>");
						out.print("<th>Total Profits</th>");
					out.print("</tr>");
					
					out.print("<tr>");
						out.print("<td>");
							out.print(totalReservations);
						out.print("</td>");
						out.print("<td>");
							out.print(totalProfits);
						out.print("</td>");
					out.print("</tr>");
				out.print("</table>");
			}else{
				%>
					<script>
						alert("You don't have any reservations/profits for " + monthString + yearString);
						window.location.href = "monthlySales.jsp";
					</script>
				<%
				return;
			}
				
	con.close();

	} catch (Exception e) {
		out.print("failed");
	%>
	<script>
		alert("Sorry, unexcepted error happened.");
		window.location.href = "monthlySales.jsp";
	</script>
	<%
	}
	%>

	<button style="margin: 0 auto;"
		onclick="window.location.href = 'monthlySales.jsp'">GO BACK
	</button>





</body>
</html>