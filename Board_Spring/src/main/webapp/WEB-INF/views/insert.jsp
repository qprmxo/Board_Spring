<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		var title = document.getElementById("title");
		var content = document.getElementById("content");
		
		if(title == null || title == ""){
			alert("You need to write Title!");
			return false;
		}
		if(content == null || content == ""){
			alert("You need to write Content!");
			return false;
		}
		
		document.getElementById("frm").submit();
	}
	
	function back(){
		history.back();
	}
</script>
</head>
<body>

<h1>Write now</h1>

<form action="insert" method="post" id="frm">
	<table>
		<tr>
			<th>Title</th><td><input type="text" name="title" id="title"></td>
		</tr>
		<tr>
			<th>Content</th><td><input type="text" name="content" id="content"></td>
		</tr>
	</table>
	<button type="button" onclick="check()">Confirm</button>
	<button type="reset">Reset</button>
	<button type="button" onclick="back()">Back</button>
</form>

</body>
</html>