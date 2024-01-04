<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/header"/>
<div align="center">
		회원 목록
		<form>
			<table>
				<tr>
					<select class="selectBox" name="select">
			  					<option value="id" selected="selected">아이디</option>
   								<option value="tel">전화번호</option>
    				</select>
					<td><input type="text" name="search"></td>
					<td><button type="submit">검색</button></td>
				</tr>
			</table>
		</form>
	<div align="center">
		<table border=1>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>탈퇴</th>
			</tr>
			<c:forEach var="member" items="${members}">
				<tr>
					<td>${member.id }</td>					
					<td>${member.name }</td>
					<td>${member.tel }</td>
					<td><button type="button" onclick="location.href='adminDelete?id=${member.id }'" >취소</button></td>
				</tr>
			</c:forEach>
		</table>
		${result }
	</div>
</div>
<c:import url="/footer"/>
</body>
</html>