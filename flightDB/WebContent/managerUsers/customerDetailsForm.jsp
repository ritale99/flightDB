<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Corona Time</title>
</head>
<body>


<p class="app-name">Add Details for a Customer!</p>      

<div class="login-page">
  <div class="form">
    <form class="register-form" method="post" action="insertionDetails.jsp">
      
      <input type="email" placeholder="email" name="email"/>
      
      <button>create</button>
      
    </form>
    
    <form class="login-form" method="post" action="managerInsertionsCustomer.jsp">
    
      <input type="email" placeholder="Customer Email" name="email"/>	
      <input type="phone" placeholder="+_ ___-___-___" name="phone"/>
      
      <button>Submit</button>

      
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