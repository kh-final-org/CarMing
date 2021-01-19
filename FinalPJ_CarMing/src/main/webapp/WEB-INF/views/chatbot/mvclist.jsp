<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!-- core 태그 추가! -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>list</h1>
	
	<table border="1">
		<colgroup>
			<col width="50" />
			<col width="100" />
			<col width="300" />
			<col width="100" />
		</colgroup>
		<tr>
			<th>MEMNO</th>
			<th>SURVEY1</th>
			<th>SURVEY2</th>
			<th>SURVEY3</th>
			<th>SURVEY4</th>
			<th>SURVEY5</th>		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="4" align="center"> ----작성된 글이 없습니다 ----</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto" >
					<tr>
						<td>${dto.memno }</td>
						<td>${dto.survey1 }</td>
						<td>${dto.survey2 }</td>
						<td>${dto.survey3 }</td>
						<td>${dto.survey4 }</td>
						<td>${dto.survey5 }</td>
					</tr>
				</c:forEach>				
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="right" >	
<!-- 				<input type="button" value="글 작성" onclick="location.href='insertform.do'"> -->
			</td>
		</tr>
	</table>
	
	
	
	
	
	
	
	
	
	
</body>
</html>