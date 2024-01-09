<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/top" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link href="resources/css/board.css" rel="stylesheet" type="text/css" />
<link href="resources/css/listForm.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<section>
		<article>
			<b class="listwritecount">글 목록(전체 글:${count })</b>
			<table class="listwirtebutton">
				<tr><td><a href="writeForm">글쓰기</a></td></tr>
			</table>
			<c:choose>
				<c:when test="${count == 0 }">
					<table class="listtable">
						<tr><td>게시판에 저장된 글이 없습니다.</td></tr>
					</table>
				</c:when>
				<c:otherwise>
					<table class="listtable">
					<tr>
						<th id="num"> 번 호 </th>
						<th id="title"> 제 목 </th>
						<th id="writer"> 작성자 </th>
						<th id="date"> 작성일 </th>
						<th id="counter"> 조 회 </th>
						<th id="ip"> IP </th>
					</tr>
					<c:forEach items="${list }" var="b">
					<tr>
						<td>${number}</td>
						<c:set var="number" value="${number-1 }" />
						
						<td class="titletd">
							<c:if test="${b.getDepth() > 0}">
								<img src="resources/images/level.gif" width="${5 * b.getDepth()}">
								<img src="resources/images/re.gif">
							</c:if>
							<c:if test="${b.getDepth() == 0}">
								<img src="resources/images/level.gif" width="0">
							</c:if>
							<a href="content?num=${b.getNum() }&pageNum=${currentPage}">${b.getSubject() }</a>
							<!-- 가져가는 값 num와 현재 페이지의 값 -->
							<c:if test="${b.getReadCount() >= 20 }">
								<img src="resources/images/hot.gif">
							</c:if>
						</td>
						<td> 
							<a href="mailto:${b.getEmail() }">${b.getWriter() }</a>
						</td>
						<td> ${sdf.format(b.getRegDate())}</td>
						<td>${b.getReadCount()}</td>
						<td>${b.getIp() }</td>
					</tr>
					</c:forEach>	
				</table>
			</c:otherwise>
		</c:choose>
		${pagePrint }
	</article>
</section>
</body>
</html>
<c:import url="/bottom" />