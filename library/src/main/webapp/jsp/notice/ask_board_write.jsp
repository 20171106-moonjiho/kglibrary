<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />
<script>
function notice_w_Check(){
	var title = document.getElementsByName('title');
	var content = document.getElementsByName('content');
	var checkbox = document.getElementById('agree1');
	if(title[0].value == ""){
		alert('제목을 입력해주세요.');
	}else if(content[0].value == ""){
		alert('내용은 필수 사항입니다.');
	}else if(!checkbox.checked){
		alert('약관에 동의해주세요.');
	}else{
		var f = document.getElementById('f');
		f.submit();
	}
}
</script>
<style>
.card{width: 800px; margin: 0 auto;}
.selectBox {
		  position: relative;
		  text-align:center;
		  width: 100px;
		  height: 35px;
		  border-radius: 10px;
		  border: 1px solid #999;
		}
.card-header1 h1{
	font-size: 30px;
	font-weight: 600;
}

.card-write{
	padding: 20px;
}
.card-write input, texarea{
	margin-left: 10px;
	padding: 10px;
	border: 1px solid #999;
	border-radius: 10px;
	box-shadow: 3px 3px 10px #e6e6e6;
}
.card-write .subject_title{
	font-size:13px;
	font-family: 600;
	margin-right: 10px;
}
.card-write .myinfo input[type="text"]{
	width: 25%;

}
.card-write .title-w input[type="text"]{
	margin-top: 20px;
	margin-bottom: 20px;
	width: 85.5%
}
.card-write .area{
	margin-top: 20px;
	margin-bottom: 20px;
}
.card-write .animalinfo{
	margin-top: 20px;
	margin-bottom: 20px;
}
.card-write .day{
	margin-top: 20px;
	margin-bottom: 20px;
}

.card-write .msg{
	margin-top: 20px;
}
.card-write .msg textarea{
	min-width: 90.5%;
	max-width: 90.5%;
	min-height: 200px;
	max-height: 200px;
	box-shadow: inset 3px 3px 10px #e6e6e6;
	
	vertical-align: top;
}
.card-write input[type="file"]{
	border: none;
	box-shadow: none;
	padding: 10px;
	
}
.btn-w{
	text-align:center;
	margin:0 auto;
	padding: 10px;
}
.btn-w input{
	border:none;
	background-color: lightcoral;
	padding: 10px;
	color: #fff;
	border-radius: 10px;
}
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
							<h2>게시글 등록</h2>
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
							<form action="ask_board_writeProc" method='post' id="f" enctype="multipart/form-data">
							<input type="hidden" name="no" value="${no }" />
							<input type="hidden" name="ref" value="${ref }" />
							<input type="hidden" name="step" value="${step }" />
							<input type="hidden" name="depth" value="${depth }" />
								<div class="table_bwrite">
									<table cellspacing="0" summary="묻고 답하기의 이름, 비밀번호, 내용을 입력">
										<colgroup>
										<col width="135">
										<col width="">
										</colgroup>
									<thead>
										<tr>
											<th scope="col" class="th_end" colspan="2">글쓰기</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row"><label for="b_subject"><img alt="*(필수항목)" src="/img/ic_vcheck.gif"> 제목</label></th>
											<td><input type="text" size="100" id="b_subject" name="title" class="board_input subject" onfocus="focus_on1(this);" onblur="focus_off1(this);" value="" maxlength="100" style="width:70%">
											<span class="text1">* 100자리 이내로 입력해주세요.</span>
											</td>
										</tr>
										
										<tr>
											<th scope="row"><label for="b_subject"><img alt="*(필수항목)" src="/img/ic_vcheck.gif"> 내용</label></th>
											<td>
											<textarea name="content" placeholder="내용을 입력하세요." style="width:90%; height: 230px;"></textarea>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for="b_subject">파일 업로드</label></th>
											<td>
											<p style="font-size:13px; ">
												<span style="color: lightcoral">※ 사진첨부시 주의사항</span><br>
												1. 사진용량이 너무 크거나, bmp 파일은 에러가 발생할 수 있습니다.<br>
												2. 사진의 파일명은 반드시 영문으로 등록해주세요.<br>
												3. 사진에 상세 입력사항을 넣거나 타사이트 주소를 게시할 경우 등록글은 삭제됩니다.<br>
												4. 업로드할 사진의 파일은 <span style="color: lightcoral">jpg, jpeg, png만</span> 가능합니다.
											</p>
											<br>
											<input type="file" name="upfile"><br>
											</td>
										</tr>
										<!-- 개인정보수집동의 항목 -->
										<tr>
											<th scope="row"><label for="b_subject"><img alt="*(필수항목)" src="/img/ic_vcheck.gif"> 개인정보수집동의</label></th>
											<td>
												<div class="line_box" style="height:160px">
													<ul class="list">
														<li>개인정보 수집 및 이용에 대한 동의 <br>
														1) 개인정보 수집·이용 항목 : 성명, 연락처 <br>
														2) 개인정보 수집·이용 목적 : 묻고답하기 <br>
														3) 개인정보의 보유기간 : 게시물 삭제 시까지 <br>
														4) 동의거부권 및 불이익 : 귀하는 개인정보 수집에 동의를 거부할 권리가 있으며, 동의를 거부하는 경우에는 해당 서비스를 이용할 수 없습니다. <br></li>
													</ul>
												</div>
												<p class="check"><input type="checkbox" name="agree1" id="agree1"> <label for="agree1">개인정보 수집 및 이용에 동의합니다.</label></p>
											</td>
										</tr>
										<!--// 개인정보수집동의 항목 -->
									</tbody>
									</table>
								</div>
								
								<div class="board_button2">
									<span><input id="submitbtn" type="button" value="글쓰기" onclick="notice_w_Check()"class="cbtn cbtn_point" ></span>
									<span><input type="button" value="목록"	 onclick="location.href='ask_Board'" class="cbtn cbtn_g"></span>
								</div>
								
							</form>
						
						<!-- board 끝 -->			
						</div>
					</div>
				
				</div>
			</div>
			<!--컨테이너끝 -->
		</div>
	
<c:import url="/footer" />  