<%@include file="Sesiones2.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
        <%UsuarioVO usuVO2 = (UsuarioVO) buscarSesion.getAttribute("datosUsuario");%>
<%if(usuVO2.getRolId_fk().equals("1") || usuVO2.getRolId_fk().equals("2")){%>
  <section class="modal modal_registrar_cliente">
        <div class="modal_container">
            <h2 class="modal_title">Registrar Cliente</h2>
            <form method="post" action="Cliente">
                           <div class="inputs">
                                    <div>
                                        <label class="modal_paragraph">Nombre:<span class="asterisco"> *</span></label>
                                        <input class="modal_input" type="text" placeholder="Nombre" name="cliNombre" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras" required>            
                                    </div>
                                 <div>
                                        <label class="modal_paragraph">Apellido:<span class="asterisco"> *</span></label>
                                        <input class="modal_input" type="text" placeholder="Apellido" name="cliApellido" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras" required>            
                                    </div>
                               <div>
                                        <label class="modal_paragraph">Tipo de documento:</label>
                                        <select class="modal_input select2" name="cliTipoDocumento">
                                            <option value="">Seleccione...</option>
                                            <option value="CC">CC</option>
                                            <option value="TI">TI</option>
                                            <option value="CE">CE</option>
                                        </select>          
                                    </div>
                               <div>
                                        <label class="modal_paragraph">Documento:</label>
                                        <input class="modal_input" type="text" placeholder="Documento"  name="cliDocumento" pattern="[0-9]{10}" title="Ingrese solo números (10 caracteres)" onkeypress="return event.charCode >= 48 && event.charCode <= 57" >            
                                    </div>
                               <div>
                                        <label class="modal_paragraph">Correo electrónico:</label>
                                        <input class="modal_input" type="email" placeholder="Correo electrónico" name="cliCorreo" >            
                                    </div>
                               <div>
                                        <label class="modal_paragraph">Dirección:</label>
                                        <input class="modal_input" type="text" placeholder="Dirección" name="cliDireccion" >            
                                    </div>
                                <div>
                                        <label class="modal_paragraph">Teléfono:</label>
                                        <input class="modal_input" type="text" placeholder="Teléfono" name="cliTelefono" pattern="[0-9]{10}" title="Ingrese solo números (10 caracteres)" onkeypress="return event.charCode >= 48 && event.charCode <= 57" >            
                                    </div>
                               </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_registrar_cliente swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Registrar</button>
                    
                </div>
                         <input type="hidden" name="opcion" value="1">       
                                
                            
                        </form>

        </div>
        
    </section>
    <section class="modal modal_actualizar_cliente">
        <div class="modal_container">
            <h2 class="modal_title">Actualizar Cliente</h2>
            <form method="post" action="Cliente">
                           
                <div class="inputs">
                     <div>
                                        <label class="modal_paragraph">Id:<span class="asterisco"> *</span></label>
                                        <input class="modal_input" type="number" placeholder="Nombre" name="cliId" required readonly id="cli_id">             
                                    </div>
                    <div>
                                        <label class="modal_paragraph">Nombre:<span class="asterisco"> *</span></label>
                                        <input class="modal_input" type="text" placeholder="Nombre" name="cliNombre" id="cli_nom" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras"  required >            
                                    </div>
                                 <div>
                                        <label class="modal_paragraph">Apellido:<span class="asterisco"> *</span></label>
                                        <input class="modal_input" type="text" placeholder="Apellido" name="cliApellido" id="cli_ape" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras"  required>            
                                    </div>
                               <div>
                                        <label class="modal_paragraph">Tipo de documento:</label>
                                        <select class="modal_input select2" name="cliTipoDocumento" id="cli_tip">
                                            <option value="">Seleccione...</option>
                                            <option value="CC">CC</option>
                                            <option value="TI">TI</option>
                                            <option value="CE">CE</option>
                                        </select>          
                                    </div>
                               <div>
                                        <label class="modal_paragraph">Documento:</label>
                                        <input class="modal_input" type="text" placeholder="Documento" name="cliDocumento" id="cli_doc" pattern="[0-9]{10}" title="Ingrese solo números (10 caracteres)" onkeypress="return event.charCode >= 48 && event.charCode <= 57" >            
                                    </div>
                               <div>
                                        <label class="modal_paragraph">Correo electrónico:</label>
                                        <input class="modal_input" type="email" placeholder="Correo electrónico" name="cliCorreo" id="cli_cor">            
                                    </div>
                               <div>
                                        <label class="modal_paragraph">Dirección:</label>
                                        <input class="modal_input" type="text" placeholder="Dirección" name="cliDireccion" id="cli_dir">            
                                    </div>
                                <div>
                                        <label class="modal_paragraph">Teléfono:</label>
                                        <input class="modal_input" type="text" placeholder="Teléfono" name="cliTelefono" id="cli_tel" pattern="[0-9]{10}" title="Ingrese solo números (10 caracteres)" onkeypress="return event.charCode >= 48 && event.charCode <= 57">            
                                    </div>
                                      
                                                
                                    </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_actualizar_cliente swal2-styled swal2-cancel">Cerrar</a>
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
                    <h2><b>Consultar Cliente</b></h2>
                    <div >

                        <div class="buscar">
                            <input type="search" class="buscador" id="buscador" placeholder="Search...">
                            <i class='search-btn bx bx-search'></i>
                        </div>

                        <br>
                        <a href="#" class="registrar_cliente btn-buscar">Añadir Registro<i class='bx bxs-plus-square'></i></a>

                    </div>


                </th>
            </tr>
        </table><br>


        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Clientes</h3>
                    <form method="post" action="GeneradorReporte.jsp" target="_blank">
  <button class="registrar_cliente btn-download" type="submit">
    <i class="bx bxs-cloud-download"></i> Generar PDF
  </button>
  <input type="hidden" name="reportName" value="Cliente">
</form>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th style="padding-right: 10px">Id</th>
                            <th>Nombre y Apellido</th>
                            <th>Documento</th>
                            <th>Correo electrónico</th>
                            <th>Dirección</th>
                            <th>Teléfono</th>
                            <th>Estado</th>
                            <th>Opciones</th>
                                <%
                                    ClienteVO cliVO = new ClienteVO();
                                    ClienteDAO cliDAO = new ClienteDAO();

                                    ArrayList<ClienteVO> listaClientes = cliDAO.listar();
                                    for (int i = 0; i < listaClientes.size(); i++) {
                                        cliVO = listaClientes.get(i);
                                %>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="registro">
                            <td ><%=cliVO.getCliId()%></td>

                            <td class="dato" ><%=cliVO.getCliNombre()%> <%=cliVO.getCliApellido()%></td>
                            <td ><%=cliVO.getCliTipoDocumento()%> <%=cliVO.getCliDocumento()%></td>
                            <td ><%=cliVO.getCliCorreo()%></td>
                            <td ><%=cliVO.getCliDireccion()%></td>
                            <td ><%=cliVO.getCliTelefono()%></td>
                                                          <td>
  <% String estado = "" + cliVO.getCliEstado();%>
    <span<% if (estado.equals("Activo")) {%> class='status activo' <%} else {%> class='status inactivo' <%}%>>
                                    <%=cliVO.getCliEstado()%>

                                </span>
                            </td>
                            <td>
                                
                                    <button class="actualizar_cliente btn-table" type="button" name="cliId" data-id-cliente="<%=cliVO.getCliId()%>"
                                            data-nombre-cliente="<%=cliVO.getCliNombre()%>" data-apellido-cliente="<%=cliVO.getCliApellido()%>"
                                            data-tipodoc-cliente="<%=cliVO.getCliTipoDocumento()%>" data-documento-cliente="<%=cliVO.getCliDocumento()%>"
                                            data-correo-cliente="<%=cliVO.getCliCorreo()%>" data-direccion-cliente="<%=cliVO.getCliDireccion()%>"
                                            data-telefono-cliente="<%=cliVO.getCliTelefono()%>"><i class='bx bxs-edit'></i></button>
                                   
                                  
                               
<button class="btn-table" onclick="mostrarSweetAlert('<%=estado%>', <%=cliVO.getCliId()%>)"  type="button">
  <%if (estado.equals("Activo")){%>
    <i class='bx bxs-hide'></i>
  <%}else{%>
    <i class='bx bxs-show'></i>
  <%}%>
</button>
<input type="hidden" name="cliEstado" value="<%= estado.equals("Activo") ? "Inactivo" : "Activo" %>">
<input type="hidden" name="cliId" value="<%= cliVO.getCliId() %>">
<input type="hidden" name="opcion" value="3">

<script>
function mostrarSweetAlert(estado, cliId) {
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
      form.action = 'Cliente';
      form.style.display = 'none';
      const cliEstadoInput = document.createElement('input');
      cliEstadoInput.type = 'hidden';
      cliEstadoInput.name = 'cliEstado';
      cliEstadoInput.value = nuevoEstado;
      form.appendChild(cliEstadoInput);
      const cliIdInput = document.createElement('input');
      cliIdInput.type = 'hidden';
      cliIdInput.name = 'cliId';
      cliIdInput.value = cliId;
      form.appendChild(cliIdInput);
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
            //select2
             $(document).ready(function() {
    $('.select2').select2();
  });
      // Código a ejecutar solo la primera vez
      //MODALES
//registrar cliente
const openModal_registrar_cliente = document.querySelector('.registrar_cliente');
const modal_registrar_cliente = document.querySelector('.modal_registrar_cliente');
const closeModal_registrar_cliente = document.querySelector('.modal_close_registrar_cliente')

openModal_registrar_cliente.addEventListener('click',(e)=>{
    e.preventDefault();
    modal_registrar_cliente.classList.add('modal--show');
});
closeModal_registrar_cliente.addEventListener('click',(e)=>{
    e.preventDefault();
    modal_registrar_cliente.classList.remove('modal--show');
});


//actualizar cliente
const openModal_actualizar_cliente = document.querySelectorAll('.actualizar_cliente');
const modal_actualizar_cliente = document.querySelector('.modal_actualizar_cliente');
const closeModal_actualizar_cliente = document.querySelector('.modal_close_actualizar_cliente')

openModal_actualizar_cliente.forEach((btn) => {
  btn.addEventListener('click', (e) => {
    e.preventDefault();
    const idCliente = btn.getAttribute('data-id-cliente'); // Obtener el id de cliente del botón actualizado
    const modal_actualizar_cliente = document.querySelector('.modal_actualizar_cliente');
    const cliIdInput = modal_actualizar_cliente.querySelector('#cli_id');
    const nomCliente = btn.getAttribute('data-nombre-cliente');
    const cliNombreInput = modal_actualizar_cliente.querySelector('#cli_nom');
        const apeCliente = btn.getAttribute('data-apellido-cliente');
    const cliApellidoInput = modal_actualizar_cliente.querySelector('#cli_ape');
    const tipCliente = btn.getAttribute('data-tipodoc-cliente');
    const cliTipoDocInput = modal_actualizar_cliente.querySelector('#cli_tip');
    const docCliente = btn.getAttribute('data-documento-cliente');
    const cliDocumentoInput = modal_actualizar_cliente.querySelector('#cli_doc');
     const corCliente = btn.getAttribute('data-correo-cliente');
    const cliCorreoInput = modal_actualizar_cliente.querySelector('#cli_cor');
    const dirCliente = btn.getAttribute('data-direccion-cliente');
    const cliDireccionInput = modal_actualizar_cliente.querySelector('#cli_dir');
    const telCliente = btn.getAttribute('data-telefono-cliente');
    const cliTelefonoInput = modal_actualizar_cliente.querySelector('#cli_tel');
    cliIdInput.value = idCliente;
    cliNombreInput.value = nomCliente;
    cliApellidoInput.value = apeCliente;
    cliTipoDocInput.value = tipCliente;
    cliDocumentoInput.value = docCliente;
     cliCorreoInput.value = corCliente;
     cliDireccionInput.value = dirCliente;
     cliTelefonoInput.value = telCliente;
     cliTipoDocInput.dispatchEvent(new Event('change'));
    modal_actualizar_cliente.classList.add('modal--show');

  });
});
closeModal_actualizar_cliente.addEventListener('click',(e)=>{
    e.preventDefault();
    modal_actualizar_cliente.classList.remove('modal--show');
});

      ejecutado = true;
   }
   // Resto del código
});
                    </script>
                        
<%}%>