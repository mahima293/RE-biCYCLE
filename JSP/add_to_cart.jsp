<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "newpackage_entities.Product" import="P.Dbcon" import="java.sql.*"%>
<%
int b_id=Integer.parseInt(request.getParameter("id"));
//System.out.println(b_id);
//HttpSession session = new HttpSession();
    try{
String s_id=session.getAttribute("uname").toString();
System.out.println(s_id);
            if(s_id!=null){

            
                Statement st=new Dbcon().con.createStatement();
                String query="Select * from cart_details where s_id='"+s_id+"' and b_id="+b_id+"";
                ResultSet rs=st.executeQuery(query);
                int z=0;
                if(rs.next()){
                z=1;
                }
                String d="";
                if(z!=1){
//                    System.out.println(s_id);
                    PreparedStatement ps=new Dbcon().con.prepareStatement("insert into cart_details(s_id,b_id,status) values(?,?,?)");
                    ps.setString(1, s_id);
                    ps.setInt(2, b_id);
                    ps.setString(3, d);
                    ps.executeUpdate();
                    %>
               
                        <script>
                            alert("Added to cart");
                            window.location="buy.jsp";
                        </script>
                        <%  
//                    response.sendRedirect("buy.jsp");
                }
                else{%>
               
                        <script>
                            alert("Already present in the cart");
                            
                            window.location="buy.jsp";
                        </script>
                        <%  
//                    response.sendRedirect("buy.jsp");
                }
            }
            else{//not working
                System.out.println("Hisjjug");
                %>
               
                        <script>
                            alert("Please login");
                            window.location="../HTML/login.html";
                        </script>
                        <%  
            }
    }catch(Exception ex){
                ex.printStackTrace();
            }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type = "text/javascript" >
function preventBack() { window.history.forward(); }
setTimeout("preventBack()", 0);
window.onunload = function () { null };
</script>
    </head>
    <body>
        
    </body>
</html>
