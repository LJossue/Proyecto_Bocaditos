/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.MateriaDAO;
import ModeloVO.MateriaVO;
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
@WebServlet(name = "MateriaControlador", urlPatterns = {"/Materia"})
public class MateriaControlador extends HttpServlet {

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

        String matId = request.getParameter("matId");
        String matNombre = request.getParameter("matNombre");
        String detmCantidad = request.getParameter("detmCantidad");
        String detmUnidadDeMedida=request.getParameter("detmUnidadDeMedida");
        String matEstado = request.getParameter("matEstado");
  
        int opcion = Integer.parseInt(request.getParameter("opcion"));

        MateriaVO matVo = new MateriaVO(matId, matNombre,matEstado, detmCantidad,detmUnidadDeMedida );

        MateriaDAO matDao = new MateriaDAO(matVo);

        switch (opcion) {

            case 1:
                if (matDao.agregarRegistro()) {
                    request.setAttribute("mensajeExito", "Matería prima registrada correctamente");
                    response.sendRedirect("index.jsp?mensajeExito=La+materia+prima+se+registro+correctamente");
                } else {
                    request.setAttribute("mensajeError", "Matería no prima registrada correctamente");
                    response.sendRedirect("index.jsp?mensajeError=La+materia+prima+no+se+registro+correctamente");

                }
                break;
            case 2:
                if (matDao.actualizarRegistro()) {
                    request.setAttribute("mensajeExito", "Matería prima actualizada correctamente");
                     response.sendRedirect("index.jsp?mensajeExito=La+materia+prima+se+actualizo+correctamente");
                } else {
                    request.setAttribute("mensajeError", "Matería prima no actualizada correctamente");
                    response.sendRedirect("index.jsp?mensajeError=La+materia+prima+no+se+actualizo+correctamente");
                    

                }
        
                break;
            case 3:

                if (matDao.eliminarRegistro()) {
                     request.setAttribute("mensajeExito", "El rol de matería prima ha sido actualizado correctamente");
               response.sendRedirect("index.jsp?mensajeExito=El+estado+de+la+materia+prima+se+actualizo+correctamente");
                } else {
                   request.setAttribute("mensajeError", "El rol de matería prima no ha sido actualizado correctamente");
                   response.sendRedirect("index.jsp?mensajeError=El+estado+de+la+materia+prima+no+se+actualizo+correctamente");
                }

                break;
                case 4:

                if (matDao.restarMateria()) {
                     request.setAttribute("mensajeExito", "La cantidad de materia prima ha sido actualizado correctamente");
               response.sendRedirect("index.jsp?mensajeExito=La+cantidad+de+la+materia+prima+se+actualizo+correctamente");
                } else {
                   request.setAttribute("mensajeError", "La cantidad de materia prima no ha sido actualizado correctamente");
                   response.sendRedirect("index.jsp?mensajeError=La+cantidad+de+la+materia+prima+no+se+actualizo+correctamente");
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
