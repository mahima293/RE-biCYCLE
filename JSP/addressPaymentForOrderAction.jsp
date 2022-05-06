<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.*"%>
<%@page import=" java.time.LocalDateTime"%> 
<%@page import=" java.time.format.DateTimeFormatter"%> 
<%@page import="java.util.*"%>
<%@page import="newpackage_servlet.AddToCartServlet"%>
<%@page import="newpackage_dao.Product_Dao"%>
<%@page import="newpackage_entities.Product"%>
<%@page import="P.Dbcon"%>
<%
    LocalDate cd1=LocalDate. now() ;
    LocalDate cd2=cd1.plusDays(7);
    String s_id=session.getAttribute("uname").toString();
    String hname=request.getParameter("address");
    int rno=Integer.parseInt(request.getParameter("rno"));
    long contact_no=Long.parseLong(request.getParameter("mobileNumber"));
    String paymentMethod=request.getParameter("paymentMethod");
    String accno=null;
    accno=request.getParameter("accno");
    System.out.println(accno);
    String status="bill" ;
    try{
        
            PreparedStatement ps=new P.Dbcon().con.prepareStatement("update cart_details set hostel_name=?,room_no=?,contach_no=?,orderdate=CURRENT_DATE,deliverydate='"+cd2+"', payment_method=?,account_no=?,status=? where s_id=? and (status='' or status='bill')");
            ps.setString(1, hname);
            ps.setInt(2, rno);
            ps.setLong(3, contact_no);
            ps.setString(4, paymentMethod);
            ps.setString(5, accno);
            ps.setString(6, status);
            ps.setString(7, s_id);
            int x=ps.executeUpdate();
//            out.println("dgsd");
            if(x>0)
            {
                out.println("dgsd");
            }
            response.sendRedirect("bill.jsp");
    }catch(Exception ex){
        System.out.println(ex);
    }
%>
