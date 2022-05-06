<%@page import="java.sql.*" import="P.Dbcon" import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    </body>
</html>
<%
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    
    
    
    String sid=request.getParameter("sid");
    String email=request.getParameter("email");
    email.toLowerCase();
    String contact_no=request.getParameter("contact");
    Long contacti=0L;
    try{
//    String stt=request.getParameter("contact").replaceAll("\\D+","");
//    contacti=Long.parseLong(stt);
    contacti=Long.parseLong(contact_no);
    }catch(NumberFormatException e){e.printStackTrace();}
    
    String hname=request.getParameter("hname");
    int roomno=Integer.parseInt(request.getParameter("roomno"));
    String pswrd=request.getParameter("pswrd");
    String cpswrd=request.getParameter("cpswrd");
    String security=request.getParameter("security");
    String sanswer=request.getParameter("sanswer");
//    if(fname.isEmpty() || lname.isEmpty() || sid.isEmpty() || email.isEmpty() || pswrd.isEmpty() || cpswrd.isEmpty()||sanswer.isEmpty())
//    {
//        out.print("Please fill all the Fields");
////        response.sendRedirect("signup_page.html");
//    }
    if(!pswrd.equals(cpswrd)){%>
    
    <script>
        alert("Please re-enter your password");
        window.location="../HTML/signup_page.html";
    </script>   
    
    <%}
    if(contact_no.length()!=10){%>

        <script>
            alert("Please re-enter your Phone Number");
            window.location="../HTML/signup_page.html";
        </script>   

    <%}
    int check=0;
    Statement st=new Dbcon().con.createStatement();
    ResultSet rs=st.executeQuery("select s_id from user_details where s_id='"+sid+"'");
    if(rs.next()){
    check=1;
    }
    if(check==1){%>

        <script>
            alert("User Id already present");
            window.location="../HTML/signup_page.html";
        </script>   

    <%}

    else{
    try{
        Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/RE-biCYCLE");
    PreparedStatement ps=conn.prepareStatement("insert into user_details values(?,?,?,?,?,?,?,?,?,?)");
    ps.setString(1, sid);
    ps.setString(2, fname);
    ps.setString(3,lname);
    ps.setString(4,email);
    ps.setLong(5,contacti);
    ps.setString(6,hname);
    ps.setInt(7,roomno);
    ps.setString(8,pswrd);
    ps.setString(9,security);
    ps.setString(10,sanswer);
    int x=ps.executeUpdate();
    if(x>0)
    {
        %>
    <script>
        alert("Record Entered Successfully");
        window.location="../HTML/login.html";
    </script>                 
<%
    }
else{
        %>
    <script>
        alert("Error Occured");
        window.location="../HTML/signup_page.html";
    </script>                 
<%}
    }
    catch(Exception ex){
        ex.printStackTrace();
    }
    }

    %>