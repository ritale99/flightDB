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
		     String newPhone = request.getParameter("new_phone");
			 String newName = request.getParameter("new_name");
			 String newEmail = request.getParameter("new_email");
			 String newCC = request.getParameter("new_credit_card");
			 String newCVV = request.getParameter("new_cvv");
		     String u_email = request.getParameter("user_email");
			 System.out.println("Email IS:" + u_email);
			 System.out.println("New Name is:" + newName);
			 System.out.println("New Email is:" + newEmail);
			 System.out.println("New Phone is:" + newPhone);
			 System.out.println("Email IS here:" + u_email);
			 
		   
		    //This if statement checks if the fields are left blank
			if (!newPhone.equals("")){
				//have to change this sql!!!
				String str = "UPDATE users SET users.phone = '" + newPhone + "'WHERE users.email = '" + u_email + "';";
				System.out.println("Works up to checkpoint:6 ");
				
				//Run the query against the database.
				stmt.executeUpdate(str);
	
				//should we check if value was inserted??
						
				
			}
			if (!newName.equals("")){
				//have to change this sql!!!
				String str = "UPDATE users SET users.user_name = '" + newName + "'WHERE users.email = '" + u_email + "';";
				System.out.println("Works up to checkpoint:6 ");
				
				//Run the query against the database.
				stmt.executeUpdate(str);
	
				//should we check if value was inserted??
						
				
			}
			if (!newEmail.equals("")){
				//have to change this sql!!!
				String str = "UPDATE users SET users.email = '" + newEmail + "'WHERE users.email = '" + u_email + "';";
				System.out.println("Works up to checkpoint:6 ");
				
				//Run the query against the database.
				stmt.executeUpdate(str);
	
				//For this specific case, we need to update session email as well
				//session.setAttribute("user_email", newEmail); 
				//should we check if value was inserted??
						
				
			}
			if (!newCC.equals("")){
				if(!newCVV.equals("")){
				//have to change this sql!!!
				String str = "UPDATE users SET users.credit_card = '" + newCC + "'WHERE users.email = '" + u_email + "';";
				String str2 = "UPDATE users SET users.credit_cvv = '" + newCVV + "'WHERE users.email = '" + u_email + "';";
				System.out.println("Works up to checkpoint:6 ");
				
				//Run the query against the database.
				stmt.executeUpdate(str);
				stmt.executeUpdate(str2);
				//should we check if value was inserted??
						
				}else{
					%>
					<script>
						alert("You need to enter a CVV");
						window.location.href = "editCustomerDetails.jsp";
					</script>
					<%
				}
			}
			%>
			<script> 
		    	alert("User information has been successfully updated!\nReturning to Home Page...");
		    	window.location.href = "managerLandingPage.jsp";
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