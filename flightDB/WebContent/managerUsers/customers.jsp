<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/HTMLTable.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Showing Flight Information</title>
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
		
					//All flights
					String str0 = "SELECT * from users;";
					PreparedStatement stmt0 = con.prepareStatement(str0);
					ResultSet flights0 = stmt0.executeQuery();
					
					System.out.println("Works up to checkpoint:1 ");
					
					out.print("<input style=\"margin:auto\" type=\"text\" id=\"myInput\" onkeyup=\"myFunction()\" placeholder=\"Search by Name or ID\">");
					
					System.out.println("Works up to checkpoint:4 ");
					
					out.print("<table id=\"myTable\">");
						out.print("</tr>");
							out.print("<th>Customer ID</th>");
							out.print("<th>Customer Name</th>");
							out.print("<th>Customer Email</th>");
							out.print("<th>Customer Phone</th>");
							out.print("<th>Customer Credit Card</th>");
							out.print("<th>Customer CVV</th>");
						out.print("</tr>");
					while (flights0.next()) {
						out.print("<tr>");
							out.print("<td>");
								out.print(flights0.getString("user_id"));
							out.print("</td>");
							out.print("<td>");
								out.print(flights0.getString("user_name"));
							out.print("</td>");
							out.print("<td>");
								out.print(flights0.getString("email"));
							out.print("</td>");
							out.print("<td>");
								out.print(flights0.getString("phone"));
							out.print("</td>");
							out.print("<td>");
								out.print(flights0.getString("credit_card"));
							out.print("</td>");
							out.print("<td>");
								out.print(flights0.getString("credit_cvv"));
							out.print("</td>");
						out.print("</tr>");
					}
					out.print("</table>");
			con.close();
			} catch (Exception e) {
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
		  var input, filter, table, tr, td,td2, i, txtValue, txtValue2;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable");
		  tr = table.getElementsByTagName("tr");
		
		  // Loop through all table rows, and hide those who don't match the search query
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[0];
		    td2 =tr[i].getElementsByTagName("td")[1];
		    if (td || td2) {
		      txtValue = td.textContent || td.innerText ;
		      txtValue2 = td2.textContent || td2.innerText
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
			<button style="margin: 0 auto;"
				onclick="window.location.href = 'customerDetailsForm.jsp'">GO BACK
			</button>

</body>
</html>