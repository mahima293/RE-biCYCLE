<%@page import="java.sql.*"%>
<%@page import="P.Dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/seller.css">
        <script type = "text/javascript" >
function preventBack() { window.history.forward(); }
setTimeout("preventBack()", 0);
window.onunload = function () { null };
</script>
    </head>
    <body>
        <%
            String uname=session.getAttribute("uname").toString();
            int b_id=Integer.parseInt(request.getParameter("id"));
            String query="select * from bicycle_details where s_id= '"+uname+"' and B_ID="+b_id+"";
            Statement st=new Dbcon().con.createStatement();
            ResultSet rs=st.executeQuery(query);
            int z=0;
            while (rs.next()) {
                z=1;%>
                <div class="main" style="margin-top: 60px">
                <div class="a">
                    <h1 class="b">Update Form</h1>
                </div>
                    <form action="${pageContext.request.contextPath}/update" method="post" enctype="multipart/form-data" onsubmit="return validate()">
                <input type="hidden" name="id" value="<%out.println(b_id);%>">
            <div class="c">
                <table>
                    <tr>
                        <td><label>Add Title:</label></td>
                        <td><input type="text" name="title" value="<%= rs.getString("title")%>" required></td>
                    </tr>
                    <tr>
                        <td><label>Color:</label></td>
                        <td><input type="text" name="color" value="<%= rs.getString("color")%>" required></td>
                    </tr>
                    <tr>
                        <td><label>Price:</label></td>
                        <td><input type="text" name="amount" id="p" value="<%= rs.getString("price")%>" required> <div id="s1"></div></td>
                    </tr>
                    <tr>
                        <td><label>Purchase date:</label></td>
                        <td><input type="date" name="purchase_date" class="dte" value="<%= rs.getString("purchase_date")%>" required></td>
                    </tr>
                    <tr>
                        <td><label>Description:</label></td>
                        <td><textarea name="description" rows="5" cols="50" required><%= rs.getString("description")%></textarea></td>
                    </tr>
                    <tr>
                        <td><label for="RE-biCYCLE">Images:</label></td>
                         <td><input type="file" id="file" name="image" onchange="return fileValidation()"> <div id="s2"></div></td>
                        <% session.setAttribute("image1", rs.getString("image")); %>
                    </tr>
                </table>
            </div>
            <div class="d">
                <button type="submit" value="submit">Save</button>
            </div>
        </form>
                <%
            }
        %>
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