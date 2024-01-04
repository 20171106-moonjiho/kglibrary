<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<c:import url="/header" />

<style>

</style>

<div id="container">
		<!--사이드바 시작-->
			<div class="swsize">
				<div id="sidebar">
					<div class="stit">
						<p class="eng"></p>
						<h2>이용자마당</h2>
					</div>
					<div id="sidemenu">
						<p class="tit jsMMenuText"><a href="#" class="jsMMenuBtn">공지사항
									</a></p>
						<ul id="jsMMenu">
								<li >
									<a href="noticeBoard">공지사항
									</a>
								</li>
								<li>
									<a href="noticeBoard2">묻고 답하기
									</a>
								</li>
								<li class="on">
									<a href="noticeboard_cal">도서관 일정
									</a>
								</li>
						</ul>
					</div>
					<div id="jsFacetLeft">				
					</div>
				</div>
			</div><!--사이드바 끝-->
			
			<!--컨텐츠 영역-->
			<div id="contents">
				<div id="print_wrap">
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
						<div id="board" style="width:100%;">
						<!-- 캘린더 시작 -->
							 <div id='calendar'>
							 
							 </div>	
						<!-- 캘린더 끝 -->
						</div>
					</div>
				
				</div>
			</div>
			<!--컨테이너끝 -->
		</div>

<c:import url="/footer" />