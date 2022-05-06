/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage_dao;
import newpackage_entities.Product;
import P.Dbcon;
import java.sql.*;
import java.util.*;
public class Product_Dao {
    public List<Product> getAllProduct() throws SQLException{
        List<Product> pd=new ArrayList<Product>();
            String query="select * from bicycle_details where b_id not in (select b_id from cart_details where status='sold')";
            Statement st=new Dbcon().con.createStatement();
            ResultSet rs=st.executeQuery(query);
            while (rs.next()) {
                Product p=new Product();
                p.setId(rs.getInt("b_id"));
                p.setTitle(rs.getString("title"));
                p.setColor(rs.getString("color"));
                p.setPrice(rs.getInt("price"));
                p.setPurchase_date(String.valueOf(rs.getDate("purchase_date")));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                pd.add(p);
            }
            return pd;
}
//    public List<Product> getCartProducts(ArrayList<Product> cartList ) throws SQLException{
//        List<Product> pd=new ArrayList<Product>();
//        try{
//            
//        if(cartList.size()>0){
//            for(Product item: cartList){
//                String query="select * from bicycle_details where id=?";
//                PreparedStatement st=new Dbcon().con.prepareStatement(query);
//                st.setInt(1, item.getId());
//                ResultSet rs=st.executeQuery();
//                while (rs.next()) {
//                    Product p=new Product();
//                    p.setTitle(rs.getString("title"));
//                    p.setColor(rs.getString("color"));
//                    p.setPrice(rs.getInt("price"));
//                    p.setPurchase_date(String.valueOf(rs.getDate("purchase_date")));
//                    p.setDescription(rs.getString("description"));
//                    p.setImage(rs.getString("image"));
//                    pd.add(p);
//                }
//            }
//        }
//        }catch(Exception ex){
//        ex.printStackTrace();
//        }
//        
//        return pd;
//    }
}
