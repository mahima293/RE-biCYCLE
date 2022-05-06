<%--<%@page import="org.apache.derby.iapi.sql.ResultSet"%>--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="newpackage_servlet.AddToCartServlet"%>
<%@page import="newpackage_dao.Product_Dao"%>
<%@page import="newpackage_entities.Product"%>
<%@page import="P.Dbcon"%>
<%
//ArrayList<Product> cart_list=(ArrayList<Product>)session.getAttribute("cart-list");
//List<Product> cartProduct = null;
//if (cart_list != null) {
//	Product_Dao pDao = new Product_Dao();
//	cartProduct = pDao.getCartProducts(cart_list);
////	double total = pDao.getTotalCartPrice(cart_list);
////	request.setAttribute("total", total);
//	request.setAttribute("cart_list", cart_list);
//}

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
                        <th scope="col">Color</th>
                        <th scope="col">Price</th>
                        <!--<th scope="col">Purchase_date</th>-->
                        <th scope="col">Buy Now</th>
                        <th scope="col">Cancel</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>

        <%
                String q="Select * from cart_details as c inner join bicycle_details as b on c.b_id=b.b_id and c.s_id='"+s_id+"' and (c.status='' or c.status='bill')";
                Statement st=new Dbcon().con.createStatement();
                ResultSet rs=st.executeQuery(q);
                int x=0;
                while(rs.next()){
        %>
					
                                        <td><img class="img-thumbnail" src="../Images/<%=rs.getString(18)%>"
						alt="Card image cap"></td>
                                        <td><%=rs.getString(13)%></td>
					<td><%=rs.getString(14)%></td>
					<td>Rs. <%=rs.getInt(15)%></td>
					<td>
                                            <a href="buy_direct.jsp?id=<%=rs.getInt(2)%>" class="btn btn-sm btn-primary">Buy</a>
					</td>
                                        <td><a href="remove_from_cart.jsp?id=<%=rs.getInt(2)%>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
                                    int a=rs.getInt(15);
                                    x+=a;
//                                    System.out.println(x);
				}%>
			</tbody>
		</table>
                        <div class="d-flex py-3"><h3>Total Price: Rs. <%out.println(x);%> </h3> 
                            <% if(x==0){
                                %>
                                <button type="button" class="mx-3 btn btn-primary" disabled>Check Out</button>
                            <%
                            }else{%>
                    <a class="mx-3 btn btn-primary" href="addressPayementForOrder.jsp">Check Out</a><%}%>
                    <a class="mx-3 btn btn-primary" href="buy.jsp">Back</a></div>
	</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>
