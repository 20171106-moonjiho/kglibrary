<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/jsp/default/favicon.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화행사</title>
</head>
<body>
	<c:import url="/header" />
	<c:import url="/cultureheader" />
	<link href="culture.css" rel="stylesheet">
	<div id="cont_head">
		<h2>문화행사</h2>
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
			<div class="table_bview">
				<table cellspacing="0" summary="의 작성일, 작성자, 조회수 및 내용">
					<caption></caption>
					<colgroup>
						<col width="">
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="th_none">${board.title }
							<a href="#javascript:;" class="btn_sm btn_close">기간종료</a>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<dl class="info">
									<dt>강좌기간</dt>
									<dd class="eng">${board.class_period_start } ~ ${board.class_period_end }</dd>
								</dl>
							</td>
						</tr>
						<tr>
							<td>
								<dl class="info">
									<dt>신청기간</dt>
									<dd class="eng">${board.reservation_period_start } ~ ${board.reservation_period_end }</dd>
								</dl>
							</td>
						</tr>

						<tr>
							<td>
								<dl class="info">
									<dt>수강대상</dt>
									<dd>${board.target }</dd>
								</dl>
							</td>
						</tr>

						<tr>
							<td>
								<dl class="info">
									<dt>행사장소</dt>
									<dd>${board.event_area }</dd>
								</dl>
							</td>
						</tr>

						<tr>
							<td>
								<dl class="info">
									<dt>모집인원</dt>
									<dd class="eng">
										<strong><span
											style="color: #FF0000; font-weight: bold;">${board.applicants }</span></strong> /
										${board.people } (선착순)

									</dd>
								</dl>
							</td>
						</tr>

						<tr>
							<td>
								<dl class="info">
									<dt>모집유형</dt>
									<dd>방문신청 , 전화신청 , 인터넷신청</dd>
								</dl>
							</td>
						</tr>


						<tr>
							<td>
								<dl class="info">
									<dt>접수장소</dt>
									<dd>${board.reception_area }</dd>
								</dl>
							</td>
						</tr>



						<tr>
							<td>
								<dl class="info">
									<dt>참가비</dt>
									<dd class="eng">${board.money }</dd>
								</dl>
							</td>
						</tr>



						<tr>
							<td>
								<dl class="info">
									<dt>강사</dt>
									<dd>${board.teacher }</dd>
								</dl>
							</td>
						</tr>


						<tr>
							<td class="content">
								<p align="center"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px; text-align: center;">
									<b style="margin: 0px; padding: 0px; border: 0px;"><span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(255, 0, 0);"><span
											style="margin: 0px; padding: 0px; border: 0px; font-size: 14pt; color: rgb(0, 0, 0); font-family: arial;"><span
												style="margin: 0px; padding: 0px; border: 0px;">*2024년
													성수도서관 겨울 독서교실&nbsp;</span><span
												style="margin: 0px; padding: 0px; border: 0px; color: rgb(255, 0, 0); font-size: 14pt;">&lt;성수
													문학소년소녀&gt;</span>&nbsp;<span
												style="margin: 0px; padding: 0px; border: 0px;">신청 안내</span></span></span></b>
								</p>
								<p align="left"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px;">
									<span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);">&nbsp;</span>
								</p>
								<p align="left"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px;">
									<b style="margin: 0px; padding: 0px; border: 0px;"><span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(255, 0, 0);"><span
											style="margin: 0px; padding: 0px; border: 0px; font-size: 12pt; color: rgb(0, 0, 0); font-family: arial;">1.
												신청 유의사항</span></span><br></b>
								</p>
								<p align="left"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px;">
									<b
										style="margin: 0px; padding: 0px; border: 0px; font-family: arial; font-size: 12pt;"><span
										style="margin: 0px; padding: 0px; border: 0px; font-size: 12pt;"><span
											style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);">★
												보호자 신청 시, [기타]란에</span>&nbsp;<u
											style="margin: 0px; padding: 0px; border: 0px;"><span
												style="margin: 0px; padding: 0px; border: 0px; color: rgb(255, 108, 0);"><u
													style="margin: 0px; padding: 0px; border: 0px;">참여자(학생)
														이름, 학교, 학년</u></span></u><span
											style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);">을
												꼭 기입해주세요!</span></span></b>
								</p>
								<p align="left"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px;">
									<span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0); font-size: 12pt; font-family: arial;"><b
										style="margin: 0px; padding: 0px; border: 0px;">★&nbsp;</b></span><b
										style="margin: 0px; padding: 0px; border: 0px; font-family: arial; font-size: 12pt;"><span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);">성동구립도서관
											내 타도서관&nbsp;</span><span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(255, 0, 0);">중복
											신청 불가</span><span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);">합니다.</span></b>
								</p>
								<p align="left"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px;">
									<b
										style="margin: 0px; padding: 0px; border: 0px; font-family: arial; font-size: 12pt;"><span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);"><span
											style="font-weight: 400; margin: 0px; padding: 0px; border: 0px; font-size: 12pt;"><b
												style="margin: 0px; padding: 0px; border: 0px;">★ <span
													style="color: rgb(255, 108, 0);">2024년 기준 3~4학년만 </span>신청
													가능합니다.
											</b></span><br></span></b>
								</p>
								<p align="left"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px;">
									<b
										style="margin: 0px; padding: 0px; border: 0px; font-family: arial; font-size: 12pt;"><span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);">★
											1인당&nbsp;</span><span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 117, 200);">1명</span><span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);">만
											신청 가능합니다.</span></b><b
										style="margin: 0px; padding: 0px; border: 0px; font-family: arial; font-size: 12pt;"><br></b>
								</p>
								<p align="left"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px;">
									<b
										style="margin: 0px; padding: 0px; border: 0px; font-family: arial; font-size: 16px;"><span
										style="margin: 0px; padding: 0px; border: 0px; font-size: 12pt;"><span
											style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);">★
												본 프로그램 참여 시&nbsp;</span><span
											style="margin: 0px; padding: 0px; border: 0px; color: rgb(58, 50, 195);">사진
												촬영 및 활용</span><span
											style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0);">에
												동의한 것으로 간주됩니다.</span></span></b><span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0); font-size: 12pt; font-family: arial;"><b
										style="margin: 0px; padding: 0px; border: 0px;"><br></b></span>
								</p>
								<p align="left"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px;">
									<span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0); font-size: 12pt; font-family: arial;"><b
										style="margin: 0px; padding: 0px; border: 0px;"><br></b></span>
								</p>
								<p align="left"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px;">
									<b style="margin: 0px; padding: 0px; border: 0px;"><span
										style="margin: 0px; padding: 0px; border: 0px; font-size: 12pt; font-family: arial; color: rgb(0, 0, 0);">2.
											참여자 혜택</span></b>
								</p>
								<p align="left"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px;">
									<span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0); font-size: 12pt; font-family: arial;"><b
										style="margin: 0px; padding: 0px; border: 0px;"><span
											style="margin: 0px; padding: 0px; border: 0px;">★ 참여자
												전원에</span></b></span><b
										style="color: rgb(0, 0, 0); font-family: arial; font-size: 12pt; margin: 0px; padding: 0px; border: 0px;"><span
										style="margin: 0px; padding: 0px; border: 0px;">게 주제도서</span>&nbsp;<span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 158, 37);">「셰익스피어
											이야기</span></b><b
										style="color: rgb(0, 0, 0); font-family: arial; font-size: 12pt; margin: 0px; padding: 0px; border: 0px;"><span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 158, 37);">」</span><span
										style="margin: 0px; padding: 0px; border: 0px;">가
											제공됩니다.</span></b>
								</p>
								<p align="left"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px;">
									<span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0); font-size: 12pt; font-family: arial;"><b
										style="margin: 0px; padding: 0px; border: 0px;"><span
											style="margin: 0px; padding: 0px; border: 0px;">★ 우수
												참여자 1명&nbsp;</span><span
											style="margin: 0px; padding: 0px; border: 0px; color: rgb(120, 32, 185);">국립어린이청소년관장상</span><span
											style="margin: 0px; padding: 0px; border: 0px;">, 차순위
												우수 참여자 2명에게</span>&nbsp;<span
											style="margin: 0px; padding: 0px; border: 0px; color: rgb(239, 0, 124);">성수도서관장상</span><span
											style="margin: 0px; padding: 0px; border: 0px;">을
												수여합니다.</span></b></span>
								</p>
								<p align="left"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px;">
									<span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0); font-size: 12pt; font-family: arial;"><b
										style="margin: 0px; padding: 0px; border: 0px;"><span
											style="margin: 0px; padding: 0px; border: 0px;"><br></span></b></span>
								</p>
								<p align="left"
									style="border: 0px; color: rgb(68, 68, 68); font-family: NotoKrR, sans-serif; font-size: 15px; letter-spacing: -1px;">
									<span
										style="margin: 0px; padding: 0px; border: 0px; color: rgb(0, 0, 0); font-size: 12pt; font-family: arial;"><b
										style="margin: 0px; padding: 0px; border: 0px;"><span
											style="margin: 0px; padding: 0px; border: 0px;"><img
												src="/data/userfiles/b09b8c22-bdf5-4142-8345-89c46aafbcb1.jpg"
												title="[%20%20%20]%20%20%20%20%20%20%20%20.jpg"><br></span></b></span>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<!--컨테이너끝 -->
	<c:import url="/culturefooter" />
	<c:import url="/footer" />
</body>
</html>