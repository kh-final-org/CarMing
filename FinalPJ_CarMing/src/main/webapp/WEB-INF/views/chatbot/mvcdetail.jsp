<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table board="1">
		<tr>
			<th>WRITER</th>
			<td>${dto.memno }</td>
		</tr>
		<tr>
			<th>SURVEY1</th>
			<td>${dto.survey1 }</td>
		</tr>
		<tr>
			<th>SURVEY2</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.survey2 }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			</td>
		</tr>
	</table>
</body>
</html>