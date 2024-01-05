<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />
<c:import url="/bookheader" />
<style>
h2 {
	font-weight: border;
}

.hr1 {
	border: 0;
	height: 2px;
	background: #d3d3d3;
}

.grey {
	color: #727272;
}

#strong {
	font-weight: 900;
}

table {
	width: 100%;
	border-top: 1px solid #d3d3d3;
	border-collapse: collapse;
}

th {
	background-color: #d3d3d3;
	border-top: 3px solid #727272;
}

th, td {
	border-bottom: 1px solid #d3d3d3;
	padding: 10px;
}

.greylist {
	width: 50px;
	height: 30px;
	font-weight: 900;
	color: white;
	text-align: center;
	background: grey;
	border: solid 2px white;
	border-radius: 5px;
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

.left {
	text-align: left;
}

.right {
	float: right;
}

.center {
	text-align: center;
}

a {
	color: black;
	text-decoration-line: none;
}
</style>
<script type="text/javascript">
	function apiCheck() {
		let search = document.getElementById('search');
		let pageNum = document.getElementById('pageNum');

		if (search.value == "") {
			alert('제목은 필수 항목입니다.');
		} else if (pageNum.value == "") {
			alert('페이지 번호는 필수 항목입니다.');
		} else {
			var f = document.getElementById('f');
			f.submit();
		}
	}

	function apimessageAlert(apimessage) {

		if (apimessage == 'search') {
			alert('등록되었습니다.');
		} else {
			alert('검색값이 없습니다.');
		}
	}
</script>

<div id="contents">
	<div id="print_wrap">
		<div id="cont_head">
			<h2>공지사항</h2>
			<!-- 현재위치 -->
			<div id="location">
				<ul>
					<li>홈</li>
					<li>이용자마당</li>
					<li class="now">공지사항</li>
				</ul>
			</div>
			<!-- //현재위치 -->
		</div>


		<div id="cont_wrap">
			<div id="board" style="width: 100%;">


				<div
					style="width: 800px; margin: 0 auto; margin-top: 100px; margin-bottom: 100px">
					<h2>도서 등록</h2>

					<hr class="hr1" noshade>

					<form action="apiRegistProc" method="post" id="f">
						<span> 10종류씩 도서가 등록 가능합니다.<br> (수량 정정이 필요할 시 관리자를
							호출해주세요)<br> 등록할 페이지 번호를 입력해 주세요. ${apimessage}<br>
						<br>
						</span> <span class="center"> <select class="selectBox"
							name="select">
								<option value="title" selected="selected">제목</option>
						</select> <c:choose>
								<c:when test="${empty search or search == 'null'}">
									<input type="text" name="search" id="search" />
								</c:when>

							</c:choose> <input type="text" name="pageNum" placeholder="등록할 페이지 번호"
							id="pageNum"> <input type="button" value="도서 등록"
							onclick="apiCheck()">
						</span>

					</form>

				</div>

			</div>
		</div>

	</div>
</div>

<c:import url="/bookfooter" />
<c:import url="/footer" />