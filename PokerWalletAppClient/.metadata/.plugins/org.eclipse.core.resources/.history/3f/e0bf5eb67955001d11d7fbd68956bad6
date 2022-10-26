<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href = "/style.css" />
</head>
<body>
<div class="header">    
   <h1>Login!</h1>
</div>
	<c:if test="${not loggedIn}">
		<div class="form-inline">
  			<form action="/" method="POST">
				<button type="submit">Home</button>
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
  			<form action="/referafriend" method="POST"> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<button type="submit">Refer a Friend</button>
			</form>
  			<form action="/contactus" method="POST"> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<button type="submit">Contact Us</button>
			</form>  
  		</div>
	</c:if>
	
	<c:if test="${loggedIn}">
		<div class="form-inline">
  			<form action="/" method="POST">
				<input type="hidden" name="username" value="${username}" /> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<input type="hidden" name="bankroll" value="${bankroll}" />
				<button type="submit">Home</button>
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
  			<form action="/referafriend" method="POST">
				<input type="hidden" name="username" value="${username}" /> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<input type="hidden" name="bankroll" value="${bankroll}" />
				<button type="submit">Refer a Friend</button>
			</form>
  			<form action="/contactus" method="POST">
				<input type="hidden" name="username" value="${username}" /> 
				<input type="hidden" name="loggedIn" value="${loggedIn}" />
				<input type="hidden" name="bankroll" value="${bankroll}" />
				<button type="submit">Contact Us</button>
			</form>  
  		</div>>
	</c:if>
<div class="login">
	<h1>User Login</h1>
	<h3>${message}</h3>
	<form action="/login" method="POST">
		Username: <input type="text" name="username"/>
		Password: <input type="password" name="password"/>
		<input type="submit"/>
	</form>
</div>
</body>
</html>