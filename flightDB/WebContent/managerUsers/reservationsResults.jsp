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

<link rel="stylesheet" type="text/css" href="../css/HTMLTable.css">

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
	
			String option = request.getParameter("option");
			
			String count = "SELECT COUNT(*) FROM Reservations R";
			System.out.println(count);
			ResultSet county = stmt.executeQuery(count);
			county.next();
			
			System.out.println(county.getInt("COUNT(*)"));
			if(county.getInt("COUNT(*)") == 0){
				%>
					<script>
						alert("OH NO! There aren't any reservations");
						window.location.href("managerLandingPage.jsp");
					</script>
				<%
			}
			if(option.equals("Customer Name")){
			
			//if name is not empty then show the reservations by that name
				String stringy = "SELECT U.user_name, R.customer, R.flight_no, R.res_date, R.num_passengers, R.res_fare, R.res_tot FROM Reservations R JOIN users U ON R.customer=U.email ORDER BY U.user_name";
				System.out.println(stringy);
				ResultSet flights0 = stmt.executeQuery(stringy);
			    
				out.print("<input style=\"margin:auto\" type=\"text\" id=\"myInput\" onkeyup=\"myFunction()\" placeholder=\"Search by Customer Name\">");
				out.print("<table id=\"myTable\">");
				out.print("</tr>");
					out.print("<th>Customer Name</th>");
					out.print("<th>Customer Email</th>");
					out.print("<th>Flight Number</th>");
					out.print("<th>Reservation Date</th>");
					out.print("<th>Number of Passengers</th>");
					out.print("<th>Ticket Price (per passenger)</th>");
					out.print("<th>Total Reservation Price</th>");
				out.print("</tr>");
				while (flights0.next()) {
				//parse out the results
					out.print("<tr>");
					out.print("<td>");
						out.print(flights0.getString("U.user_name"));
					out.print("</td>");	
					out.print("<td>");	
						out.print(flights0.getString("R.customer"));
					out.print("</td>");
					out.print("<td>");	
						out.print(flights0.getString("R.flight_no"));
					out.print("</td>");
					out.print("<td>");	
						out.print(flights0.getString("R.res_date"));
					out.print("</td>");
					out.print("<td>");	
						out.print(flights0.getString("R.num_passengers"));
					out.print("</td>");
					out.print("<td>");	
						out.print(flights0.getString("R.res_fare"));
					out.print("</td>");
					out.print("<td>");	
						out.print(flights0.getString("R.res_tot"));
					out.print("</td>");
				out.print("</tr>");
				}
			out.print("</table>");
		}
			
		else if ((option.equals("Flight Number"))){
			
			String stringy2 = "SELECT U.user_name, R.customer, R.flight_no, R.res_date, R.num_passengers, R.res_fare, R.res_tot FROM Reservations R JOIN users U ON R.customer=U.email ORDER BY R.flight_no";			
			System.out.println(stringy2);
			ResultSet flights1 = stmt.executeQuery(stringy2);
			out.print("<input style=\"margin:auto\" type=\"text\" id=\"myInput2\" onkeyup=\"myFunction2()\" placeholder=\"Search by Flight Number\">");
			out.print("<table id=\"myTable2\">");
				out.print("</tr>");
					out.print("<th>Flight Number</th>");
					out.print("<th>Customer Name</th>");
					out.print("<th>Customer Email</th>");
					out.print("<th>Reservation Date</th>");
					out.print("<th>Number of Passengers</th>");
					out.print("<th>Ticket Price (per passenger)</th>");
					out.print("<th>Total Reservation Price</th>");
				out.print("</tr>");
				while (flights1.next()) {
				//parse out the results
					out.print("<tr>");
					out.print("<td>");	
						out.print(flights1.getString("R.flight_no"));
					out.print("</td>");
					out.print("<td>");
						out.print(flights1.getString("U.user_name"));
					out.print("</td>");	
					out.print("<td>");	
						out.print(flights1.getString("R.customer"));
					out.print("</td>");
					out.print("<td>");	
						out.print(flights1.getString("R.res_date"));
					out.print("</td>");
					out.print("<td>");	
						out.print(flights1.getString("R.num_passengers"));
					out.print("</td>");
					out.print("<td>");	
						out.print(flights1.getString("R.res_fare"));
					out.print("</td>");
					out.print("<td>");	
					out.print(flights1.getString("R.res_tot"));
				out.print("</td>");
				out.print("</tr>");
				}
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
		<script>
			function myFunction() {
			  // Declare variables
			  var input, filter, table, tr, td, i, txtValue;
			  input = document.getElementById("myInput");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("myTable");
			  tr = table.getElementsByTagName("tr");
			
			  // Loop through all table rows, and hide those who don't match the search query
			  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[0];
			    if (td) {
			      txtValue = td.textContent || td.innerText;
			      if (txtValue.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      } else {
			        tr[i].style.display = "none";
			      }
			    }
			  }
			}
		</script>
		<%
		
		%>
		<script>
			function myFunction2() {
			  // Declare variables
			  var input, filter, table, tr, td, i, txtValue;
			  input = document.getElementById("myInput2");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("myTable2");
			  tr = table.getElementsByTagName("tr");
			
			  // Loop through all table rows, and hide those who don't match the search query
			  for (i = 0; i < tr.length; i++) {
			    td = tr[i].getElementsByTagName("td")[0];
			    if (td) {
			      txtValue = td.textContent || td.innerText;
			      if (txtValue.toUpperCase().indexOf(filter) > -1) {
			        tr[i].style.display = "";
			      } else {
			        tr[i].style.display = "none";
			      }
			    }
			  }
			}
		</script>
		<%
	%>
	
		<button style="margin: 0 auto;"
			onclick="window.location.href = 'queryReservations.jsp'">GO BACK
		</button>
		
		

</body>
</html>