<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<c:choose>
	<c:when test="${sessionScope.id == null }">
		<form action="login" method="post">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="text" name="pwd"></td>
				</tr>
			</table>
			<button type="submit">Login</button>
			<button type="reset">Reset</button>
		</form>
	</c:when>
	<c:otherwise>
		<a href="boardList">Board List</a>
		<a href="">Logout</a>
	</c:otherwise>
</c:choose>
	
</body>
</html>
