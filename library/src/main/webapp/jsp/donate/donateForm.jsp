<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 기증</title>
</head>
<body>
	<div class="board_title">
		<h1>기증자 조회</h1>
	</div>
	<div class="board_list">
					<ul class="board_header">
						<li class="id">글번호</li>
						<li class="writer">작성자</li>						
						<li class="date">작성일</li>
					</ul>
				
<%-- 				<c:forEach var="list" items="${boardList}">
				<ul class="board_ul" onclick="detailView(${list.bid})">
					<li class="id">${list.bid }</li>
					<li class="category">${list.cname }</li>
					<li class="title">${list.btitle }</li>
					<li class="writer">${list.userName }</li>
					<li class="count">${list.bcount }</li>
					<li class="date">${list.createDate }</li>
				</ul>
				</c:forEach> --%>
			</div>
	<div class="container">
		<div class="row">
			<form method="post" name="search" action="searchbbs.jsp">
				<table class="pull-right">
					<tr>
						<td><input type="text" class="form-control"
							placeholder="기증자를 입력하세요." name="searchText" maxlength="200"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>