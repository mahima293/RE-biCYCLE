<%-- 
    Document   : viewOrder
    Created on : 20 Apr, 2022, 4:42:55 PM
    Author     : Nancy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" import="P.Dbcon" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/admin.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
        <div class="navbar">
            <h2>RE-biCYCLE</h2>
            <nav>
                <ul>
                    <a href="admin.jsp"><li>View Bicycle</li></a>
                    <a href="viewOrder.jsp"><li>View Orders</li></a>
                    <a href="../JSP/view_users.jsp"><li>View Users</li></a>
                    <a href="messageReceived.jsp"><li>Receieved Messages</li></a>
                    <a href="../HTML/home.html"><li>Logout</li></a>
                </ul>
            </nav>
        </div>
        </div>
        <div class="container my-3">
		
		<table class="table table-light">
			<thead>
				<tr>
                                        <th scope="col">Buyer Id</th>
					<th scope="col">Bicycle ID</th>
					<th scope="col">Address</th>
                                        <th scope="col">Room No.</th>
					<th scope="col">Contact NO.</th>
                                        <!--<th scope="col">Purchase_date</th>-->
                                        <th scope="col">Order Date</th>
					<th scope="col">Delivery date</th>
                                        <th scope="col">Payment Method</th>
                                        <!--<th scope="col">Account No.</th>-->
                                        <th scope="col">Status</th>
                                        <th scope="col">Sold on</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<%
                                    String sql="select * from cart_details where status!=''";
                                    PreparedStatement ps=new Dbcon().con.prepareStatement(sql);
                                    ResultSet rs= ps.executeQuery();
                                    while(rs.next()){
                                %>	
                                        <td><%=rs.getString(1)%></td>
                                        <td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
                                        <td><%=rs.getString(6)%></td>
                                        <td><%=rs.getString(7)%></td>
                                        <td><%=rs.getString(8)%></td>
                                        <td><%=rs.getString(10)%></td>
                                        <td><%=rs.getString(11)%></td>
				</tr>
                                <%
                                    }
                                %>
			</tbody>
		</table>
	</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>
