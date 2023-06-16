/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.DetallesMateriaDAO;
import ModeloVO.DetallesMateriaVO;
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
@WebServlet(name = "DetallesMateriaControlador", urlPatterns = {"/Detalles"})
public class DetallesMateriaControlador extends HttpServlet {

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
        
         String detmId = request.getParameter("detmId");
        String proId_fk = request.getParameter("proId_fk");
        String matId_fk = request.getParameter("matId_fk");
        String detmCantidad = request.getParameter("detmCantidad");
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        
        DetallesMateriaVO detVO = new DetallesMateriaVO(detmId, proId_fk, matId_fk, detmCantidad);
        DetallesMateriaDAO detDAO = new DetallesMateriaDAO(detVO);
        
        
        
                switch (opcion) {

            case 1:
                if (detDAO.actualizarRegistro()) {

                    request.setAttribute("mensajeExito", "¡El registro se actualizo correctamente!");
                } else {
                    request.setAttribute("mensajeError", "El registro NO se actualizo correctamente");
                }
                request.getRequestDispatcher("actualizarDetallesMateria.jsp").forward(request, response);
                break;

            

            case 2:
                detVO = detDAO.consultarPorId(detmId);
                if (detVO != null) {
                    request.setAttribute("Registro encontrado", detVO);
                    request.getRequestDispatcher("actualizarDetallesMateria.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "Registro NO encontrado");
                    request.getRequestDispatcher("consultarDetallesMateria.jsp").forward(request, response);

                }
                break;
                
                

            case 3:
                if (detDAO.agregarRegistro()) {

                    request.setAttribute("mensajeExito", "¡El registro se agrego correctamente!");
                } else {
                    request.setAttribute("mensajeError", "El registro NO se agrego");
                }
                request.getRequestDispatcher("registrarDetallesMateria.jsp").forward(request, response);
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
