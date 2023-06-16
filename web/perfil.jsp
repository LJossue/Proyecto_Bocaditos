<%@include file="Sesiones2.jsp"%>
<%@page import="ModeloDAO.UsuarioDAO"%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.OrdenDAO"%>
<%@page import="ModeloVO.OrdenVO"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="ModeloVO.ProductoVO"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<% UsuarioVO usuVO = (UsuarioVO) buscarSesion.getAttribute("datosUsuario");
String Id = usuVO.getUsuId();
UsuarioDAO usuDAO = new UsuarioDAO();
UsuarioVO usuVO2 = usuDAO.consultarPorId(Id);
%>

<section class="modal modal_telefono">
        <div class="modal_container">
            <h2 class="modal_title">Actualizar Télefono</h2>
            <form method="post" action="Usuario">
                <div class="inputs">
                    <div>
                        <label class="modal_paragraph">Télefono Nuevo:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="text" placeholder="Télefono" name="usuTelefono" id="usuTelefono" pattern="[0-9]{10}" title="Ingrese solo números (10 caracteres)" onkeypress="return event.charCode >= 48 && event.charCode <= 57" required>           
                    </div>
                     <div>
                        <label class="modal_paragraph">Confirmar Télefono:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="text" placeholder="Confirmar Télefono" name="confirmarTelefono" oninput="validarTelefono()" pattern="[0-9]{10}" title="Ingrese solo números (10 caracteres)" onkeypress="return event.charCode >= 48 && event.charCode <= 57" required>         
                        <input class="modal_input" type="hidden" name="usuId" value="<%=usuVO.getUsuId()%>" >
                    </div>
                </div>
               <div class="swal2-actions">
                    <a href="#" class="modal_close_telefono swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Actualizar</button>

                </div>
                <input type="hidden" name="opcion" value="7">       


            </form>

        </div>

    </section>
<section class="modal modal_direccion">
        <div class="modal_container">
            <h2 class="modal_title">Actualizar Dirección</h2>
            <form method="post" action="Usuario">
                <div class="inputs">
                    <div>
                        <label class="modal_paragraph">Dirección Nueva:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="text" placeholder="Dirección" name="usuDireccion" id="usuDireccion" required >            
                    </div>
                     <div>
                        <label class="modal_paragraph">Confirmar Dirección:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="text" placeholder="Confirmar Dirección"  name="confirmarDireccion" oninput="validarDireccion()" required >   
                        <input class="modal_input" type="hidden" name="usuId" value="<%=usuVO.getUsuId()%>" >
                    </div>
                </div>
               <div class="swal2-actions">
                    <a href="#" class="modal_close_direccion swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Actualizar</button>

                </div>
                <input type="hidden" name="opcion" value="8">       


            </form>

        </div>

    </section>
<section class="modal modal_contraseña">
        <div class="modal_container">
            <h2 class="modal_title">Actualizar Contraseña</h2>
            <form method="post" action="Usuario">
                <div class="inputs">
                   
                    <div>
                        <label class="modal_paragraph">Contraseña Nueva:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="password" placeholder="Contraseña" name="usuContrasena" id="usuContrasena"  pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" title="La contraseña debe contener al menos 8 caracteres, incluyendo al menos una letra mayúscula, una letra minúscula, un número y un carácter especial (@$!%*?&)." required >            
                    </div>
                     <div>
                        <label class="modal_paragraph">Confirmar Contraseña:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="password" placeholder="Confirmar Contraseña" name="confirmarContrasena" oninput="validarContrasena()" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" title="La contraseña debe contener al menos 8 caracteres, incluyendo al menos una letra mayúscula, una letra minúscula, un número y un carácter especial (@$!%*?&)." required >   
                        <input class="modal_input" type="hidden" name="usuId" value="<%=usuVO.getUsuId()%>" >
                    </div>
                </div>
               <div class="swal2-actions">
                    <a href="#" class="modal_close_contraseña swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Actualizar</button>

                </div>
                <input type="hidden" name="opcion" value="9">       


            </form>

        </div>

    </section>


 <div class="box-info2">
  <div class="perfil1">
    <div>
      <h2><%=usuVO.getUsuNombre()%> <%=usuVO.getUsuApellido()%></h2>
      <h4><%=usuVO.getUsuTipoDocumento()%> <%=usuVO.getUsuDocumento()%></h4>
    </div>
    <div class="fondo-perfil1">
      <% if (usuVO.getRolId_fk().equals("1")) { %>
        <img class="img-perfil" src="img/boss.png" alt="Foto de perfil">
        <h3>Propietario</h3>
      <% } else if (usuVO.getRolId_fk().equals("2")) {%>
        <img class="img-perfil" src="img/manager.png" alt="Foto de perfil">
        <h3>Supervisor</h3>
      <% } else if (usuVO.getRolId_fk().equals("3")) {%>
        <img class="img-perfil" src="img/baker.png" alt="Foto de perfil">
        <h3>Repostero</h3>
      <% } else{%>
        <img class="img-perfil" src="img/baker.png" alt="Foto de perfil">
      <% }%>
    </div>
  </div>
  <div class="perfil1 perfil2">
    <h2>Datos Personales</h2>
    <div class="datos-perfil">
      <div class="datos-perfil-1">
        <h3>Nombre:</h3>
        <h3>Apellido:</h3>
        <h3>Documento:</h3>
        <h3>Correo:</h3>
        <h3>Teléfono:</h3>
        <h3>Dirección:</h3>
        <h3>Contraseña:</h3>
      </div>
      <div class="datos-perfil-2">
        <h3><%=usuVO2.getUsuNombre()%></h3>
        <h3><%=usuVO2.getUsuApellido()%></h3>
        <h3><%=usuVO2.getUsuTipoDocumento()%> <%=usuVO2.getUsuDocumento()%></h3>
        <h3><%=usuVO2.getUsuCorreo()%></h3>
        <h3><%=usuVO2.getUsuTelefono()%> <a href="#" class="asterisco"><i class='bx bxs-edit telefono'></i></a></h3>
        <h3><%=usuVO2.getUsuDireccion()%> <a href="#" class="asterisco"><i class='bx bxs-edit direccion'></i></a></h3>
        <h3>********** <a href="#" class="asterisco"><i class='bx bxs-edit contraseña'></i></a></h3>
      </div>
    </div>
  </div>
