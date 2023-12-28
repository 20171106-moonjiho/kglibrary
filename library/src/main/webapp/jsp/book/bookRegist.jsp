<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />

<div align="center">
	<h1>도서 등록</h1>
	<table >
	<tr><td>
		<font color="red">${msg}</font>
	</td></tr>
	<tr><td>
	<form action="registProc" method="post" id="f">
		<input type="text" name="category" placeholder="카테고리" id="category"> (*필수 항목) <br>
		<input type="text" name="title_info" placeholder="제목" id="title_info"><br>
		<input type="text" name="author_info" placeholder="저작자" id="author_info">
		<label id="label" ></label><br>
		<input type="text" name="pub_info" placeholder="발행자" id="pub_info"  >
		
		<input type="text" name = "pub_year_info" id="pub_year_info" placeholder="발행연도">
		<input type="text" name = "reg_date" id="reg_date" placeholder="비치일"><br>
		<input type="text" name = donation id="donation" placeholder="기증자"><br>

		<input type="button" value="회원가입" onclick="allCheck()">
		<input type="button" value="취소" onclick="location.href='index'"><br>
	</form>
	</td></tr></table>
</div>

<c:import url="/footer" />












