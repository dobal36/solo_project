<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.logincontainer{
		width:400px;
		margin:0 auto;
		padding:0 30px;
		overflow:auto;
		border:solid 5px #5181e3;
		border-radius:30px;
		margin-top:100px;
		margin-bottom:-450px;
	}
    #log{
    	width:400px; 
    	margin:0px auto;
    }
    #log>h1{
    	text-align: center;
    }
    
    #logfrm>ul>li{
        float: left;
		height: 40px; 
		line-height: 40px;
		width: 30%;
		border-bottom: 1px solid #ddd;
    }
    #logfrm>ul>li:nth-child(2n-1){
    	font-weight:bold;
		text-align:center;
	}
    #logfrm>ul>li:nth-child(2n){
    	width:70%;
    }
    #logfrm>ul>li:last-of-type{
    	width:100%; 
    	margin-bottom:25px;
    	text-align:center;
    	border:none;
    }
</style>
<script>
    function CheckForm(){
        if(document.querySelector("#userpwd").value==""){
            alert("비밀번호를 입력하세요.");
            document.querySelector("#userpwd").focus();
            return false;
        }
        return true;
    }
</script>
<div class="logincontainer">
	<div id=log>
	    <h1>본인 확인</h1>
	    <form method="post" action="/myapp/member/checkOk" id="logfrm" onsubmit="return CheckForm()">
		    <ul>
		        <li>아이디</li>
		        <li><input type="text" name="userid" id="userid" value="${vo.getUserid}"/></li>
		        <li>비밀번호</li>
		        <li><input type="password" name="userpwd" id="userpwd"/></li>
		        <li><input type="submit" value="로그인"/>
		            <input type="reset" value="취 소"/></li>
		    </ul>
	    </form>
	</div>
</div>