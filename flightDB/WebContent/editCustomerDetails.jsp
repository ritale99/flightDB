<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Details</title>
</head>
<body>


<p class="app-name">Update your details</p>      


<div class="login-page">
    <form class="register-form" method="post" action="insertionDetails.jsp">
      
      <pre>
      <label>Update your name: </label>
      <input type="text" placeholder="name" name="new_name"/>
      
      
      
      <label>Update your email:</label>
      <input type="email" placeholder="email" name="new_email"/>
      
      
      
      <label>Update your Phone-number: </label>
      <label>+</label><input type="phone" placeholder="" name="new_phone"/>
      
      
      <label>Update your credit-card number</label>
      <input type="password" name ="new_credit_card"/>
      <label>Input your CVV</label>
      <input type="password" name = "new_cvv"/>
      
      <button class="buttonSubmit">Update</button>
      </pre>
      
    </form>
     
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