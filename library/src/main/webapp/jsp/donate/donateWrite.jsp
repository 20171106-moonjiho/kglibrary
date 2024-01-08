<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 기증 신청</title>
</head>
<body>
	<c:import url="/header" />
	<c:import url="/donateheader" />
	
	<div id="contents">
		<div id="print_wrap">
			<div id="cont_head">
				<h2>기증 신청</h2>
				<!-- 현재위치 -->
				<div id="location">
					<ul>
						<li>홈</li>
						<li>도서 기증</li>
						<li class="now">기증 신청</li>
					</ul>
				</div>
			</div>
		</div>
	

	<div>
		<form action="donateWriteProc" method='post'
			enctype="multipart/form-data">
			<h3>기증 내용 및 방법</h3>
			<p>* 표시는 필수 입력항목입니다.</p>
			<table border=1>
				<tbody>
					<tr>
						<th>기증자</th>
						<td><input style="width: 100%;" type="text" name="id"
							value="${sessionScope.id }"></td>
					</tr>
					<tr>
						<th scope="row">주요 기증 분야</th>
						<td>
							<div>
								<input type="text" name="subject" maxlength="100">
							</div>
							<p style="margin-top: 5px">예) 일반도서, 아동·청소년도서</p>
						</td>
					</tr>
					<tr>
						<th scope="row">* 도서수량</th>
						<td>
							<div>
								<input type="text" name="book_no" maxlength="10">책(점)
							</div>
						</td>
					</tr>
					<tr>
					<tr>
						<th scope="row">* 기증방법</th>
						<td><input type="radio" id="donation_method01"
							name="method" value="직접방문" checked />직접방문<input
							type="radio" id="donation_method02" name="method" 
							value="우편배달" />우편발송</label></td>
					<tr>
						<th>내용</th>
						<td><textarea style="width: 100%; resize: none" rows="10"
								cols="40" name="content" value="${donate.content}"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="등록"> <input type="button" value="취소"
							onclick="location.href='donateForm'"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
			</div>
					</div>
				
				</div>
			</div>
	<c:import url="/noticefooter" />
	<c:import url="/footer" />
</body>
</html>