<%-- 
    Document   : logout
    Created on : 8 Apr, 2022, 1:51:49 AM
    Author     : Nancy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
                if(request.getSession().getAttribute("uname")!=null) {
				request.getSession().removeAttribute("uname");
				response.sendRedirect("../HTML/login.html");
			}else {
				response.sendRedirect("../HTML/home.html");
			}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type = "text/javascript" >
function preventBack() { window.history.forward(); }
setTimeout("preventBack()", 0);
window.onunload = function () { null };
</script>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
