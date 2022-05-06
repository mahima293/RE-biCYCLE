/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package P;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Dbcon {
    public Connection con;
        public Dbcon(){
            try{
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                con=DriverManager.getConnection("jdbc:derby://localhost:1527/RE-biCYCLE");
//                System.out.println("Connection Successfull");
            }catch(Exception e){
                e.printStackTrace();
            }
            //return null;
        }
}
