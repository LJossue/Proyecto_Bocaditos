package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ModeloVO.UsuarioVO;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Sesiones.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("         <link rel=\"icon\" href=\"img/logo.png\">\n");
      out.write("        <link rel=\"apple-touch-icon\" href=\"img/logo.png\">\n");
      out.write("    </head>\n");
      out.write("     ");
 
        response.setHeader("Pragma","No-cache");
        response.setHeader("Cache-control", "no-cache,no-strore,must-revalidate");
        response.setDateHeader("Expires", 0);
    
      out.write("\n");
      out.write("\n");
      out.write("        ");

            String usuario="";
            HttpSession buscarSesion = (HttpSession) request.getSession(); 
                
           if (buscarSesion.getAttribute("datosUsuario") != null )
            {
               UsuarioVO usuVO = (UsuarioVO) buscarSesion.getAttribute("datosUsuario");
                usuario = usuVO.getUsuNombre();
            }else
            {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        
      out.write("\n");
      out.write("       \n");
      out.write("\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html lang=\"es\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("\n");
      out.write("        <!-- Boxicons -->\n");
      out.write("        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>\n");
      out.write("  \n");
      out.write("        <link rel=\"icon\" href=\"img/logo.png\">\n");
      out.write("        <link rel=\"apple-touch-icon\" href=\"img/logo.png\">\n");
      out.write("        <!-- JQUERY -->\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script> \n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/sweetalert2@10.16.3/dist/sweetalert2.min.css\">\n");
      out.write("  <script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js\"></script>\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css\">\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js\"></script>\n");
      out.write("                <!-- My CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"style.css\"> \n");
      out.write("        <title>Bocaditos - Sistema de Información</title>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("     ");
 String mensajeExito = request.getParameter("mensajeExito");
if (request.getParameter("mensajeExito") != null) {
    request.setAttribute("mensajeExito", mensajeExito.replace("+", " "));
} 
      out.write('\n');
 String mensajeError = request.getParameter("mensajeError");
if (request.getParameter("mensajeError") != null) {
    request.setAttribute("mensajeError", mensajeError.replace("+", " "));
} 
      out.write('\n');
 if (request.getAttribute("mensajeError") != null) { 
      out.write("\n");
      out.write("     <script> \n");
      out.write("        const Toast = Swal.mixin({\n");
      out.write("            toast: true,\n");
      out.write("            position: 'top-end',\n");
      out.write("            showConfirmButton: false,\n");
      out.write("            timer: 3000,\n");
      out.write("            timerProgressBar: true,\n");
      out.write("            didOpen: (toast) => {\n");
      out.write("                toast.addEventListener('mouseenter', Swal.stopTimer)\n");
      out.write("                toast.addEventListener('mouseleave', Swal.resumeTimer)\n");
      out.write("            }\n");
      out.write("        })\n");
      out.write("\n");
      out.write("        Toast.fire({\n");
      out.write("            icon: 'error',\n");
      out.write("            title: '");
      out.print( request.getAttribute("mensajeError") );
      out.write("'\n");
      out.write("        })\n");
      out.write("     </script>\n");
 } else if(request.getAttribute("mensajeExito") != null) { 
      out.write("\n");
      out.write("     <script> \n");
      out.write("        const Toast = Swal.mixin({\n");
      out.write("            toast: true,\n");
      out.write("            position: 'top-end',\n");
      out.write("            showConfirmButton: false,\n");
      out.write("            timer: 3000,\n");
      out.write("            timerProgressBar: true,\n");
      out.write("            didOpen: (toast) => {\n");
      out.write("                toast.addEventListener('mouseenter', Swal.stopTimer)\n");
      out.write("                toast.addEventListener('mouseleave', Swal.resumeTimer)\n");
      out.write("            }\n");
      out.write("        })\n");
      out.write("\n");
      out.write("        Toast.fire({\n");
      out.write("            icon: 'success',\n");
      out.write("            title: '");
      out.print( request.getAttribute("mensajeExito") );
      out.write("'\n");
      out.write("        })\n");
      out.write("     </script>\n");
 } 
      out.write("\n");
      out.write("\n");
      out.write("        <!-- SIDEBAR -->\n");
      out.write("        <section id=\"sidebar\">\n");
      out.write("            <a href=\"index.jsp\" class=\"brand\">\n");
      out.write("                <img src=\"img/LOGO CUPCAKE.png\" alt=\"Logo Bocaditos\" >\n");
      out.write("                <span class=\"text\">Bocaditos</span>\n");
      out.write("            </a>\n");
      out.write("            <ul class=\"side-menu top\">\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\" id=\"dashboard\">\n");
      out.write("                        <i class='bx bxs-dashboard'></i>\n");
      out.write("                        <span class=\"text\">Dashboard</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\">\n");
      out.write("                        <i class='bx bxs-receipt'></i>\n");
      out.write("                        <span class=\"text\">Mis Ordenes</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\" id=\"usuario\">\n");
      out.write("                        <i class='bx bxs-group'></i>\n");
      out.write("                        <span class=\"text\">Equipo</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </ul>\n");
      out.write("            <ul class=\"side-menu top\">\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\" id=\"producto\">\n");
      out.write("                        <i class='bx bxs-cake'></i>\n");
      out.write("                        <span class=\"text\">Producto</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\" id=\"cliente\">\n");
      out.write("                        <i class='bx bxs-group'></i>\n");
      out.write("                        <span class=\"text\">Cliente</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\" id=\"orden\">\n");
      out.write("                        <i class='bx bxs-receipt'></i>\n");
      out.write("                        <span class=\"text\">Orden</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\" id=\"categoria\">\n");
      out.write("                        <i class='bx bxs-food-menu'></i>\n");
      out.write("                        <span class=\"text\">Categoría</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\" id=\"materia\">\n");
      out.write("                        <i class='bx bxs-package'></i>\n");
      out.write("                        <span class=\"text\">Matería Prima</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\" id=\"pedido\">\n");
      out.write("                        <i class='bx bxs-truck'></i>\n");
      out.write("                        <span class=\"text\">Pedido</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\" id=\"proveedor\">\n");
      out.write("                        <i class='bx bxs-store' ></i>\n");
      out.write("                        <span class=\"text\">Proveedor</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#\" id=\"rol\">\n");
      out.write("                        <i class='bx bxs-user-circle'></i>\n");
      out.write("                        <span class=\"text\">Rol</span>\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </ul>\n");
      out.write("            <ul class=\"side-menu\">\n");
      out.write("\n");
      out.write("                <li>\n");
      out.write("                   <form id=\"miFormulario\" method=\"post\" action=\"Sesiones\" style=\"display: none;\">\n");
      out.write("    <input type=\"submit\" value=\"Cerrar Sesion\">\n");
      out.write("</form>\n");
      out.write("                    <a href=\"#\" onclick=\"document.querySelector('#miFormulario').submit(); return false; \" class=\"logout\"><i class='bx bxs-log-out-circle'></i>Cerrar Sesion</a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </section>\n");
      out.write("        <!-- SIDEBAR -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- CONTENT -->\n");
      out.write("        <section id=\"content\">\n");
      out.write("            <!-- NAVBAR -->\n");
      out.write("            <nav>\n");
      out.write("                <i class='bx bx-menu'></i>\n");
      out.write("                <form action=\"#\">\n");
      out.write("                    <div class=\"form-input\">\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("                <input type=\"checkbox\" id=\"switch-mode\" hidden>\n");
      out.write("                <label for=\"switch-mode\" class=\"switch-mode\"></label>\n");
      out.write("               \n");
      out.write("                <a href=\"#\" id=\"perfil\" class=\"profile\">\n");
      out.write("   ");
 UsuarioVO usuVO = (UsuarioVO) buscarSesion.getAttribute("datosUsuario");
   if (usuVO.getRolId_fk().equals("1")) {
      out.write("\n");
      out.write("   <img src=\"img/boss.png\">\n");
      out.write("   ");
 } else if (usuVO.getRolId_fk().equals("2")) {
      out.write("\n");
      out.write("   <img src=\"img/manager.png\">\n");
      out.write("   ");
 } else if (usuVO.getRolId_fk().equals("3")) {
      out.write("\n");
      out.write("   <img src=\"img/baker.png\">\n");
      out.write("    ");
 } else{
      out.write("\n");
      out.write("    <img src=\"img/baker.png\">\n");
      out.write("    ");
 }
      out.write("\n");
      out.write("                </a>\n");
      out.write("            </nav>\n");
      out.write("            <!-- NAVBAR -->\n");
      out.write("\n");
      out.write("            <!-- MAIN -->\n");
      out.write("            <main id=\"main-content\">\n");
      out.write("\n");
      out.write("            </main>\n");
      out.write("\n");
      out.write("            <!-- MAIN -->\n");
      out.write("        </section>\n");
      out.write("        <!-- CONTENT -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script src=\"script.js\"></script>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
