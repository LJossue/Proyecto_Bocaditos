<%-- 
    Document   : Sesiones
    Created on : 23/03/2023, 02:03:01 PM
    Author     : APRENDIZ
--%>

<%@page import="ModeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="icon" href="img/logo.png">
        <link rel="apple-touch-icon" href="img/logo.png">
    </head>
     <% 
        response.setHeader("Pragma","No-cache");
        response.setHeader("Cache-control", "no-cache,no-strore,must-revalidate");
        response.setDateHeader("Expires", 0);
    %>

        <%
            String usuario="";
            HttpSession buscarSesion = (HttpSession) request.getSession(); 
                
           if (buscarSesion.getAttribute("datosUsuario") != null )
            {
               UsuarioVO usuVO = (UsuarioVO) buscarSesion.getAttribute("datosUsuario");
                usuario = usuVO.getUsuNombre();
            }else
            {
                request.getRequestDispatcher("vacio.jsp").forward(request, response);
            }
        %>
       

</html>
