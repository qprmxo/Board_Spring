<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			alert("삭제할 항목을 선택하세요.");
		}else{
			document.location.href="delete?num=" + aa;
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
			alert("수정할 항목을 선택하세요.")
		}else if(cnt>1){
			alert("한개의 항목만 선택해주세요.")
		}else if(cnt==1){
			document.location.href="update?num=" + aa;
		}
	}

</script>
</head>

<body>

<h1>qprmxo의 게시판</h1>

<table border="1">
	<tr>
		<th><input type="checkbox" id="chkAll" onclick="chkAll()"></th>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>등록일</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td><input type="checkbox" name="chk" value="${vo.num }"></td>
			<td>${vo.num }</td>
			<td>${vo.title }</td>
			<td>${vo.content }</td>
			<td>${vo.regdate }</td>
		</tr>
	</c:forEach>
</table>

<div><!-- 페이징 -->
	<c:choose>
		<c:when test="${pu.startPageNum-5>0 }">
			<a href="boardList?pageNum=${pu.startPageNum-5 }">[이전]</a>
		</c:when>
		<c:otherwise>
			[이전]
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==pu.pageNum }"><!-- 현재페이지인 경우(색상다르게 표시) -->
				<a href="boardList?pageNum=${i }"><span style="color:blue">[${i }]</span></a>
			</c:when>
			<c:otherwise>
				<a href="boardList?pageNum=${i }"><span style="color:#555">[${i }]</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${pu.endPageNum<pu.totalPageCount }">
			<a href="boardList?pageNum=${pu.endPageNum+1 }">[다음]</a>
		</c:when>
		<c:otherwise>
			[다음]
		</c:otherwise>
	</c:choose>
</div>

<a href="insert"><button type="button">글쓰기</button></a>
<button type="button" onclick="up_b()">글수정</button>
<button type="button" onclick="del_b()">글삭제</button>
</body>
</html>