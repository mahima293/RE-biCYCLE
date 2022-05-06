<%@page import="java.sql.*"%>
<%@page import="P.Dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%String s_id=session.getAttribute("s_id").toString();
          int b_id=Integer.parseInt(request.getParameter("b_id"));
        String q="update cart_details set status='' where s_id='"+s_id+"' and b_id="+b_id+"";
        Statement st=new Dbcon().con.createStatement();
        st.executeUpdate(q);
        response.sendRedirect("seller_updates.jsp");

        %>
    </body>
</html>
