<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기증 내용</title>
</head>
<script>
	
</script>
<body>
	<c:import url="/header" />
	<c:import url="/donateheader" />

	<div id="contents">
		<div id="print_wrap">
			<div id="cont_head">
				<h2>기증 내용</h2>
				<!-- 현재위치 -->
				<div id="location">
					<ul>
						<li>홈</li>
						<li>도서 기증</li>
						<li class="now">기증 목록</li>
					</ul>
				</div>
			</div>
			<div>
				<h1>기증 내용</h1>
			</div>
			<div>
				<div>${board.subject }</div>
				<div>
					<dl>
						<dt>번호</dt>
						<dd>${board.no}</dd>
					</dl>
					<dl>
						<dt>도서 수량</dt>
						<dd>${board.book_no}</dd>
					</dl>
					<dl>
						<dt>기증 방법</dt>
						<dd>${board.method}</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${board.reg_date}</dd>
					</dl>
				</div>
				<div>${board.content}</div>
				<div>
					<a href="donateForm">목록</a>
				</div>
			</div>
		</div>
	</div>

	<c:import url="/noticefooter" />
	<c:import url="/footer" />
</body>
</html>