<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");

  if("admin".equals(id) && "1234".equals(pw)) {
    session.setAttribute("user", id);
%>

<!DOCTYPE html>
<html>
<head>
<title>Main</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<div class="box">
  <h2>Welcome</h2>
  <p><%= id %> logged in</p>
</div>

</body>
</html>

<%
  } else {
    response.sendRedirect("index.html");
  }
%>
