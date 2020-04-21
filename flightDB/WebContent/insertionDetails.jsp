<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/login.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Title</title>
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
			if (con !=null){System.out.println("we connected !!");}
			//Create a SQL statement
			Statement stmt = con.createStatement();
		
			
			//Get parameters from the HTML form at the editCustomerDetails.jsp
		     String phone = request.getParameter("phone");
		     String u_email = (String) session.getAttribute("user_email");
			 System.out.println("Email ISvg:" + u_email);
			 System.out.println(phone);
		   
		    //This if statement checks if the fields are left blank
			if (phone.equals("")){
				%>
				<script> 
				    alert("Please enter your phone number");
				    window.location.href = "editCustomerDetails.jsp";
				</script>
				<% 
			} else {
				
				//have to change this sql!!!
				String str = "UPDATE users SET users.phone = '" + phone + "'WHERE users.email = '" + u_email + "';";
				System.out.println("Works up to checkpoint:6 ");
				
				//Run the query against the database.
				stmt.executeUpdate(str);
	
				//should we check if value was inserted??
						
				
			}
		    
			%>
			<script> 
		    	alert("Phone Number Added! Returning to Home Page...");
		    	window.location.href = "customerLandingPage.jsp";
			</script>
			<%	
			
			
			con.close();
			
			
		} catch (Exception e) {
			System.out.println("Update Error ");
			%>
			<script> 
		    	alert("Sorry, unexcepted error happened.");
		    	window.location.href = "logout.jsp";
			</script>
			<%			
		}
	%>

</body>
</html>