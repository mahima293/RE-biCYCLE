<%@page import="java.sql.*"%>
<%@page import="P.Dbcon"%>
<%@page import="java.time.LocalDate"%>
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
        <%
            LocalDate cd1=LocalDate. now() ;
            try{
                String s_id=session.getAttribute("s_id").toString();
                int b_id=Integer.parseInt(request.getParameter("b_id"));
//                String s_id=request.getParameter("s_id");
//                System.out.println(s_id);
//                System.out.println(b_id);
//                String b=request.getParameter("b_id");
//                int b_id=Integer.parseInt(b);
        String q="update cart_details set status='sold',sold_date='"+cd1+"' where s_id='"+s_id+"' and b_id="+b_id+" ";
        Statement st=new Dbcon().con.createStatement();
        st.executeUpdate(q);
        response.sendRedirect("seller_updates.jsp");
            }catch(Exception ex){
            ex.printStackTrace();
            }
            
        %>
    </body>
</html>

