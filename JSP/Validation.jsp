
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,P.Dbcon" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validation check</title>
    </head>
    <body>
        <%
//            out.print("hello");
            String uname=request.getParameter("user");
            String p=request.getParameter("pass");
            if("ADMIN16732".equals(uname) && "admin1".equals(p)){
                session.setAttribute("uname", uname);
//                System.out.println(session.getAttribute("uname"));
                response.sendRedirect("../JSP/admin.jsp");
            }
            else{
                int z=0;
                try{
                    PreparedStatement ps=new Dbcon().con.prepareStatement("select s_id , PASSWORD from USER_DETAILS where "+
                    "s_id = ? and PASSWORD = ?");
                    ps.setString(1, uname);
                    ps.setString(2, p);
                    ResultSet rs=ps.executeQuery();
                    while(rs.next()){
                        z=1;
                        session.setAttribute("uname", uname);
//                        System.out.println(session.getAttribute("uname"));
                        response.sendRedirect("../HTML/type.html");
                    }
                    if(z==0){
                        %>
                <script>
                   alert("Incorrect Id and Password");
                   window.location="../HTML/login.html";
                  </script><%
                        
                    }
                    
                }catch(Exception ex){
%>
                    <script>
                   alert("Something went wrong");
                   window.location="../HTML/login.html";
                  </script><%                        
                }
            }
//            PreparedStatement ps=new Dbcon().con.prepareStatement("select S_ID , PASSWORD from USER_DETAILS where "+
//                    "S_ID = ? and PASSWORD = ?");
//            ps.setString(1, uname);
//            ps.setString(2, p);
//            ResultSet rs=ps.executeQuery();
//            if(rs.next()){
//                session.setAttribute("uname", uname);
//                response.sendRedirect("UserLogin.jsp");
//            }
//            else{
//                %>
                //<script>
//                    alert("Incorrect Username and Password");
//                </script><%
//                response.sendRedirect("login.html");
//            }
        %>
    </body>
</html>
