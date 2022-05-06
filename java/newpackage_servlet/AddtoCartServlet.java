/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage_servlet;
import newpackage_entities.Product;
import P.Dbcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
/**
 *
 * @author Nancy
 * 
 * @Webservlet("/add-to-cart")
 */
public class AddToCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int b_id=Integer.parseInt(request.getParameter("id"));
//            ArrayList<Product> cartList=new ArrayList<Product>();
//            Product cm=new Product();
//            cm.setId(id);
//            
//            HttpSession session =request.getSession();
            String s_id=request.getAttribute("uname").toString();
            if(s_id==null){
            response.sendRedirect("../../login.html");
            }
            try{
                Statement st=new Dbcon().con.createStatement();
                String query="Select * from cart where s_id='"+s_id+"' and b_id="+b_id+"";
                ResultSet rs=st.executeQuery(query);
                int z=0;
                if(rs.next()){
                z=1;
                }
                if(z!=1){
//                    PreparedStatement ps=new Dbcon().con.prepareStatement("insert into cart_details values(?,?)");
//                    String hname;
//                    long  cno;
//                    
//                    Statement ps1=new Dbcon().con.createStatement();
//                    ResultSet rs1=ps1.executeQuery("select * from user_details where s_id='"+s_id+"'");
//                    while(rs.next())
//                    {
//                        
//                    }
                    PreparedStatement ps=new Dbcon().con.prepareStatement("insert into cart(s_id,b_id) values(?,?)");
                    ps.setString(1, s_id);
                    ps.setInt(2, b_id);
                }
            }catch(Exception ex){
                ex.printStackTrace();
            }
            
//            ArrayList<Product> cart_list= (ArrayList<Product>)request.getAttribute("cart-list");
//            if(cart_list==null){
//                cartList.add(cm);
//                session.setAttribute("cart-list",cartList);
//            }
//            else{
//                cartList=cart_list;
//                boolean exist=false;
//                for(Product c: cart_list){
//                    if(c.getId()==id){
//                        exist=true;
//                        out.println("<h3 style='color:crimson; text-align: center'>Item Already in Cart. <a href='cart.jsp'>GO to Cart Page</a></h3>");
//                    }
//                }
//                if(!exist){
//                cartList.add(cm);
//                response.sendRedirect("buy.jsp");
//                }
//            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
