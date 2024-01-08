<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />

<script>
	function deleteCheck() {
		result = confirm('진짜로 삭제하겠습니까?');
		if (result == true) {
			location.href = 'ContentDeleteProc?no=${board.no}'
		}
	}
</script>


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
								<li class="on">
									<a href="noticeBoard">공지사항
									</a>
								</li>
								<li>
									<a href="ask_board">묻고 답하기
									</a>
								</li>
								<li>
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
							<h2>묻고 답하기</h2>
							<!-- 현재위치 -->
							<div id="location">
								<ul>
									<li>홈</li>
									<li>이용자마당</li>
									<li class="now">묻고 답하기</li>
								</ul>
							</div>
							<!-- //현재위치 -->
						</div>
					
					<div id="cont_wrap">
						<div id="board" style="width:100%;">
							<div class="table_bview">
							<table cellspacing="0" summary="공지사항 의 작성일, 작성자, 조회수 및 내용">
							
							<thead>
								<tr>
									<th scope="col"><span class="category_color"></span>${board.title }</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<dl class="info">
											<dt>작성일</dt>
											<dd>${board.writeDate }</dd>
										</dl>
										<dl class="info">
											<dt>작성자</dt>
											<dd>${board.id }</dd>
										</dl>
										<!-- 
										<dl class="info">
											<dt>조회</dt>
											<dd>205</dd>
										</dl>
										 -->
									</td>
								</tr>
								<tr>
									<td class="content">
										<c:if test="${board.image != null}">
										<img src="../img/${board.id}/${board.image}">
										<br>
										</c:if>	
										${board.content }		
									</td>
								</tr>
							</tbody>
							</table>
							</div>
							
							<div class="board_button">
								<div class="fr">
								<span class="bt"><input type="button" value="목록" onclick="location.href='ask_board'" class="cbtn cbtn_g"></span>
								<span class="bt">
								<input type="button" value="답글" 
								class="cbtn cbtn_g" onclick="location.href='ask_board_write?no=${board.no }&ref=${board.ref }&step=${board.step }&depth=${board.depth }'">
								</span>
								<c:if test="${sessionScope.id eq board.id}">
								<span class="bt"><input type="button" value="수정" onclick="location.href='ask_board_Modify?no=${board.no }'" class="cbtn cbtn_g"></span>
								<span class="bt"><input type="button" value="삭제" onclick="deleteCheck()" class="cbtn cbtn_g"></span>
								</c:if>
								</div>
							</div>
							
						</div>
					</div>
				
				</div>
			</div>
			<!--컨테이너끝 -->
		</div>
		
