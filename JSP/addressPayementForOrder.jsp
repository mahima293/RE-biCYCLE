<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="newpackage_servlet.AddToCartServlet"%>
<%@page import="newpackage_dao.Product_Dao"%>
<%@page import="newpackage_entities.Product"%>
<%@page import="P.Dbcon"%>
<!DOCTYPE html>
<%
String s_id=session.getAttribute("uname").toString();
%>
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
            <a href="cart.jsp" class="btn btn-dark"><i class="bi bi-arrow-90deg-left">Back</i></a>
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
                            String q = "Select * from cart_details as c inner join bicycle_details as b on c.b_id=b.b_id and c.s_id='" + s_id + "' and (c.status='' or c.status='bill')";
                            Statement st = new Dbcon().con.createStatement();
                            ResultSet rs = st.executeQuery(q);
                            int x = 0;
                            while (rs.next()) {
                        %>

                        <td><img class="img-thumbnail" src="../Images/<%=rs.getString(18)%>"
                                 alt="Card image cap"></td>
                         <td><%=rs.getString(13)%></td>
                        <td><%=rs.getString(14)%></td>
                        <td>Rs. <%=rs.getInt(15)%></td>
                    </tr>

                    <%
                            int a = rs.getInt(15);
                            x += a;
//                                    System.out.println(x);
                                    }%>
                </tbody>
            </table>
                
            <div class="d-flex py-3"><h3>Total Price: Rs. <%out.println(x);%> </h3> </div>
                <%
                    ResultSet rs1 = st.executeQuery("select * from user_details where s_id='"+s_id+"'");
                    while(rs1.next())
                    {
                    %>
                    <form class="row g-3" action="addressPaymentForOrderAction.jsp" method="post" onsubmit="return validate()">
                         <div class="col-md-5">
                           <label>First Name:</label>
                            <input  type="text" name="fname" value="<%= rs1.getString(2) %>"   class = "form-control" id="fn" placeholder="Enter FirstName" required><div id="s1"></div>
                        </div>
                        <div class="col-md-5">
                            <label>Last Name</label>
                            <input type="text" name="lname" class = "form-control" id="ln" value="<%= rs1.getString(3)%>" placeholder="Enter Room No" required><div id="s2"></div>
                        </div>
                        <div class="col-md-5">
                            <label>Hostel Name</label>
                            <input  type="text" name="address" value="<%= rs1.getString(6)%>"  class = "form-control" id="inputEmail4" placeholder="Enter Hostel Name" required>
                        </div>
                        <div class="col-md-5">
                            <label>Room no</label>
                            <input  type="number" name="rno" value="<%= rs1.getInt(7)%>" class = "form-control" id="inputEmail4" placeholder="Enter Room No" required>
                        </div>
                        <div class="col-md-5">
                             <label>Select Way of Payment</label>
                            <select  name="paymentMethod" class = "form-control" id="inputEmail4">
                                <option value="Cash On delivery(COD)">Cash On delivery(COD)</option>
                            </select>
                         </div>
                        <div class="col-md-5">
                            <label>Mobile No</label>
                            <input  type="text" name="mobileNumber" value="<%= rs1.getLong(5)%>" class = "form-control" id="ph" placeholder="Enter Mobile No" required><div id="s6"></div>
                        </div>
                        <div class="col-md-5">
                            <label>Email Address</label>
                            <input  type="text" name="email" value="<%= rs1.getString(4)%>"  class = "form-control" id="en" required><div id="s4"></div>
                        </div>
                        <div class="col-md-5">
                            <button class="button" type="submit">Proceed to Generate Bill and save<i class="far fa-arrow-alt-circle-right"> </i></button>
                            <h3 style="color: red">*Fill form correctly</h3>
                        </div>
                    </form>
                    <%
                        }
                        %>
        </div>
        <script>
            function validate(){
                var s1=document.getElementById("fn").value;
                var s2=document.getElementById("ln").value;
                var s4=document.getElementById("en").value;
                var s6=document.getElementById("ph").value;
                var b=/^\w+([\.-]?\w+)@\w+([\.-]?\w+)(\.\w{2,3})+$/;
                var e=/^[1-9][0-9]{9}$/
//                var c=/^[A-Z]{5}[0-9]{5}$/;
                var status=false;
                var a=/^[A-Z][a-z]*$/;
//                var d=new RegExp("^(?=.[a-z])(?=.[A-Z])(?=.[0-9])(?=.[!@#\$%\^&\*])(?=.{8,})");
                if(!a.test(s1)){
                    document.getElementById("s1").innerHTML="* Please Enter Letters only!!!";
                    document.getElementById("s1").style.color="red";
                    document.getElementById("s1").style.fontSize="12px";
                    status=false;
                }
                else if(a.test(s1)){
                    document.getElementById("s1").innerHTML="";
                }
                if(!a.test(s2)){
                    document.getElementById("s2").innerHTML="* Please Enter Letters only!!!";
                    document.getElementById("s2").style.color="red";
                    document.getElementById("s2").style.fontSize="12px";
                    status=false;
                }
                else if(a.test(s2)){
                    document.getElementById("s2").innerHTML="";
                }
//                if(!c.test(s3)){
//                    document.getElementById("s3").innerHTML="* Please Enter correct ID!!!";
//                    document.getElementById("s3").style.color="red";
//                    document.getElementById("s3").style.fontSize="12px";
//                    status=false;
//                }
//                else if(c.test(s3)){
//                    document.getElementById("s3").innerHTML="";
//                }
                if(!b.test(s4)){
                    document.getElementById("s4").innerHTML="* Please Enter Correct Mail!!!";
                    document.getElementById("s4").style.color="red";
                    document.getElementById("s4").style.fontSize="12px";
                    status=false;
                }
                else if(b.test(s4)){
                    document.getElementById("s4").innerHTML="";
                }
//               if(!d.test(s5)){
//                    document.getElementById("s5").innerHTML="* Please Enter Strong Password containing at least 1Ucase,1Lcase,1Digit,1SpecialCharacter!!!";
//                    document.getElementById("s5").style.color="red";
//                    document.getElementById("s5").style.fontSize="12px";
//                    status=false;
//                }
//                else if(d.test(s5)){
//                    document.getElementById("s5").innerHTML="";
//                }
                if(!e.test(s6)){
                    document.getElementById("s6").innerHTML="* Please Enter Valid Phone Number!!!";
                    document.getElementById("s6").style.color="red";
                    document.getElementById("s6").style.fontSize="12px";
                    status=false;
                }
                else if(e.test(s6)){
                    document.getElementById("s6").innerHTML="";
                }
               
                if(a.test(s2) && a.test(s1) && b.test(s4) &&e.test(s6)){
                    status=true;
                }
                return status;
    }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>