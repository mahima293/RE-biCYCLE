<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="newpackage_servlet.AddToCartServlet"%>
<%@page import="newpackage_dao.Product_Dao"%>
<%@page import="newpackage_entities.Product"%>
<%@page import="P.Dbcon"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script type = "text/javascript" >
function preventBack() { window.history.forward(); }
setTimeout("preventBack()", 0);
window.onunload = function () { null };
</script>
    <body>
       <%
       String s_id=session.getAttribute("uname").toString();
       int b_id=Integer.parseInt(request.getParameter("id"));
       try{
       Statement st=new Dbcon().con.createStatement();
       st.executeUpdate("delete from cart_details where s_id='"+s_id+"' and b_id="+b_id+"");
       }catch(Exception ex){
       ex.printStackTrace();
       }
//ResultSet rs=st.executeUpdate("delete from Rebicycle1.cart_details where s_id='"+s_id+"' and b_id="+b_id+"");
       response.sendRedirect("cart.jsp");
       %>
    </body>
</html>
