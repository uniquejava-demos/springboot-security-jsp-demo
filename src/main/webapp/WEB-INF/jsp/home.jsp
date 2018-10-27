<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring security example</title>
</head>
<body>

	<h1>Welcome!</h1>

	<p>
		click <a href="<spring:url value='/hello'/>">here</a> to see a
		greeting.
	</p>
</body>
</html>