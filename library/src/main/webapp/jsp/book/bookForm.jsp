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

<div id="contents">
	<div id="print_wrap">
		<div id="cont_head">
			<h2>도서검색</h2>
			<!-- 현재위치 -->
			<div id="location">
				<ul>
					<li>홈</li>
					<li>도서자료검색</li>
					<li class="now">도서검색</li>
				</ul>
			</div>
			<!-- //현재위치 -->
		</div>


		<div id="cont_wrap">
			<div id="board" style="width: 100%;">

				<form action="bookForm">
					<span> ▷ 총 ${count }개의 검색 결과가 있습니다. </span> <span class="center">
						<select class="selectBox" name="select">
							<option value="title" selected="selected">제목</option>
							<option value="author">저작자</option>
							<option value="category">카테고리</option>
					</select> </select> <c:choose>
							<c:when test="${empty search or search == 'null'}">
								<input type="text" name="search" />
							</c:when>
							<c:otherwise>
								<input type="text" name="search" value="${search }" />
							</c:otherwise>
						</c:choose> <input type="submit" class="submit_button" value="검색" />
					</span>
				</form>

				<c:choose>
					<c:when test="${empty boards }">
						<h1>등록된 데이터가 존재하지 않습니다.</h1>
					</c:when>
					<c:otherwise>
						<table style="padding-top: 30px;">
							<tr>
								<th width="70">번호</th>
								<th width="500">제목</th>
								<th width="300">작성자</th>
								<th width="200">작성일</th>
							</tr>

							<c:forEach var="board" items="${ boards}">
								<tr>
									<td class="center">${board.no }</td>
									<td class="left"
										onclick="location.href='bookContent?no=${board.no }'">
										${board.title_info }</td>
									<td class="center">${board.author_info }</td>
									<td class="center">${board.reg_date }</td>
								</tr>
							</c:forEach>
						</table>
						<div class="center" style="margin-top: 18px;">${result}</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${sessionScope.id eq 'admin'}">
						<tr>
							<span class="right">
								<button type="button" style="width: 150px;"
									onclick="location.href='bookRegist'" class="submit_button">개별
									도서 등록</button>
							</span>
						</tr>
					</c:when>
				</c:choose>


			</div>
		</div>

	</div>
</div>





<c:import url="/bookfooter" />
<c:import url="/footer" />