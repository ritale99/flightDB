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
	
	//Get parameters from the HTML form at the index.jsp
	String flightnum = request.getParameter("flightnum");
	String passengersNum = request.getParameter("passengersNum");
	int passengersNumber = Integer.parseInt(passengersNum);
	String u_email = (String) session.getAttribute("user_email");
	 System.out.println("Email ISvg:" + u_email);
	try {

		//Create a connection string
		String url = "jdbc:mysql://localhost:3306/cs336project";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");

		//Create a connection to your DB
		Connection con = DriverManager.getConnection(url, "root", "password");
		
				if (con !=null){System.out.println("we connected !!");}

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		// 1. check empty
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
		
		//find number of passengers to see if theres enough seats left
		
		String select = "SELECT num_seats FROM flights WHERE flights.flight_num = '" + flightnum + "'";
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
	
		//generate random reservation number
		Random rand = new Random();
        int reservationNum = rand.nextInt(1000);
        
        //get todays date!
        java.util.Date utilDate = new Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

         System.out.println(u_email);
         System.out.println(sqlDate);
		
		//HAVE TO CHANGE THE SQL BELOW
		
		//Make an insert statement for the Reservations table:
		String insert = "INSERT INTO Reservations VALUES ('" + reservationNum + "','" + sqlDate + "','" + u_email +  "','" + passengersNumber + "');";
	
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		System.out.println(insert);
		//Run the update against the DB
		ps.executeUpdate();

		//Now we insert into the trips table
		String insertTrip = "INSERT INTO Trips VALUES ('" + reservationNum + "','" +  flightnum + "');";
		stmt.executeUpdate(insertTrip);
		
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