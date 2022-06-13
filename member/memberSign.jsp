<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	body{
		background-color:#ddd;
	}
	#h1{
		text-align:center;
	}
	
	.signcontainer{
		width:600px;
		margin:0 auto;
		padding:0 30px;
		overflow:auto;
		border:solid 5px #5181e3;
		border-radius:30px;
		margin-top:100px;
		margin-bottom:-450px;
		background-color:white;
	}
	
	#mFrm li{
		float: left;
		height: 40px; 
		line-height: 40px;
		width: 30%;
		border-bottom: 1px solid #ddd;
	}
	#mFrm li:nth-child(2n-1){
		text-align:center;
	}
	#mFrm li:nth-child(2n) {
		width:70%;
	}
	#mFrm li:last-of-type {
    	width:100%; 
    	margin-bottom:25px;
    	text-align:center;
    	border:none;
	}
</style>
<script src='/myapp/js/member.js'></script>
<script>
	$(function(){
		// 아이디 중복검사
		$("#userid").keyup(function(){
			var userid = $("#userid").val();
			if(userid != '' && userid.length>=6){
				var url = "/myapp/member/memberIdCheck";
				$.ajax({
					url:url,
					data:"userid="+userid,
					type:"POST",
					success:function(result){
						if(result>0){	// 사용불가능하다.
							$("#chk").html("사용불가능")
							$("#idchk").val("N");
							$("#chk").css("color", "red");
						}else{	// 사용가능하다.
							$("#chk").html("사용가능")
							$("#idchk").val("Y");
							$("#chk").css("color", "blue");
						}
					}
				});
			}else{	// 사용불가능하다.
				$("#chk").html("사용불가능합니다.")
				$("#idchk").val("N");
				$("#chk").css("color", "red");
			}
		});
	});
</script>
<div class='signcontainer'>
	<h1 id="h1">회원가입</h1>
	<form method='post' action='/myapp/member/memberOk' id='mFrm' onsubmit='return memberCheck()'>
		<ul>
			<li><b>아이디</b></li>
			<li>
				<input type='text' name='userid' id='userid' placeholder='아이디 입력'/>
				<input type='button' value='아이디 중복 확인'/>
				<span id='chk'></span>
				<input type="hidden" id="idchk" value='N'/>
			</li>
			<li><b>비밀번호</b></li>
			<li><input type='password' name='userpwd' id='userpwd' placeholder='비밀번호 입력'/></li>
			<li><b>비밀번호 확인</b></li>
			<li><input type='password' name='userpwd2' id='userpwd2' placeholder='비밀번호 확인'/></li>
			<li><b>이름</b></li>
			<li><input type='text' name='username' id='username' placeholder='이름 입력'/></li>
			<li><b>닉네임</b></li>
			<li><input type='text' name='nickname' id='nickname' placeholder='닉네임 입력'/></li>
			<li><b>연락처</b></li>
			<li>
				<select name='tel1'>
					<option value='010'>010</option>
					<option value='02'>02</option>
					<option value='031'>031</option>
					<option value='041'>041</option>
				</select>-
				<input type='text' name='tel2' id='tel2' maxlength='4'/>-
				<input type='text' name='tel3' id='tel3' maxlength='4'/>
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
			<li><input type='submit' value='가입하기'/></li>
		</ul>
	</form>
</div>