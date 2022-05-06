<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="P.Dbcon" import="java.sql.*" %>
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
            try{
                    String email=null;
                    String uname=session.getAttribute("uname").toString();
                    System.out.print(uname);
                    String q="select email from user_details where s_id=?";
                    PreparedStatement st=new Dbcon().con.prepareStatement(q);
                    st.setString(1, uname);
                    ResultSet rs=st.executeQuery();
                    if(rs.next()){
                       email=rs.getString("EMAIL");
                    }
                       System.out.print(email);
                    String subject=request.getParameter("subject");
                    String body=request.getParameter("body");
                    
                    PreparedStatement st1=new Dbcon().con.prepareStatement("insert into message(email,subject,body) values (?,?,?)");
                    st1.setString(1, email);
                    st1.setString(2, subject);
                    st1.setString(3, body);
                    st1.executeUpdate();
                    
                    response.sendRedirect("messageUs.jsp?msg=valid");
                    }catch(Exception ex){
                        
                        response.sendRedirect("messageUs.jsp?msg=invalid");
                    ex.printStackTrace();
                    }
         %>
    </body>
    
</html>
