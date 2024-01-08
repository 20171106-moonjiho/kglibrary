<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<link href="resources/css/board.css" rel="stylesheet" type="text/css" />
<link href="resources/css/content.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<section>
		<article>
			<b>글 내용 보기</b><br><br>
			<table class="contenttable">
				<tr>
					<th>글번호</th> <td>${board.num }</td>
					<th>조회수</th> <td>${board.readCount}</td>
				</tr>
				<tr>
					<th>작성자</th> <td>${board.writer}</td>
					<th>작성일</th> <td>${sdf.format(board.regDate)}</td>
				</tr>
				<tr>
					<th>글제목</th> 
					<td colspan="3" class="contenttitle">${board.subject}</td>
				</tr>
				<tr>
					<th>글내용</th> 
					<td colspan="3" class="content">${board.content }</td>
				</tr>
				<tr>
					<td colspan="4" >
						<input type="button" value="글수정" 
						onclick="document.location.href='updateForm?num=${board.num }&pageNum=${pageNum }'">
						<!-- 페이지 번호는 게시글에 들어갔다 나왔을떄 그 페이지 번호가 유지 되기 위해서 가지고 가는것이다. -->
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="글삭제" 
						onclick="document.location.href='deleteForm?num=${board.num }&pageNum=${pageNum }'">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="글목록" 
						onclick="document.location.href='list?pageNum=${pageNum }'">
					
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="답글" 
						onclick="document.location.href='writeForm?num=${board.num }&ref=${board.ref }&step=${board.step }&depth=${board.depth }'">
					
					</td>
				</tr>
			</table>
		</article>
	</section>
</body>
</html>
