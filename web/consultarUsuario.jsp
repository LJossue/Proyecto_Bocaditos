<%@include file="Sesiones2.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page import="ModeloVO.UsuarioVO"%>
<%@page import="ModeloVO.RolVO"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<%UsuarioVO usuVO2 = (UsuarioVO) buscarSesion.getAttribute("datosUsuario");%>
<%if(usuVO2.getRolId_fk().equals("1") || usuVO2.getRolId_fk().equals("2")){%>
    <section class="modal modal_actualizar_usuario">
        <div class="modal_container">
            <h2 class="modal_title">Actualizar Usuario</h2>
            <form method="post" action="Usuario">

                <div class="inputs">
                    <div>
                        <label class="modal_paragraph">Id:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="number" placeholder="Id" name="usuId" required readonly id="usu_id" required>            
                    </div>
                    <div>
                        <label class="modal_paragraph">Nombre:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="text" placeholder="Nombre" name="usuNombre" id="usu_nom" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras" required>            
                    </div>
                    <div>
                        <label class="modal_paragraph">Apellido:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="text" placeholder="Apellido" name="usuApellido" id="usu_ape" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras" required>            
                    </div>
                    <div>
                        <label class="modal_paragraph">Tipo de documento:<span class="asterisco"> *</span></label>
                        <select class="modal_input select2" name="usuTipoDocumento"  required id="usu_tip">
                            <option value="">Seleccione...</option>
                            <option value="CC">CC</option>
                            <option value="CE">CE</option>
                        </select>          
                    </div>
                    <div>
                        <label class="modal_paragraph">Documento:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="text" placeholder="Documento" name="usuDocumento" id="usu_doc" pattern="[0-9]{10}" title="Ingrese solo números (10 caracteres)" onkeypress="return event.charCode >= 48 && event.charCode <= 57"  required>            
                    </div>
                    <div>
                        <label class="modal_paragraph">Correo electrónico:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="email" placeholder="Correo electrónico" name="usuCorreo" id="usu_cor" required>            
                    </div>
                    <div>
                        <label class="modal_paragraph">Dirección:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="text" placeholder="Dirección" name="usuDireccion" id="usu_dir" required>            
                    </div>
                    <div>
                        <label class="modal_paragraph">Teléfono:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="text" placeholder="Teléfono" name="usuTelefono" id="usu_tel" pattern="[0-9]{10}" title="Ingrese solo números (10 caracteres)" onkeypress="return event.charCode >= 48 && event.charCode <= 57"  required>            
                    </div>
                    <div>

                        <label class="modal_paragraph ">Rol:<span class="asterisco"> *</span></label>
                        <select class="modal_input select2"  name="rolId_fk" required id="usu_rol">            

                            <%

                                RolDAO rolDAO = new RolDAO();
                                for (RolVO rolVO : rolDAO.listar()) {


                            %>
                            <option value="<%=rolVO.getRolId()%>"><%=rolVO.getRolDescripcion()%></option> 
                            <% } %>

                        </select>         
                    </div>


                </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_actualizar_usuario swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Actualizar</button>
                </div>
                <input type="hidden" name="opcion" value="2">              
            </form>
        </div>

    </section>

    <center>

        <ul class="box-info box-usu">

            <%
          UsuarioVO usuVO = new UsuarioVO();
                UsuarioDAO usuDAO = new UsuarioDAO();
                                    ArrayList<UsuarioVO> listaOrdUsuarios = usuDAO.listarNumeroOrdenes();
                                    for (int i = 0; i < listaOrdUsuarios.size(); i++) {
                                        usuVO = listaOrdUsuarios.get(i);
            %>
            <li>
                
                    <div class="fondo-perfil1-usuario">
                    <%if(usuVO.getRolDescripcion().equals("Propietario")){%>
                    <img class="img-perfil-usuario" src="img/boss.png" alt="Foto de perfil">
                    <%}else if(usuVO.getRolDescripcion().equals("Supervisor")){%>
                     <img class="img-perfil-usuario" src="img/manager.png" alt="Foto de perfil">
                    <%}else if(usuVO.getRolDescripcion().equals("Repostero")){%>
                    <img class="img-perfil-usuario" src="img/baker.png" alt="Foto de perfil">
                    <%}%>
                    </div>
                    <span class="text">
                    <h3><%=usuVO.getUsuNombre()%> <%=usuVO.getUsuApellido()%></h3>
                    <p><%=usuVO.getRolDescripcion()%></p>
                    <p>Ordenes semanales: <%=usuVO.getCantidad_ordenes()%></p>
                </span>
            </li>
            <%}%>
        </ul>

        <table>
            <tr>
                <th>
                    <h2><b>Consultar Usuario</b></h2>
                    <div >

                        <div class="buscar">
                            <input type="search" class="buscador" id="buscador" placeholder="Search...">
                            <i class='search-btn bx bx-search'></i>

                        </div>



                    </div>


                </th>
            </tr>
        </table><br>




        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Usuarios</h3>
                    <form method="post" action="GeneradorReporte.jsp" target="_blank">
  <button class="registrar_cliente btn-download" type="submit">
    <i class="bx bxs-cloud-download"></i> Generar PDF
  </button>
  <input type="hidden" name="reportName" value="Usuario">
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
                            <th>Rol</th>
                            <th>Estado</th>
                            <th>Opciones</th>
                                <%
                                    ArrayList<UsuarioVO> listaUsuarios = usuDAO.listar();
                                    for (int i = 0; i < listaUsuarios.size(); i++) {
                                        usuVO = listaUsuarios.get(i);
                                %>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="registro">
                            <td ><%=usuVO.getUsuId()%></td>
                            <td class="dato" ><%=usuVO.getUsuNombre()%> <%=usuVO.getUsuApellido()%></td>
                            <td><%=usuVO.getUsuTipoDocumento()%> <%=usuVO.getUsuDocumento()%></td>
                            <td><%=usuVO.getUsuCorreo()%></td>
                            <td><%=usuVO.getUsuDireccion()%></td>
                            <td><%=usuVO.getUsuTelefono()%></td>
                            <td><%=usuVO.getRolDescripcion()%></td>
                            <td>
                                <% String estado = "" + usuVO.getUsuEstado();%>
                                <span<% if (estado.equals("Activo")) {%> class='status activo' <%} else {%> class='status inactivo' <%}%>>
                                    <%=usuVO.getUsuEstado()%>

                                </span>
                            </td>
                            <td>

                                <button class="actualizar_usuario btn-table" type="button" name="usuId" data-id-usuario="<%=usuVO.getUsuId()%>"
                                        data-nombre-usuario="<%=usuVO.getUsuNombre()%>" data-apellido-usuario="<%=usuVO.getUsuApellido()%>"
                                        data-tipodoc-usuario="<%=usuVO.getUsuTipoDocumento()%>" data-documento-usuario="<%=usuVO.getUsuDocumento()%>"
                                        data-correo-usuario="<%=usuVO.getUsuCorreo()%>" data-direccion-usuario="<%=usuVO.getUsuDireccion()%>"
                                        data-telefono-usuario="<%=usuVO.getUsuTelefono()%>" data-rol-usuario="<%=usuVO.getRolId_fk()%>"><i class='bx bxs-edit'></i></button>



                                <button class="btn-table" onclick="mostrarSweetAlert('<%=estado%>', <%=usuVO.getUsuId()%>)"  type="button">
                                    <%if (estado.equals("Activo")) {%>
                                    <i class='bx bxs-hide'></i>
                                    <%} else {%>
                                    <i class='bx bxs-show'></i>
                                    <%}%>
                                </button>
                                <input type="hidden" name="usuEstado" value="<%= estado.equals("Activo") ? "Inactivo" : "Activo"%>">
                                <input type="hidden" name="usuId" value="<%= usuVO.getUsuId()%>">
                                <input type="hidden" name="opcion" value="3">

                                <script>
                                    function mostrarSweetAlert(estado, usuId) {
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
                                    }).then((result) =>{
                                    if (result.isConfirmed) {
                                    // Envía el formulario
                                    const form = document.createElement('form');
                                    form.method = 'POST';
                                    form.action = 'Usuario';
                                    form.style.display = 'none';
                                    const usuEstadoInput = document.createElement('input');
                                    usuEstadoInput.type = 'hidden';
                                    usuEstadoInput.name = 'usuEstado';
                                    usuEstadoInput.value = nuevoEstado;
                                    form.appendChild(usuEstadoInput);
                                    const usuIdInput = document.createElement('input');
                                    usuIdInput.type = 'hidden';
                                    usuIdInput.name = 'usuId';
                                    usuIdInput.value = usuId;
                                    form.appendChild(usuIdInput);
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
        $(document).ready(function() {
    $('.select2').select2();
  });
            //MODALES

//actualizar usuario
            const openModal_actualizar_usuario = document.querySelectorAll('.actualizar_usuario');
            const modal_actualizar_usuario = document.querySelector('.modal_actualizar_usuario');
            const closeModal_actualizar_usuario = document.querySelector('.modal_close_actualizar_usuario')

                    openModal_actualizar_usuario.forEach((btn)=>{
                    btn.addEventListener('click', (e) =>{
                    e.preventDefault();
                    const idUsuario = btn.getAttribute('data-id-usuario'); // Obtener el id de usuario del botón actualizado
                    const modal_actualizar_usuario = document.querySelector('.modal_actualizar_usuario');
                    const usuIdInput = modal_actualizar_usuario.querySelector('#usu_id');
                    const nomUsuario = btn.getAttribute('data-nombre-usuario');
                    const usuNombreInput = modal_actualizar_usuario.querySelector('#usu_nom');
                    const apeUsuario = btn.getAttribute('data-apellido-usuario');
                    const usuApellidoInput = modal_actualizar_usuario.querySelector('#usu_ape');
                    const tipUsuario = btn.getAttribute('data-tipodoc-usuario');
                    const usuTipoDocInput = modal_actualizar_usuario.querySelector('#usu_tip');
                    const docUsuario = btn.getAttribute('data-documento-usuario');
                    const usuDocumentoInput = modal_actualizar_usuario.querySelector('#usu_doc');
                    const corUsuario = btn.getAttribute('data-correo-usuario');
                    const usuCorreoInput = modal_actualizar_usuario.querySelector('#usu_cor');
                    const dirUsuario = btn.getAttribute('data-direccion-usuario');
                    const usuDireccionInput = modal_actualizar_usuario.querySelector('#usu_dir');
                    const telUsuario = btn.getAttribute('data-telefono-usuario');
                    const usuTelefonoInput = modal_actualizar_usuario.querySelector('#usu_tel');
                    const rolUsuario = btn.getAttribute('data-rol-usuario');
                    const usuRolInput = modal_actualizar_usuario.querySelector('#usu_rol');
                    usuIdInput.value = idUsuario;
                    usuNombreInput.value = nomUsuario;
                    usuApellidoInput.value = apeUsuario;
                    usuTipoDocInput.value = tipUsuario;
                     // Seleccionar el valor del select en Select2
usuTipoDocInput.dispatchEvent(new Event('change'));
                    usuDocumentoInput.value = docUsuario;
                    usuCorreoInput.value = corUsuario;
                    usuDireccionInput.value = dirUsuario;
                    usuTelefonoInput.value = telUsuario;
                    usuRolInput.value = rolUsuario;
                    usuRolInput.dispatchEvent(new Event('change'));
                    modal_actualizar_usuario.classList.add('modal--show');
                    });
                    });
            closeModal_actualizar_usuario.addEventListener('click', (e) =>{
            e.preventDefault();
            modal_actualizar_usuario.classList.remove('modal--show');
            });
            ejecutado = true;
            }
            // Resto del código
            });
        </script>
        
<%}%>