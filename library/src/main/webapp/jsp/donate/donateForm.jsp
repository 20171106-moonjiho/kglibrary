<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 기증</title>
</head>
<body>
	<c:import url="/header" />

	<div>
		<h1>도서 기증</h1>
	</div>
	<div>
		<form>
			<table>
				<tr>
					<td><input type="text" placeholder="기증자를 입력하세요."
						name="search" maxlength="200"></td>
					<td><button type="submit">검색</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div align="center">
		<table border=1>
			<tr>
				<th>번호</th>
				<th>기증자</th>
				<th>날짜</th>
				<!-- <th>상태</th> -->
			</tr>
			<c:forEach var="board" items="${donate}">
				<tr>
					<td>${board.no }</td>					
					<td>${board.id }</td>
					<td>${board.reg_date }</td>
					<%-- <td>${donate.status }</td> --%>
				</tr>
			</c:forEach>
		</table>
		${result }
	</div>
</body>
</html>