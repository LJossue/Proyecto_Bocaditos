/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.ProductoDAO;
import ModeloVO.ProductoVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author leand
 */
@WebServlet(name = "ProductoControlador", urlPatterns = {"/Producto"})
public class ProductoControlador extends HttpServlet {

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
        String proId = request.getParameter("proId");
        String proNombre = request.getParameter("proNombre");
        String proCantidad = request.getParameter("proCantidad");
        String proEstado = request.getParameter("proEstado");
        String proPrecio = request.getParameter("proPrecio");
        String catId_fk = request.getParameter("catId_fk");
       
       
        
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        
         //2. ¿Quiién tiene los datos de forma segura? VO
        ProductoVO proVO = new ProductoVO(proId, proNombre, proEstado, catId_fk);
        
        ProductoDAO proDAO = new ProductoDAO(proVO);
        
        switch(opcion){
            case 1: //Agregar registro
                if(proDAO.agregarRegistro()){
                request.setAttribute("mensajeExito", "¡El producto se registro correctamente!");
                response.sendRedirect("index.jsp?mensajeExito=El+Producto+se+registro+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡El producto no se registro!");
                    response.sendRedirect("index.jsp?mensajeError=El+Producto+no+se+registro+correctamente");
                }
                
                break;
            case 2: //Actualziar registro
                if(proDAO.actualizarRegistro()){
                request.setAttribute("mensajeExito", "¡El producto se actualizó correctamente!");
                response.sendRedirect("index.jsp?mensajeExito=El+Producto+se+actualizo+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡El producto no se actualizó!");
                    response.sendRedirect("index.jsp?mensajeError=El+Producto+no+se+actualizo+correctamente");
                }
                
                break;
            case 3: //Eliminar registro
                 if(proDAO.eliminarRegistro()){
                request.setAttribute("mensajeExito", "¡El producto se eliminó correctamente!");
                response.sendRedirect("index.jsp?mensajeExito=El+estado+del+Producto+se+actualizo+correctamente");
                }
                else{
                    request.setAttribute("mensajeError", "¡El producto no se eliminó!");
                    response.sendRedirect("index.jsp?mensajeError=El+estado+del+Producto+no+se+actualizo+correctamente");
                }
               
                break;
             
        }}
    
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