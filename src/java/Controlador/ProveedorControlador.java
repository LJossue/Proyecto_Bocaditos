package Controlador;

import ModeloDAO.ProveedorDAO;
import ModeloVO.ProveedorVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(name = "ProveedorControlador", urlPatterns = {"/Proveedor"})
public class ProveedorControlador extends HttpServlet {

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

        //1. Recibir datos de las vistas
        String prvId = request.getParameter("prvId");
        String prvNit = request.getParameter("prvNit");
        String prvNombre = request.getParameter("prvNombre");
        String prvDireccion = request.getParameter("prvDireccion");
        String prvTelefono = request.getParameter("prvTelefono");
        String prvCorreo = request.getParameter("prvCorreo");
        String prvEstado = request.getParameter("prvEstado");
        
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        
        
        
        //2. ¿Quiién tiene los datos de forma segura? VO
        ProveedorVO prvVO = new ProveedorVO(prvId, prvNit, prvNombre, prvDireccion, prvTelefono, prvCorreo, prvEstado);
        
        //3. ¿Quién hace las operaciones? DAO
        ProveedorDAO prvDAO = new ProveedorDAO(prvVO);
        
        //4. Administrar operaciones
        switch(opcion){
            case 1: //Agregar registro
                if(prvDAO.agregarRegistro()){
                request.setAttribute("mensajeExito", "¡El proveedor se registro correctamente!");
                 response.sendRedirect("index.jsp?mensajeExito=El+proveedor+se+registro+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡El proveedor no se registro!");
                     response.sendRedirect("index.jsp?mensajeError=El+proveedor+no+se+registro+correctamente");
                }
              
                break;
            case 2: //Actualziar registro
                if(prvDAO.actualizarRegistro()){
                request.setAttribute("mensajeExito", "¡El proveedor se actualizó correctamente!");
                 response.sendRedirect("index.jsp?mensajeExito=El+proveedor+se+actualizo+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡El proveedor no se actualizó!");
                    response.sendRedirect("index.jsp?mensajeError=El+proveedor+no+se+actualizo+correctamente");
                }
                
                break;
            case 3: //Eliminar registro
                 if(prvDAO.eliminarRegistro()){
                request.setAttribute("mensajeExito", "¡El proveedor se eliminó correctamente!");
                response.sendRedirect("index.jsp?mensajeExito=El+rol+del+proveedor+se+actualizo+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡El proveedor no se eliminó!");
                     response.sendRedirect("index.jsp?mensajeError=El+rol+del+proveedor+no+se+actualizo+correctamente");
                }
                
                break;
            
          
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
