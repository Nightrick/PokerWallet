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
	</c:if>
	<c:if test="${loggedIn}">
		<a>Welcome back, ${username}!</a><br>
		<a>Current Bankroll: ${bankroll}</a><br>
		<a href="/signout">Sign Out</a>
	</c:if>
   </div>
	<h1>Login!</h1>
  <div class="topnav">
  	<a class="active" href="/">Home</a>
  	<a href="/">Bankroll Statistics</a>
  	<a href="/">Poker Stats</a>
  	<a href="/">Training Grounds</a>
  	<a href="/">Refer-a-Friend</a>
  	<a href="/">Contact Us</a>  
  </div>
</div>
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