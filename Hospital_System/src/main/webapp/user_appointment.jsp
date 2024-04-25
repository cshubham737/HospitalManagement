<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url(img/hospital.jpg);
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<%@include file="Component/allCss.jsp"%>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white">
	</div>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-3">
				<img alt="" src="img/doc.jpg" height="90%">
			</div>
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty successMsg }">
							<p class="text-center text-success fs-6">${successMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-6">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<form class="row g-3" action="addAppointment" method="post">
							<input type="hidden" name="userid" value="${userObj.id }">
							<div class="col-md-6">
								<label class="form-label">Full Name</label> <input required
									type="text" class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label>Gender</label><select class="form-control" name="gender"
									required>
									<option value="">--Select--</option>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label class="form-label">Age</label> <input required
									type="number" class="form-control" name="age">
							</div>

							<div class="col-md-6">
								<label class="form-label">Appointment Date</label> <input
									type="date" class="form-control" required name="appoint_date">
							</div>

							<div class="col-md-6">
								<label class="form-label">Email</label> <input required
									type="email" class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label class="form-label">Phone no</label> <input
									max-length="10" required type="number" class="form-control"
									name="phno">
							</div>

							<div class="col-md-6">
								<label class="form-label">Diseases</label> <input required
									type="text" class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Doctor</label><select
									class="form-control" name="doct" required>
									<option value="">--Select--</option>

									<%
									DoctorDao dao = new DoctorDao(DbConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%>
										(<%=d.getSpecialist()%>)
									</option>

									<%
									}
									%>



								</select>
							</div>

							<div class="col-md-12">
								<label>Full Address</label>
								<textarea required name="address" class=form-control rows="3"
									cols=""></textarea>
							</div>

							<c:if test="${empty userObj}">
								<a href="user_login.jsp"
									class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>

							<c:if test="${not empty userObj}">
								<button class="col-md 6 offset-md-3 btn btn-success">Submit</button>
							</c:if>

						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>