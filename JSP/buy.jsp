<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="P.Dbcon" import="java.sql.*" %>
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
        <link rel="stylesheet" href="../CSS/buy.css">
        <link rel="stylesheet" href="../CSS/admin.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .navbar{
                width: 113.2%;
                /*width: ;*/
                margin-left: -74px;
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
                    <!--<a href="#"><li>View Bicycle</li></a>-->
<!--                    <a href="seller.jsp"><li>Become a seller</li></a>
                    <a href="seller_updates.jsp"><li>Seller Updates</li></a>-->
                    <a href="../HTML/type.html"><li>Become a seller</li></a>
                    <a href="cart.jsp"><li>My cart</li></a>
                    <a href="myOrders.jsp"><li>My order</li></a>
                    <!--<input type="hidden" name="pag" value="page1">-->
                    <a href="viewprofile.jsp?page=1"><li>Update profile</li></a>
                    <a href="messageUs.jsp"><li>Message Us</li></a>
                    <a href="logout.jsp"><li>Logout</li></a>
                </ul>
            </nav>
        </div>
            
            <div class="search_display">
                <div class="search">
                <h2>Filters</h2>
                <form method="post">
                    <div class="choice">
                    <select class="mychoice1" value="none" name="mychoice1" id="SelectUserChoice">
                        <option value="none" selected>Select Price</option>
                        <option value="3000">Under 3000Rs</option>
                        <option value="4000">Under 4000Rs</option>
                        <option value="5000">Under 5000Rs</option>
                        <option value="6000">Under 6000Rs</option>      
                        <option value="7000">Under 7000Rs</option>      
                    </select>
                </div>
                <div class="choice">
                    <select class="mychoice2" name="mychoice2" id="SelectUserChoice">
                        <option value="none" selected>Select Color</option>
                        <option value="Black">Black</option>
                        <option value="Blue">Blue</option>
                        <option value="Red">Red</option>
                        <option value="Pink">Pink</option>   
                        <option value="White">White</option>   
                    </select>
                </div>
                <div class="choice">
                    <select class="mychoice3" value="none" name="mychoice3" id="SelectUserChoice">
                        <option value="none" selected>Select Purchase Year</option>
                        <option value="1">1 year OLD</option>
                        <option value="2">2 year OLD</option>
                        <option value="3">3 year OLD</option>
                        <option value="4">4 year OLD</option>                
                    </select>
                </div>
                    <button type="submit" class="mychoice" formaction="filter.jsp">Search</button>
                </form>
            </div>
        <div class="display_images">
		<div class="row">
                    <%
                    if (!products.isEmpty()) {
                        for (Product pi : products) {%>


                    <% //System.out.println("");%>

                    <div class="col-md-4 my-4">
                        <div class="card w-100">
                            <img class="card-img-top" src="../Images/<%=pi.getImage()%>"
                                 alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title"><%=pi.getTitle()%></h5>
                                <h6 class="card-title">Color: <%=pi.getColor()%></h6>
                                <h6 class="price">Price: Rs. <%=pi.getPrice()%></h6>
                                <h6 class="card-title">Bought on: <%=pi.getPurchase_date()%></h6>
                                <h7 class="card-title"><%=pi.getDescription()%></h7>
                                <%
                                    String sql="select * from cart_details where b_id="+pi.getId()+"";
                                    PreparedStatement ps=new Dbcon().con.prepareStatement(sql);
                                    ResultSet rs=ps.executeQuery();
                                    int flag=0;
                                    try{
                                    while(rs.next()){
                                        flag=0;
//                                        System.out.println("hanjisung");
                                        if(rs.getString(10).equals("processing")){
//                                            System.out.println("Leeknow");
                                            flag=1;
                                            
                                %>             <br>  <br>     
                                                <h7 class="card-title text-danger">Currently Not Available</h7>  
						<div class="mt-3 d-flex justify-content-between">
                                                    <a class="btn btn-secondary disabled" href="./add_to_cart.jsp?id=<%=pi.getId()%>">Add to Cart</a> 
                                                        <a class="btn btn-primary disabled" href="buy_direct.jsp?id=<%=pi.getId()%>">Buy Now</a><!--
                                                    <a class="btn btn-dark" href="#">Add to Cart</a> <a
								class="btn btn-primary" href="#">Buy Now</a>-->
                                                        </div>
                                <%
        break;}}
                                                   
                                        }catch(Exception ex){
                                        ex.printStackTrace();
                                        }
                                        finally{
                                         if(flag==0){%>
                                         <div class="mt-3 d-flex justify-content-between">                                           
                                         <a class="btn btn-dark" href="./add_to_cart.jsp?id=<%=pi.getId()%>">Add to Cart</a> 
                                                        <a class="btn btn-primary" href="buy_direct.jsp?id=<%=pi.getId()%>">Buy Now</a>
                                                        </div>        
<%
                                                        }
}
                                                        %>
                                        
						
					</div>
				</div>
			</div>  
                    <%}
                    }
                    else{
                        out.println("There is no proucts");
                    }
                    %>
                    

		</div>
	</div>
        </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>
