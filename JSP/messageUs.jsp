
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../CSS/messageUs.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Message Us</title>
        <script type = "text/javascript" >
function preventBack() { window.history.forward(); }
setTimeout("preventBack()", 0);
window.onunload = function () { null };
</script>
    </head>
    <body>
        <%
        String msg=request.getParameter("msg");
        if("valid".equals(msg)){%>
            
            <h3 style="text-align:center; color:black;">Message successfully sent. Our team will contact you soon!</h3>
        <%
        }
        if("invalid".equals(msg)){%>
        
            <h3 style="text-align:center; color: black; ">Some thing Went Wrong! Try Again!</h3>
            
        <%}
        %>
        <br>
        <h1>Message US</h1>
        <br><br>
        <form action="messageUsAction.jsp" method="post">
            <input class="input-style" placeholder="Subject" type="text" name="subject" required>
            <br><br>
            <textarea class="input-style" name="body" placeholder="Enter your Message Here..." required></textarea>
            <br><br>
            <button class="button" type="submit">Send</button>
     
            
<a href="../HTML/type.html" class="button" style="margin-left: -1px;">Back</a>
        </form>
    </body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</html>
