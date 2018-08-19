<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function back(){
		history.back();
	}
</script>
</head>
<body>

<table border="1">
	<tr>
		<th>Num</th>
		<td>${vo.num }</td>
	</tr>
	<tr>
		<th>Title</th>
		<td>${vo.title }</td>
	</tr>
	<tr>
		<th>Content</th>
		<td>${vo.content }</td>
	</tr>
	<tr>
		<th>Regdate</th>
		<td>${vo.regdate }</td>
	</tr>
</table>

<button type="button" onclick="back()">Back</button>

</body>
</html>