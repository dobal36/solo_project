<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	function delCheck(){
		if(confirm("삭제하시겠습니까?")){
			location.href = "/myapp/board/afree/boardDel?no=${vo.no}";
		}
	}
	$(function(){
		function replyListAll(){
			var url = "/myapp/reply/list";
			var params = "no=${vo.no}";
			$.ajax({
				url:url,
				data:params,
				success:function(result){
					var $result = $(result);
					
					var tag = "<ul>";
					$result.each(function(idx, vo){
						tag += "<li><div>" + vo.nickname + " (" + vo.writedate + ") ";
	
						if(vo.nickname == '${logNick}'){
							tag += "<input type='button' value='Edit'/>";
							tag += "<input type='button' value='Del' title='"+vo.replyno+"'/>";
						}
						tag += "<br/><br/>" + vo.coment + "</div>";
						
						if(vo.nickname=='${logNick}'){
							tag += "<div style='display:none'><form method='post'>";
							tag += "<input type='hidden' name='replyno' value='"+vo.replyno+"'/>";
							tag += "<textarea name='coment' style='width:400px; height:50px;'>"+vo.coment+"</textarea>";
							tag += "<input type='submit' value='수정'/></form></div>";
						}	
						tag += "<hr/></li>";
					});
					tag += "</ul>";
					
					$("#replyList").html(tag);
					
				},error:function(e){
					console.log(e.responseText);
				}
				
			});
		}
		$("#replyFrm").submit(function(){
			event.preventDefault();
			if($("#coment").val()==""){
				alert("댓글을 입력후 등록하세요.")
				return;
			}else{
				var params = $("#replyFrm").serialize();
				$.ajax({
					url:'/myapp/reply/writeOk',
					data:params,
					type:'POST',
					success:function(r){
						$("#coment").val("");
						replyListAll();
					},error:function(e){
						console.log(e.responseText);
					}
				});
			}
		});
		$(document).on('click','#replyList input[value=Edit]',function(){
			$(this).parent().css("display","none");
			$(this).parent().next().css("display","block");
		});
        $(document).on('submit','#replyList form',function(){
            event.preventDefault();
            let params2 = $(this).serialize();
            let url2 = '/myapp/reply/editOk';
            $.ajax({
                url : url2,
                data : params2,
                type : 'POST',
                success : function(result){
                    console.log(result);
                    replyListAll();
                }, error : function(e){
                    console.log('수정에러');
                }
            });
        });
		$(document).on('click','#replyList input[value=Del]',function(){
			if(confirm('댓글을 삭제하시겠습니까?')){
				var params = "replyno=" + $(this).attr("title");
				$.ajax({
					url:'/myapp/reply/del',
					data:params,
					success:function(result){
						console.log(result);
						replyListAll();
					}, error:function(){
						console.log("댓글삭제에러발생...")
					}
				});
			}
		});
		replyListAll();
	});
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
	<c:if test="${logStatus=='Y'}">
		<form method='post' id="replyFrm">
			<input type="hidden" name="no" value="${vo.no}"/>
			<textarea name="coment" id='coment' style="width:500px; height:50px"></textarea>
			<input type="submit" value="댓글등록"/>
		</form>
	</c:if>
	<div>
		<c:if test="${logId==vo.userid}">
			<a href="/myapp/board/afree/boardEdit?no=${vo.no}">수정</a>
			<a href="javascript:delCheck()">삭제</a>
		</c:if>
	</div>
	<hr/>
	<div id="replyList">
		
	</div>
</div>