<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Bankroll Confirmation</title>
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
		<h1 style="text-align: center"> A Fresh Start!</h1> 
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
		<h1 style="text-align: center"> A Fresh Start!</h1>
	</c:if>
   </div>
</div>
	<c:if test="${not loggedIn}">
		<div class="form-inline">
  			<form action="/" method="POST">
				<button type="submit">Home</button>
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
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
  		<h3 style="text-align: center">Please sign in to reset your bankroll!</h3>
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
  	</c:if>
<h3 style="text-align: center">Are you sure you wish to proceed? This will erase your stats and set your bankroll and net profit back to $0.00.</h3>  	
<form action="/resetbankroll" method="POST" class="bankrollform">
		<input type="hidden" name="username" value="${username}" /> 
		<input type="hidden" name="loggedIn" value="${loggedIn}" />
		<button type="submit">Yes, reset my bankroll.</button>
</form>
<br>
<form action="/managebankroll" method="POST" class="bankrollform">
		<input type="hidden" name="username" value="${username}" /> 
		<input type="hidden" name="loggedIn" value="${loggedIn}" />
		<button type="submit">No, take me back.</button>
</form>
</body>
</html>