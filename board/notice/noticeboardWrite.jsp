<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
<style>
	h1{
		text-align:center;
	}
	#subject{
		width:99.2%;
	}
	#boadrFrm li{
		padding:10px 5px;
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
	li:last-of-type{
		margin-bottom:30px;
	}
</style>
<script>
	$(function(){
		CKEDITOR.replace("content");
		
		$("#boardFrm").submit(function(){
			if($("#subject").val()==''){
				alert("제목을 입력하세요");
				return false;
			}
		});
	});
</script>
<div class="boardcontainer">
	<h1>글쓰기</h1>
	<form method="post" action="/myapp/board/notice/noticeboardWriteOk" id="boardFrm">
		<ul>
			<li>제목</li>
			<li><input type="text" name="subject" id="subject"/></li>
			<li><textarea name="content" id="content"></textarea></li>
			<li><input type="submit" value="등록"/></li>
		</ul>
	</form>
</div>