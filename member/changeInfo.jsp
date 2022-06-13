<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.changecontainer{
		width:600px;
		margin:0 auto;
		padding:0 30px;
		overflow:auto;
		border:solid 5px #5181e3;
		border-radius:30px;
		margin-top:100px; 
		margin-bottom:-450px;
	}
	h1{
		text-align:center;
	}
	#menu>li:nth-child(4) a:link, #menu>li:nth-child(4) a:visited, #menu>li:nth-child(4) a:hover{
		color:pink;
	}
	#mFrm li{
		float: left;
		height: 40px; 
		line-height: 40px;
		width: 30%;
		border-bottom: 1px solid #ddd;
	}
	#mFrm li:nth-child(2n-1){
	font-weight:bold;
		text-align:center;
	}
	#mFrm li:nth-child(2n){
		width:70%;
	}
	#mFrm li:last-of-type {
    	width:100%; 
    	margin-bottom:25px;
    	text-align:center;
    	border:none;
	}
</style>
<script>
	$(function(){
		$("#mFrm").submit(function(){
			if($("#userpwd").val()==''){
				alert("비밀번호 입력 후 변경하세요.");
				return false;
			}
			if($("#username").val()==''){
				alert("이름을 입력하세요.");
				return false;
			}
			var reg = /^[0-9]{3,4}$/;
			var reg2 = /^[0-9]{4}$/;
			if(!reg.test($("#tel2").val()) || !reg2.test($("#tel3").val())){
				alert("전화번호를 잘못 입력하였습니다.");
				return false;
			}
			return true;
		});
	});
</script>
<div class='changecontainer'>
	<h1>회원정보변경</h1>
	<form method='post' action='/myapp/member/memberEditOk' id='mFrm'>
	<ul>
		<li>아이디</li>
		<li>${vo.userid}</li>
		<li>비밀번호</li>
		<li><input type='password' name='userpwd' id='userpwd' placeholder='비밀번호 입력'/></li>
		<li>이름</li>
		<li><input type='text' name='username' id='username' value="${vo.username}"/></li>
		<li>닉네임</li>
		<li><input type='text' name='nickname' id='nickname' value="${vo.nickname}"/></li>
		<li>연락처</li>
		<li>
			<select name='tel1'>
				<option value='010' <c:if test="${vo.tel1=='010'}">selected</c:if>>010</option>
				<option value='02' <c:if test="${vo.tel1=='02'}">selected</c:if>>02</option>
				<option value='031' <c:if test="${vo.tel1=='031'}">selected</c:if>>031</option>
				<option value='041' <c:if test="${vo.tel1=='041'}">selected</c:if>>041</option>
			</select>-
			<input type='text' name='tel2' id='tel2' maxlength='4' value="${vo.tel2}"/>-
			<input type='text' name='tel3' id='tel3' maxlength='4' value="${vo.tel3}"/>
		</li>
		<li><b>좋아하는 팀</b></li>
		<li>
			<select name="team">
			    <option value="kia">기아타이거즈</option>
			    <option value="hanwha">한화이글스</option>
			    <option value="lg">LG트윈스</option>
			    <option value="nc">NC다이노스</option>
			    <option value="ssg">SSG랜더스</option>
			    <option value="doosan">두산베어스</option>
			    <option value="lotte">롯데자이언츠</option>
			    <option value="samsung">삼성라이온즈</option>
			    <option value="kiwoom">키움히어로즈</option>
			    <option value="kt">KT위즈</option>
			</select>
		</li>
		<li><input type='submit' value='정보변경하기'/></li>
	</ul>
	</form>
</div>