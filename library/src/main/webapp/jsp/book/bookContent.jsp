<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/header" />

<script>
	function deleteCheck(){
		result = confirm('진짜로 삭제하겠습니까?');
		if(result == true){
			location.href="bookDeleteProc?no=${board.no}"
		}
	}
	function rentCheck(){
		var userId = '<%= session.getAttribute("id") %>';
		
	    if (userId == "null" || userId.trim() == "") {
	        alert("로그인이 필요합니다.");
	        location.href = "login";
	    }
	    else{
		result = confirm('대여 하시겠습니까?');
		if(result == true){
			location.href="rentalProc?no=${board.no}"
		}
	    }
	}
	
	function returnCheck(){
		var userId = '<%= session.getAttribute("id") %>';
		
	    if (userId == "null" || userId.trim() == "") {
	        alert("로그인이 필요합니다.");
	        location.href = "login";
	    }
	    else{
		result = confirm('반납 하시겠습니까?');
		if(result == true){
			location.href="returnProc?no=${board.no}"
		}
	    }
	}
	
	

</script>


<div align="center" style="margin-top: 100px; margin-bottom:50px;">
	<h1>${board.title_info}</h1>
		
	<table border='1' style="margin-top: 50px;">
		<tr>
			<th width="100">제목</th>
			<td width="200">${board.title_info}</td>
			<th width="100">작성자</th>
			<td width="200">${board.author_info }</td>
			<th width="70">발행자</th>
			<td whdth="200">${board.pub_info}</td>
		</tr>
		<tr>
			<th width="100">카테고리</th>
			<td width="200">${board.category}</td>
			<th width="100">발행연도</th>
			<td width="200">${board.pub_year_info }</td>
			<th width="70">비치일</th>
			<td whdth="200">${board.reg_date}</td>
		</tr>
		<tr>
			<c:set var="borrowPerson" value="${board.borrowperson}" />
			
			<th width="100">대여 여부</th>
		<c:choose>
   	 		<c:when test="${borrowPerson eq '대여 가능'}">
   	 		 <td width="200">${board.borrowperson}</td>
    		</c:when>
    		<c:when test="${sessionScope.id eq borrowPerson}">
   	 		<td width="200" colspan="5">
    	   		<button type="button" onclick="returnCheck()">반납 ${rentaldate} 까지 </button>
    	   	</td>
    		</c:when>
    		<c:otherwise>
    		 <td width="200" colspan="5">대여 중  -  예상 반납 시간 : ${rentaldate} 까지</td>
    		</c:otherwise>
		</c:choose>
			
		<c:choose>
		<c:when test="${not empty board.image && board.category ne 'API'}">
		<img width ="300" src="/img/admin/${board.image }">
		</c:when>
		<c:otherwise>
		<img width ="300" src="${board.image }">
		</c:otherwise>
		</c:choose>
		</tr>
		<tr>
			<th>문서내용</th>
			<td colspan="6">${board.detail_link }</td>	
			</td>	
		</tr>
		


		<tr>
			<td colspan="6" align="center">
				<button type="button" onclick="location.href='bookForm'">목록</button>
		<c:choose>
			<c:when test="${sessionScope.id eq 'admin'}">
				<button type="button" onclick="deleteCheck()">삭제</button> 
			</c:when>
		</c:choose>
		
		<c:choose>
   	 		<c:when test="${borrowPerson eq '대여 가능'}">
   	 		 <input type="hidden" id="userId" value="<%= session.getAttribute("id") %>">
    	   		<button type="button" onclick="rentCheck()">대여</button>
    		</c:when>
		</c:choose>


				
			</td>
		</tr>
	
	</table>
</div>

<c:import url="/footer" />












