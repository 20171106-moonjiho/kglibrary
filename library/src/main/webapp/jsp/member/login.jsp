<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<script src="member.js"></script>
<div align="center">
	<h1>로그인</h1>
	<table >
	<tr><td>
		<font color="red" >${msg }</font>
	</td></tr>
	<tr><td>
	<form action="loginProc" method="post" id="f">
		<input type="text" name="id" placeholder="아이디" id="id"><br>
		<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
		<input type="button" value="로그인" onclick="loginCheck()">
		<input type="button" value="취소" onclick="location.href='index'"><br>	
	</form>
	</td></tr>
	<!-- 
		카카오 이미지 링크
		https://developers.kakao.com/tool/demo/login/login?method=dynamic
	 -->
	<tr><td>
		<a href="https://kauth.kakao.com/oauth/authorize?response_type=code
		&client_id=d3a13977a0273b816e425220da2d6622
		&redirect_uri=http://localhost/kakaoLogin">
			<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" />
		</a>
	</td></tr>
	</table>
</div>
<c:import url="/footer" />