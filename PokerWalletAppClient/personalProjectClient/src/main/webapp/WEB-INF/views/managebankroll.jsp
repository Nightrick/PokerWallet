<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Bankroll</title>
<link rel="stylesheet" href = "/style.css" />
</head>
<body>
    
<div class="header">    
  <div class="loginButtons">
	<c:if test="${not loggedIn}">
		<div class="loginButtons">
			<a href="/login">Login</a>
  			<a href="/signup">Sign Up</a>
		</div>
		<h1 style="text-align: center"> Bankroll Management!</h1> 
  		</div>
	</c:if>
	<c:if test="${loggedIn}">
		<a>Welcome back, ${username}!</a><br>
		<a>Current Bankroll: ${bankroll}</a><br>
		<form action="/signout" method="POST" class="signout">
			<input type="hidden" name="username" value="${username}" /> 
			<input type="hidden" name="loggedIn" value="${loggedIn}" />
			<button type="submit">Sign Out</button>
		</form>
		<h1 style="text-align: center"> Bankroll Management!</h1>
	</c:if>
   </div>
</div>
	<c:if test="${not loggedIn}">
		<div class="form-inline">
  			<form action="/" method="POST">
  				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<button type="submit">Home</button>
			</form>
			<form action="/howtouse" method="POST">
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<button type="submit">How to Use</button>
			</form>
  			<form action="/managebankroll" method="POST"> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<button type="submit">Manage Bankroll</button>
			</form>
  			<form action="/bankrollstats" method="POST"> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<button type="submit">Bankroll Stats</button>
			</form>
  			<form action="/pokerstats" method="POST"> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<button type="submit">Poker Stats</button>
			</form>
  			<form action="/contactus" method="POST"> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<button type="submit">Contact Us</button>
			</form>  
  		</div>
  		<h3 style="text-align: center">Please sign in to manage your bankroll!</h3>
	</c:if>
	<c:if test="${loggedIn}">
		<div class="form-inline">
  			<form action="/" method="POST">
				<input type="hidden" name="username" value="${username}" /> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<input type="hidden" name="bankroll" value="${bankroll}" />
				<button type="submit">Home</button>
			</form>
			<form action="/howtouse" method="POST">
				<input type="hidden" name="username" value="${username}" /> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<input type="hidden" name="bankroll" value="${bankroll}" />
				<button type="submit">How to Use</button>
			</form>
  			<form action="/managebankroll" method="POST">
				<input type="hidden" name="username" value="${username}" /> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<input type="hidden" name="bankroll" value="${bankroll}" />
				<button type="submit">Manage Bankroll</button>
			</form>
  			<form action="/bankrollstats" method="POST">
				<input type="hidden" name="username" value="${username}" /> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<input type="hidden" name="bankroll" value="${bankroll}" />
				<button type="submit">Bankroll Stats</button>
			</form>
  			<form action="/pokerstats" method="POST">
				<input type="hidden" name="username" value="${username}" /> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<input type="hidden" name="bankroll" value="${bankroll}" />
				<button type="submit">Poker Stats</button>
			</form>
  			<form action="/contactus" method="POST">
				<input type="hidden" name="username" value="${username}" /> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<input type="hidden" name="bankroll" value="${bankroll}" />
				<button type="submit">Contact Us</button>
			</form>  
  		</div>
  		<h3 style="text-align: center">${message}</h3>
	</c:if>

<c:if test="${not loggedIn}"> 
	
</c:if>
<c:if test="${loggedIn}">
	<h4 style="text-align: center">Your current bankroll is: ${bankroll}.</h4>
	<form action="/managebankrollconfirmation" method="POST" class="bankrollform">
		<input type="hidden" name="username" value="${username}" /> 
		<input type="hidden" name="loggedIn" value="${loggedIn}" />
		<input type="hidden" name="bankroll" value="${bankroll}" />
	<div class="bankrollform"> 
		<label for="bankrolladdition">Add to Base Bankroll: $</label>
		<input type="number" step="0.01" id="toppings" name="bankrolladdition" min="0" max="1000000000" value=0.00>
	</div><br>
	<div class="bankrollform"> 
		<label for="bankrollwithdrawal">Subtract from Base Bankroll: $</label>
		<input type="number" step="0.01" id="toppings" name="bankrollwithdrawal" min="0" max="1000000000" value=0.00>
	</div><br>
	<div class="bankrollform"> 
		<label for="winnings">Add Winnings to Current Bankroll: $</label>
		<input type="number" step="0.01" id="toppings" name="winnings" min="0" max="1000000000" value=0.00>
	</div><br>
	<div class="bankrollform"> 
		<label for="loses">Subtract Loses from Current Bankroll: $</label>
		<input type="number" step="0.01" id="toppings" name="loses" min="0" max="1000000000" value=0.00>
	</div><br>
	<button type="submit">Update Bankroll</button>
  	</form>
  	<br>
  	<h3 style="text-align: center">If you'd like to start over, you can reset your bankroll and net profit to $0.00.</h3>
  	<form action="/resetbankrollconfirmation" method="POST" class="bankrollform">
		<input type="hidden" name="username" value="${username}" /> 
		<input type="hidden" name="loggedIn" value="${loggedIn}" />
		<input type="hidden" name="bankroll" value="${bankroll}" />
		<button type="submit">Reset Bankroll</button>
  	</form>
</c:if>



</body>
</html>