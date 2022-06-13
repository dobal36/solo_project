<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script src="//cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("content");
		
		$("#boardFrm").submit(function(){
			if($("#subject").val()==''){
				alert("글제목을 입력하세요");
				return false;
			}
		});
	});
</script>
<div class="boardcontainer">
	<h1>글수정</h1>
	<form method="post" action="/myapp/board/lotte/lotteboardEditOk" id="boardFrm">
		<input type="hidden" name="no" value="${vo.no}"/>
		<ul>
			<li>제목</li>
			<li><input type="text" name="subject" id="subject" value="${vo.subject}"/></li>
			<li><textarea name="content" id="content">${vo.content}</textarea></li>
			<li><input type="submit" value="글수정"/></li>
		</ul>
	</form>
</div>