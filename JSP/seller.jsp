<%@page import="newpackage_servlet.ProductOperationServlet" %>
<%@page import="P.Dbcon" %>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../CSS/seller.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="main">
        <div class="a">
            <h1 class="b">Seller's Form</h1>
        </div>
            <%
            int id=1;
            try{
                Statement s=new Dbcon().con.createStatement();
                ResultSet rs=s.executeQuery("Select max(b_id) from bicycle_details");
                if(rs.next()){
                    id=rs.getInt(1);
                    id=id+1;
                }
            }catch(Exception ex){
                ex.printStackTrace();
            }
            
            %>
            <form action="${pageContext.request.contextPath}/ProductOperationServlet" method="post" enctype="multipart/form-data" onsubmit="return validate()">
                <input type="hidden" name="id" value="<%out.println(id);%>">
            <div class="c">
                <table>
                    <tr>
                        <td><label>Add Title:</label></td>
                        <td><input type="text" name="title" required></td>
                    </tr>
                    <tr>
                        <td><label>Color:</label></td>
                        <td><input type="text" name="color" required></td>
                    </tr>
                    <tr>
                        <td><label>Price:</label></td>
                        <td><input type="text" name="amount" id="p" required><div id="s1"></div></td>
                    </tr>
                    <tr>
                        <td><label>Purchase date:</label></td>
                        <td><input type="date" name="purchase_date" class="dte" required></td>
                    </tr>
                    <tr>
                        <td><label>Description:</label></td>
                        <td><textarea name="description" rows="5" cols="50" required></textarea></td>
                    </tr>
                    <tr>
                        <td><label for="RE-biCYCLE">Images:</label></td>
                         <!--<td><input type="image" width="48" height="48"></td>--> 
                        <td><input type="file" id="file" name="image" required><div id="s2"></div></td>
                    </tr>
                </table>
            </div>
            <div class="d">
                <button type="submit" value="submit">Post</button>
            </div>
        </form>
    </div>
            <script>
            function validate(){
                var s1=document.getElementById("p").value;
                var a=/^[0-9]*$/;
                var status=false;
                if(!a.test(s1)){
                    document.getElementById("s1").innerHTML="* Please Enter the Valid Price(in digits)!!!";
                    document.getElementById("s1").style.color="red";
                    document.getElementById("s1").style.fontSize="12px";
                    status=false;
                }
                else if(a.test(s1)){
                    document.getElementById("s1").innerHTML="";
                }                
                if(a.test(s1)){
                    status=true;
                }
                return status;
    }
    function fileValidation() {
            var fileInput = 
                document.getElementById('file');
              
            var filePath = fileInput.value;
          
            // Allowing file type
            var allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;
              
            if (!allowedExtensions.exec(filePath)) {
                document.getElementById("s2").innerHTML="* Please Enter Image Only!!!";
                document.getElementById("s2").style.color="red";
                document.getElementById("s2").style.fontSize="12px";
                fileInput.value = '';
                return false;
            } 
            else{
                document.getElementById("s2").innerHTML="";
                return true;
            }
        }
        </script>
    </body>
</html>