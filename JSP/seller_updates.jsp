<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="newpackage_servlet.AddToCartServlet"%>
<%@page import="newpackage_dao.Product_Dao"%>
<%@page import="newpackage_entities.Product"%>
<%@page import="P.Dbcon"%>
<%
String s_id=session.getAttribute("uname").toString();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <div class="container my-3">

            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Image</th>
                        <th scope="col">Title</th>
                        <th scope="col">Price</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Deliver by</th>
                        <th scope="col">Address</th>
                        <th scope="col">Room No.</th>
                        <th scope="col">Contact No.</th>
                        <th scope="col">Payment Method</th>
                        <th scope="col">Status</th>
                        <th scope="col">Mark Delivered</th>
                        <th scope="col">Cancel Order</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                                    
        <%
//            String q="Select * from Rebicycle1.bicycle_details as b inner join Rebicycle1.cart_details as c where b.s_id='"+s_id+"' and b.b_id=c.b_id and c.status!=''";
                String q="Select * from bicycle_details as b inner join cart_details as c on c.b_id=b.b_id and b.s_id='"+s_id+"' and c.status!='' and c.status!='bill'";
                Statement st=new Dbcon().con.createStatement();
                ResultSet rs=st.executeQuery(q);
                int x=0;
                while(rs.next()){
                    x=1;
        %>

        <td><img class="img-thumbnail" src="../Images/<%=rs.getString(7)%>"
                 alt="Card image cap"></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getInt(4)%></td>
        <td><%=rs.getDate(14)%></td>
        <td><%=rs.getDate(15)%></td>
        <td><%=rs.getString(11)%></td>
        <td><%=rs.getString(12)%></td>
        <td><%=rs.getLong(13)%></td>
        <td><%=rs.getString(16)%></td>
        <td><%=rs.getString(18)%></td>

                                        <%
//                                        System.out.println(rs.getString(9));
//                                        System.out.println(rs.getInt(10));
                                        %>
                                        
                                        <!--<td>-->
                                            <!--<form action="deliver.jsp" method="post" class="form-inline">-->

						<!--<button type="submit" class="btn btn-primary btn-sm">Buy</button>-->
                                    <%            session.setAttribute("s_id", rs.getString(9));
//                                                   session.setAttribute("b_id", rs.getInt(10));
                                    %>
                                    <%if(rs.getString(18).equals("sold")){%>
                                        <div class="mt-3 d-flex justify-content-between">
                                            <td> <a class="btn btn-primary disabled" href="deliver.jsp?b_id=<%=rs.getInt(10)%>">Deliver</a></td>
                                        <td><a class="btn btn-danger disabled" href="cancel.jsp?b_id=<%=rs.getInt(10)%>">Cancel</a></td></div>
                                            <!--</form>-->
					<!--</td>-->
                                    <%
                                    }
                                    else{%>
                                        <div class="mt-3 d-flex justify-content-between">
                                            <td> <a class="btn btn-primary" href="deliver.jsp?b_id=<%=rs.getInt(10)%>">Deliver</a></td>
                                        <td><a class="btn btn-danger" href="cancel.jsp?b_id=<%=rs.getInt(10)%>">Cancel</a></td></div>
                                    <%
                                        }
                                    %>
				</tr>
                                
				<%}
                                if(x==0){
                                out.println("Become a seller");%>
                                <a href="seller.jsp"></a>
<%}
                                %>
			</tbody>
		</table>
            <a class="mx-3 btn btn-primary" href="send_seller.jsp">Back</a></div>
	</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>

