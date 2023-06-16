package Controlador;

import ModeloDAO.PedidoDAO;
import ModeloVO.PedidoVO;

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
 * @author APRENDIZ
 */
@WebServlet(name = "PedidoControlador", urlPatterns = {"/Pedido"})
public class PedidoControlador extends HttpServlet {

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
        String pedId = request.getParameter("pedId");
        String pedFechaPedido = request.getParameter("pedFechaPedido");
        String pedFechaEntrega = request.getParameter("pedFechaEntrega");
        String pedEstado = request.getParameter("pedEstado");
        String prvId_fk = request.getParameter("prvId_fk");
        String pedTotal = request.getParameter("pedTotal");
        
        String detpId = request.getParameter("detpId");
        String pedId_fk = request.getParameter("pedId_fk");
        String matId_fk = request.getParameter("matId_fk");
        String detpPrecioUnidad = request.getParameter("detpPrecioUnidad");
        String detpCantidad = request.getParameter("detpCantidad");
        String detpSubTotal = request.getParameter("detpSubTotal");

        int opcion = Integer.parseInt(request.getParameter("opcion"));

        //2. ¿Quiién tiene los datos de forma segura? VO
        PedidoVO pedVO = new PedidoVO(pedId, pedFechaPedido, pedFechaEntrega, pedEstado, prvId_fk, pedTotal, detpId, pedId_fk, matId_fk, detpPrecioUnidad, detpCantidad, detpSubTotal);

        //3. ¿Quién hace las operaciones? DAO
        PedidoDAO pedDAO = new PedidoDAO(pedVO);

        //4. Administrar operaciones
        switch (opcion) {
            case 1: //Agregar registro
                if (pedDAO.agregarRegistro()) {
                    request.setAttribute("mensajeExito", "¡El pedido se registro correctamente!");
                } else {
                    request.setAttribute("mensajeError", "¡El pedido no se registro!");
                }
                request.getRequestDispatcher("registrarPedido.jsp").forward(request, response); //para enviar a la otra vista
                break;
            case 2: //Actualizar registro
                if (pedDAO.actualizarRegistro()) {
                    request.setAttribute("mensajeExito", "¡El pedido se actualizó correctamente!");
                    response.sendRedirect("index.jsp?mensajeExito=El+Pedido+se+actualizo+correctamente");
                } else {
                    request.setAttribute("mensajeError", "¡El pedido no se actualizó!");
                    response.sendRedirect("index.jsp?mensajeError=El+Pedido+no+se+actualizo+correctamente");
                }
                break;
            case 3: //Eliminar registro
                if (pedDAO.eliminarRegistro()) {
                    request.setAttribute("mensajeExito", "¡El pedido se eliminó correctamente!");
                } else {
                    request.setAttribute("mensajeError", "¡El pedido no se eliminó!");
                }
                request.getRequestDispatcher("consultarPedido.jsp").forward(request, response); //para enviar a la otra vista
                break;

            case 4:
                pedVO = pedDAO.consultarPorId(pedId);
                if (pedVO != null) {
                    request.setAttribute("pedidoEncontrado", pedVO);
                    request.getRequestDispatcher("actualizarPedido.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "Pedido NO Encontrado");
                    request.getRequestDispatcher("consultarPedido.jsp").forward(request, response);
                }
                break;
                
            case 5:
    String materiaJson = request.getParameter("materiaArray"); // Obtener la cadena JSON de productos desde la solicitud
    
    if (pedDAO.agregarAmbosRegistro(materiaJson)) {
        request.setAttribute("mensajeExito", "¡El pedido se registró correctamente!");
        response.sendRedirect("index.jsp?mensajeExito=El+Pedido+se+registro+correctamente");
    } else {
        request.setAttribute("mensajeError", "¡El pedido no se registró!");
        response.sendRedirect("index.jsp?mensajeError=El+Pedido+no+se+registro+correctamente");
    }
    break;
    case 6:
                materia(request, response);
                break;
            case 7:
                    if (pedDAO.eliminarMateria(detpId)) {
                    request.setAttribute("mensajeExito", "¡El materia prima se elimino!");
                    response.sendRedirect("index.jsp?mensajeExito=La+Materia+prima+se+elimino+correctamente");
                } else {
                    request.setAttribute("mensajeError", "¡La materia prima no se elimino!");
                    response.sendRedirect("index.jsp?mensajeError=La+materia+prima+no+se+elimino");
                }
                break;
                 case 8:
                     String materiaJsonAñadir = request.getParameter("materiaArrayAñadir"); 
                    if (pedDAO.actualizarMateria(materiaJsonAñadir, pedId_fk)) {
                    request.setAttribute("mensajeExito", "¡La materia prima se añadió!");
                    response.sendRedirect("index.jsp?mensajeExito=La+materia+prima+se+anadio+correctamente");
                } else {
                    request.setAttribute("mensajeError", "¡La materia prima no se añadió!");
                    response.sendRedirect("index.jsp?mensajeError=La+materia+prima+no+se+anadio");
                }
                break;
        }

    }

  private void materia(HttpServletRequest request, HttpServletResponse response) {
    try {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String pedId = request.getParameter("ped_id");
        PedidoDAO pedDAO = new PedidoDAO();
        ArrayList<PedidoVO> pedVOList = pedDAO.listarMateria(pedId);
        
        JSONArray jsonArray = new JSONArray();
        
        for (PedidoVO pedVO : pedVOList) {
            JSONObject json = new JSONObject();
            json.put("pedId", pedVO.getPedId());
            json.put("detpId", pedVO.getDetpId());
            json.put("materia", pedVO.getMatNombre());
            json.put("cantidad", pedVO.getDetpCantidad());
            json.put("subtotal", pedVO.getDetpSubTotal());
            
            jsonArray.put(json);
        }
        
        out.print(jsonArray);
    } catch (IOException ex) {
        Logger.getLogger(PedidoControlador.class.getName()).log(Level.SEVERE, null, ex);
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
            
        
        
 // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

