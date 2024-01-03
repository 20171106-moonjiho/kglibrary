<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />

<script>
	function deleteCheck() {
		result = confirm('진짜로 삭제하겠습니까?');
		if (result == true) {
			location.href = 'ContentDeleteProc3?no=${board.no}'
		}
	}
</script>


<style>
.box1 {
	font-size: 15px;
	border: 1px solid #444444;
	border-collapse: collapse;
	line-height: 20px;
}

.box1 img {
	max-width: 900px;
	margin: 0 auto;
}

.box1 th, td {
	border: 1px solid #444444;
}

.box1 th {
	width: 150px;
	height: 40px;
	background: #626363;
	color: #fff;
}

.box1 td {
	width: 270px;
	height: 40px;
}

.main_box {
	width: 930px;
	margin: 0 auto;
	margin-top: 100px;
	border: 1px solid lightcoral;
	border-radius: 5px 5px 5px 5px;
}

.ask_box {
	width: 930px;
	margin: 0 auto;
	margin-top: 50px;
}

.title, .user, .time {
	border-bottom: 1px solid #dedede;
	height: 45px;
	padding-left: 27px;
	font-size: 15px;
	line-height: 45px;
}

.contents {
	padding: 27px;
	font-size: 15px;
}

.contents img {
	display: block;
	margin: 0 auto;
	max-width: 880px
}

.button_bar {
	margin: 0 auto;
	width: 300px;
	margin-bottom: 15px;
	text-align: center;
}

.button_bar button {
	color: #fff;
	width: 65px;
	height: 30px;
	border-radius: 4px;
	border: 1px solid lightcoral;
	background: lightcoral;
	padding-left: 10px;
}
</style>

<div class="main_box">
	<div class="title">
		<span style="color: lightcoral; font-weight: 500;">제목 :</span>
		${board.title }
	</div>
	<div class="user">
		<span style="color: lightcoral; font-weight: 500;">작성자 : </span>${board.id }
	</div>
	<div class="time">
		<span style="color: lightcoral; font-weight: 500;">작성일 : </span>${board.writeDate }
	</div>
	<div class="contents">
		<c:if test="${board.image != null}">
			<img src="../img/${board.id}/${board.image}">
			<br>
		</c:if>
		${board.content }
	</div>
	<div class="button_bar">
		<button type="button" onclick="location.href='noticeBoard'">목록</button>
			<button type="button"
				onclick="location.href='noticeboard_Modify?no=${board.no }'">수정</button>
			<button type="button" onclick="deleteCheck()">삭제</button>
	</div>
</div>

<c:import url="/footer" />
