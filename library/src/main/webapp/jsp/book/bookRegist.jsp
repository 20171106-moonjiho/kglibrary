<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />

<script>

function bookCheck(){
	let category = document.getElementById('category');
	let title_info = document.getElementById('title_info');
	let author_info = document.getElementById('author_info');
	let book_count = document.getElementById('book_count');
	
	
	if(category.value == ""){
		alert('카테고리는 필수 항목입니다.');
	}else if(title_info.value == ""){
		alert('제목은 필수 항목입니다.');
	}else if(author_info.value == ""){
		alert('저작자는 필수 항목입니다.');
	}else if(book_count.value == ""){
		alert('도서의 갯수는 필수 항목입니다.');
	}else{
		var f = document.getElementById('f');
		f.submit();
	}
}

</script>

<div align="center">
	<h1>도서 등록</h1>
	<table >
	<tr><td>
		<font color="red">${msg}</font>
	</td></tr>
		<form action="bookRegistProc" method="post" enctype="multipart/form-data" id="f">
	<tr><td>

		<input type="text" name="category" placeholder="카테고리" id="category">
		<input type="text" name="title_info" placeholder="제목" id="title_info"><br><br>
		<input type="text" name="author_info" placeholder="저작자" id="author_info">
		<input type="text" name="pub_info" placeholder="발행자" id="pub_info"  ><br><br>
		
		<input type="text" name = "pub_year_info" id="pub_year_info" placeholder="발행연도">
		<input type="text" name = "book_count" id="book_count" placeholder="책 갯수"><br>	
		<input type="text" name = donation id="donation" placeholder="기증자"><br>
		</td>
					<th>파일첨부</th> <br>	
		<td><input type="file" name="upfile"></td>
		<td>
		<input type="button" value="도서 등록" onclick="bookCheck()">
		<input type="button" value="취소" onclick="location.href='index'"><br>	
		</td></tr>
	</form>
	</table>
</div>

<c:import url="/footer" />












