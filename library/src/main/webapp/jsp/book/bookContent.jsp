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

<script>
	function deleteCheck(){
		result = confirm('진짜로 삭제하겠습니까?');
		if(result == true){
			location.href="bookDeleteProc?no=${board.no}"
		}
	}
	function rentCheck(){
		var userId = '<%=session.getAttribute("id")%>';
		
	    if (userId == "null" || userId.trim() == "") {
	        alert("로그인이 필요합니다.");
	        location.href = "login";
	    }
	    else{
		result = confirm('대여 하시겠습니까?');
		if(result == true){
			location.href="rentalProc?no=${board.no}"
		}
	    }
	}
	
	function returnCheck(){
		var userId = '<%=session.getAttribute("id")%>';

		if (userId == "null" || userId.trim() == "") {
			alert("로그인이 필요합니다.");
			location.href = "login";
		} else {
			result = confirm('반납 하시겠습니까?');
			if (result == true) {
				location.href = "returnProc?no=${board.no}"
			}
		}
	}
</script>

<div id="contents">
	<div id="print_wrap">
		<div id="cont_head">
			<h2>도서상세정보</h2>
			<!-- 현재위치 -->
			<div id="location">
				<ul>
					<li>홈</li>
					<li>도서자료검색</li>
					<li class="now">도서상세정보</li>
				</ul>
			</div>
			<!-- //현재위치 -->
		</div>


		<div id="cont_wrap">
			<div id="board" style="width: 100%;">

				<div align="center" style="margin-top: 50px; margin-bottom: 100px;">
					<h1>${board.title_info}</h1>
					<br>
					<br>
					<tr>
						<c:choose>
							<c:when
								test="${not empty board.image && board.category ne 'API'}">
								<img width="300" src="/img/admin/${board.image }">
								<br>
							</c:when>
							<c:otherwise>
								<img width="300" src="${board.image }">
								<br>
							</c:otherwise>
						</c:choose>
					</tr>
					<table border='1' style="margin-top: 50px;">
						<tr>
							<th width="100">제목</th>
							<td width="200">${board.title_info}</td>
							<th width="100">작성자</th>
							<td width="200">${board.author_info }</td>
							<th width="70">발행자</th>
							<td whdth="200">${board.pub_info}</td>
						</tr>
						<tr>
							<th width="100">카테고리</th>
							<td width="200">${board.category}</td>
							<th width="100">발행연도</th>
							<td width="200">${board.pub_year_info }</td>
							<th width="70">비치일</th>
							<td whdth="200">${board.reg_date}</td>
						</tr>
						<tr>
							<c:set var="borrowPerson" value="${board.borrowperson}" />

							<th width="100">대여 여부</th>
							<c:choose>
								<c:when test="${borrowPerson eq '대여 가능'}">
									<td width="200" colspan="5">${board.borrowperson}</td>
								</c:when>
								<c:when test="${sessionScope.id eq borrowPerson}">
									<td width="200" colspan="5">
										<button type="button" onclick="returnCheck()">반납
											${rentaldate} 까지</button>
									</td>
								</c:when>
								<c:otherwise>
									<td width="200" colspan="5">대여 중 - 예상 반납 시간 :
										${rentaldate} 까지</td>
								</c:otherwise>
							</c:choose>


						</tr>
						<tr>
							<th>문서내용</th>
							<td colspan="6">${board.detail_link }</td>
							</td>
						</tr>

						<tr>
							<td colspan="6" align="center">
								<button type="button" onclick="location.href='bookForm'">목록</button>
								<c:choose>
									<c:when test="${sessionScope.id eq 'admin'}">
										<button type="button" onclick="deleteCheck()">삭제</button>
									</c:when>
								</c:choose> <c:choose>
									<c:when test="${borrowPerson eq '대여 가능'}">
										<input type="hidden" id="userId"
											value="<%=session.getAttribute("id")%>">
										<button type="button" onclick="rentCheck()">대여</button>
									</c:when>
								</c:choose>



							</td>
						</tr>

					</table>
				</div>

			</div>
		</div>

	</div>
</div>

<c:import url="/bookfooter" />
<c:import url="/footer" />












