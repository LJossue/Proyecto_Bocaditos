/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.ClienteDAO;
import ModeloVO.ClienteVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author esteb
 */
@WebServlet(name = "ClienteControlador", urlPatterns = {"/Cliente"})
public class ClienteControlador extends HttpServlet {

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

        String cliId = request.getParameter("cliId");
        String cliDocumento = request.getParameter("cliDocumento");
        String cliTipoDocumento = request.getParameter("cliTipoDocumento");
        String cliNombre = request.getParameter("cliNombre");
        String cliApellido = request.getParameter("cliApellido");
        String cliCorreo = request.getParameter("cliCorreo");
        String cliDireccion = request.getParameter("cliDireccion");
        String cliTelefono = request.getParameter("cliTelefono");
        String cliEstado = request.getParameter("cliEstado");
        
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        
        ClienteVO cliVO = new ClienteVO(cliId, cliDocumento, cliTipoDocumento, cliNombre, cliApellido, cliCorreo,cliDireccion,cliTelefono,cliEstado);
        
        ClienteDAO cliDAO = new ClienteDAO(cliVO);
        
                switch(opcion){
            case 1: //Agregar registro
                if(cliDAO.agregarRegistro()){
                request.setAttribute("mensajeExito", "¡El cliente se registro correctamente!");
                 response.sendRedirect("index.jsp?mensajeExito=El+Cliente+se+registro+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡El cliente no se registro!");
                    response.sendRedirect("index.jsp?mensajeError=El+Cliente+no+se+registro+correctamente");
                }
               
                break;
            case 2: //Actualziar registro
                if(cliDAO.actualizarRegistro()){
                request.setAttribute("mensajeExito", "¡El cliente se actualizó correctamente!");
                response.sendRedirect("index.jsp?mensajeExito=El+Cliente+se+actualizo+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡El cliente no se actualizó!");
                    response.sendRedirect("index.jsp?mensajeError=El+Cliente+no+se+actualizo+correctamente");
                }
                
                break;
            case 3: //Eliminar registro
                 if(cliDAO.eliminarRegistro()){
                request.setAttribute("mensajeExito", "¡El estado del cliente se actualizo correctamente!");
                response.sendRedirect("index.jsp?mensajeExito=El+estado+del+Cliente+se+actualizo+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡El estado del cliente no se actualizo!");
                    response.sendRedirect("index.jsp?mensajeError=El+estado+del+Cliente+no+se+pudo+actualizar");
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
