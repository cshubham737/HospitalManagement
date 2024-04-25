<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@ include file="../Component/allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Patient details</p>
				<c:if test="${not empty successMsg }">
					<p class="text-center text-success fs-6">${successMsg}</p>
					<c:remove var="successMsg" scope="session" />
				</c:if>

				<c:if test="${not empty errorMsg }">
					<p class="text-center text-danger fs-6">${errorMsg}</p>
					<c:remove var="errorMsg" scope="session" />
				</c:if>

				<table class="table">
					<thread>
					<tr>
						<th scope="col">Full Name</th>
						<th scope="col">Gender</th>
						<th scope="col">Age</th>
						<th scope="col">Appointment Date</th>
						<th scope="col">Email</th>
						<th scope="col">Mob No</th>
						<th scope="col">Diseases</th>
						<th scope="col">Status</th>
						<th scope="col">Action</th>
					</tr>
					</thread>
					<tbody>
						<%
						AppointmentDAO dao = new AppointmentDAO(DbConnect.getConn());
						DoctorDao dao2 = new DoctorDao(DbConnect.getConn());
						List<Appointment> list = dao.getAllAppointment();
						for (Appointment ap : list) {
							Doctor d = dao2.getDoctorById(ap.getDoctorId());
						%>
						<tr>

							<th><%=ap.getFullname()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppointDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>
							<td><%=d.getFullName()%></td>
							<td><%=ap.getAddress()%></td>
							<td><%=ap.getStatus()%></td>
							
						</tr>
						<%
						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>