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
			<td>${dto.memno }번 회원</td>
		</tr>
		<tr>
			<th>SURVEY1</th>
			<td>${dto.survey1 }</td>
		</tr>
		<tr>
			<th>SURVEY2</th>
			<td>${dto.survey2 }</td>
		</tr>
		<tr>
			<th>SURVEY3</th>
			<td>${dto.survey3 }</td>
		</tr>
		<tr>
			<th>SURVEY4</th>
			<td>${dto.survey4 }</td>
		</tr>
		<tr>
			<th>SURVEY5</th>
			<td>${dto.survey5 }</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			</td>
		</tr>
	</table>
</body>
</html>