<%@page import="ModeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="img/logo.png">
    <link rel="apple-touch-icon" href="img/logo.png">
</head>
<% 
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
    response.setDateHeader("Expires", 0);

    String usuario = "";
    HttpSession buscarSesion = request.getSession(); 
                
    if (buscarSesion.getAttribute("datosUsuario") != null) {
        UsuarioVO usuVO = (UsuarioVO) buscarSesion.getAttribute("datosUsuario");
        usuario = usuVO.getUsuNombre();
        
        // Redireccionar a la página deseada después del inicio de sesión
        response.sendRedirect("index.jsp");
        return;
    }
%>
</html>
