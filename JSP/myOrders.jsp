<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="newpackage_servlet.AddToCartServlet"%>
<%@page import="newpackage_dao.Product_Dao"%>
<%@page import="newpackage_entities.Product"%>
<%@page import="P.Dbcon"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>JSP Page</title>
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
                        <th scope="col">S.no</th>
                        <th scope="col">Image</th>
                        <th scope="col">Title</th>
                        <th scope="col">Color</th>
                        <th scope="col">Price</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Expected delivery Date</th>
                        <th scope="col">Payment Method</th>
                        <th scope="col">Seller Email</th>
                        <th scope="col">Seller Contact No.</th>
                        <th scope="col">Seller Hostel Name</th>
                        <th scope="col">Seller Room No.</th>
                        <th scope="col">Status</th>
                        <th scope="col">Cancel Purchase</th>
                    </tr>
                </thead>
                <tbody>
                     
                    <%
                        String s_id=session.getAttribute("uname").toString();
                        int sno=0;
                        try{
                                Statement st=new Dbcon().con.createStatement();
                                 ResultSet rs=st.executeQuery("select * from cart_details as c inner join bicycle_details as b inner join user_details as u on u.s_id=b.s_id on c.b_id=b.b_id and c.s_id='"+s_id+"' and (c.status='processing' or c.status='sold')");
                                
                                while(rs.next())
                                {
                                    sno=sno+1;
                                    
                                    
  %>
  <tr>
      <td><%out.println(sno);%></td>
      <td><img class="img-thumbnail" src="../Images/<%= rs.getString("image")%>" alt="Card image cap"></td>
      <td><%= rs.getString("title")%></td>
      <td><%= rs.getString("color")%></td>
      <td><%= rs.getInt("price")%></td>
      <td><%= rs.getDate("orderdate")%></td>
      <td><%= rs.getDate("deliverydate")%></td>
      <td><%= rs.getString("payment_method")%></td>
      <td><%= rs.getString(23)%></td>
      <td><%= rs.getLong(24)%></td>
      <td><%= rs.getString(25)%></td>
      <td><%= rs.getInt(26)%></td>
      <td><%if(rs.getString("status").equals("sold")){out.println("Delivered");}
      else{out.println(rs.getString("status"));}%></td>
       <td>
           <%if(!rs.getString("status").equals("sold")){%>
           <a class="btn btn-danger" href="user_order_cancel.jsp?b_id=<%=rs.getInt("b_id")%>">Cancel</a>
           <%}
else{%>
<a class="btn btn-danger disabled">Cancel</a>
<%
}
           %>
       </td>
  </tr>
                    
                    
                    
                    
                    <%
                                }
                        }catch(Exception ex)
                        {
                            System.out.println(ex);
                        }
                    %>
                </tbody>
                 </table>
                <a class="btn btn-primary" href="buy.jsp">Back</a>
            </div>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>
