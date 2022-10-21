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
  <div class="loginButtons">
	<c:if test="${not loggedIn}">
		<div class="loginButtons">
			<a href="/login">Login</a>
  			<a href="/signup">Sign Up</a>
		</div>
		<h1 style="text-align: center"> Bankroll Management!</h1>
		<div class="topnav" style="text-align: center">
  			<a href="/">Home</a>
  			<a href="/">Bankroll Statistics</a>
  			<a href="/">Poker Stats</a>
  			<a class="active" href="/managebankroll">Manage Bankroll</a>
  			<a href="/">Refer-a-Friend</a>
  			<a href="/">Contact Us</a>  
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
		<div class="topnav" style="text-align: center">
  			<a href="/">Home</a>
  			<a href="/">Bankroll Statistics</a>
  			<a href="/">Poker Stats</a>
  			<a class="active" href="/managebankroll">Manage Bankroll</a>
  			<a href="/">Refer-a-Friend</a>
  			<a href="/">Contact Us</a>  
  		</div>
	</c:if>
   </div>
</div>

<c:if test="${not loggedIn}"> 
	<h3 style="text-align: center">Please sign in to manage your bankroll!</h3>
</c:if>
<c:if test="${loggedIn}">
		
</c:if>



</body>
</html>