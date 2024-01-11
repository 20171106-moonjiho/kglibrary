<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/jsp/default/favicon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관 일정</title>
</head>

<body>
	<c:import url="/header" />
	<c:import url="/noticeheader" />
	<script src="notice_cal.js"></script>
	<link href="notice_cal.css" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
	<div id="cont_head">
		<h2>도서관 일정</h2>
		<!-- 현재위치 -->
		<div id="location">
			<ul>
				<li>홈</li>
				<li>이용자마당</li>
				<li class="now">도서관 일정</li>
			</ul>
		</div>
		<!-- //현재위치 -->
	</div>

	<div id="cont_wrap">
		<div id="board" style="width: 100%;">
			<!-- 캘린더 시작 -->
			<div id='calendar'></div>
			<!-- 캘린더 끝 -->
			
			<div class="board_button">
				<div class="fr">
					<span class="bt"><input type="button" value="이벤트 추가" id="openModalBtn"
						class="cbtn cbtn_g2"></span>
				</div>
			</div>
			
		<!-- 모달창 -->
			<div id="myModal" style="display: none;" class="modal">
	        	<div class="modal-content">
	            	<span id="closeModalBtn" class="close">&times;</span>
	            	
		            <form action="noticeboard_cal_pro" method="post" id="f">
				        <label for="datepicker">시작일 : </label>
				        <input type="text" id="startDate" name="startDate" readonly><br>
				        <label for="datepicker">종료일 : </label>
				        <input type="text" id="endDate" name="endDate" readonly><br>
				        <span>이벤트를 입력해 주세요. : </span>
						<input type="text" id="events" name="events">
				        <input type="button" value="확인" onclick="cal_check()">
		   			 </form>
	       		 </div>
	        	<!-- 모달창 끝-->
	   		 </div>
		</div>
	</div>
	<c:import url="/noticefooter" />
	<c:import url="/footer" />
</body>
</html>