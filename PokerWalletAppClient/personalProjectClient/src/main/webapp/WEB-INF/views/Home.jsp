<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

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
	
</body>
</html>