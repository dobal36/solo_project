<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function noticedelCheck(){
		if(confirm("삭제하시겠습니까?")){
			location.href = "/myapp/board/notice/noticeboardDel?no=${vo.no}";
		}
	}
</script>
<style>
	h1{
		margin-left:10px;
		margin-bottom:10px;
	}
	.boardcontainer>ul>li:nth-child(1){
		margin-left:10px;
		margin-bottom:10px;
	}
	.boardcontainer>ul>li:nth-child(2){
		text-align:right;
		margin-top:-31.6px;
		margin-bottom:10px;
	}
	.boardcontainer>ul>li:last-of-type{
		background-color:#ddd;
		height:100px;
	}
	.boardcontainer>ul>li:last-of-type>p{
		margin: 0;
    	margin-left:10px;
	}
	hr{
		margin:0;
	}
	.boardcontainer{
		width:1000px;
		margin:0 auto;
		padding:0 30px;
		overflow:auto;
		border:solid 5px #5181e3;
		border-radius:30px;
		margin-top:100px; 
		margin-bottom:-450px;
	}
	#edit{
		text-align:right;
	}
</style>
<div class="boardcontainer">
	<h1>${vo.subject}</h1>
	<ul>
		<li>글번호 : ${vo.no} | 작성자 : ${vo.nickname} | 작성일 : ${vo.writedate} | IP : ${vo.ip}</li>
		<li>조회수 : ${vo.hit}</li>
		<hr/>
		<li>${vo.content}</li>
	</ul>
	<hr/>
	<div id="edit">
		<c:if test="${logNick==vo.nickname}">
			<a href="/myapp/board/notice/noticeboardEdit?no=${vo.no}">수정</a>
			<a href="javascript:noticedelCheck()">삭제</a>
		</c:if>
	</div>
	<div id="replyList">
		
	</div>
</div>