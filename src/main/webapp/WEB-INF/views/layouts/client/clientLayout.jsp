<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <header>
        <nav>
            <tiles:insertAttribute name="header" />
        </nav>
    </header>

    <section>
            <tiles:insertAttribute name="contents" />
    </section>

    <footer>
        <tiles:insertAttribute name="footer" />
    </footer>
</body>
</html>
