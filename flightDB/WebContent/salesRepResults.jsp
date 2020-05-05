<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/HTMLTable.css">

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
			String filterOp = request.getParameter("filter");
			
			
			if (filterOp.equals("By Flight")) {
			//Match by flightID
			String str0 = "SELECT flight_num, a_name, profits FROM flights F JOIN airlines A WHERE F.airline_id = A.airline_id ORDER BY profits DESC";
			System.out.println("Works up to checkpoint:2 ");
			System.out.println(str0);
			PreparedStatement stmt0 = con.prepareStatement(str0);
	
			ResultSet flights0 = stmt0.executeQuery();
			out.print("<input style=\"margin:auto\" type=\"text\" id=\"myInput\" onkeyup=\"myFunction2()\" placeholder=\"Search by flight\">");
			out.print("<table id=\"myTable2\">");
				out.print("<thead>");
					out.print("</tr>");
					out.print("<th>Flight Number</th>");
					out.print("<th>Airline Name</th>");
					out.print("<th>Profits</th>");
				out.print("</thead>");
			out.print("</tr>");
			
				out.print("<tbody>");
				while (flights0.next()) {
					//parse out the results
					out.print("<tr>");
						out.print("<td>");
						out.print(flights0.getString("flight_num"));
						out.print("</td>");
						out.print("<td>");
						out.print(flights0.getString("a_name"));
						out.print("</td>");
						out.print("<td>");
						out.print(flights0.getString("profits"));
						out.print("</td>");
					out.print("</tr>");
				}
				out.print("</tbody>");
			out.print("</table>");
			} else if (filterOp.equals("By Destination City")) 
			{
				//Match by City
				String str0 = "SELECT Airport_id, ap_name, city, state, country, profits FROM Airport A ORDER BY profits DESC";
				System.out.println("Works up to checkpoint:2 ");
				System.out.println(str0);
				PreparedStatement stmt0 = con.prepareStatement(str0);
		
				ResultSet flights0 = stmt0.executeQuery();
				out.print("<input style=\"margin:auto\" type=\"text\" id=\"myInput\" onkeyup=\"myFunction3()\" placeholder=\"Search by City\">");
				out.print("<table id=\"myTable3\">");
					out.print("<thead>");
						out.print("</tr>");
							out.print("<th>Airport ID</th>");
							out.print("<th>Airport Name</th>");
							out.print("<th>City</th>");
							out.print("<th>State</th>");
							out.print("<th>Country</th>");
							out.print("<th>Profits</th>");
						out.print("</tr>");
					out.print("</thead>");
		
				out.print("<tbody>");
				while (flights0.next()) {
					//parse out the results
					out.print("<tr>");
						out.print("<td>");
						out.print(flights0.getString("Airport_id"));
						out.print("</td>");
						out.print("<td>");
						out.print(flights0.getString("ap_name"));
						out.print("</td>");
						out.print("<td>");
						out.print(flights0.getString("city"));
						out.print("</td>");
						out.print("<td>");
						out.print(flights0.getString("state"));
						out.print("</td>");
						out.print("<td>");
						out.print(flights0.getString("country"));
						out.print("</td>");
						out.print("<td>");
						out.print(flights0.getString("profits"));
						out.print("</td>");
					out.print("</tr>");
				}
				out.print("</tbody>");
			out.print("</table>");
			}
	con.close();
	} catch (Exception e) {
		out.print("failed");
	%>
	<script>
		alert("Sorry, unexcepted error happened.");
		window.location.href = "salesReportForm.jsp";
	</script>
	<%
		}
	%>
	<script>
		function myFunction() {
		  // Declare variables
		  var input, filter, table, tr, td, td2, i, txtValue, txtValue2;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable");
		  tr = table.getElementsByTagName("tr");
		
		  // Loop through all table rows, and hide those who don't match the search query
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[0];
		    td2 = tr[i].getElementsByTagName("td")[1];
		    if (td) {
		      txtValue = td.textContent || td.innerText;
		      txtValue2 = td2.textContent || td2.innerText;
		      if (txtValue.toUpperCase().indexOf(filter) > -1 || txtValue2.toUpperCase().indexOf(filter) > -1) {
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
		  input = document.getElementById("myInput");
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
	<script>
		function myFunction3() {
		  // Declare variables
		  var input, filter, table, tr, td, i, txtValue;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable3");
		  tr = table.getElementsByTagName("tr");
		
		  // Loop through all table rows, and hide those who don't match the search query
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[2];
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
		onclick="window.location.href = 'salesRepForm.jsp'">GO BACK
	</button>





</body>
</html>