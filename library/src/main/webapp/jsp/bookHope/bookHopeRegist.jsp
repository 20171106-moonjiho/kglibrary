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
	function bookHopeCheck() {
		let category = document.getElementById('category');
		let title_info = document.getElementById('title_info');
		let author_info = document.getElementById('author_info');

		if (category.value == "") {
			alert('카테고리는 필수 항목입니다.');
		} else if (title_info.value == "") {
			alert('제목은 필수 항목입니다.');
		} else if (author_info.value == "") {
			alert('저작자는 필수 항목입니다.');
		} else {
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

		<div align="center" style="margin-top: 50px; margin-bottom: 50px;">
			<h1>비치 희망 도서 신청 등록</h1>
			<table>
				<tr>
					<td><font color="red">${msg}</font></td>
				</tr>
				<form action="bookHopeRegistProc" method="post" id="f">
					<tr>

						<div class="card-write">
							<div class="title-w">
								<input type="text" name="board_title" placeholder="제목"
									id="board_title">
							</div>

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
							</select> <input type="text" name="title_info" placeholder="도서제목"
								id="title_info"><br>
							<br> <input type="text" name="author_info" placeholder="저작자"
								id="author_info"> <input type="text" name="pub_info"
								placeholder="발행자" id="pub_info"> <input type="text"
								name="pub_year_info" id="pub_year_info" placeholder="발행연도">
							<tr>
								<th><span class="subject_title">신청 이유</span></th>
							</tr>
							<tr>
								<td><textarea width="100%" rows="10" cols="100"
										name="reason"></textarea></td>
							</tr>
						</div>
						<td><input type="button" class="submit_button" value="신청 등록"
							onclick="bookHopeCheck()"> <input type="button"
							class="submit_button" value="취소"
							onclick="location.href='bookHopeForm'"><br></td>
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












