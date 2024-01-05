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

<div align="center"style="margin-top: 100px; margin-bottom: 50px;">
	<h1>도서 등록</h1>
	<table >
	<tr><td>
		<font color="red">${msg}</font>
	</td></tr>
		<form action="bookRegistProc" method="post" enctype="multipart/form-data" id="f">
	<tr><td>

	<!-- 	<input type="text" name="category" placeholder="카테고리" id="category"> -->
		<select class="selectBox" name="category" id="category">
		    <option value="소설" selected="selected">소설</option>
   			<option value="만화">만화</option>
   			<option value="시,에세이">시,에세이</option>
   			<option value="인문학">인문학</option>
   			<option value="자기계발">자기계발</option>
   			<option value="과학">과학</option>
   			<option value="요리">요리</option>
    		<option value="컴퓨터IT">컴퓨터IT</option>
    		<option value="역사,문화">역사,문화</option>
    	</select>
		
		<input type="text" name="title_info" placeholder="제목" id="title_info"><br><br>
		<input type="text" name="author_info" placeholder="저작자" id="author_info">
		<input type="text" name="pub_info" placeholder="발행자" id="pub_info"  ><br><br>
		
		<input type="text" name = "pub_year_info" id="pub_year_info" placeholder="발행연도">
		<input type="text" name = "book_count" id="book_count" placeholder="책 갯수"><br>	
		<input type="text" name = donation id="donation" placeholder="기증자"><br>
		<tr>
				<th>내용</th>
				<td>
					<textarea style="width: 100%; margin-left: 10px;" rows="10" cols="30" name="detail_link"></textarea>
				</td>
			</tr>
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












