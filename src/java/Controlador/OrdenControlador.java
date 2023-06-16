/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.OrdenDAO;
import ModeloVO.OrdenVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * author APRENDIZ
 */
@WebServlet(name = "OrdenControlador", urlPatterns = {"/Orden"})
public class OrdenControlador extends HttpServlet {

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

        //1. recibir datos de las vistas
        String ordId = request.getParameter("ordId");
        String ordIdRepostero_fk = request.getParameter("ordIdRepostero_fk");
        String cliId_fk = request.getParameter("cliId_fk");
        String ordFechaPedido = request.getParameter("ordFechaPedido");
        String ordFechaEntrega = request.getParameter("ordFechaEntrega");
        String ordDireccion = request.getParameter("ordDireccion");
        String ordDetalles = request.getParameter("ordDetalles");
        String ordPrecioDomicilio = request.getParameter("ordPrecioDomicilio");
        String ordTotal = request.getParameter("ordTotal");
        String ordAbono = request.getParameter("ordAbono");
        String ordSaldo = request.getParameter("ordSaldo");
        String ordEstado = request.getParameter("ordEstado");
        //////////////////////////////////////////////////////
        // Obtener datos para detalles orden
        String detoId = request.getParameter("detoId");
        String ordId_fk = request.getParameter("ordId_fk");
        String prodId_fk = request.getParameter("prodid_fk");
        String detoSabor = request.getParameter("detosabor");
        String detoRelleno = request.getParameter("detorelleno");
        String detoPorciones = request.getParameter("detoporciones");
        String detoCantidad = request.getParameter("detocantidad");
        String detoPrecio = request.getParameter("detoprecio");
        String detoSubTotal = request.getParameter("detosubtotal");

        int opcion = Integer.parseInt(request.getParameter("opcion"));

        //2. quien tiene los datos de forma segura? VO
        OrdenVO ordVO = new OrdenVO(ordId, ordIdRepostero_fk, cliId_fk, ordFechaPedido, ordFechaEntrega, ordDireccion, ordDetalles, ordPrecioDomicilio, ordTotal, ordAbono, ordSaldo, ordEstado,detoId, ordId_fk, prodId_fk,detoSabor,detoRelleno,detoPorciones, detoCantidad, detoPrecio,detoSubTotal);
        // del VO detalles orden

        //3. quien hace las operaciones DAO
        OrdenDAO ordDAO = new OrdenDAO(ordVO);
        //4. administar opciones
        switch (opcion) {

            case 1:
                if (ordDAO.agregarRegistro()) {

                    request.setAttribute("mensajeExito", "¡La orden se registro correctamente!");
                } else {
                    request.setAttribute("mensajeError", "La orden NO se registro correctamente");
                }
                request.getRequestDispatcher("registrarOrden.jsp").forward(request, response);
                break;

            case 2:
                if (ordDAO.actualizarRegistro()) {
                    request.setAttribute("mensajeExito", "¡La orden se actualizó correctamente!");
                    response.sendRedirect("index.jsp?mensajeExito=La+Orden+se+actualizo+correctamente");
                } else {
                    request.setAttribute("mensajeError", "¡La orden no se actualizó!");
                    response.sendRedirect("index.jsp?mensajeError=La+Orden+no+se+actualizo+correctamente");
                }
                break;

            case 3:
                if (ordDAO.eliminarRegistro()) {

                    request.setAttribute("mensajeExito", "¡La orden se elimino correctamente!");
                } else {
                    request.setAttribute("mensajeError", "La orden NO se elimino correctamente");
                }
                request.getRequestDispatcher("consultarOrden.jsp").forward(request, response);
                break;

            case 4:
                String productosJson = request.getParameter("productosArray"); // Obtener la cadena JSON de productos desde la solicitud

                if (ordDAO.agregarAmbosRegistro(productosJson)) {
                    request.setAttribute("mensajeExito", "¡La orden se registró correctamente!");
                    response.sendRedirect("index.jsp?mensajeExito=La+Orden+se+registro+correctamente");
                } else {
                    request.setAttribute("mensajeError", "¡La orden no se registró!");
                    response.sendRedirect("index.jsp?mensajeError=La+Orden+no+se+registro+correctamente");
                }
                break;
            case 5:
                productos(request, response);
                break;
            case 6:
                    if (ordDAO.eliminarProducto(detoId)) {
                    request.setAttribute("mensajeExito", "¡El producto se elimino!");
                    response.sendRedirect("index.jsp?mensajeExito=El+producto+se+elimino+correctamente");
                } else {
                    request.setAttribute("mensajeError", "¡El producto no se elimino!");
                    response.sendRedirect("index.jsp?mensajeError=El+producto+no+se+elimino");
                }
                break;
                 case 7:
                     String productosJsonAñadir = request.getParameter("productosArrayAñadir"); 
                    if (ordDAO.actualizarProductos(productosJsonAñadir, ordId_fk)) {
                    request.setAttribute("mensajeExito", "¡El producto se añadió!");
                    response.sendRedirect("index.jsp?mensajeExito=El+producto+se+añadio+correctamente");
                } else {
                    request.setAttribute("mensajeError", "¡El producto no se añadió!");
                    response.sendRedirect("index.jsp?mensajeError=El+producto+no+se+añadio");
                }
                break;
        }

    }

  private void productos(HttpServletRequest request, HttpServletResponse response) {
    try {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String ordId = request.getParameter("ord_id");
        OrdenDAO ordDAO = new OrdenDAO();
        ArrayList<OrdenVO> ordVOList = ordDAO.listarProductos(ordId);
        
        JSONArray jsonArray = new JSONArray();
        
        for (OrdenVO ordVO : ordVOList) {
            JSONObject json = new JSONObject();
            json.put("OrdId", ordVO.getOrdId());
            json.put("detoId", ordVO.getDetoId());
            json.put("producto", ordVO.getProNombre());
            json.put("sabor", ordVO.getDetoSabor());
            json.put("relleno", ordVO.getDetoRelleno());
            json.put("porciones", ordVO.getDetoPorciones());
            json.put("cantidad", ordVO.getDetoCantidad());
            json.put("subtotal", ordVO.getDetoSubTotal());
            
            jsonArray.put(json);
        }
        
        out.print(jsonArray);
    } catch (IOException ex) {
        Logger.getLogger(OrdenControlador.class.getName()).log(Level.SEVERE, null, ex);
    }
}
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    processRequest(request, response);
}
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    processRequest(request, response);
}
}
