<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />
<c:import url="/bookheader" />
<style>
.card {
	width: 800px;
	margin: 0 auto;
}

.selectBox {
	position: relative;
	text-align: center;
	width: 100px;
	height: 35px;
	border-radius: 10px;
	border: 1px solid #999;
}

.card-header1 h1 {
	font-size: 30px;
	font-weight: 600;
}

.card-write {
	padding: 20px;
}

.card-write input, texarea {
	margin-left: 10px;
	padding: 10px;
	border: 1px solid #999;
	border-radius: 10px;
	box-shadow: 3px 3px 10px #e6e6e6;
}

.card-write .subject_title {
	font-size: 13px;
	font-family: 600;
	margin-right: 10px;
}

.card-write .myinfo input[type="text"] {
	width: 25%;
}

.card-write .title-w input[type="text"] {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 85.5%
}

.card-write .area {
	margin-top: 20px;
	margin-bottom: 20px;
}

.card-write .msg {
	margin-top: 20px;
}

.card-write .msg textarea {
	min-width: 90.5%;
	max-width: 90.5%;
	min-height: 200px;
	max-height: 200px;
	box-shadow: inset 3px 3px 10px #e6e6e6;
	vertical-align: top;
}

.card-write input[type="file"] {
	border: none;
	box-shadow: none;
	padding: 10px;
}

.submit_button {
	width: 80px;
	height: 30px;
	font-weight: 900;
	color: white;
	text-align: center;
	background: linear-gradient(to bottom, grey, black);
	border: solid 2px white;
	border-radius: 5px;
}
</style>

<script>
	function bookCheck() {
		let category = document.getElementById('category');
		let title_info = document.getElementById('title_info');
		let author_info = document.getElementById('author_info');
		let book_count = document.getElementById('book_count');

		if (category.value == "") {
			alert('카테고리는 필수 항목입니다.');
		} else if (title_info.value == "") {
			alert('제목은 필수 항목입니다.');
		} else if (author_info.value == "") {
			alert('저작자는 필수 항목입니다.');
		} else if (book_count.value == "") {
			alert('도서의 갯수는 필수 항목입니다.');
		} else {
			var f = document.getElementById('f');
			f.submit();
		}
	}
</script>

<!--컨텐츠 영역-->
<div id="contents">
	<div id="print_wrap">
		<div id="cont_head">
			<h2>개별도서등록</h2>
			<!-- 현재위치 -->
			<div id="location">
				<ul>
					<li>홈</li>
					<li>도서자료검색</li>
					<li class="now">개별도서등록</li>
				</ul>
			</div>
			<!-- //현재위치 -->
		</div>

		<div align="center" style="margin-top: 50px; margin-bottom: 50px;">
			<h1>도서 등록</h1>
			<table>
				<tr>
					<td><font color="red">${msg}</font></td>
				</tr>
				<form action="bookRegistProc" method="post"
					enctype="multipart/form-data" id="f">
					<tr>
						<td>

							<div class="card-write" align="center">

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
								</select> <input type="text" name="title_info" placeholder="제목"
									id="title_info"><br>
								<br> <input type="text" name="author_info"
									placeholder="저작자" id="author_info"> <input type="text"
									name="pub_info" placeholder="발행자" id="pub_info"><br>
								<br> <input type="text" name="pub_year_info"
									id="pub_year_info" placeholder="발행연도"> <input
									type="text" name="book_count" id="book_count"
									placeholder="책 갯수"><br>
								<br> <input type="text" name=donation id="donation"
									placeholder="기증자"><br>
								<tr>
									<th>상세 정보</th>
								</tr>
								<tr>
									<td><textarea style="width: 100%; margin-left: 10px;"
											rows="10" cols="30" name="detail_link"></textarea></td>
								</tr>
						</td>
					<tr>
						<th>파일첨부</th>
					</tr>
					<td><input type="file" name="upfile"></td>
					</div>
					<td><input type="button" class="submit_button" value="도서 등록"
						onclick="bookCheck()"> <input type="button"
						class="submit_button" value="취소" onclick="location.href='index'"><br>
					</td>
					</tr>
				</form>
			</table>
		</div>

	</div>
</div>

</div>
</div>
<c:import url="/bookfooter" />
<c:import url="/footer" />












