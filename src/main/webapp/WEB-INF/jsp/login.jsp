<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<spring:message code="user.text"/>
<form id="login" action="submituser.json">
<input type="text" name="uname" value="" />
<input type="password" name="password" value="" />
<input type="submit" value="login"/>

</form>
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/login.js"></script>
</body>
</html>