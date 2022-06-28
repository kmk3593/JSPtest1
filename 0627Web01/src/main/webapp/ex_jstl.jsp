<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int num = 30;
%>
	<%
	// 자바영역에 있는 배열에 특정한 숫자가 있으면 화면에 있다고 표시.
	// 없으면 없다고 표시
	int [] numArr = {3,6,9,12,15,18,21,24,27,30};
	int count=0;
	int find=6;
	for(int i=0; i<numArr.length; i++){
		if(numArr[i]==find){
			count++;
		}
	}
	if(count>0)
		out.println("\n"+find+"는 numArr에 들어있다");
	%>
	<c:set var="target" value="6"></c:set>
	<c:set var="numArr" value="{3,6,9,12,15,18,21,24,27,30}"></c:set>
	<br><br>
	<c:forEach var="item" items="${numArr}">
		<c:if test="${item==target}"> 
			<c:out value = "일치"></c:out>
		</c:if>
		<c:if test="${item!=target}">
			<c:out value = "불일치"></c:out>
		</c:if>
	</c:forEach>
</body>
</html>