<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Details</title>
</head>
<body>


<p class="app-name">Find Reservations by Flight Number or Customer Name!</p>      


<div class="login-page">
<div class="form">
     <form class="login-form" method="post" action="reservationsResults.jsp">
      
     	<label>Enter Customers Name:</label>
      <input type="text" placeholder="name" name="name"/>
     	
     	<label>Or Enter flight ID:</label>
      <input type="text" placeholder="flight-id" name="flightID"/>
      
      
      
    
      
      <button class="buttonSubmit">Search</button>
      </pre>
      <a href="managerLandingPage.jsp">Want to go back?</a>
    </form>
     
</div>


</body>
</html>