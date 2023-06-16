



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ModeloDAO.UsuarioDAO;
import ModeloVO.UsuarioVO;
import Util.ConexionBd;
import Util.Crud;
import java.sql.Connection;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author APRENDIZ
 */
@WebServlet(urlPatterns = {"/EnvioCorreo"})
public class EnvioCorreo extends HttpServlet {
private String servidor, puerto, usuario, clave;

public void init(){ //ES EL QUE APENAS UNO EJECUTA EJECUTA LA CLASE O SERVLET SE EJECUTA (SE USA PARA INICIALIZAR ATRIBUTOS)
    ServletContext context = getServletContext(); //servlet contxt es para almacenar datos vulnerables
    servidor = context.getInitParameter("servidor"); //aca se llama del web.xml de web inf para asegurar la informacion
    puerto = context.getInitParameter("puerto");
    usuario = context.getInitParameter("usuario");
    clave = context.getInitParameter("clave");
    //SI LO QUIERO HACER PARA LA CLAVE DE LA BD SERIA IGUAL PERO SIN EL SERVLET CONTEXT
}
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
     String correoDestino = request.getParameter("destino");
     
     UsuarioDAO usuarioDAO = new UsuarioDAO();
     UsuarioVO usuarioVO = usuarioDAO.consultarPorCorreo(correoDestino);
     
     if (usuarioVO == null) {
 
    // Si el usuario no existe en la base de datos, muestra un mensaje de error
response.sendRedirect("login.jsp?mensajeError=El+correo+ingresado+no+se+encuentra+registrado");
    return;
}
    
     String correoUsuario = request.getParameter("destino");
    String destino = request.getParameter("destino"); //se recibe de una vista
     String asunto = request.getParameter("asunto");
     String mensaje = request.getParameter("mensaje"); //en este caso se hace recogiendolo de una vista, pero se puede hacer el asunto y el mensaje predeterminado
     String resultadoMensaje = "";
     
    
     
     
     try {
        PropiedadesCorreo.envioCorreo(servidor, puerto, usuario, clave, destino, asunto, mensaje);
        response.sendRedirect("login.jsp?mensajeExito=El+correo+se+envio+correctamente");
    } catch (Exception e) {
        e.printStackTrace();
        
        response.sendRedirect("login.jsp?mensajeError=El+correo+no+se+envio+correctamente");
    }
    
}

}
