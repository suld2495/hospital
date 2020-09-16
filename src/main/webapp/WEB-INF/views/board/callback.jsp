<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="<c:url value='/js/lib/jquery.1.12.4.js'/>"></script>
    <script>
        var path = "<c:out value='${path}'/>";
        var filName = "<c:out value='${fileName}' />";

        opener.parent.imgAdd("../../" + path + "/" + filName);
        window.close();
    </script>
    <title>Insert title here</title>
</head>
<body>
</body>
</html>