<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Corona Time</title>
</head>
<body>
<%
session.setAttribute("user_name", "");
session.setAttribute("user_email", "");
%>

<p class="app-name"> Flight Website Registration! </p>      

<div class="login-page">
  <div class="form">
    <form class="register-form" method="post" action="register.jsp">
      
      <input type="text" placeholder="name" name="user_name"/>
      
      <input type="password" placeholder="password" name="password"/>
      
      <input type="email" placeholder="email" name="email"/>
      
      <button>create</button>
      
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form>
    
    <form class="login-form" method="post" action="login.jsp">
      <input type="email" placeholder="email" name="email"/>
      <input type="password" placeholder="password" name="password"/>
      <button>login</button>
      <p class="message">Not registered? <a href="#">Create an account</a></p>
      
      <!-- have to change this file path and filename to match ours -->
      <p class="message">Manager? <a href="managerUsers/asLogin.jsp">Please log in here</a></p>
      
    </form>
     
  </div>
</div>

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript">
$(document).ready(function(){
	if (window.location.href.indexOf('signup')!=-1){
		$('.login-form').hide();
		$('.register-form').show();
	}
});

$('.message a').click(function(){
	   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
	});
</script>
</body>
</html>