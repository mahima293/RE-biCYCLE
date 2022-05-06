<%-- 
    Document   : user_search
    Created on : 23 Mar, 2022, 6:00:32 PM
    Author     : Nancy
--%>
 

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,P.Dbcon" %>

<!DOCTYPE html>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="../CSS/forget.css" type="text/css" rel="stylesheet">

        <title>Validation check</title>

    </head>

    <body>

        <div class='root'>

            <form method="post">

                <% 

                try{

                    int z=0;

                    String pass=request.getParameter("pass");

//                    request.setAttribute("Pass", pass);

                    String cpass=request.getParameter("cpass");

                    if(!pass.equals(cpass)){

                        %>

                        <script>

                            alert("Both the password do not matches");

                            window.location="../HTML/user_forget.html";

                        </script>

                    <%

                    }

                    String uname=request.getParameter("id");

                    uname.toLowerCase();

//                    request.setAttribute("Email", uname);

                    if(pass.equals(cpass)){

                        PreparedStatement ps=new Dbcon().con.prepareStatement("select SECURITY_Q from USER_DETAILS where s_id = ?");

                        ps.setString(1, uname);

                        ResultSet rs=ps.executeQuery();

                        while(rs.next()){

                            z=1;

                %>

                    <h1>Verifying Account</h1>

                    <div class="cont">

                        <label>Security Question</label><br>

                        <%out.print("<input type='text' name='SQUE' id='u' value='"+rs.getString(1)+"' readonly/><br>");%>

                        <input type="hidden" name="xyz" value="<%=pass%>">

                        <input type="hidden" name="uvw" value="<%=uname%>">

 

                        <label>Answer</label><br>

                        <input type="text" name="SANS" id="p" placeholder="Enter Ans" required/><br>

                        <button type="submit" formaction="user_valid.jsp" id="s">Verify</button>

                    </div>

                        <%

                        }

                    }

                        if(z==0){%>

                        <script>

                            alert("Invalid ID ");

                            window.location="../HTML/user_forget.html";

                        </script>

                    <%                       

                    }

                    }catch(Exception ex){

                        %>

                        <script>

                            alert("Something want wrong!!!");

                            window.location="../HTML/user_forget.html";

                        </script>

                    <%                

                    ex.printStackTrace();

                    }%>

                   

            </form>

        </div>

    </body>

</html>