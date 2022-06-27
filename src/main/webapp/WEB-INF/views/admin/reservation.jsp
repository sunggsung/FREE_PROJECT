<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script>

	$(function(){
		fnFindMemberList();
	})
	
	function fnFindMemberList() {
		$.ajax({
			url: '${contextPath}/admin/findMembers',
			type: 'GET',
			success: function(obj) {
				$('#members').empty();
				$.each(obj.members, function(i, member) {
					var tr = '<tr>';
					tr += '<td>' + member.memberNo + '</td>';
					tr += '<td>' + member.memberId + '</td>';
					tr += '<td>' + member.memberName + '</td>';
					tr += '<td>' + member.memberEmail + '</td>';
					tr += '<td>' + member.memberPhone + '</td>';
					tr += '<td>' + member.memberBirth + '</td>';
					tr += '<td><input type="button" value="예약내역확인"></td>';
					tr += '</tr>';
					$('#members').append(tr);
				})
			}
		})
	}
	
</script>
<link rel="stylesheet" href="../resources/css/admin.css">
</head>
<body>
	
	<div class="container">
		<jsp:include page="index.jsp"></jsp:include>
		
		<div class="grid_item member">
			<h3>예약 목록</h3>
			<table class="table">
				<thead>
					<tr>
						<td>예약번호</td>
						<td>아이디</td>
						<td>이름</td>
						<td>이메일</td>
						<td>연락처</td>
						<td>가입일</td>
						<td>비고</td>
					</tr>
				</thead>
				<tbody id="members">
				</tbody>
			</table>
		</div>
		
	</div>

</body>
</html>