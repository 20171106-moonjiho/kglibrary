<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<c:import url="/bookheader"/>
<script>

function bookHopeCheck(){
	let category = document.getElementById('category');
	let title_info = document.getElementById('title_info');
	let author_info = document.getElementById('author_info');

	
	
	if(category.value == ""){
		alert('카테고리는 필수 항목입니다.');
	}else if(title_info.value == ""){
		alert('제목은 필수 항목입니다.');
	}else if(author_info.value == ""){
		alert('저작자는 필수 항목입니다.');
	}else{
		var f = document.getElementById('f');
		f.submit();
	}
}

</script>

<div id="contents">
	<div id="print_wrap">
		<div id="cont_head">
			<h2>비치희망도서</h2>
			<!-- 현재위치 -->
			<div id="location">
				<ul>
					<li>홈</li>
					<li>도서자료검색</li>
					<li class="now">비치희망도서신청</li>
				</ul>
			</div>
			<!-- //현재위치 -->
		</div>

<div align="center"style="margin-top: 100px; margin-bottom: 50px;">
	<h1>비치 희망 도서 신청 등록</h1>
	<table >
	<tr><td>
		<font color="red">${msg}</font>
	</td></tr>
		<form action="bookHopeRegistProc" method="post" id="f">
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
    		<option value="기타">기타</option>
    	</select>
		
		<input type="text" name="title_info" placeholder="도서제목" id="title_info"><br><br>
		<input type="text" name="author_info" placeholder="저작자" id="author_info">
		<input type="text" name="pub_info" placeholder="발행자" id="pub_info"  ><br><br>
		
		<input type="text" name = "pub_year_info" id="pub_year_info" placeholder="발행연도">
		<tr>
				<th>신청 이유</th>
				<td>
					<textarea style="width: 100%; margin-left: 10px;" rows="10" cols="30" name="reason"></textarea>
				</td>
			</tr>
		</td>
		<td>
		<input type="button" value="신청 등록" onclick="bookHopeCheck()">
		<input type="button" value="취소" onclick="location.href='bookHopeForm'"><br>	
		</td></tr>
	</form>
	</table>
</div>


			</div>
		</div>

	</div>
</div>
<c:import url="/bookfooter" />
<c:import url="/footer" />












