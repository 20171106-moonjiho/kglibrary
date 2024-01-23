<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/jsp/default/favicon.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<c:import url="/header" />
	<c:import url="/cultureheader" />
	<link href="culture.css" rel="stylesheet">
	<div id="cont_head">
		<h2>공지사항</h2>
		<!-- 현재위치 -->
		<div id="location">
			<ul>
				<li>홈</li>
				<li>문화마당</li>
				<li class="now">문화행사</li>
			</ul>
		</div>
		<!-- //현재위치 -->
	</div>

	<div id="cont_wrap">
		<div id="board" style="width: 100%;">
			<div class="search_tit">
				<h3 class="tit">문화행사 목록</h3>
			</div>
			<c:choose>
				<c:when test="${empty board }">
					<h1>등록된 데이터가 존재하지 않습니다.</h1>
				</c:when>
				<c:otherwise>
					<div class="table_blist">
						<table cellspacing="0" summary="의 번호, 제목, 글쓴이, 등록일, 조회수를 확인">
							<caption></caption>
							<colgroup>
								<!-- <col width="10%" /> -->
								<col width="15%">
								<col width="*">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr>
									<!-- <th scope="col">번호</th> -->
									<th scope="col">이름</th>
									<th scope="col">제목</th>
									<th scope="col">상태</th>
									<th scope="col" class="th_none">취소</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<!-- <td class="eng">1</td> -->
									<td>${board.name }</td>
									<td class="eng">${board.title }</td>
									<td>신청완료</td>
									<td><input type="button" value="취소하기" class="con_sbtn"
										onclick="deleteOk('26722');"></td>
								</tr>
							</tbody>
						</table>

					</div>

					<!-- 버튼 -->
					<div class="btn_w">
						<span><a href="/SD/edusat/list.do" class="con_btn">돌아가기</a></span>
					</div>
					<!-- //버튼 -->
					<div class="lesson no_top">
						<ul>
							<c:forEach var="board" items="${boards }" varStatus="status">
								<li class="img_yes">

									<p class="imgw">
										<c:if test="${board.image != null}">
											<img src="../img/${board.id}/${board.image}">
											<br>
										</c:if>
										<img src="#" alt="11월 <직업인으로서의 변호사> 이재욱 변호사와의 만남">
									</p>

									<div class="cont">
										<p class="cate"
											style="color: #848484; text-align: left; font-weight: bold;">${board.reception_area }</p>
										<p class="tit">
											<a href="cultureContent?no=${board.no }"
												style="color: #BDBDBD; text-align: left;"> ${board.title }</a>
										</p>
										<div class="sm_box">
											<dl>
												<dt style="font-weight: bold;">신청기간</dt>
												<dd class="eng">${board.reservation_period_start }~
													${board.reservation_period_end }</dd>
											</dl>
											<dl>
												<dt style="font-weight: bold;">운영기간</dt>
												<dd class="eng">${board.class_period_start }~
													${board.class_period_end }</dd>
											</dl>
											<dl>
												<dt style="font-weight: bold;">수강대상</dt>
												<dd>${board.target }</dd>
											</dl>
											<dl>
												<dt style="font-weight: bold;">모집인원</dt>
												<dd>
													<strong>[선착순]</strong> <strong style="color: #ff4e00;"
														class="eng"><span
														style="color: #FF0000; font-weight: bold;">${board.applicants }</span></strong><span
														class="eng">/${board.people }</span>
												</dd>
											</dl>
										</div>
									</div>
									<div class="btn_box">
										<c:set var="applicantsInt" value="${board.applicants}" />
										<c:set var="peopleInt" value="${board.people}" />
										<c:choose>
											<c:when test="${apply_ckList[status.index] == '1'}">
												<a href="#" class="btn_sm btn_close">신청완료</a>
											</c:when>
											<c:when test="${applicantsInt < peopleInt}">
												<a href="registWrite?no=${board.no }" class="btn_sm btn_ing">행사신청</a>
											</c:when>
											<c:otherwise>
												<a href="#" class="btn_sm btn_close">모집종료</a>
											</c:otherwise>
										</c:choose>
										<a href="#" class="btn_sm btn_check">등록확인</a>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>

					<div class="board_paginate">${result}</div>
					<c:if test="${sessionScope.id eq 'admin'}">
						<div class="board_button">
							<div class="fr">
								<span class="bt"><input type="button" value="글쓰기"
									onclick="location.href='cultureWrite'" class="cbtn cbtn_g2"></span>
							</div>
						</div>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!--컨테이너끝 -->
	<c:import url="/culturefooter" />
	<c:import url="/footer" />
</body>
</html>