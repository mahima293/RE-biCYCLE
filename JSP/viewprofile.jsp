<%@page import= "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../CSS/viewprofile.css">
        <link rel="stylesheet" href="../CSS/admin.css">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="navbar">
            <h2>RE-biCYCLE</h2>
            <nav>
                <ul>
                    <a href="../HTML/type.html"><li>Become a seller</li></a>
                    <a href="cart.jsp"><li>My cart</li></a>
                    <a href="myOrders.jsp"><li>My order</li></a>
                    <a href="viewprofile.jsp?page=1"><li>Update profile</li></a>
                    <a href="messageUs.jsp?page=1"><li>Message Us</li></a>
                    <a href="logout.jsp"><li>Logout</li></a>
                </ul>
            </nav>
        </div>
 
        </div>
        <div id="root">
            <h2>Your Profile</h2>
            <form name="f1" method="post" onsubmit="return validate()">
            <table>
                <%
                  String sid = session.getAttribute("uname").toString();
                     try {
                             
                               Statement pst=new P.Dbcon().con.createStatement();
                             ResultSet rs=pst.executeQuery("select * from user_details where s_id='"+sid+"'");
                             while(rs.next())
                             {
                                 %>
                                 <tr>
                                     <td><label>Smart Card ID:</label></td>
                                     <td><input type="text" name="sid" id="bd" value="<%= sid %>" readonly><div id="s3"></div></td></tr>
                                 <tr>
                                     <td><label>First Name:</label></td>
                                     <td><input type="text" name="fname" id="fn" value="<%= rs.getString(2)%>"><div id="s1"></div></td></tr>
                                 <tr> 
                                     <td><label>Last Name:</label></td>
                                     <td><input type="text" name="lname" id="ln" value="<%= rs.getString(3)%>"><div id="s2"></div></td></tr>
                                <tr>
                                    <td><label>E-mail:</label></td>
                                    <td><input type="text" name="email" id="en" value="<%= rs.getString(4)%>"><div id="s4"></div></td></tr>
                                <tr>
                                    <td><label>Mobile no:</label></td>
                                    <td><input type="text" maxlength=10 id="ph" name="phnno"  value="<%=rs.getString(5)%>"><div id="s6"></div></td></tr>
                                <tr>
                                    <td><label>Hostel name:</label></td>
                                    <td><input type="text" name="hname"  value="<%=rs.getString(6)%>"></td></tr>
                                <tr>
                                    <td><label>Room no:</label></td>
                                    <td><input type="number" name="roomno"  value="<%=rs.getString(7)%>"></td></tr>
                                <tr>
                                    <td><label>Password:</label></td>
                                    <td><input type="text" name="pass" id="sp" value="<%=rs.getString(8)%>"><div id='s5'></div></td></tr>
                             <%
                                 }
                         } catch (Exception ex) {
                             ex.printStackTrace();
                         }
                    %>
            </table>
           
            <input type="hidden" name="save" value="<%=request.getParameter("page")%>">
            <input type="submit" name="Save" value="Save"  formaction="../JSP/save.jsp" >
            
          </form>
         </div>
            <script>
            function validate(){
                var s1=document.getElementById("fn").value;
                var s2=document.getElementById("ln").value;
                var s3=document.getElementById("bd").value;
                var s4=document.getElementById("en").value;
                var s5=document.getElementById("sp").value;
                var s6=document.getElementById("ph").value;
                var b=/^\w+([\.-]?\w+)@\w+([\.-]?\w+)(\.\w{2,3})+$/;
                var e=/^[1-9][0-9]{9}$/
                var c=/^[A-Z]{5}[0-9]{5}$/;
                var status=false;
                var a=/^[A-Z][a-z]*$/;
                var d=new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
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
               if(!d.test(s5)){
                    document.getElementById("s5").innerHTML="* Please Enter Strong Password containing at least 1Ucase,1Lcase,1Digit,1SpecialCharacter!!!";
                    document.getElementById("s5").style.color="red";
                    document.getElementById("s5").style.fontSize="12px";
                    status=false;
                }
                else if(d.test(s5)){
                    document.getElementById("s5").innerHTML="";
                }
                if(!e.test(s6)){
                    document.getElementById("s6").innerHTML="* Please Enter Valid Phone Number!!!";
                    document.getElementById("s6").style.color="red";
                    document.getElementById("s6").style.fontSize="12px";
                    status=false;
                }
                else if(e.test(s6)){
                    document.getElementById("s6").innerHTML="";
                }
               
                if(a.test(s2) && a.test(s1) && b.test(s4) && d.test(s5) && e.test(s6)){
                    status=true;
                }
                return status;
    }
        </script>
            
    </body>
</html>