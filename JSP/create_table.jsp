
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" import="P.Dbcon"%>
<!DOCTYPE html>
<%
    try{
          String q="create table message(ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY(Start with 1, Increment by 1) ,EMAIL VARCHAR(50),SUBJECT VARCHAR(200),BODY VARCHAR(2000))";
//            String q="create table cart_details(S_ID VARCHAR(15) NOT NULL,B_ID INT NOT NULL, HOSTEL_NAME VARCHAR(100), ROOM_NO INT, CONTACH_NO BIGINT, ORDERDATE DATE,DELIVERYDATE DATE, PAYMENT_METHOD VARCHAR(50), ACCOUNT_NO VARCHAR(20), STATUS VARCHAR(20),PRIMARY KEY (S_ID, B_ID))";
        Statement st=new Dbcon().con.createStatement();
        st.execute(q);
//        ResultSet rs=st.executeQuery(q);
//        if(rs.next()){
        System.out.print("Table Created");
//        }
//        else{
//        System.out.print("Failed");
//        }
    }catch(Exception ex){
        System.out.print("Some error occurred");
        ex.printStackTrace();
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    </body>
</html>
