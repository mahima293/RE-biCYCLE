<%-- 
    Document   : user_valid
    Created on : 23 Mar, 2022, 6:01:06 PM
    Author     : Nancy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,P.Dbcon" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class='root'>
            <form method="post">
        <%
            String ans=request.getParameter("SANS");
            String id=request.getParameter("uvw");
            out.print(id);
            String p=request.getParameter("xyz");
            PreparedStatement ps1=new Dbcon().con.prepareStatement("select security_a from user_DETAILS where s_id = ?");
            ps1.setString(1, id);
            ResultSet rs1=ps1.executeQuery();
            if(rs1.next()){
                out.print(rs1.getString(1));
                if(ans.equalsIgnoreCase(rs1.getString(1))){
                    PreparedStatement ps2=new Dbcon().con.prepareStatement("update user_DETAILS set password=? where s_id=?");
                    ps2.setString(1, p);
                    ps2.setString(2, id);
                    int x=ps2.executeUpdate();
                    if(x>0){
                         %>
                        <script>
                            alert("Updated Successfull");
                            window.location="../HTML/login.html";
                        </script>
                        <%    }
                }
                else{
                    %>
                        <script>
                            alert("Enter correct ans of the que");
                            window.location="../HTML/user_forget.html";
                        </script>
                    <%
                    }
            }
        %>
            </form>
        </div>
    </body>
</html>