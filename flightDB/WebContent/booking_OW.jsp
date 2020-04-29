<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import=" java.util.regex.Pattern"%>
<%@ page import=" java.util.Random"%>
<%@ page import=" java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/login.css">

<title>Creating Reservation...</title>
</head>
<body>



	<%
	
	//1. Get parameters from the HTML form at the index.jsp as well as the session attributes
	String flightnum = request.getParameter("flightnum");
	String passengersNum = request.getParameter("passengersNum");
	String depDate = request.getParameter("departure");
	int passengersNumber = Integer.parseInt(passengersNum);
	String u_email = (String) session.getAttribute("user_email");
	 
	//2. Checking the session attributes to create reservation for that user
	 if (u_email == null || u_email.equals("")){
		 %> 
				<!-- if error, show the alert and go back --> 
			<script> 
			    alert("Sorry, session Invalidated! Please log in Again.");
			    window.location.href = "logout.jsp";
			</script>
			<%
	 }

	try {
		//3. Databse Connection
		String url = "jdbc:mysql://localhost:3306/cs336project";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "root", "password");
		Statement stmt = con.createStatement();
		
		// 4. check if fields needed for reservation are empty (from the form)
		if( flightnum.equals("") || passengersNum.equals("")){
			System.out.println("empty detected!");
			%> 
			<!-- if error, show the alert and go back to login page --> 
			<script> 
			    alert("Sorry, but all fields must be filled to create a new account.");
			    window.location.href = "OneWayForm.jsp";
			</script>
			<%
			return;
		}
		
		//5. find number of passengers to see if theres enough seats left
		//Might wanna change the logic up here
		String select = "SELECT num_seats FROM flights WHERE flights.flight_num = '" + flightnum + "';";
		ResultSet pass = stmt.executeQuery(select);
		if (pass.next()){
			 int passengers = pass.getInt(1);
		      System.out.println("Passengers=" + passengers);
		      System.out.println("Passengers Wanted =" + passengersNumber);
		      
		      if (passengersNumber > passengers){
		    	  //error
		    	  %> 
					<!-- if error, show the alert and go back to one way --> 
					<script> 
					    alert("Sorry, there are no more seats available, failed to create your reservation");
					    window.location.href = "OneWayForm.jsp";
					</script>
					<%
		      }
		      
		      else {
		    	  //this is the value we will now update into the flight!
		    	  int passengersUpdate = passengers - passengersNumber;
		    	
		    	  //now we have to update the flight to reflect how there are less passengers
		  		String update = "UPDATE flights SET num_seats ='" + passengersUpdate + "' WHERE flights.flight_num = '" + flightnum + "';";
		  		stmt.executeUpdate(update);
		      }
			
		}
		
		else{
			%> 
			<!-- if error, show the alert and go back to one way --> 
			<script> 
			    alert("Sorry, that flight does not exist!");
			    window.location.href = "OneWayForm.jsp";
			</script>
			<%
		}
		
        //get todays date!
        java.util.Date utilDate = new Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

        System.out.println(sqlDate);
		
		//Get the price of the flight
		String selectF = "SELECT fare_first FROM flights WHERE flight_num = '" + flightnum + "';";
		ResultSet passF = stmt.executeQuery(selectF);
		passF.next();
		double fare = passF.getDouble(1);
		
		//Make an insert statement for the Reservations table:
		String insert = "INSERT INTO Reservations (res_date, res_fare, customer, num_passengers, flight_no) VALUES ('" + sqlDate + "','" + fare + "','" + u_email +  "','" + passengersNumber + "','" + flightnum + "');";
	
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		System.out.println(insert);
		//Run the update against the DB
		ps.executeUpdate();

		//Now we insert into the trips table
		String insertTrip = "INSERT INTO Trips (res_num, flights) VALUES (@@identity,'" + flightnum + "');";
		stmt.executeUpdate(insertTrip);
		
		//Update profits
		String updateCus = "UPDATE users SET profits=profits+'" + fare + "' WHERE email='" + u_email + "';";
		stmt.executeUpdate(updateCus);
		
		String updateFli = "UPDATE flights SET profits=profits+'" + fare + "', num_reserves=num_reserves+1 WHERE flight_num='" + flightnum + "';";
		stmt.executeUpdate(updateFli);
		
		System.out.println("Checkpoint 2");
		String updateAir = "UPDATE Airport A SET A.profits=A.profits+'" + fare + "' JOIN flights F ON A.Airport_id=F.depart_aid WHERE F.flight_num'" + flightnum + "';";
		System.out.println(depDate);
		

		stmt.executeUpdate(updateFli);
		//Close the connection.
		con.close();



		%>
		<script> 
		    alert("Congratulations! Your new reservation is created!");
		    
	    	window.location.href = "customerLandingPage.jsp";
		</script>
		<%
	} catch (Exception ex) {
		System.out.println("insert error");
		%> 
		<!-- if error, show the alert and go back to one way --> 
		<script> 
		    alert("Sorry, something went wrong on our server, failed to create your reservation");
		    window.location.href = "OneWayForm.jsp";
		</script>
		<%
		return;
	}
%>
</body>
</html>