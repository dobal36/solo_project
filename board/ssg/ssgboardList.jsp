<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
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
	#menu>li:nth-child(2) a:link, #menu>li:nth-child(2) a:visited, #menu>li:nth-child(2) a:hover{
		color:pink;
	}
	h1{
		text-align:center;
		color:#cf0f2c;
	}
	.boardList{
		overflow:auto;
	}
	.boardlist>li{
		float:left;
		height:40px;
		line-height:40px;
		border-bottom:1px solid #ddd;
		width:10%;
	}
	.boardlist>li a:link, .boardlist>li a:visited, .boardlist>li a:hover{
		text-decoration:none;
		color:gray;
	}
	.boardlist>li a:hover{
		text-decoration:none;
		color:black;
		font-weight:bold;
	}
	.boardlist>li:nth-child(5n+2){
		width:60%;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	.boardlist>li:nth-child(2){
		text-align:center;
	}
	.boardlist>li:nth-child(5n+1){
		text-align:center;
	}
	.boardlist>li:nth-child(5n+3){
		text-align:center;
	}
	.boardlist>li:nth-child(5n+4){
		text-align:center;
	}
	.boardlist>li:nth-child(5n){
		text-align:center;
	}
	.paging{
		height:30px;
		display: table; margin-left: auto; margin-right: auto;
	}
	.paging>li{
		text-align:center;
		float:left;
		width:32px;
		height:24px;
		margin:15px;
	}
	.paging>li a:link, .paging>li a:visited, .paging>li a:hover{
		text-decoration:none;
		color:black;
	}
	.paging>li a:hover{
		text-decoration:none;
		font-weight:bold;
	}
	#searchFrm{
		width:304px;
		margin-bottom:30px;
		display: table; margin-left: auto; margin-right: auto;
	}
	
	#id{
		background-color:red;
	}
</style>
<script>
	$(function(){
		$("#searchFrm").submit(function(){
			if($("#searchWord").val()==""){
				alert("검색어를 입력하세요...");
				return false;
			}
		});
	});
</script>
<div class="boardcontainer">
	<h1>SSG랜더스</h1>
	<div><a href="<%=request.getContextPath()%>/board/ssg/ssgboardWrite">글쓰기</a></div>
	<form>
		<ul class=boardlist>
			<li>번호</li>
			<li>제목</li>
			<li>글쓴이</li>
			<li>조회수</li>
			<li>등록일</li>
			<c:forEach var="vo" items="${list}">
				<li>${vo.no}</li>
				<li><a href="/myapp/board/ssg/ssgboardView?no=${vo.no}">${vo.subject}</a></li>
				<li>${vo.nickname}</li>
				<li>${vo.hit}</li>
				<li>${vo.writedate}</li>
			</c:forEach>
		</ul>
	</form>
	
	<ul class="paging">
		<c:if test="${pVO.pageNum==1}">
			<li>이전</li>
		</c:if>
		<c:if test="${pVO.pageNum>1}">
			<li><a href="/myapp/board/ssg/ssgboardList?pageNum=${pVO.pageNum-1}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">이전</a></li>
		</c:if>
		<c:forEach var="p" begin="${pVO.startPage}" end="${pVO.startPage+pVO.onePageCount-1}">
			<c:if test="${p<=pVO.totalPage}">
				<c:if test="${p==pVO.pageNum}">
					<li style="background-color:#5181e3; border-radius:360px; font-weight:bold;">
				</c:if>
				<c:if test="${p!=pVO.pageNum}">
					<li>
				</c:if>
				<a href="/myapp/board/ssg/ssgboardList?pageNum=${p}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">${p}</a></li>
			</c:if>
		</c:forEach>
		<c:if test="${pVO.pageNum==pVO.totalPage}">
			<li>다음</li>
		</c:if>
		<c:if test="${pVO.pageNum<pVO.totalPage}">
			<li><a href="/myapp/board/ssg/ssgboardList?pageNum=${pVO.pageNum+1}<c:if test='${pVO.searchWord!=null}'>&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord}</c:if>">다음</a></li>
		</c:if>
	</ul>

	<form method="get" action="/myapp/board/ssg/ssgboardList" id="searchFrm">
		<select name="searchKey">
			<option value="subject">제목</option>
			<option value="content">글내용</option>
			<option value="userid">글쓴이</option>
		</select>
		<input type="text" name="searchWord" id="searchWord"/>
		<input type="submit" value="Search"/>
	</form>
</div>