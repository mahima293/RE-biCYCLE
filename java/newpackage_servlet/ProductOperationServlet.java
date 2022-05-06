/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage_servlet;
import java.io.File;
import java.io.FileOutputStream;
import newpackage_entities.Product;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;


@MultipartConfig(fileSizeThreshold=1024*1024*2, //2mb
maxFileSize=1024*1024*10, //10mb
maxRequestSize=1024*1024*50)//50mb

public class ProductOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private String getFileName(final Part part) {
    final String partHeader = part.getHeader("content-disposition");
    
    for (String content : part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(
                    content.indexOf('=') + 1).trim().replace("\"", "");
        }
    }
    return null;
}
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ProductOperationServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ProductOperationServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");

//                String op= request.getParameter("operation");
//                if(op.trim().equals("addproduct")){
                    HttpSession session=request.getSession();
                    String s_id=session.getAttribute("uname").toString();
                    String id=request.getParameter("id");
                    String title=request.getParameter("title");
                    String color=request.getParameter("color");
                    int amount=Integer.parseInt(request.getParameter("amount"));
                    Date purchase_date=Date.valueOf(request.getParameter("purchase_date"));
                    String description=request.getParameter("description");
                    Part filePart=request.getPart("image");
                    
                    
//                    Product p=new Product();
//                    p.setTitle(title);
//                    p.setColor(color);
//                    p.setPrice(amount);
//                    p.setPurchase_date(purchase_date);
//                    p.setDescription(description);
//                    p.setImage(part.getSubmittedFileName());
                    
                    //save product
                    
                    String photo="";
                    String path="C:\\Users\\Mahima Agrawal\\Documents\\NetBeansProjects\\RE-biCYCLE\\web\\Images";
          
                    File file=new File(path);
                    file.mkdir();
                    String fileName = getFileName(filePart);
          
                    OutputStream out1=null;
          
                    InputStream filecontent = null;
            
                    PrintWriter writer = response.getWriter();
                    try {
                    out1 = new FileOutputStream(new File(path + File.separator
                        + fileName));

                filecontent = filePart.getInputStream();


                int read = 0;
                final byte[] bytes = new byte[1024];

                while ((read = filecontent.read(bytes)) != -1) {
                    out1.write(bytes, 0, read);

                    photo=path+"/"+fileName;
        
    }
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/RE-biCYCLE");
                PreparedStatement ps=conn.prepareStatement("insert into bicycle_details values(?,?,?,?,?,?,?,?)");
                ps.setString(1, id);
                ps.setString(2, title);
                ps.setString(3, color);
                ps.setInt(4,amount);
                ps.setDate(5,purchase_date);
                ps.setString(6,description);
                ps.setString(7,filePart.getSubmittedFileName());
                ps.setString(8, s_id);


                int x=ps.executeUpdate();



                if(x>0)
                {  
//                    out.print("Successfull");
                    
                    response.sendRedirect(request.getContextPath() + "/JSP/send_seller.jsp");
                    
//                    RequestDispatcher requestDispatcher = request
//                    .getRequestDispatcher("/buy.jsp");
//            requestDispatcher.forward(request, response);
        } else {

//            RequestDispatcher requestDispatcher = request
//                    .getRequestDispatcher("/seller.jsp");
//            requestDispatcher.forward(request, response);
//                out.print("Error");
response.sendRedirect(request.getContextPath() + "/JSP/seller.jsp");
                                }
            }
                catch(Exception ex){
                    System.out.println(ex.getMessage());
                    System.out.println("Message servlet page");
                    ex.printStackTrace();
                }
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
