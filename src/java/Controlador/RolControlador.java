/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.RolDAO;
import ModeloVO.RolVO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author leand
 */
@WebServlet(name = "RolControlador", urlPatterns = {"/Rol"})
public class RolControlador extends HttpServlet {

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
        String rolId = request.getParameter("rolId");
        String rolDescripcion = request.getParameter("rolDescripcion");
        String rolEstado = request.getParameter("rolEstado");
       
       
        
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        
         //2. ¿Quiién tiene los datos de forma segura? VO
        RolVO rolVO = new RolVO(rolId, rolDescripcion, rolEstado);
        
        RolDAO rolDAO = new RolDAO(rolVO);
        
        switch(opcion){
            case 1: //Agregar registro
                if(rolDAO.agregarRegistro()){
                request.setAttribute("mensajeExito", "¡El rol se registro correctamente!");
                 response.sendRedirect("index.jsp?mensajeExito=El+rol+se+registro+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡El rol no se registro!");
                    response.sendRedirect("index.jsp?mensajeError=El+rol+no+se+registro+correctamente");
                }
                //para enviar a la otra vista
                break;
            case 2: //Actualziar registro
                if(rolDAO.actualizarRegistro()){
                request.setAttribute("mensajeExito", "¡El rol se actualizó correctamente!");
                response.sendRedirect("index.jsp?mensajeExito=El+rol+se+actualizo+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡El rol no se actualizó!");
                     response.sendRedirect("index.jsp?mensajeError=El+rol+no+se+actualizo+correctamente");
                }
                
                break;
            case 3: //Eliminar registro
                 if(rolDAO.eliminarRegistro()){
                request.setAttribute("mensajeExito", "¡Se actualizó el estado del Rol correctamente!");
                response.sendRedirect("index.jsp?mensajeExito=Se+actualizo+el+estado+del+Rol+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡El estado del Rol no se pudo actualizar!");
                    response.sendRedirect("index.jsp?mensajeError=El+estado+del+Rol+no+se+pudo+actualizar");
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