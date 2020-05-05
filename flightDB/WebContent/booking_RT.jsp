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
	
	//1. Get parameters from the HTML form at the roundTripForm.jsp and get session attributes
	String flightnum = request.getParameter("flightnum");
	String flightnum2 = request.getParameter("flightnum2");
	String passengersNum = request.getParameter("passengersNum");
	String depDate = request.getParameter("departure");
	String retDate = request.getParameter("arrival");
	int passengersNumber = Integer.parseInt(passengersNum);
	int u_id = (Integer) session.getAttribute("user_id");
	
	System.out.println(u_id);
	//2. check if the session attributes are valid 
	 if (u_id == 0){
		 %> 
			<!-- if error, show the alert and go back --> 
			<script> 
			    alert("Sorry, session Invalidated! Please log in Again.");
			    window.location.href = "logout.jsp";
			</script>
			<%
	 }
	try {

		//3. Connect to database
		String url = "jdbc:mysql://localhost:3306/cs336project";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, "root", "password");
		Statement stmt = con.createStatement();
		
		// 4. check if the required form fields empty
		if( flightnum.equals("") || passengersNum.equals("") || flightnum2.equals("")){
			System.out.println("empty detected!");
			%> 
			<!-- if error, show the alert and go back to login page --> 
			<script> 
			    alert("Sorry, but all fields must be filled to create a new account.");
			    window.location.href = "roundTripForm.jsp";
			</script>
			<%
			return;
		}
		
		//find number of passengers to see if theres enough seats left for the first flight
		
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
			    System.out.println("first q:" + update);

		      }
			
		}
		
		//find number of passengers to see if theres enough seats left for the second flight
		
		String select2 = "SELECT num_seats FROM flights WHERE flights.flight_num = '" + flightnum2 + "';";
		ResultSet pass2 = stmt.executeQuery(select);
		System.out.println("second q:" + select2);
		if (pass2.next()){
			 int passengers2 = pass2.getInt(1);
		      System.out.println("Passengers=" + passengers2);
		      System.out.println("Passengers Wanted =" + passengersNumber);
		      
		      if (passengersNumber > passengers2){
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
		    	  int passengersUpdate = passengers2 - passengersNumber;
		    	
		    	  //now we have to update the flight to reflect how there are less passengers
		  		String update = "UPDATE flights SET num_seats ='" + passengersUpdate + "' WHERE flights.flight_num = '" + flightnum2 + "';";
		  		System.out.println("third q:" + update);
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

    
 //---------------------------- THIS IS ALL FOR THE FIRST FLIGHT ------------------------------------------
		
		//Get the price of the flight
		String selectF = "SELECT fare_first FROM flights WHERE flight_num = '" + flightnum + "';";
		ResultSet passF = stmt.executeQuery(selectF);
		passF.next();
		double fare = passF.getDouble(1);
		System.out.println("fourth q:" + selectF);
		
		//Make an insert statement for the Reservations table:
		String insert = "INSERT INTO Reservations (res_date, res_fare, customer, num_passengers, flight_no) VALUES ('" + sqlDate + "','" + fare + "','" + u_id +  "','" + passengersNumber + "','" + flightnum + "');";
	
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		//Run the update against the DB
		ps.executeUpdate();

		
		//Get reservation number
		/*
		String getRes = "SELECT res_num FROM reservations WHERE res_date='" + sqlDate + "';";
		System.out.println(getRes);
		ResultSet resNumQ = stmt.executeQuery(select);
		resNumQ.next();
		int resNum = resNumQ.getInt(1);
		System.out.println(resNum);
		*/
		
		//Now we insert into the trips table
		//String insertTrip = "INSERT INTO Trips (res_num, flights) VALUES ('" + resNum + "','" +  flightnum + "');";
		String insertTrip = "INSERT INTO Trips (res_num, flights) VALUES (@@identity,'" + flightnum + "');";
		
		stmt.executeUpdate(insertTrip);
		
		//Update profits
		String updateCus = "UPDATE users SET profits=profits+('" + fare + "'*'"+passengersNum+"')"+ " WHERE email='" + u_id + "';";
		stmt.executeUpdate(updateCus);
		
		String updateFli = "UPDATE flights SET profits=profits+('" + fare + "'*'"+passengersNum+"')"+ ", num_reserves=num_reserves+1 WHERE flight_num='" + flightnum + "';";
		stmt.executeUpdate(updateFli);
		
		System.out.println("Checkpoint 2");
		String updateAir = "UPDATE Airport SET profits=profits+('" + fare + "'*'"+passengersNum+"')"+ " JOIN flights F WHERE Airport.Airport_id = F.arrive_aid AND F.flight_num'" + flightnum + "';";
		stmt.executeUpdate(updateFli);

//---------------------------------THIS IS ALL FOR THE SECOND FLIGHT -----------------------------------------------
				//Get the price of the flight
				String selectF2 = "SELECT fare_first FROM flights WHERE flight_num = '" + flightnum2 + "';";
			
				ResultSet passF2 = stmt.executeQuery(selectF2);
				passF2.next();
				double fare2 = passF2.getDouble(1);

				//Must somehow insert into the trips table
				//String insertTrip2 = "UPDATE Trips SET flights2 = '" + flightnum2 + "' WHERE res_num = '" + resNum + "';";
				String insertTrip2 = "UPDATE Trips SET flights2 = '" + flightnum2 + "' WHERE res_num =@@identity ;";
				stmt.executeUpdate(insertTrip2); 

				//Update profits
				String updateCus2 = "UPDATE users SET profits=profits+'" + fare2 + "' WHERE email='" + u_id + "';";
				stmt.executeUpdate(updateCus2);
				

				String updateFli2 = "UPDATE flights SET profits=profits+'" + fare2 + "', num_reserves=num_reserves+1 WHERE flight_num='" + flightnum2 + "';";
				stmt.executeUpdate(updateFli2);
				String updateAir2 = "UPDATE Airport SET profits=profits+'" + fare2 + "' JOIN flights F WHERE Airport.Airport_id = F.arrive_aid AND F.flight_num'" + flightnum2 + "';";
				stmt.executeUpdate(updateFli2);
		
		
		
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
		    window.location.href = "roundTripForm.jsp";
		</script>
		<%
		return;
	}
%>
</body>
</html>