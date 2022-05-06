<%-- 
    Document   : user_order_cancel
    Created on : 21 Apr, 2022, 1:51:24 PM
    Author     : Nancy
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="P.Dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        try{
            String s_id=session.getAttribute("uname").toString();
            int b_id=Integer.parseInt(request.getParameter("b_id"));
        String sql="update cart_details set orderdate=NULL,deliverydate=NULL,payment_method=NULL,account_no='',status='' where s_id='"+s_id+"' and b_id="+b_id+"";
//        String sql1="update Rebicycle1.cart_details set status='' where s_id='"+s_id+"' and b_id="+b_id+"";
        PreparedStatement ps=new Dbcon().con.prepareStatement(sql);
//        PreparedStatement ps1=new bDcon().con.prepareStatement(sql1);
//        ps1.executeUpdate();
        ps.executeUpdate();
        response.sendRedirect("myOrders.jsp");
        }catch(Exception ex){
        ex.printStackTrace();
        }
        %>
    </body>
</html>
