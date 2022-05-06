<%-- 
    Document   : save
    Created on : 24 Mar, 2022, 2:29:17 PM
    Author     : Nancy
--%>

<%@page import= "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="heading"  position="sticky">
            <h1>RE-biCYCLE</h1>
            <h3>Your Profile </h3>
        </div>
         <div id="root">
            <table>
                <form name="f1" method="post">
                <%
                    String sid;
//                  sid=(String)session.getAttribute("sid");
                    sid = request.getParameter("sid");
                    String fname=request.getParameter("fname");
                    String lname=request.getParameter("lname");
                    String email=request.getParameter("email");
                    long cno=Long.parseLong(request.getParameter("phnno"));
                    String hname=request.getParameter("hname");
                    int roomno=Integer.parseInt(request.getParameter("roomno"));
                    String pass=request.getParameter("pass");
                     try {
//                             Class.forName("org.apache.derby.jdbc.ClientDriver");
//                             Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/RE-biCYCLE");
                             PreparedStatement pst=new P.Dbcon().con.prepareStatement("update user_details set f_name=?,l_name=?,email=?,contact_no=?,hostel_name=?,room_no=?,password=? where s_id=?");
                             pst.setString(1,fname);
                             pst.setString(2,lname);
                             pst.setString(3, email);
                             pst.setLong(4, cno);
                             pst.setString(5, hname);
                             pst.setInt(6,roomno);
                             pst.setString(7,pass);
                             pst.setString(8,sid);
                             int i=pst.executeUpdate();
                             if(i>0 && (request.getParameter("save").equals("1")))
                             {
                                  %>
                                  <script>
                                      alert("Updated Successfully");
                                      window.location="../JSP/buy.jsp";
                                  </script>
                    <%
                             }
                            else if(i>0 && (request.getParameter("save").equals("2")))
                             {
                                  %>
                                  <script>
                                      alert("Updated Successfully");
                                      window.location="../JSP/send_seller.jsp";
                                  </script>
                    <%
                             }
                         } catch (Exception ex) {
                             ex.printStackTrace();
                         }
                    %>
                </form>
            </table>
         </div>
    </body>
</html>
