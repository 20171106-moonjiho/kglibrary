<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>대출 목록</title>
</head>
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
<body>
<c:import url="/header" />
<c:import url="/userHeader"/>
<script src="myBook.js"></script>
<script>
</script>

<div id="cont_head">
		<h2>대출 목록</h2>
		<!-- 현재위치 -->
		<div id="location">
			<ul>
				<li>홈</li>
				<li>마이페이지</li>
				<li class="now">대출 목록</li>
			</ul>
		</div>
		<!-- //현재위치 -->
	</div>
<div id="cont_wrap">
	<!-- <div style="width: 1200px; margin: 0 auto; margin-top: 100px;"> -->
	<h2> 도서 검색 </h2>

	<hr class="hr1" noshade>
	
	<%-- <form action="myBook">
					<span class="right">
					<select class="selectBox" name="select">
			  					<option value="title" selected="selected">제목</option>
   								<option value="author">저작자</option>
					   			<option value="category">카테고리</option>
    	</select>
					<c:choose>
						<c:when test="${empty search or search == 'null'}">
							<input type="text" name="search" />
						</c:when>
						<c:otherwise>
							<input type="text" name="search" value="${search }"/>
						</c:otherwise>
					</c:choose>
					<input type="submit" class="submit_button" value="검색" />
					</span>
				</form> --%>
				
		<c:choose>
			<c:when test="${empty boards }">
				<h2> 대출 도서가 없습니다. </h2>
			</c:when>
			<c:otherwise>
				<table style="margin-top: 30px;">
					<tr>
						<th width="50">번호</th>
						<th width="350">제목</th>
						<th width="130">작성자</th>
						<th width="250" colspan="3">반납일</th>
					</tr>
					
					<c:forEach var="board" items="${ boards}">
						<tr>
							<td class="center">${board.no }</td>
							<td class="left" onclick="location.href='bookContent?no=${board.no }'">
								${board.title_info }
							</td>
							<td class="center">${board.author_info }</td>
							<td class="center">${board.rentaldate }</td>
							<td width="45px">
								<button type="button" onclick="extendCheck('${sessionScope.id }','${board.no}', '${board.rentaldate}', '${board.borrowdate}')" >연장</button>
							</td>
							<td width="45px">
								<button type="button" onclick="returnCheck('${sessionScope.id }','${board.no}')">반납</button>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="center" style="margin-top: 18px;">${result}</div>
		</c:otherwise>
	</c:choose>		
	<!-- </div> -->
</div>
<c:import url="/userFooter" />
<c:import url="/footer" />
</body>
</html>