<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/header" />

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
								<li class="on">
									<a href="noticeBoard">공지사항
									</a>
								</li>
								<li>
									<a href="noticeBoard2">묻고 답하기
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
							<h2>공지사항</h2>
							<!-- 현재위치 -->
							<div id="location">
								<ul>
									<li>홈</li>
									<li>이용자마당</li>
									<li class="now">공지사항</li>
								</ul>
							</div>
							<!-- //현재위치 -->
						</div>
					
					<div id="cont_wrap">
						<div id="board" style="width:100%;">
							
									<c:choose>
									<c:when test="${empty boards }">
										<h1>등록된 데이터가 존재하지 않습니다.</h1>
									</c:when>
									<c:otherwise>
							<div class="board_total">
								<div class="board_total_left">
									<img src="../img/total_ic.gif" alt=""> 
									전체 <strong>${count }</strong>개의 게시물이 있습니다.
								</div>
							</div>		
							<table>
								<tr>
									<th width="100">번호</th>
									<th width="500">제목</th>
									<th width="130">작성자</th>
									<th width="200">일시</th>
									<th width="70">조회수</th>
								</tr>
								<c:forEach var="board" items="${boards }">
									<tr>
										<td class="notice"><a href="noticeboard_Content?no=${board.no }">${board.no }</a></td>
										<td class="notice title"><a href="noticeboard_Content?no=${board.no }">${board.title }</a></td>
										<td class="notice">${board.id }</td>
										<td class="notice">${board.writeDate }</td>
										<td class="notice">${board.hits }</td>
									</tr>
									
								</c:forEach>
							</table>
						
							<div class="board_button">
								<div class="fr">
								<span class="bt"><input type="button" value="글쓰기" onclick="location.href='noticeboard_write'"
								class="cbtn cbtn_g"></span>
								</div>
							</div>

							<div class="board_paginate">
								${result}
							</div>
							
							<div style="margin:0 auto;text-align:center;">
								<div class="board_search">
									<form id="frm_sch" action="noticeBoard">
										<fieldset>
										<ul>
											<li><select id="v_search" name="search_select" title="검색형태 선택" style="width:70px;">
												<c:choose>
													<c:when test="${search_select == '제목' }">
														<option value="">전체</option>
														<option value="제목" selected="selected" >제목</option>
														<option value="글쓴이">글쓴이</option>
													</c:when>
													<c:when test="${search_select == '글쓴이' }">
														<option value="">전체</option>
														<option value="제목">제목</option>
														<option value="글쓴이" selected="selected" >글쓴이</option>
													</c:when>
													<c:otherwise>
														<option value="" selected="selected">전체</option>
														<option value="제목">제목</option>
														<option value="글쓴이">글쓴이</option>
													</c:otherwise>
												</c:choose>
											</select></li>
											<li>
											<c:choose>
											<c:when test="${empty search or search == 'null'}">
												<input type="text" size="25" title="검색어를 입력하세요" id="p_keyword" name="search" class="search_input" value="">
											</c:when>
											<c:otherwise>
											<input type="text" size="25" title="검색어를 입력하세요" id="p_keyword" name="search" class="search_input" value="">
											</c:otherwise>
											</c:choose>
											</li>
											<li><input type="image" src="../img/search_bt.gif" id="search_bt" name="search_bt" class="search_bt" alt="검색"></li>
										</ul>
										</fieldset>
									</form>
								</div>
							</div>
							
							
							</c:otherwise>
							</c:choose>
						</div>
					</div>
				
				</div>
			</div>
			<!--컨테이너끝 -->
		</div>
		
<c:import url="/footer" />