</div>


<script>
            var ejecutado = false;
            $(document).ready(function() {
            if (!ejecutado) {
// Código a ejecutar solo la primera vez
//MODALES

//actualizar rol
           
            
            
            const openModal_telefono = document.querySelectorAll('.telefono');
            const modal_telefono = document.querySelector('.modal_telefono');
            const closeModal_telefono = document.querySelector('.modal_close_telefono')

                    openModal_telefono.forEach((btn) => {
                    btn.addEventListener('click', (e)=> {
                    e.preventDefault();
                   
                    modal_telefono.classList.add('modal--show');
                    });
                    });
            closeModal_telefono.addEventListener('click', (e)=> {
            e.preventDefault();
            modal_telefono.classList.remove('modal--show');
            });
            
            
            const openModal_direccion = document.querySelectorAll('.direccion');
            const modal_direccion = document.querySelector('.modal_direccion');
            const closeModal_direccion = document.querySelector('.modal_close_direccion')

                    openModal_direccion.forEach((btn) => {
                    btn.addEventListener('click', (e)=> {
                    e.preventDefault();
                   
                    modal_direccion.classList.add('modal--show');
                    });
                    });
            closeModal_direccion.addEventListener('click', (e)=> {
            e.preventDefault();
            modal_direccion.classList.remove('modal--show');
            });
            
            
            const openModal_contraseña = document.querySelectorAll('.contraseña');
            const modal_contraseña = document.querySelector('.modal_contraseña');
            const closeModal_contraseña = document.querySelector('.modal_close_contraseña')

                    openModal_contraseña.forEach((btn) => {
                    btn.addEventListener('click', (e)=> {
                    e.preventDefault();
                   
                    modal_contraseña.classList.add('modal--show');
                    });
                    });
            closeModal_contraseña.addEventListener('click', (e)=> {
            e.preventDefault();
            modal_contraseña.classList.remove('modal--show');
            });
            ejecutado = true;
            }


            });
             function validarTelefono() {
  var telefono = document.getElementById("usuTelefono").value;
  var confirmarTelefono = document.getElementsByName("confirmarTelefono")[0];

  if (telefono !== confirmarTelefono.value) {
    confirmarTelefono.setCustomValidity("Los télefonos no coinciden");
    document.getElementById("mensajeError").textContent = "Los télefonos no coinciden";
  } else {
    confirmarTelefono.setCustomValidity("");
    document.getElementById("mensajeError").textContent = "";
  }
}
function validarDireccion() {
  var direccion = document.getElementById("usuDireccion").value;
  var confirmarDireccion = document.getElementsByName("confirmarDireccion")[0];

  if (direccion !== confirmarDireccion.value) {
    confirmarDireccion.setCustomValidity("La dirección no coinciden");
    document.getElementById("mensajeError").textContent = "La dirección no coinciden";
  } else {
    confirmarDireccion.setCustomValidity("");
    document.getElementById("mensajeError").textContent = "";
  }
}
function validarContrasena() {
  var contrasena = document.getElementById("usuContrasena").value;
  var confirmarContrasena = document.getElementsByName("confirmarContrasena")[0];

  if (contrasena !== confirmarContrasena.value) {
    confirmarContrasena.setCustomValidity("Las contraseña no coinciden");
    document.getElementById("mensajeError").textContent = "Las contraseñas no coinciden";
  } else {
    confirmarContrasena.setCustomValidity("");
    document.getElementById("mensajeError").textContent = "";
  }
}
        </script>

           