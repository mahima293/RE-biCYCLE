<%--<%@page import="org.apache.derby.iapi.sql.ResultSet"%>--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
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
    </head>
    
    <body>
        <div class="container">
        <div class="navbar">
            <h2>RE-biCYCLE</h2>
            <nav>
                <ul>
                    <a href="#1"><li>View Bicycle</li></a>
                    <a href="viewOrder.jsp"><li>View Orders</li></a>
                    <a href="../JSP/view_users.jsp"><li>View Users</li></a>
                    <a href="messageReceived.jsp"><li>Receieved Messages</li></a>
                    <a href="../HTML/home.html"><li>Logout</li></a>
                </ul>
            </nav>
        </div>
    </div>
        <div class="container my-3" id="1">
		
		<table class="table table-light">
			<thead>
				<tr>
                                        <th scope="col">Image</th>
					<th scope="col">Title</th>
					<th scope="col">Color</th>
					<th scope="col">Price</th>
                                        <th scope="col">Seller Bought on</th>
					
				</tr>
			</thead>
			<tbody>
				<tr>
                                    
        <%
                String q="Select * from bicycle_details";
                Statement st=new Dbcon().con.createStatement();
                ResultSet rs=st.executeQuery(q);
                int x=0;
                while(rs.next()){
        %>
					
                                        <td><img class="img-thumbnail" src="../Images/<%=rs.getString(7)%>"
						alt="Card image cap"></td>
                                        <td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td>Rs. <%=rs.getInt(4)%></td>
                                        <td><%=rs.getDate(5)%></td>
					
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