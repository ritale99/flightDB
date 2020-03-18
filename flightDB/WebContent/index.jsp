<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airline Ticketing System</title>
</head>
<body>
<h1> Welcome to Airline Booking Service</h1>
      <form method="post" action="login.jsp">
         <table>
            <tr>
               <td>Username: </td>
               <td><input type="text" placeholder="Enter username" name="username" required></td>
               <td>Password: </td>
               <td><input type="password" placeholder="Enter Password" name = "password" required></td>
               <td>
                  <input type="checkbox" name="myCheck" value="checked" > I'm a customer representative<br>
               </td>
            </tr>
            <tr>
               <td style="padding:0 15px 0 15px;"> <input type="submit" value="Login" /> </td>
            </tr>
         </table>
      </form>
      <br>
      <table>
         <tr>
            <td>Need an account? <a href="register.jsp">Register</a></td>
         </tr>
      </table>


</body>
</html>