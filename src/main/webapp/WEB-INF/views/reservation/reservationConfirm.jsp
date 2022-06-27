<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<h1>예약 확인</h1>
	
	객실 이미지        객실 이름 및 타입
	
	체크인             체크아웃
	
	예약번호${reservation.reserNo}
	투숙인원${reservation.reserPeople}
	투숙객 이름
	투숙객 전화번호
	<c:if test="${session == null }">
			<div>
				이름 <input type="text" name="name" id="name" value="ksj" readonly><br>
				연락처 <input type="text" name="tel" id="tel" value="01012345678" readonly><br>
				이메일 <input type="text" name="email" id="email" value="rlawo32@naver.com" readonly><br>
				체크인 <input type="text" name="checkin" id="checkin" value="" readonly>
				체크아웃 <input type="text" name="checkout" id="checkout" value="" readonly>
			</div>
		</c:if>
		<c:if test="${session != null }">
			<div>
				비회원 이름 <input type="text" name="nonName" id="nonName" value="${session.nonName}" readonly>
				비회원 연락처 <input type="text" name="nonTel" id="nonTel" value="${session.nonTel}" readonly><br>
			</div>
		</c:if>
	
	총 결제 금액
	결제 금액 세부사항(조식비 + 객실비)

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>