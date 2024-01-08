<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기증 안내</title>
</head>
<body>
	<c:import url="/header" />
	<c:import url="/donateheader" />

	<div id="contents">
		<div id="print_wrap">
			<div id="cont_head">
				<h2>기증 안내</h2>
				<!-- 현재위치 -->
				<div id="location">
					<ul>
						<li>홈</li>
						<li>도서 기증</li>
						<li class="now">기증 안내</li>
					</ul>
				</div>
			</div>
		</div>

		<div>
			<img src="/img/book_donate.png">
		</div>
		<div>
			<h2>
				기관, 단체, 개인으로부터 도서를 기증받아 도서관 자료로 활용하고 정보소외계층, 작은도서관, 지역아동센터 등에 지원함으로써
				서로 나누고 독서 활성화에 기여하고자 합니다.<br> 단, 기증받은 자료는 우리 도서관 내부 규정에 준하여
				선정ㆍ등록하며, 사후 처리 시 기증자료에 대한 권한을 도서관에 일임함을 원칙으로 하오니 기증 시 참고하여 주시기 바랍니다.
			</h2>
		</div>
	</div>
	<c:import url="/noticefooter" />
	<c:import url="/footer" />
</body>
</html>