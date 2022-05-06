<%-- 
    Document   : bill
    Created on : 19 Apr, 2022, 10:42:05 PM
    Author     : Mahima Agrawal
--%>

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
            h2{
                position:absolute;
                top: 5%;
                left: 50%;
                justify-content:  center;
            }
            .g-3, .gy-3 {
                margin-left: 16%;
                margin-top: 4rem;
            }
              .img-thumbnail{
                display: block;
                width: 200px;
            }
        </style>
    </head>

    <body>
        <h2> Bill </h2>
        <%
                String s_id=session.getAttribute("uname").toString();
                
                try{
                    int total=0;
                    int sno=0 ;
                    Statement st=new Dbcon().con.createStatement();
                    ResultSet rs=st.executeQuery("select sum(price) from bicycle_details b,cart_details c where b.b_id=c.b_id and c.s_id='"+ s_id+"' and c.status='bill'");
                    while(rs.next())
                    {
                        total+=rs.getInt(1);
                    }
//                    out.println(total) ;
                      ResultSet rs2=st.executeQuery("select * from cart_details where s_id='"+s_id+"' and status='bill'");
                      while(rs2.next())
                      {
                      %>
        <form class="row g-3">
            <div class="col-md-5">
                <label>Smart Card id:</label>
                <input type="text" value="<%= rs2.getString(1)%>" class="form-control" id="inputEmail4" readonly>
            </div>
            <div class="col-md-5">
                <label>Mobile Number:</label>
                <input type="text" value="<%= rs2.getLong(5)%>" class="form-control" id="inputEmail4" readonly>
            </div>
            <div class="col-md-5">
                <label>Hostel name:</label>
                <input type="text" value="<%= rs2.getString(3)%>" class="form-control" id="inputEmail4" readonly>
            </div>
             <div class="col-md-5">
                <label>Room no:</label>
                <input type="text" value="<%= rs2.getInt(4)%>" class="form-control" id="inputEmail4" readonly>
            </div>
             <div class="col-md-5">
                <label>Order Date:</label>
                <input type="text" value="<%= rs2.getDate(6)%>" class="form-control" id="inputEmail4" readonly>
            </div>
             <div class="col-md-5">
                <label>Expected Delivery Date:</label>
                <input type="text" value="<%= rs2.getDate(7 )%>" class="form-control" id="inputEmail4" readonly>
            </div>
            <div class="col-md-5">
                <label>Payment Method:</label>
                <input type="text" value="<%= rs2.getString(8 )%>" class="form-control" id="inputEmail4" readonly>
            </div>
        </form>
                      <%    
                      break;}%>
            <div class="container my-3">
<!--            <a href="cart.jsp" class="btn btn-dark"><i class="bi bi-arrow-90deg-left">Back</i></a>-->
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Image</th>
                        <th scope="col">Title</th>
                        <th scope="col">Color</th>
                        <th scope="col">Price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>

                        <%
                            String q = "Select * from cart_details as c inner join bicycle_details as b on c.b_id=b.b_id and c.s_id='" + s_id + "' and c.status='bill'";
                            ResultSet rs3 = st.executeQuery(q);
                            while (rs3.next()) {
                        %>

                        <td><img class="img-thumbnail" src="../Images/<%=rs3.getString(18)%>"
                                 alt="Card image cap"></td>
                         <td><%=rs3.getString(13)%></td>
                        <td><%=rs3.getString(14)%></td>
                        <td>Rs. <%=rs3.getInt(15)%></td>
                    </tr>
                      <%}%>
                </tbody>
            </table>
      
            <div class="d-flex py-3"><h3>Total Price: Rs. <%out.println(total);%> </h3> </div>
            <a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
            <a onclick="window.print();"><button class="button right-button">Print</button></a>
            </div>
                      <%
}catch(Exception ex)
                {
                    ex.printStackTrace();
                }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
       
    </body>
</html>
