<%-- 
    Document   : GeneradorReporte
    Created on : 4/05/2023, 10:18:05 PM
    Author     : esteb
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Connection"%>
<%@page import="Util.ConexionBd"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String reportName = request.getParameter("reportName"); // Obtener el nombre del reporte de la URL

            // Verificar si el nombre del reporte es válido
            if (reportName != null && !reportName.isEmpty()) {
                String jasperFilePath = application.getRealPath("REPORTE/" + reportName + ".jasper"); // Ruta del archivo .jasper

                File reporte = new File(jasperFilePath);
                Map<String, Object> parametros = new HashMap<String, Object>();

                ConexionBd conexion = new ConexionBd();
                Connection objetoConexion = conexion.obtenerConexion();
                byte[] bytes = JasperRunManager.runReportToPdf(reporte.getPath(), parametros, objetoConexion);
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                response.setHeader("Content-Disposition", "attachment; filename=\"reportesBocaditos.pdf\";");
                ServletOutputStream salida = response.getOutputStream();
                salida.write(bytes, 0, bytes.length);
                salida.flush();
                salida.close();
            } else {
                // Manejar el caso en que no se proporciona un nombre de reporte válido
                out.println("Nombre de reporte inválido.");
            }

        %>
    </body>
</html>
