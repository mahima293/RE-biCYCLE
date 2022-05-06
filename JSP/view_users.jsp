<%--<%@page import="org.apache.derby.iapi.sql.ResultSet"%>--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="newpackage_servlet.AddToCartServlet"%>
<%@page import="newpackage_dao.Product_Dao"%>
<%@page import="newpackage_entities.Product"%>
<%@page import="P.Dbcon"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/admin.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .img-thumbnail{
            display: block;
            width: 200px;
        }
    </style>
        <script type = "text/javascript" >
function preventBack() { window.history.forward(); }
setTimeout("preventBack()", 0);
window.onunload = function () { null };
</script>
    </head>
    
    <body>
        <div class="container">
        <div class="navbar">
            <h2>RE-biCYCLE</h2>
            <nav>
                <ul>
                    <a href="../JSP/admin.jsp"><li>View Bicycle</li></a>
                    <a href="viewOrder.jsp"><li>View Orders</li></a>
                    <a href="#1"><li>View Users</li></a>
                    <a href="messageReceived.jsp"><li>Received Messages</li></a>
                    <a href="../HTML/home.html"><li>Logout</li></a>
                </ul>
            </nav>
        </div>
    </div>
        <div class="container my-3" id="1">
		
		<table class="table table-light">
			<thead>
				<tr>
                                        <th scope="col">Student ID</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Contact Number</th>
                                        <th scope="col">Hostel Name</th>
					<th scope="col">Room Number</th>
				</tr>
			</thead>
			<tbody>
				<tr>
                                    
        <%
                String q="Select * from user_details";
                Statement st=new Dbcon().con.createStatement();
                ResultSet rs=st.executeQuery(q);
                int x=0;
                while(rs.next()){
                    if(rs.getString(1).equals("ADMIN16732")){
                        continue;
                    }
        %>     
					
                                        <td><%= rs.getString(1)%></td>
                                        <td><%= rs.getString(2)%> <%= rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getLong(5)%></td>
                                        <td><%=rs.getString(6)%></td>
					<td><%=rs.getInt(7)%></td>
				</tr>
                                <%
                                    
				}%>
			</tbody>
                </table>
	</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>