<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="P.Dbcon"%>
<%--<%@page import="newpackage_dao.user_bicycle"%>--%>
<%--<%@page import="java.util.List"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="newpackage_dao.Product_Dao"%>--%>
<%@page import="newpackage_entities.Product" import="java.util.*"%>
<%
        List<Product> pd=new ArrayList<Product>();
//        HttpSession session = null; 
        String uname=session.getAttribute("uname").toString();
            String query="select * from bicycle_details where S_id='"+uname+"' and b_id not in ( select b_id from cart_details where status='sold' or status='processing')";
//            System.out.print(uname);
            Statement st=new Dbcon().con.createStatement();
            ResultSet rs=st.executeQuery(query);
            while (rs.next()) {
                Product p=new Product();
                p.setId(rs.getInt("b_id"));
//                session.setAttribute("b_id", rs.getInt("b_id"));
                p.setTitle(rs.getString("title"));
                p.setColor(rs.getString("color"));
                p.setPrice(rs.getInt("price"));
                p.setPurchase_date(String.valueOf(rs.getDate("purchase_date")));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                pd.add(p);
            }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/buy.css">
        <link rel="stylesheet" href="../CSS/admin.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
        <div class="navbar">
            <h2>RE-biCYCLE</h2>
            <nav>
                <ul>
                    <a href="../HTML/type.html"><li>Become a buyer</li></a>
                    <!--<a href="seller.jsp"><li>Become a seller</li></a>-->
                    <a href="seller_updates.jsp"><li>Seller Updates</li></a>
                    <a href="view_bicycle.jsp"><li>Update Bicycle Details</li></a>
                    <a href="viewprofile.jsp?page=2"><li>Update profile</li></a>
                    <a href="messageUs.jsp?page=2"><li>Message Us</li></a>
                    <a href="logout.jsp"><li>Logout</li></a>
                </ul>
            </nav>
        </div>
            <div class="search_display">
        <div class="display_images">
		<div class="row">
                    <%
                    if(!pd.isEmpty()){
                        for(Product pi:pd){%>
                          
			<div class="col-md-3 my-3">
				<div class="card w-100">
                                    <img class="card-img-top" src="../Images/<%=pi.getImage()%>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=pi.getTitle()%></h5>
                                                <h5 class="card-title"><%=pi.getColor()%></h5>
						<h6 class="price">Price: Rs. <%=pi.getPrice() %></h6>
                                                <h5 class="card-title"><%=pi.getPurchase_date()%></h5>
                                                <h7 class="card-title"><%=pi.getDescription()%></h7>
						<div class="mt-3 d-flex justify-content-between">
                                                    <a class="btn btn-dark" href="./edit.jsp?id=<%=pi.getId()%>">Edit</a>
						</div>
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