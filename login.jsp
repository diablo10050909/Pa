<%@ page import="java.io.*" %>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");

boolean success = false;

// CSV 파일 실제 경로
String path = application.getRealPath("users.csv");
BufferedReader br = new BufferedReader(new FileReader(path));

String line;
br.readLine(); // 헤더 스킵

while ((line = br.readLine()) != null) {
    String[] data = line.split(",");
    if (data[0].equals(id) && data[1].equals(pw)) {
        success = true;
        break;
    }
}
br.close();

if (success) {
    session.setAttribute("user", id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
