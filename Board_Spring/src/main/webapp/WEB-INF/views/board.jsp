<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a{
		text-decoration: none;
		color: black;
	}
</style>
<script type="text/javascript">
	function chkAll(){
		var chk = document.getElementsByName("chk");
		var chkAll = document.getElementById("chkAll");
		for(var i=0; i<chk.length; i++){
			if(document.getElementById("chkAll").checked){
				chk[i].checked = true;
			}else{
				chk[i].checked = false;
			}
		}
	}
	function del_b(){
		var chk = document.getElementsByName("chk");
		var aa = 0;
		for(var i=0; i<chk.length; i++){
			if(chk[i].checked){
				aa = aa + "/" + chk[i].value; 
			}
		}
		if(aa==0){
			alert("Select delete contents");
		}else{
			if(confirm("Do you want to delete?")){
				document.location.href="delete?num=" + aa;
			}
		}
	}
	function up_b(){
		var chk = document.getElementsByName("chk");
		var cnt = 0;
		for(var i = 0; i < chk.length ; i++){
			if(chk[i].checked){
				var aa = chk[i].value;
				cnt++;
			}
		}
		if(cnt==0){
			alert("Select update contents")
		}else if(cnt>1){
			alert("You can select just 1 content")
		}else if(cnt==1){
			document.location.href="update?num=" + aa;
		}
	}

</script>
</head>

<body>

<h1>qprmxo's Board List</h1>

<table border="1">
	<tr>
		<th><input type="checkbox" id="chkAll" onclick="chkAll()"></th>
		<th>Num</th>
		<th>Title</th>
		<th>Content</th>
		<th>Regdate</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td><input type="checkbox" name="chk" value="${vo.num }"></td>
			<td>${vo.num }</td>
			<td><a href="detail?num=${vo.num }">${vo.title }</a></td>
			<td>${vo.content }</td>
			<td>${vo.regdate }</td>
		</tr>
	</c:forEach>
</table>

<div>
	<a href="boardList?pageNum=1">[◀◀]</a>
	<c:choose>
		<c:when test="${pu.startPageNum-5>0 }">
			<a href="boardList?pageNum=${pu.startPageNum-5 }">[◀]</a>
		</c:when>
		<c:otherwise>
			[◀]
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }">
				<a href="boardList?pageNum=${i }"><span style="color:red">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="boardList?pageNum=${i }"><span>[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${pu.endPageNum<pu.totalPageCount }">
			<a href="boardList?pageNum=${pu.endPageNum+1 }">[▶]</a>
		</c:when>
		<c:otherwise>
			[▶]
		</c:otherwise>
	</c:choose>
	<a href="boardList?pageNum=${pu.totalPageCount }">[▶▶]</a>
</div>

<a href="insert"><button type="button">Write</button></a>
<button type="button" onclick="up_b()">Update</button>
<button type="button" onclick="del_b()">Delete</button>
</body>
</html>