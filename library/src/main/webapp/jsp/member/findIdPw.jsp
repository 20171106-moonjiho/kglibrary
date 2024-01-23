<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/jsp/default/favicon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<link href="book.css" rel="stylesheet">
<body>
	<c:import url="/header" />
	<c:import url="/userHeader2" />
	<script src="member.js"></script>
	<div id="cont_head">
		<h2>아이디/비밀번호 찾기</h2>
		<!-- 현재위치 -->
		<div id="location">
			<ul>
				<li>홈</li>
				<li>사이트이용</li>
				<li class="now">아이디/비밀번호 찾기</li>
			</ul>
		</div>
		<!-- //현재위치 -->
	</div>
<div id="cont_wrap">
	<div align="center">
	<table>
	<tr><td>
		<font color="red" >${msg }</font>
	</td></tr>
	<tr><td align="center">
	<div class="card-write" align="center">
		<a href="findId">아이디 찾기</a>
		<a href="findPw">비밀번호 찾기</a>
	</div>
	</td></tr>
			</table>
		</div>
	</div>
	<c:import url="/userFooter" />
	<c:import url="/footer" />
</body>
</html>