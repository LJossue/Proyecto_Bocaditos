<%@include file="Sesiones2.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ProveedorDAO"%>
<%@page import="ModeloVO.ProveedorVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <%UsuarioVO usuVO2 = (UsuarioVO) buscarSesion.getAttribute("datosUsuario");%>
<%if(usuVO2.getRolId_fk().equals("1") || usuVO2.getRolId_fk().equals("2")){%>
 <section class="modal modal_registrar_proveedor">
        <div class="modal_container">
            <h2 class="modal_title">Registrar Proveedor</h2>
            <form method="post" action="Proveedor">
                           <div class="inputs">
                                  
                    <div>
                                        <label class="modal_paragraph">Nit:<span class="asterisco"> *</span></label>
                                       <input class="modal_input" type="text" placeholder="Nit" name="prvNit" required>

                                    </div>
                    <div>
                                        <label class="modal_paragraph">Nombre:<span class="asterisco"> *</span></label>
                                        <input class="modal_input" type="text" placeholder="Nombre" name="prvNombre" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras" required >            
                                    </div>
                                 <div>
                                        <label class="modal_paragraph">Dirección:</label>
                                        <input class="modal_input" type="text" placeholder="Dirección" name="prvDireccion" >      
                                    </div>
                               
                              
                               <div>
                                        <label class="modal_paragraph">Correo electrónico:</label>
                                        <input class="modal_input" type="email" placeholder="Correo electrónico" name="prvCorreo">            
                                    </div>
                              
                                <div>
                                        <label class="modal_paragraph">Teléfono:</label>
                                        <input class="modal_input" type="text" placeholder="Teléfono" name="prvTelefono" pattern="[0-9]{10}" title="Ingrese solo números (10 caracteres)" onkeypress="return event.charCode >= 48 && event.charCode <= 57" >            
                                    </div>
                               </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_registrar_proveedor swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Registrar</button>
                    
                </div>
                         <input type="hidden" name="opcion" value="1">       
                                
                            
                        </form>

        </div>
        
    </section>
    <section class="modal modal_actualizar_proveedor">
        <div class="modal_container">
            <h2 class="modal_title">Actualizar Proveedor</h2>
            <form method="post" action="Proveedor">
                           
                <div class="inputs">
                     <div>
                                        <label class="modal_paragraph">Id:<span class="asterisco"> *</span></label>
                                        <input class="modal_input" type="number" placeholder="Id" name="prvId"  required readonly id="prv_id">            
                                    </div>
                    <div>
                                        <label class="modal_paragraph">Nit:<span class="asterisco"> *</span></label>
                                       <input class="modal_input" type="text" placeholder="Nit" name="prvNit" required id="prv_nit">

                                    </div>
                    <div>
                                        <label class="modal_paragraph">Nombre:<span class="asterisco"> *</span></label>
                                        <input class="modal_input" type="text" placeholder="Nombre" name="prvNombre" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras"  required id="prv_nom" >            
                                    </div>
                                 <div>
                                        <label class="modal_paragraph">Dirección:</label>
                                        <input class="modal_input" type="text" placeholder="Dirección" name="prvDireccion" id="prv_dir">      
                                    </div>
                               
                              
                               <div>
                                        <label class="modal_paragraph">Correo electrónico:</label>
                                        <input class="modal_input" type="email" placeholder="Correo electrónico" name="prvCorreo" id="prv_cor">            
                                    </div>
                              
                                <div>
                                        <label class="modal_paragraph">Teléfono:</label>
                                        <input class="modal_input" type="text" placeholder="Teléfono" name="prvTelefono" pattern="[0-9]{10}" title="Ingrese solo números (10 caracteres)" onkeypress="return event.charCode >= 48 && event.charCode <= 57" id="prv_tel">            
                                    </div>
                                      
                                                
                                    </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_actualizar_proveedor swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Actualizar</button>
                </div>
                         <input type="hidden" name="opcion" value="2">              
                        </form>
        </div>
        
    </section>
    <center>


        <table>
            <tr>
                <th>
                    <h2><b>Consultar Proveedor</b></h2>
                    <div >

                        <div class="buscar">
                            <input type="search" class="buscador" id="buscador" placeholder="Search...">
                            <i class='search-btn bx bx-search'></i>
                        </div>

                        <br>
                         <a href="#" class="registrar_proveedor btn-buscar">Añadir Registro<i class='bx bxs-plus-square'></i></a>

                    </div>


                </th>
            </tr>
        </table><br>


        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Proveedores</h3>
                    <form method="post" action="GeneradorReporte.jsp" target="_blank">
  <button class="registrar_cliente btn-download" type="submit">
    <i class="bx bxs-cloud-download"></i> Generar PDF
  </button>
  <input type="hidden" name="reportName" value="Proveedor">
</form>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th style="padding-right: 10px">Id</th>
                            <th>Nit</th>
                            <th>Nombre</th>
                            <th>Dirección</th>
                            <th>Telefono</th>
                            <th>Correo</th>
                            <th>Estado</th>
                            <th>Opciones</th>
                                <%
                                    ProveedorVO prvVO = new ProveedorVO();
                                    ProveedorDAO prvDAO = new ProveedorDAO();

                                    ArrayList<ProveedorVO> listaProveedores = prvDAO.listar();
                                    for (int i = 0; i < listaProveedores.size(); i++) {
                                        prvVO = listaProveedores.get(i);
                                %>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="registro">
                            <td ><%=prvVO.getPrvId()%></td>
                            
                            <td >
                                <%=prvVO.getPrvNit()%>
                            </td>
                            <td class="dato" >
                                <%=prvVO.getPrvNombre()%>
                            </td>
                            <td>
                                <%=prvVO.getPrvDireccion()%>
                            </td>
                             <td>
                                <%=prvVO.getPrvTelefono()%>
                            </td>
                             <td>
                                <%=prvVO.getPrvCorreo()%>
                            </td>
                              <td>
  <% String estado = "" + prvVO.getPrvEstado();%>
    <span<% if (estado.equals("Activo")) {%> class='status activo' <%} else {%> class='status inactivo' <%}%>>
                                    <%=prvVO.getPrvEstado()%>

                                </span>
                            </td>
                            <td>
                                
                                    <button class="actualizar_proveedor btn-table" type="button" name="prvId" data-id-proveedor="<%=prvVO.getPrvId()%>"
                                            data-nombre-proveedor="<%=prvVO.getPrvNombre()%>" data-nit-proveedor="<%=prvVO.getPrvNit()%>"
                                            data-correo-proveedor="<%=prvVO.getPrvCorreo()%>" data-direccion-proveedor="<%=prvVO.getPrvDireccion()%>"
                                            data-telefono-proveedor="<%=prvVO.getPrvTelefono()%>"><i class='bx bxs-edit'></i></button>
                                   
                                  
                               
<button class="btn-table" onclick="mostrarSweetAlert('<%=estado%>', <%=prvVO.getPrvId()%>)"  type="button">
  <%if (estado.equals("Activo")){%>
    <i class='bx bxs-hide'></i>
  <%}else{%>
    <i class='bx bxs-show'></i>
  <%}%>
</button>
<input type="hidden" name="prvEstado" value="<%= estado.equals("Activo") ? "Inactivo" : "Activo" %>">
<input type="hidden" name="prvId" value="<%= prvVO.getPrvId() %>">
<input type="hidden" name="opcion" value="3">

<script>
function mostrarSweetAlert(estado, prvId) {
  let mensaje, nuevoEstado;
  if (estado === "Activo") {
    mensaje = "¿Está seguro que desea Inactivar este dato?";
    nuevoEstado = "Inactivo";
  } else {
    mensaje = "¿Está seguro que desea Activar este dato?";
    nuevoEstado = "Activo";
  }

  Swal.fire({
    title: mensaje,
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Sí, estoy seguro'
  }).then((result) => {
    if (result.isConfirmed) {
      // Envía el formulario
      const form = document.createElement('form');
      form.method = 'POST';
      form.action = 'Proveedor';
      form.style.display = 'none';
      const prvEstadoInput = document.createElement('input');
      prvEstadoInput.type = 'hidden';
      prvEstadoInput.name = 'prvEstado';
      prvEstadoInput.value = nuevoEstado;
      form.appendChild(prvEstadoInput);
      const prvIdInput = document.createElement('input');
      prvIdInput.type = 'hidden';
      prvIdInput.name = 'prvId';
      prvIdInput.value = prvId;
      form.appendChild(prvIdInput);
      const opcionInput = document.createElement('input');
      opcionInput.type = 'hidden';
      opcionInput.name = 'opcion';
      opcionInput.value = '3';
      form.appendChild(opcionInput);
      document.body.appendChild(form);
      form.submit();
    }
  })
}

</script>
                            </td>

                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
                         <script>
var ejecutado = false;

$(document).ready(function() {
   if (!ejecutado) {
      // Código a ejecutar solo la primera vez
      //MODALES
//registrar proveedor
const openModal_registrar_proveedor = document.querySelector('.registrar_proveedor');
const modal_registrar_proveedor = document.querySelector('.modal_registrar_proveedor');
const closeModal_registrar_proveedor = document.querySelector('.modal_close_registrar_proveedor')

openModal_registrar_proveedor.addEventListener('click',(e)=>{
    e.preventDefault();
    modal_registrar_proveedor.classList.add('modal--show');
});
closeModal_registrar_proveedor.addEventListener('click',(e)=>{
    e.preventDefault();
    modal_registrar_proveedor.classList.remove('modal--show');
});


//actualizar proveedor
const openModal_actualizar_proveedor = document.querySelectorAll('.actualizar_proveedor');
const modal_actualizar_proveedor = document.querySelector('.modal_actualizar_proveedor');
const closeModal_actualizar_proveedor = document.querySelector('.modal_close_actualizar_proveedor')

openModal_actualizar_proveedor.forEach((btn) => {
  btn.addEventListener('click', (e) => {
    e.preventDefault();
    const idProveedor = btn.getAttribute('data-id-proveedor'); // Obtener el id de proveedor del botón actualizado
    const modal_actualizar_proveedor = document.querySelector('.modal_actualizar_proveedor');
    const prvIdInput = modal_actualizar_proveedor.querySelector('#prv_id');
    const nomProveedor = btn.getAttribute('data-nombre-proveedor');
    const prvNombreInput = modal_actualizar_proveedor.querySelector('#prv_nom');
    const nitProveedor = btn.getAttribute('data-nit-proveedor');
    const prvNitInput = modal_actualizar_proveedor.querySelector('#prv_nit');
     const corProveedor = btn.getAttribute('data-correo-proveedor');
    const prvCorreoInput = modal_actualizar_proveedor.querySelector('#prv_cor');
    const dirProveedor = btn.getAttribute('data-direccion-proveedor');
    const prvDireccionInput = modal_actualizar_proveedor.querySelector('#prv_dir');
    const telProveedor = btn.getAttribute('data-telefono-proveedor');
    const prvTelefonoInput = modal_actualizar_proveedor.querySelector('#prv_tel');
    prvIdInput.value = idProveedor;
    prvNombreInput.value = nomProveedor;
    prvNitInput.value = nitProveedor;
     prvCorreoInput.value = corProveedor;
     prvDireccionInput.value = dirProveedor;
     prvTelefonoInput.value = telProveedor;
    modal_actualizar_proveedor.classList.add('modal--show');

  });
});
closeModal_actualizar_proveedor.addEventListener('click',(e)=>{
    e.preventDefault();
    modal_actualizar_proveedor.classList.remove('modal--show');
});

      ejecutado = true;
   }
   // Resto del código
});
                    </script>
                    <%}%>