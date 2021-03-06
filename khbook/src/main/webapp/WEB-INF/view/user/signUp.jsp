<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>KH BOOKs Sign Up</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!--<link rel="stylesheet" href="css/custom-styles.css">-->


<!-- Favicons -->
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>


<!-- 아코디언 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
#accordion-resizer {
	padding: 10px;
	width: 350px;
	height: 220px;
}
</style>
<!-- https://getbootstrap.com/docs/4.3/utilities/borders/ -->

<fmt:formatDate value="${bean.date}" pattern="yyyy-MM-dd" />


<script type="text/javascript">
	$(document).ready(function() {

		$(function() {
			$("#accordion").accordion({
				heightStyle : "fill"
			});

			$("#accordion-resizer").resizable({
				minHeight : 140,
				minWidth : 200,
				resize : function() {
					$("#accordion").accordion("refresh");
				}
			});
		});

		$('#allChk').click(function() {
			if ($('#allChk').prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		});

		
		$('#idchk_btn').on('click', checkId);
	});//end ready

	var idchk = 0;
	function checkId() {
		var userId = $("#id").val();
		console.log(userId);
		$.ajax({
				async: true,
	            type : 'POST',
	            data : userId,
				url : 'checkId.kh',
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
				if(data.cnt > 0) {
					alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
				    idchk = 0;
				}else {
					alert("사용가능한 아이디입니다.");
					idchk = 1;
				}
			}

		});
	}

	//https://kingchobocoding.tistory.com/11?category=978301


	function joinChk() {
		var pwd = $('#userPwd').val();
		var pwdchk = $('#userPwdChk').val();

		/* if($("input[type=radio]").prop("checked", false)){
			document.getElementById('noGen').innerHTML = '성별을 선택해 주세요.';
			return false;
		} */
		
		if(confirm("회원가입을 하시겠습니까?")){
	        if(idchk==0){
	            alert('아이디 중복체크를 해주세요');
	            return false;
	        }else{
	        alert("회원가입이 완료되었습니다.");
				return true;
	        }
	    }
		
		if(pwd.length() < 9){
			alert("비밀번호를 8자리 이상 입력해주세요.");
			return false;
		}
		
		if (pwd != pwdchk) {
			document.getElementById('pwrong').innerHTML = '비밀번호가 틀렸습니다. 다시 입력해 주세요';
			return false;
		}
		

	}//end join check
</script>
</head>

