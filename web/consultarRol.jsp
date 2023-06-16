<%@include file="Sesiones2.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.RolVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<%UsuarioVO usuVO = (UsuarioVO) buscarSesion.getAttribute("datosUsuario");%>
<%if(usuVO.getRolId_fk().equals("1")){%>
    <section class="modal modal_registrar_rol">
        <div class="modal_container">
            <h2 class="modal_title">Registrar Rol</h2>
            <form method="post" action="Rol">
                <div class="inputs">
                    <div>
                        <label class="modal_paragraph">Descripción:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="text" placeholder="Descripción" name="rolDescripcion" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras" required >            
                    </div>
                </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_registrar_rol swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Registrar</button>

                </div>
                <input type="hidden" name="opcion" value="1">       


            </form>

        </div>

    </section>
    <section class="modal modal_actualizar_rol">
        <div class="modal_container">
            <h2 class="modal_title">Actualizar Rol</h2>
            <form method="post" action="Rol">

                <div class="inputs">
                    <div>
                        <label class="modal_paragraph" >Id:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="number" placeholder="Id" name="rolId" required readonly id="rol_id">    
                    </div>
                    <div>
                        <label class="modal_paragraph" >Descripción:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="text" placeholder="Descripción" name="rolDescripcion" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras" required id="rol_desc" >   
                    </div>


                </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_actualizar_rol swal2-styled swal2-cancel">Cerrar</a>
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
                    <h2><b>Consultar Rol</b></h2>
                    <div >
                        <div class="buscar">
                            <input type="search" class="buscador" id="buscador" placeholder="Search...">
                            <i class='search-btn bx bx-search'></i>
                        </div>
                        <br>
                        <a href="#" class="registrar_rol btn-buscar">Añadir Registro<i class='bx bxs-plus-square'></i></a>
                    </div>
                </th>
            </tr>
        </table><br>




        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Roles</h3>
                    <i class='bx bx-filter'></i>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Descripción</th>
                            <th>Estado</th>
                            <th>Opciones</th>
                                <%
                                    RolVO rolVO = new RolVO();
                                    RolDAO rolDAO = new RolDAO();

                                    ArrayList<RolVO> listaRoles = rolDAO.listar();
                                    for (int i = 0; i < listaRoles.size(); i++) {
                                        rolVO = listaRoles.get(i);
                                %>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="registro">
                            <td>
                                <%=rolVO.getRolId()%>
                            </td>
                            <td class="dato">
                                <%=rolVO.getRolDescripcion()%>
                            </td>
                            <td>
                                <% String estado = "" + rolVO.getRolEstado();%>
                                <span<% if (estado.equals("Activo")) {%> class='status activo' <%} else {%> class='status inactivo' <%}%>>
                                    <%=rolVO.getRolEstado()%>

                                </span>
                            </td>
                            <td>

                                <button class="actualizar_rol btn-table" type="button" name="rolId" data-id-rol="<%=rolVO.getRolId()%>" data-descripcion-rol="<%=rolVO.getRolDescripcion()%>"><i class='bx bxs-edit'></i></button>



                                <button class="btn-table" onclick="mostrarSweetAlert('<%=estado%>', <%=rolVO.getRolId()%>)"  type="button">
                                    <%if (estado.equals("Activo")) {%>
                                    <i class='bx bxs-hide'></i>
                                    <%} else {%>
                                    <i class='bx bxs-show'></i>
                                    <%}%>
                                </button>
                                <input type="hidden" name="rolEstado" value="<%= estado.equals("Activo") ? "Inactivo" : "Activo"%>">
                                <input type="hidden" name="rolId" value="<%= rolVO.getRolId()%>">
                                <input type="hidden" name="opcion" value="3">

                                <script>
                                    function mostrarSweetAlert(estado, rolId) {
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
                                    form.action = 'Rol';
                                    form.style.display = 'none';
                                    const rolEstadoInput = document.createElement('input');
                                    rolEstadoInput.type = 'hidden';
                                    rolEstadoInput.name = 'rolEstado';
                                    rolEstadoInput.value = nuevoEstado;
                                    form.appendChild(rolEstadoInput);
                                    const rolIdInput = document.createElement('input');
                                    rolIdInput.type = 'hidden';
                                    rolIdInput.name = 'rolId';
                                    rolIdInput.value = rolId;
                                    form.appendChild(rolIdInput);
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
//registrar rol
            const openModal_registrar_rol = document.querySelector('.registrar_rol');
            const modal_registrar_rol = document.querySelector('.modal_registrar_rol');
            const closeModal_registrar_rol = document.querySelector('.modal_close_registrar_rol');

                    openModal_registrar_rol.addEventListener('click', (e)=>{
                    e.preventDefault();
                    modal_registrar_rol.classList.add('modal--show');
                    });
            closeModal_registrar_rol.addEventListener('click', (e)=> {
            e.preventDefault();
            modal_registrar_rol.classList.remove('modal--show');
            });
//actualizar rol
            const openModal_actualizar_rol = document.querySelectorAll('.actualizar_rol');
            const modal_actualizar_rol = document.querySelector('.modal_actualizar_rol');
            const closeModal_actualizar_rol = document.querySelector('.modal_close_actualizar_rol')

                    openModal_actualizar_rol.forEach((btn) => {
                    btn.addEventListener('click', (e)=> {
                    e.preventDefault();
                    const idRol = btn.getAttribute('data-id-rol'); // Obtener el id de rol del botón actualizado
                    const modal_actualizar_rol = document.querySelector('.modal_actualizar_rol');
                    const rolIdInput = modal_actualizar_rol.querySelector('#rol_id');
                    rolIdInput.value = idRol; // Asignar el id de rol al input correspondiente en la ventana modal
// Obtener el valor de data-descripcion del botón y asignarlo al input correspondiente en la ventana modal
                    const descripcion = btn.getAttribute('data-descripcion-rol');
                    const rolDescripcionInput = modal_actualizar_rol.querySelector('#rol_desc');
                    rolDescripcionInput.value = descripcion;
                    modal_actualizar_rol.classList.add('modal--show');
                    });
                    });
            closeModal_actualizar_rol.addEventListener('click', (e)=> {
            e.preventDefault();
            modal_actualizar_rol.classList.remove('modal--show');
            });
            ejecutado = true;
            }
// Resto del código
            });
        </script>
        <%}%>