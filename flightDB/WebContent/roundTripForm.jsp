<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Search for Flights!</title>
	</head>
	<body>
		<br>
		<h3>What type of flight?</h3>
			<form method="get" action="roundTripFlightResults.jsp" enctype=text/plain>	
		
		<table>
				<tr>
					<!-- textbox for flight search -->
					<tr>
						<td>Departing Airport</td>
						</tr>
						<tr><td>
							<select type="text" name="depport" placeholder="Enter 3 letter Airport ID">
							<option> Select </option>
							<option>EWR</option>
							<option>JFK</option>
							<option>MIA</option>
							<option>SFO</option>
							<option>MDW</option>
							<option>LAX</option>
							<option>ATL</option>
							<option>ORD</option>
							<option>DFW</option>
							<option>DEN</option>
							<option>SEA</option>
							<option>LAS</option>
							<option>MCO</option>
							<option>CLT</option>
							<option>PHX</option>
							<option>IAH</option>
							<option>BOS</option>
							<option>MSP</option>
							<option>FLL</option>
							<option>DTW</option>
							<option>PHL</option>
							<option>DTW</option>
							<option>LGA</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Arriving Airport</td>
						</tr>
						<tr><td>
							<select type="text" name="arrivport" placeholder="Enter 3 letter Airport ID">
							<option> Select </option>
							<option>EWR</option>
							<option>JFK</option>
							<option>MIA</option>
							<option>SFO</option>
							<option>MDW</option>
							<option>LAX</option>
							<option>ATL</option>
							<option>ORD</option>
							<option>DFW</option>
							<option>DEN</option>
							<option>SEA</option>
							<option>LAS</option>
							<option>MCO</option>
							<option>CLT</option>
							<option>PHX</option>
							<option>IAH</option>
							<option>BOS</option>
							<option>MSP</option>
							<option>FLL</option>
							<option>DTW</option>
							<option>PHL</option>
							<option>DTW</option>
							<option>LGA</option>
							</select>
						</td>
					</tr>
					<td>Take off date</td>
						</tr>
							<tr>
								
						<td>
								<input type="text" name="take_off_date" placeholder="YEAR-MM-DD"> To:
					 			<input type= "text" name= "take_off_date_2" placeholder="YEAR-MM-DD"> 
							</td> 
						</tr>
						<br>
					<tr>
						 <td> Arrive date </td>
						</tr>
					<tr> 
						
						<td>
							<input type="text" name="arrive_date" placeholder= "YEAR-MM-DD"> To:
							<input type="text" name="arrive_date_2" placeholder ="YEAR-MM-DD">
						</td>
						<br>
					<tr>
						
						
						
											
					
				</table>
				
		<input type = 'submit' name="submit" value = "submit"> 	
			
			</form>
		
		<br>
		<a href="success.jsp">Want to go back?</a>
		
	</body>
</html>