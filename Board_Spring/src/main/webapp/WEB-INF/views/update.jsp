<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="update" method="post">
	<table>
		<tr>
			<th>글번호</th><td><input type="text" readonly="readonly" name="num" value="${vo.num }"></td>
		</tr>
		<tr>
			<th>제목</th><td><input type="text" name="title" value="${vo.title }"></td>
		</tr>
		<tr>
			<th>내용</th><td><input type="text" name="content" value="${vo.content }"></td>
		</tr>
	</table>
	<button type="submit">확인</button>
	<button type="reset">다시입력</button>
</form>

</body>
</html>