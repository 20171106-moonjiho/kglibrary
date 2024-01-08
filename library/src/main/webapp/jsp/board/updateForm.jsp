
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>updateForm</title>
<link href="resources/css/board.css" rel="stylesheet" type="text/css" />
<link href="resources/css/writeForm.css" rel="stylesheet" type="text/css" />
<script src="resources/script.js"></script>
</head>
<body>

<section>
	<b> 글 수정 </b>
	<article>
		<form method="post" name="writeForm" action="updateProc?num=${board.num }&pageNum=${pageNum}" onsubmit="return writeSave()">
		<input type="hidden" name="writer" value="${board.writer}" />

			<table class="board">
				<tr>
					<td class="attr">이름</td>
					<td><input type="text" disabled="disabled" value="${board.writer}" /></td>
				</tr>
				<tr>
					<td class="attr">이메일</td>
					<td><input type="email" name="email" value="${board.email}"/></td>
				</tr>
				<tr>
					<td class="attr">제목</td>
					<td><input class="input" type="text" name="subject" value="${board.subject}"/></td>
				</tr>
				<tr>
					<td class="attr">내용</td>
					<td><textarea name="content" rows="13" cols="50">${board.content}</textarea></td>
				</tr>
				<tr>
					<td class="attr">비밀번호</td>
					<td><input type="password" name="pass" /></td>
				</tr>
				<tr>
					<td colspan="2" class="attr">
						<input type="submit" value="글 수정" />
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