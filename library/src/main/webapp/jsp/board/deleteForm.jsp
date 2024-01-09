<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>deleteForm</title>
<link href="resources/css/board.css" rel="stylesheet" type="text/css" />
<link href="resources/css/deleteForm.css" rel="stylesheet" type="text/css" />
</head>
<body>

<section>
	<b> 글 삭제 </b>
	<article>
		<form method="post"  action="deleteProc?pageNum=${pageNum }">
			<table class="deletetable">
				<tr>
					<th><b>비밀번호를 입력 해 주세요.</b></th>
				</tr>
				<tr>
					<td>비밀번호 : 
						<input type="password" name="pass" />
						<input type="hidden" name="num" value="${board.num }" >
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="글삭제" />
						<input type="button" value="목록" 
						onclick="document.location.href='list?pageNum=${pageNum}'"/>
					</td>
				</tr>
			</table>
		</form>
	</article>
</section>
</body>
</html>