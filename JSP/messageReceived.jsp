

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" import="P.Dbcon"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        
    <style>
        table,th,td{
            text-align: center; border: 1px solid black; border-color: #96D4D4;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
    <script type = "text/javascript" >
function preventBack() { window.history.forward(); }
setTimeout("preventBack()", 0);
window.onunload = function () { null };
</script>
    </head>
    <body>
        <a href="admin.jsp" class="btn btn-dark"><i class="bi bi-arrow-90deg-left">Back</i></a>
        <div style="color: black; text-align: center; font-size: 30px; margin-bottom: 5%; margin-top: 2%;">Messages Received</div>
        <table>
        <thead>
        <tr>
        <th scope="col">ID</th>
        <th scope="col">Email</th>
        <th scope="col">Subject</th>
        <th scope="col">Body</th>
        </tr>
        </thead>
        <tbody>
            <%
                try{
                    Statement st=new Dbcon().con.createStatement();
                    ResultSet rs=st.executeQuery("select * from message");
                    while(rs.next()){
            %>
                <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                </tr>
        <%
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        %>
        </tbody>
        </table>
        <br>
        <br>
        <br>

    </body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</html>
