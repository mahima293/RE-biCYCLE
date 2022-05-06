<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="newpackage_servlet.AddToCartServlet"%>
<%@page import="newpackage_dao.Product_Dao"%>
<%@page import="newpackage_entities.Product"%>
<%@page import="P.Dbcon"%>
<%
    String s_id=session.getAttribute("uname").toString();
    String status="processing";
    try{
       PreparedStatement ps=new P.Dbcon().con.prepareStatement("update cart_details set status=? where s_id=? and status='bill'");
       ps.setString(1, status);
       ps.setString(2,s_id);
       int x=ps.executeUpdate();
       if(x>0)
       {
           out.println("huhuj");
       }
       response.sendRedirect("buy.jsp");
    }catch(Exception ex)
{
    System.out.println(ex);
}
%>
