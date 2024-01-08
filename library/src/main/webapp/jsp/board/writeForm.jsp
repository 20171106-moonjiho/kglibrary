<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:import url="/top" />
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>writeForm</title>
<link href="resources/css/board.css" rel="stylesheet" type="text/css" />
<link href="resources/css/writeForm.css" rel="stylesheet" type="text/css" />
<script src="resources/script.js"></script>
</head>
<body>

<section>
	<b class="listwirtebutton"> 글쓰기 </b>
	<article>
		<form method="post" name="writeForm" action="writeProc" onsubmit="return writeSave()">
		<input type="hidden" name="num" value="${num }" />
		<input type="hidden" name="ref" value="${ref }" />
		<input type="hidden" name="step" value="${step }" />
		<input type="hidden" name="depth" value="${depth }" />
			<table class="board">
				<tr>
					<td class="attr">이름</td>
					<td><input type="text" name="writer" /></td>
				</tr>
				<tr>
					<td class="attr">이메일</td>
					<td><input type="email" name="email" /></td>
				</tr>
				<tr>
					<td class="attr">제목</td>
					<c:choose>
						<c:when test="${empty num or num == '0'}">
							<td><input class="input" type="text" name="subject" /></td>
						</c:when>
						<c:otherwise>
							<td><input class="input" type="text" name="subject" value="[답변]"/></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td class="attr">내용</td>
					<td><textarea name="content" rows="13" cols="50"></textarea></td>
				</tr>
				<tr>
					<td class="attr">비밀번호</td>
					<td><input type="password" name="pass" /></td>
				</tr>
				<tr>
					<td colspan="2" class="attr">
						<input type="submit" value="글쓰기" />
						<input type="reset" value="다시 작성" />
						<input type="button" value="목록" onclick="window.location='list'"/>
					</td>
				</tr>
			</table>
		</form>
	</article>
</section>
</body>
</html>

<c:import url="/bottom" />