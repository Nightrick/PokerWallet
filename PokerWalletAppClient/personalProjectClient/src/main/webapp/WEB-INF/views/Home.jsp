<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PokerWallet.com</title>
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
	<h1> Welcome to PokerWallet!</h1>
  <div class="topnav">
  	<a class="active" href="/">Home</a>
  	<a href="/">Bankroll Statistics</a>
  	<a href="/">Poker Stats</a>
  	<a href="/">Training Grounds</a>
  	<a href="/">Refer-a-Friend</a>
  	<a href="/">Contact Us</a>  
  </div>
</div>
<!--  
<div>
	<table id="userList">
		<tr>
			<th>Username</th>
			<th>Bankroll</th>
			<th>Net-Profit</th>
		</tr>
	<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.username}</td>
				<td>${user.bankroll}</td>
				<td>${user.netProfit}</td>
				<td>
				</td>
			</tr>
	</c:forEach>
	</table>
</div>
-->
</body>
</html>