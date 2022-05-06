package newpackage_servlet;
import P.Dbcon;
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


@MultipartConfig

public class update extends HttpServlet {

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
                    HttpSession session=request.getSession();
                    String id=request.getParameter("id");
                    String title=request.getParameter("title");
                    String color=request.getParameter("color");
                    int amount=Integer.parseInt(request.getParameter("amount"));
                    Date purchase_date=Date.valueOf(request.getParameter("purchase_date"));
                    String description=request.getParameter("description");
                    String uname=session.getAttribute("uname").toString();
                    Part filePart=request.getPart("image");
                    Long z=filePart.getSize();
                    String image="";
                    if(z==0){
                        image=session.getAttribute("image1").toString();  
                    }
                    if(z!=0){
                        String photo="";
                        String path="C:\\Users\\Mahima Agrawal\\Documents\\NetBeansProjects\\RE-biCYCLE\\web\\Images";

                        File file=new File(path);
                        file.mkdir();
                        String fileName = getFileName(filePart);

                        OutputStream out1=null;

                        InputStream filecontent = null;

                        PrintWriter writer = response.getWriter();
                        out1 = new FileOutputStream(new File(path + File.separator
                            + fileName));

                    filecontent = filePart.getInputStream();


                    int read = 0;
                    final byte[] bytes = new byte[1024];

                    while ((read = filecontent.read(bytes)) != -1) {
                        out1.write(bytes, 0, read);

                        photo=path+"/"+fileName;

        }}
                PreparedStatement ps=new Dbcon().con.prepareStatement("update bicycle_details set title= ?, color=?, price=?, purchase_date=?, description=?, image=? where S_id=? and b_id=?");
                ps.setString(1, title);
                ps.setString(2, color);
                ps.setInt(3,amount);
                ps.setDate(4,purchase_date);
                ps.setString(5,description);
                if(z!=0){
                ps.setString(6,filePart.getSubmittedFileName());}
                else{
                    ps.setString(6,image);
                }
                ps.setString(7, uname);
                ps.setString(8, id);
                int x=ps.executeUpdate();
                if(x>0)
                {  
                    String p=request.getContextPath() + "/JSP/view_bicycle.jsp";
                    out.println("<script language='Javascript'>");
                    out.println("alert('Updated Successfull')");
                    out.println("window.location.href='"+p+"'");
                    out.println("</script>");
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