<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="P.Dbcon" import="java.sql.*"%>
<%@page import="newpackage_dao.Product_Dao"%>
<%@page import="newpackage_entities.Product" import="java.util.*"%>
<%
    Product_Dao p=new Product_Dao();
    List<Product> products=p.getAllProduct();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script type = "text/javascript" >
    function preventBack() { window.history.forward(); }
setTimeout("preventBack()", 0);
window.onunload = function () { null };
</script>
    </head>
<!--    <style>
        .container{
            display: block;
        }
    </style>-->
    
    <body>
            <a href="buy.jsp" class="btn btn-dark"><i class="bi bi-arrow-90deg-left">Back</i></a>
        <%
            try{
                String s1=null;
                s1=request.getParameter("mychoice1").toString();
                String s2=null;
                s2=request.getParameter("mychoice2").toString();
                s2=s2.toLowerCase();
                String s3=null;
                s3=request.getParameter("mychoice3").toString();
//                System.out.println(s1);
//                System.out.println(s2);
//                System.out.println(s3);
                String sql="";
                int s,y;
                if(!s1.equals("none") && !s2.equals("none") && !s3.equals("none"))
                {
                        s=Integer.parseInt(s3);
                        y=Integer.parseInt(s1);
                       sql="select * from bicycle_details where price<="+y+" and color='"+s2+"' and ({fn timestampdiff(SQL_TSI_DAY, purchase_date, CURRENT_DATE)})<("+s+")*365 and b_id not in (select b_id from cart_details where status='sold')";
                }
                else if(!s1.equals("none") && !s2.equals("none") && s3.equals("none"))
                {
                       y=Integer.parseInt(s1);
                       sql="select * from bicycle_details where price<="+y+" and color='"+s2+"' and b_id not in (select b_id from cart_details where status='sold')";
                }
                else if(!s1.equals("none") && s2.equals("none") && s3.equals("none")){
                        y=Integer.parseInt(s1);
                       sql="select * from bicycle_details where price<="+y+" and b_id not in (select b_id from cart_details where status='sold')";
                }
                else if(s1.equals("none") && !s2.equals("none") && s3.equals("none"))
                {
                        sql="select * from bicycle_details where color='"+s2+"' and b_id not in (select b_id from cart_details where status='sold')";
                }
                else if(!s1.equals("none") && s2.equals("none") && !s3.equals("none")){
                        s=Integer.parseInt(s3);
                        y=Integer.parseInt(s1);
                       sql="select * from bicycle_details where price<="+y+" and ({fn timestampdiff(SQL_TSI_DAY, purchase_date, CURRENT_DATE)})<("+s+")*365 and b_id not in (select b_id from cart_details where status='sold')";
                }
                else if(s1.equals("none") && !s2.equals("none") && !s3.equals("none")){
                        s=Integer.parseInt(s3);
                       sql="select * from bicycle_details where color='"+s2+"' and ({fn timestampdiff(SQL_TSI_DAY, purchase_date, CURRENT_DATE)})<("+s+")*365 and b_id not in (select b_id from cart_details where status='sold')";
                }
                else if(s1.equals("none") && s2.equals("none") && !s3.equals("none")){
                        s=Integer.parseInt(s3);
                       sql="select * from bicycle_details where ({fn timestampdiff(SQL_TSI_DAY, purchase_date, CURRENT_DATE)})<("+s+")*365 and b_id not in (select b_id from cart_details where status='sold')";
                }
                PreparedStatement ps=new Dbcon().con.prepareStatement(sql);
                ResultSet rs=ps.executeQuery();
                
//                if(rs.next()){
//                    out.println("HI");

            %>
            
            
                <div class="container">
                    
                <div class="display_images">
                        <div class="row">
            <%
                int z=0;
                while(rs.next()){
            z=1;
            %>
                
                <div class="col-md-3 my-3">
                        <div class="card w-100">
                            <img class="card-img-top" src="../Images/<%=rs.getString(7)%>"
                                        alt="Card image cap">
                                <div class="card-body">
                                    
                                        <h5 class="card-title"><%=rs.getString("title")%></h5>
                                        <h5 class="card-title"><%=rs.getString("color")%></h5>
                                        <h6 class="price">Price: Rs. <%=rs.getString("price")%></h6>
                                        <h5 class="card-title"><%=rs.getString("purchase_date")%></h5>
                                        <h7 class="card-title"><%=rs.getString("description")%></h7>
<%
                                    String sql1="select * from cart_details where b_id="+rs.getInt("b_id")+" ";
                                    PreparedStatement ps1=new Dbcon().con.prepareStatement(sql1);
                                    ResultSet rs1=ps1.executeQuery();
                                    int flag=0;
                                    try{
                                    while(rs1.next()){
                                        flag=0;
//                                        System.out.println("hanjisung");
                                        if(rs1.getString(10).equals("processing")){
//                                            System.out.println("Leeknow");
                                            flag=1;
                                            
                                %>             <br>  <br>     
                                                <h7 class="card-title text-danger">Currently Not Available</h7>  
						<div class="mt-3 d-flex justify-content-between">
                                                    <a class="btn btn-secondary disabled" href="./add_to_cart.jsp?id=<%=rs.getInt("b_id")%>">Add to Cart</a> 
                                                        <a class="btn btn-primary disabled" href="order-now?quantity=1&id=<%=rs.getInt("b_id")%>">Buy Now</a>
                                                        </div>
                                <%
        break;}}
                                                   
                                        }catch(Exception ex){
                                        ex.printStackTrace();
                                        }
                                        finally{
                                         if(flag==0){%>
                                         <div class="mt-3 d-flex justify-content-between"></div>                                                   
                                         <a class="btn btn-dark" href="./add_to_cart.jsp?id=<%=rs.getInt("b_id")%>">Add to Cart</a> 
                                                        <a class="btn btn-primary" href="order-now?quantity=1&id=<%=rs.getInt("b_id")%>">Buy Now</a>
<%
                                                        }
}
                                                        %>
                                        
						
					</div>
                                </div>
                        </div>
                    <!--</div>-->
                <!--</div>-->
                   <% }

if(z==0){%>

<h1 class="text-danger text-center">No such product Found</h1>
<a class="btn btn-primary " href="buy.jsp">GO back</a>
<%}
                    %>                            
                
            <%
            }catch(Exception ex){
                ex.printStackTrace();
            response.sendRedirect("buy.jsp");
            }
        %>

        </div>
                </div>
    </div>
    </body>
    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</html>