/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.CategoriaDAO;
import ModeloVO.CategoriaVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author leand
 */
@WebServlet(name = "CategoriaControlador", urlPatterns = {"/Categoria"})
public class CategoriaControlador extends HttpServlet{

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
        String catId = request.getParameter("catId");
        String catDescripcion = request.getParameter("catDescripcion");
        String catEstado = request.getParameter("catEstado");
       
       
        
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        
         //2. ¿Quiién tiene los datos de forma segura? VO
        CategoriaVO catVO = new CategoriaVO(catId, catDescripcion, catEstado);
        
        CategoriaDAO catDAO = new CategoriaDAO(catVO);
        
        switch(opcion){
            case 1: //Agregar registro
                if(catDAO.agregarRegistro()){
                request.setAttribute("mensajeExito", "¡La categoría se registro correctamente!");
                response.sendRedirect("index.jsp?mensajeExito=La+Categoria+se+registro+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡La categoría no se registro!");
                    response.sendRedirect("index.jsp?mensajeError=La+Categoria+no+se+registro+correctamente");
                }
              
                break;
            case 2: //Actualziar registro
                if(catDAO.actualizarRegistro()){
                request.setAttribute("mensajeExito", "¡La categoría se actualizó correctamente!");
                response.sendRedirect("index.jsp?mensajeExito=La+Categoria+se+actualizo+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡La categoría no se actualizó!");
                    response.sendRedirect("index.jsp?mensajeExito=La+Categoria+no+se+actualizo+correctamente");
                }
                
                break;
            case 3: //Eliminar registro
                 if(catDAO.eliminarRegistro()){
                request.setAttribute("mensajeExito", "¡La categoría se eliminó correctamente!");
                response.sendRedirect("index.jsp?mensajeExito=Se+actualizo+el+estado+de+la+Categoria+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡La categoría no se eliminó!");
                     response.sendRedirect("index.jsp?mensajeError=El+estado+de+la+Categoria+no+se+pudo+actualizar");
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