<body>

	<div class="container main-container" style="width: 800px;">

		<!-- Begin Header -->
		<div class="row">
			<div class="col" style="text-align: center">
				<a href="index.htm"><h4>KH BOOKs</h4></a>
				<hr />
				</div>
		</div>
		<!-- End Header -->



		<div class="container" style="width:700px;">
			<!--User Login-->
			<form method="post" action="signUp.kh" onsubmit="return joinChk(this)">
				<div class="row">
					<div class="col-4">
						<input type="text" class="form-control" id="id" name="id"
							placeholder="아이디" required>
					</div>
					<div class="col-md-2">
						<input class="btn btn-primary" type="button" id="idchk_btn" value="중복확인" />
					</div>
					<p id="sameid" style="color: red;"></p>
				</div>
					<br/>
				<div class="row">
					<div class="col-4">
					<input type="password" class="form-control" id="userPwd" name="upwd" placeholder="비밀번호" required>
					</div>
					<div class="w-100"></div>
					<div class="col-4">
					<input type="password" class="form-control" id="userPwdChk" placeholder="비밀번호 확인">
					</div>
					<p id="pwrong" style="color: red;"></p>
				</div>
					<br/>
				
				<div class="row">
					<div class="col-4">
						<input type="text" class="form-control" id="userName" name="uname" placeholder="이름" required>
					</div>
				</div>
					<br/>
				
				<div class="row">
					<div class="col-4">
						<input type="email" class="form-control" id="userEmail"	name="uemail" aria-describedby="emailHelp" placeholder="이메일 주소" required> 
					</div><p id="sameEmail" style="color: red;"></p>
				</div>
					<br/>
				<div class="row">
					<div class="col-4">
						<input type="text" class="form-control" id="userPhone" name="uphone" placeholder="전화번호" required>
					</div>
				</div>
				
				<div class="row">
					<div class="col-4">
					<label>생년월일</label>
					<input type="date" class="form-control" id="userBirth" name="ubirth" required>
					</div>
				</div>
					<br/>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="ugender" value=1>
					<label class="form-check-label" for="inlineRadio1">남</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="ugender" value=2>
					<label class="form-check-label" for="inlineRadio2">여</label>
				</div>
				<p id="noGen" style="color: red;"></p>

				<hr />

				<label>약관동의</label>
				<div id="accordion-resizer" class="ui-widget-content">
					<div id="accordion">
						<h3>회원 약관</h3>
						<div>
							<p>-제 1장 총칙- 제 1 조 (목적) 1. 본 약관은 KHBOOKS 사이트가 제공하는 모든 서비스(이하
								"서비스")의 이용조건 및 절차, 이용자와 KHBOOKS 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을
								규정함을 목적으로 합니다. 제 2 조 (약관의 효력과 변경) 1. KHBOOKS 사이트는 귀하가 본 약관 내용에
								동의하는 경우 KHBOOKS 사이트의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로
								적용됩니다. 2. KHBOOKS 사이트는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 KHBOOKS
								사이트 내에 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다. 이용자가 변경된
								약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며 계속 사용의 경우는 약관
								변경에 대한 동의로 간주 됩니다. 제 3 조 (약관 외 준칙) 1. 본 약관에 명시되지 않은 사항은 전기통신기본법,
								전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.
								제 4 조 (용어의 정의) 본 약관에서 사용하는 용어의 정의는 다음과 같습니다. 1. 이용자 : 본 약관에 따라
								KHBOOKS 사이트가 제공하는 서비스를 받는 자. 2. 가입 : KHBOOKS 사이트가 제공하는 신청서 양식에
								해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위. 3. 회원 : KHBOOKS 사이트에
								개인 정보를 제공하여 회원 등록을 한 자로서 KHBOOKS 사이트가 제공하는 서비스를 이용할 수 있는 자. 4.
								비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와
								숫자의 조합. 5. 탈퇴 : 회원이 이용계약을 종료시키는 행위. 제 2 장 서비스 제공 및 이용 제 5 조
								(이용계약의 성립) 1. 이용계약은 신청자가 온라인으로 KHBOOKS 사이트에서 제공하는 소정의 가입신청 양식에서
								요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다. 2. KHBOOKS 사이트는 다음 각 호에 해당하는
								이용계약에 대하여는 가입을 취소할 수 있습니다. ① 다른 사람의 명의를 사용하여 신청하였을 때 ② 이용계약 신청서의
								내용을 허위로 기재하였거나 신청하였을 때 ③ 다른 사람의 KHBOOKS 사이트 서비스 이용을 방해하거나 그 정보를
								도용하는 등의 행위를 하였을 때 ④ KHBOOKS 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우 ⑤
								기타 KHBOOKS 사이트가 정한 이용신청요건이 미비 되었을 때 제 6 조 (회원정보 사용에 대한 동의) 1.
								회원의 개인정보는 공공기관의 개인정보보호에 관한 법률에 의해 보호됩니다. 2. KHBOOKS 사이트의 회원 정보는
								다음과 같이 사용, 관리, 보호됩니다. ① 개인정보의 사용 : KHBOOKS 사이트는 서비스 제공과 관련해서 수집된
								회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해
								국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 또는 기타
								관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 KHBOOKS 사이트에 제공한 개인정보를 스스로 공개한
								경우에는 그러하지 않습니다. ② 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의
								개인정보관리에서 수시로 귀하의 개인정보를 수정/삭제할 수 있습니다. ③ 개인정보의 보호 : 귀하의 개인정보는 오직
								귀하만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 귀하의 ID와 비밀번호에 의해 관리되고 있습니다. 따라서
								타인에게 본인의 ID와 비밀번호를 알려주어서는 안되며, 작업 종료 시에는 반드시 로그아웃 해 주시기 바랍니다. 3.
								회원이 본 약관에 따라 이용신청을 하는 것은, KHBOOKS 사이트가 신청서에 기재된 회원정보를 수집, 이용하는
								것에 동의하는 것으로 간주됩니다. 제 7 조 (사용자의 정보 보안) 1. 가입 신청자가 KHBOOKS 사이트 서비스
								가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여
								발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다. 2. ID와 비밀번호에 관한 모든 관리의 책임은 회원에게
								있으며, 회원의 ID나 비밀번호가 부정하게 사용 되었다는 사실을 발견한 경우에는 즉시 KHBOOKS 사이트에
								신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다. 종료하지 아니함으로써 제3자가
								귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 KHBOOKS 사이트는 책임을
								부담하지 아니합니다. 제 8 조 (서비스의 중지) 1. KHBOOKS 사이트는 이용자가 본 약관의 내용에 위배되는
								행동을 한 경우, 임의로 서비스 사용을 제한 및 중지할 수 있습니다. 제 9 조 (서비스의 변경 및 해지) 1.
								KHBOOKS 사이트는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여
								책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을
								지지 않습니다. 의한 손해에 대하여 책임을 부담하지 아니합니다. 제 10 조 (게시물의 저작권) 1. 귀하가 게시한
								게시물의 내용에 대한 권리는 귀하에게 있습니다. 2. KHBOOKS 사이트는 게시된 내용을 사전 통지 없이 편집,
								이동할 수 있는 권리를 보유하며, 게시판운영 원칙에 따라 사전 통지 없이 삭제할 수 있습니다. 3. 귀하의 게시물이
								타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야 합니다. 제 3 장 의무 및
								책임 제 11 조 (KHBOOKS 사이트의 의무) 1. KHBOOKS 사이트는 회원의 개인 신상 정보를 본인의
								승낙없이 타인에게 누설, 배포하지 않습니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가
								있는 경우에는 그러하지 아니합니다. 제 12 조 (회원의 의무) 1. 회원 가입 시에 요구되는 정보는 정확하게
								기입하여야 합니다. 또한 이미 제공된 귀하에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은
								자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다. 2. 회원은 KHBOOKS 사이트의 사전 승낙 없이
								서비스를 이용하여 어떠한 영리행위도 할 수 없습니다. 제 4 장 기타 제 13 조 (양도금지) 1. 회원이 서비스의
								이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다. 제 14 조 (손해배상) 1.
								KHBOOKS 사이트는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 KHBOOKS 사이트가
								고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다. 제 15 조 (면책조항) 1.
								KHBOOKS 사이트는 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. KHBOOKS
								사이트는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다.
								금전적 거래등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여
								책임을 부담하지 않습니다. 제 16 조 (재판관할) 1. KHBOOKS 사이트와 이용자 간에 발생한 서비스 이용에
								관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 대한민국의 법원에 제기합니다.</p>
						</div>
						<h3>개인정보 수집 및 이용 동의</h3>
						<div>
							<p>
								KHBOOKS은 「개인정보보호법」 제15조제1항제1호, 제17조제1항제1호, 제23조제1호, 제24조제1항 제1호에
								따라 아래와 같이 개인정보의 수집. 이용에 관하여 귀하의 동의를 얻고자 합니다. KHBOOKS은 이용자의 사전 동의
								없이는 이용자의 개인정보를 함부로 공개하지 않으며, 수집된 정보는 아래와 같이 이용하고 있습니다. 이용자가 제공한
								모든 정보는 아래의 목적에 필요한 용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 이를 알리고 동의를 구할
								것입니다. 개인정보의 수집 및 이용 동의 1. 개인정보의 수집 및 이용 목적 가. 서비스 제공에 관한 업무 이행 -
								컨텐츠 제공, 특정 맞춤 서비스 제공(마이페이지, 뉴스레터 등), 기업 애로상담 나. 회원관리 - 회원제 서비스
								이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 가입의사 확인, 가입 및 가입횟수 제한, 추후 법정 대리인
								본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 공지사항 전달 2. 수집하는 개인정보의 항목
								<개인회원 가입> 필수항목 : 아이디, 비밀번호, 이름, 핸드폰번호, 이메일 선택항목 : 이메일
								수신여부, 문자수신여부, 웹진구독여부 <기업회원 가입> 필수항목 : 아이디, 비밀번호, 담당자 이름,
								담당자 전화번호, 핸드폰번호, 이메일, (법인기업의 경우 법인등록번호), 기업정보(회사명, 대표자명,
								사업자등록번호, 회사전화번호, 주소, 지역, 대표업종) 선택항목 : 팩스번호, 홈페이지주소, 회사이메일주소,
								창업일자, 부업종, 매출액, 수출액, 상시근로자 수, 주요생산품명, 이메일 수신여부, 문자수신여부, 웹진구독여부 <전문가
									가입> 필수항목 : 아이디, 비밀번호, 이름, 핸드폰번호, 이메일, 최종학력, 협약사항, 지역 선택항목
								: 소속기관명, 대표자명, 사업자번호, 소속기관 전화번호 전문가정보는 기업애로상담을 위한 목적으로 수집하나 보유하지
								않고 비즈니스사업단으로 시스템연계 제공 <자동수집> IP주소, 쿠키, 서비스 이용기록, 방문기록 등
								3. 개인정보의 보유 및 이용기간 KHBOOKS은 원칙적으로 보유기간의 경과, 개인정보의 수집 및 이용목적의 달성
								등 그 개인정보가 불필요하게 되었을 때에는 지체 없이 파기합니다. 다만, 다른 법령에 따라 보존하여야 하는 경우에는
								그러하지 않을 수 있습니다. 불필요하게 되었을 때에는 지체 없이 해당 개인정보를 파기합니다. 회원정보 - 탈퇴 후
								지체없이 파기 전문가정보 - 전문가 정보는 기업애로상담을 위한 목적으로 수집하나 보유하지 않고 비즈니스사업단으로
								시스템연계 제공함 4. 동의거부권 및 불이익 정보주체는 개인정보 수집에 동의를 거부할 권리가 있습니다. 다만, 필수
								항목에 대한 동의를 거부할 시 저희가 제공하는 서비스를 이용할 수 없습니다. 
							</p>
						</div>
						<h3>마케팅/홍보의 수집의 이용 동의</h3>
						<div>
							<p>마케팅/홍보의 수집의 이용 동의 1. 개인정보의 수집 및 이용 목적 신규 서비스 개발 및 마케팅ㆍ광고에의
								활용 - 신규 서비스 개발, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속 빈도 등 회원의 서비스 이용에
								대한 통계 2. 수집하는 개인정보의 항목 필수항목 : 이름 선택항목 : 이메일, 연락처(휴대전화번호, 유선전화번호
								중 1개 선택) 3. 개인정보의 보유 및 이용기간 이용목적의 달성 후 지체없이 파기 4. 동의거부권 및 불이익
								개인정보의 마케팅/홍보의 수집 및 이용 동의를 거부하시더라도 회원 가입 시 제한은 없습니다. 다만, 마케팅 활용
								서비스 안내 및 참여에 제한이 있을 수 있습니다.</p>
						</div>
					</div>
				</div>
				<br />
				
				<div>
					<input type="checkbox" id="allChk">전체선택
				</div>
				<div>
					<input type="checkbox" id="c1">회원 약관(필수)
				</div>
				<div>
					<input type="checkbox" id="c2">개인정보 수집 및 이용 동의(필수)
				</div>
				<div>
					<input type="checkbox">마케팅/홍보의 수집의 이용 동의(선택)
				</div>
				<br />

				<div class="row">
					<div class="col-2">
						<input type="submit" id="signUp_btn" class="form-control btn btn-primary signupbtn" value="회원가입">
					</div>
				</div>


			</form>
		</div>


	</div>
	<!-- End Container -->
</body>
</html>
