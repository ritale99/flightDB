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
				
		String flightOption = request.getParameter("flight_option");
		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "root", "password");
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the combobox from the HelloWorld.jsp
		
			    
			System.out.println("Works up to checkpoint:1 ");
		
			
			if(flightOption.equals("All Flights")){
				//All flights
				String str0 = "SELECT F.flight_num, F.airline_id, D.depart_date, F.depart_aid, D.arrive_date, F.arrive_aid, F.arr_dep_time FROM flights F, FlightDate D WHERE F.flight_num= D.flight_id ORDER BY D.depart_date;";
				System.out.println("Works up to checkpoint:2 ");
				
				PreparedStatement stmt0 = con.prepareStatement(str0);
				
				ResultSet flights0 = stmt0.executeQuery();
				
				System.out.println("Works up to checkpoint:4 ");
				
				out.print("<table id=\"myTable\">");
					out.print("</tr>");
						out.print("<th>Flight</th>");
						out.print("<th>Airline</th>");
						out.print("<th>Departure Date</th>");
						out.print("<th>Departure Airport</th>");
						out.print("<th>Arrival Date</th>");
						out.print("<th>Arrival Airport</th>");
						out.print("<th>Departure/Arrival Status</th>");
					out.print("</tr>");
					while (flights0.next()) {
						out.print("<tr>");
							out.print("<td>");
								out.print(flights0.getString("F.flight_num"));
							out.print("</td>");
							out.print("<td>");
								out.print(flights0.getString("F.airline_id"));
							out.print("</td>");
							out.print("<td>");
								out.print(flights0.getString("D.depart_date"));
							out.print("</td>");
							out.print("<td>");
								out.print(flights0.getString("F.depart_aid"));
							out.print("</td>");
							out.print("<td>");
								out.print(flights0.getString("D.arrive_date"));
							out.print("</td>");
							out.print("<td>");
								out.print(flights0.getString("F.arrive_aid"));
							out.print("</td>");
							out.print("<td>");
								out.print(flights0.getString("F.arr_dep_time"));
							out.print("</td>");
						out.print("</tr>");
					}
					out.print("</table>");
				}else if(flightOption.equals("By Airport")){
					out.print("<input style=\"margin:auto\" type=\"text\" id=\"myInput\" onkeyup=\"myFunction2()\" placeholder=\"Search by Airport \">");
					//Match by Airport
					String str0 = "SELECT F.flight_num, F.airline_id, D.depart_date, F.depart_aid, D.arrive_date, F.arrive_aid, F.arr_dep_time FROM flights F, FlightDate D WHERE F.flight_num= D.flight_id ORDER BY F.depart_aid;";
					System.out.println("Works up to checkpoint:2 ");
					
					PreparedStatement stmt0 = con.prepareStatement(str0);
					
					ResultSet flights0 = stmt0.executeQuery();
					
					System.out.println("Works up to checkpoint:4 ");
					
					out.print("<table id=\"myTable2\">");
						out.print("</tr>");
							out.print("<th>Departure Airport</th>");
							out.print("<th>Departure Date</th>");
							out.print("<th>Arrival Airport</th>");
							out.print("<th>Arrival Date</th>");
							out.print("<th>Flight</th>");
							out.print("<th>Airline</th>");
							out.print("<th>Departure/Arrival Status</th>");
						out.print("</tr>");
						while (flights0.next()) {
							out.print("<tr>");
								out.print("<td>");
									out.print(flights0.getString("F.depart_aid"));
								out.print("</td>");
								out.print("<td>");
									out.print(flights0.getString("D.depart_date"));
								out.print("</td>");
								out.print("<td>");
									out.print(flights0.getString("F.arrive_aid"));
								out.print("</td>");
								out.print("<td>");
									out.print(flights0.getString("D.arrive_date"));
								out.print("</td>");
								out.print("<td>");
									out.print(flights0.getString("F.flight_num"));
								out.print("</td>");
								out.print("<td>");
									out.print(flights0.getString("F.airline_id"));
								out.print("</td>");
								out.print("<td>");
									out.print(flights0.getString("F.arr_dep_time"));
								out.print("</td>");
							out.print("</tr>");
						}
						out.print("</table>");					
				}else if(flightOption.equals("By Departure/Arrival Status")){
					out.print("<input style=\"margin:auto\" type=\"text\" id=\"myInput\" onkeyup=\"myFunction3()\" placeholder=\"Search by Departure/Arrival Time Status\">");
					//Match by Dep/Arr Status
					String str0 = "SELECT F.flight_num, F.airline_id, D.depart_date, F.depart_aid, D.arrive_date, F.arrive_aid, F.arr_dep_time FROM flights F, FlightDate D WHERE F.flight_num= D.flight_id ORDER BY F.arr_dep_time;";
					System.out.println("Works up to checkpoint:2 ");
					
					PreparedStatement stmt0 = con.prepareStatement(str0);
					
					ResultSet flights0 = stmt0.executeQuery();
					
					System.out.println("Works up to checkpoint:4 ");
					
					out.print("<table id=\"myTable3\">");
						out.print("</tr>");
							out.print("<th>Departure/Arrival Status</th>");
							out.print("<th>Flight</th>");
							out.print("<th>Airline</th>");
							out.print("<th>Departure Date</th>");
							out.print("<th>Departure Airport</th>");
							out.print("<th>Arrival Date</th>");
							out.print("<th>Arrival Airport</th>");
						out.print("</tr>");
						while (flights0.next()) {
							out.print("<tr>");
								out.print("<td>");
									out.print(flights0.getString("F.arr_dep_time"));
								out.print("</td>");
								out.print("<td>");
									out.print(flights0.getString("F.flight_num"));
								out.print("</td>");
								out.print("<td>");
									out.print(flights0.getString("F.airline_id"));
								out.print("</td>");
								out.print("<td>");
									out.print(flights0.getString("D.depart_date"));
								out.print("</td>");
								out.print("<td>");
									out.print(flights0.getString("F.depart_aid"));
								out.print("</td>");
								out.print("<td>");
									out.print(flights0.getString("D.arrive_date"));
								out.print("</td>");
								out.print("<td>");
									out.print(flights0.getString("F.arrive_aid"));
								out.print("</td>");
							out.print("</tr>");
						}
						out.print("</table>");					
				}else if(flightOption.equals("By Flight")){
					

					
					String count = "SELECT COUNT(*) FROM Reservations R;";
					PreparedStatement stmt0 = con.prepareStatement(count);
					ResultSet county = stmt0.executeQuery(count);
					county.next();

					if(county.getInt("COUNT(*)") == 0){
						%>
							<script>
								alert("No one has made any reservations! Can't display flight results for customers");
								window.location.href("flights.jsp");
							</script>
						<%
					}
						//Match by flightID
						String str0 = "SELECT R.flight_no, U.user_name, U.user_id, R.num_passengers FROM Reservations R JOIN Users U ON R.customer=U.user_id ORDER BY R.flight_no";
						System.out.println(str0);
						System.out.println("Works up to checkpoint:2 ");
						ResultSet flights0 = stmt0.executeQuery(str0);
	
						
						out.print("<input style=\"margin:auto\" type=\"text\" id=\"myInput\" onkeyup=\"myFunction4()\" placeholder=\"Search by Flight\">");
						
						System.out.println("Works up to checkpoint:4 ");
						
						out.print("<table id=\"myTable4\">");
							out.print("</tr>");
								out.print("<th>Flight</th>");
								out.print("<th>Customer ID</th>");
								out.print("<th>Customer Name</th>");
								out.print("<th>Number of Passengers</th>");
							out.print("</tr>");
							while (flights0.next()) {
								System.out.println("i am here");
								out.print("<tr>");
									out.print("<td>");
										out.print(flights0.getString("R.flight_no"));
									out.print("</td>");
									out.print("<td>");
										out.print(flights0.getString("U.user_id"));
									out.print("</td>");
									out.print("<td>");
										out.print(flights0.getString("U.user_name"));
									out.print("</td>");
									out.print("<td>");
										out.print(flights0.getString("R.num_passengers"));
									out.print("</td>");
								out.print("</tr>");
							}
							out.print("</table>");
				}
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
		function myFunction2() {
		  // Declare variables
		  var input, filter, table, tr, td,td2, i, txtValue, txtValue2;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable2");
		  tr = table.getElementsByTagName("tr");
		
		  // Loop through all table rows, and hide those who don't match the search query
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[0];
		    td2 =tr[i].getElementsByTagName("td")[2];
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
		function myFunction4() {
		  // Declare variables
		  var input, filter, table, tr, td, i, txtValue;
		  input = document.getElementById("myInput");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("myTable4");
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
				onclick="window.location.href = 'flights.jsp'">GO BACK
			</button>

</body>
</html>