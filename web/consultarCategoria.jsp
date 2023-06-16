<%@include file="Sesiones2.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.CategoriaDAO"%>
<%@page import="ModeloVO.CategoriaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<section class="modal modal_registrar_categoria">
        <div class="modal_container">
            <h2 class="modal_title">Registrar Categoría</h2>
            <form method="post" action="Categoria">
                           <div class="inputs">
                                    <div>
                                        <label class="modal_paragraph">Descripción:<span class="asterisco"> *</span></label>
                                        <input class="modal_input" type="text" placeholder="Descripción" name="catDescripcion" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras" required >            
                                    </div>
                               </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_registrar_categoria swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Registrar</button>
                    
                </div>
                         <input type="hidden" name="opcion" value="1">       
                                
                            
                        </form>

        </div>
        
    </section>
    <section class="modal modal_actualizar_categoria">
        <div class="modal_container">
            <h2 class="modal_title">Actualizar Categoría</h2>
            <form method="post" action="Categoria">
                           
                <div class="inputs">
                    <div>
                           <label class="modal_paragraph" >Id:<span class="asterisco"> *</span></label>
                                         <input class="modal_input" type="number" placeholder="Id" name="catId" required readonly id="cat_id">    
                    </div>
                    <div>
                         <label class="modal_paragraph" >Descripción:<span class="asterisco"> *</span></label>
                                        <input class="modal_input" type="text" placeholder="Descripción" name="catDescripcion" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras" required id="cat_desc" >   
                    </div>
                                      
                                                
                                    </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_actualizar_categoria swal2-styled swal2-cancel">Cerrar</a>
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
                <h2><b>Consultar Categoría</b></h2>
                <div >
        <div class="buscar">
          <input type="search" class="buscador" id="buscador" placeholder="Search...">
          <i class='search-btn bx bx-search'></i>
        </div>
                    <br>
                    <a href="#" class="registrar_categoria btn-buscar">Añadir Registro<i class='bx bxs-plus-square'></i></a>
                </div>
              </th>
            </tr>
          </table><br>


                <div class="table-data">
                  <div class="order">
                    <div class="head">
                      <h3>Categorías</h3>
                      <form method="post" action="GeneradorReporte.jsp" target="_blank">
  <button class="registrar_cliente btn-download" type="submit">
    <i class="bx bxs-cloud-download"></i> Generar PDF
  </button>
  <input type="hidden" name="reportName" value="Categoria">
</form>
                    </div>
                    <table>
                      <thead>
                        <tr>
                          <th>Id</th>
                          <th>Descripción</th>
                          <th>Estado</th>
                          <th>Opciones</th>
                       <%
                                                                CategoriaVO catVO = new CategoriaVO();
                                                                CategoriaDAO catDAO = new CategoriaDAO();

                                                                ArrayList<CategoriaVO> listaCategorias = catDAO.listar();
                                                                for (int i = 0; i < listaCategorias.size(); i++) {
                                                                    catVO = listaCategorias.get(i);
               %>
                        </tr>
                      </thead>
                      <tbody>
                        <tr class="registro">
                            <td >
                            <%=catVO.getCatId()%>
                          </td>
                          <td class="dato" >
                            <%=catVO.getCatDescripcion()%>
                          </td>
                                                       <td>
  <% String estado = "" + catVO.getCatEstado();%>
    <span<% if (estado.equals("Activo")) {%> class='status activo' <%} else {%> class='status inactivo' <%}%>>
                                    <%=catVO.getCatEstado()%>

                                </span>
                            </td>
                           <td>
                                
                                    <button class="actualizar_categoria btn-table" type="button" name="catId" data-id-categoria="<%=catVO.getCatId()%>" data-descripcion-categoria="<%=catVO.getCatDescripcion()%>"><i class='bx bxs-edit'></i></button>
                                   
                                  
                               
<button class="btn-table" onclick="mostrarSweetAlert('<%=estado%>', <%=catVO.getCatId()%>)"  type="button">
  <%if (estado.equals("Activo")){%>
    <i class='bx bxs-hide'></i>
  <%}else{%>
    <i class='bx bxs-show'></i>
  <%}%>
</button>
<input type="hidden" name="catEstado" value="<%= estado.equals("Activo") ? "Inactivo" : "Activo" %>">
<input type="hidden" name="catId" value="<%= catVO.getCatId() %>">
<input type="hidden" name="opcion" value="3">

<script>
function mostrarSweetAlert(estado, catId) {
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
      form.action = 'Categoria';
      form.style.display = 'none';
      const catEstadoInput = document.createElement('input');
      catEstadoInput.type = 'hidden';
      catEstadoInput.name = 'catEstado';
      catEstadoInput.value = nuevoEstado;
      form.appendChild(catEstadoInput);
      const catIdInput = document.createElement('input');
      catIdInput.type = 'hidden';
      catIdInput.name = 'catId';
      catIdInput.value = catId;
      form.appendChild(catIdInput);
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
//registrar categoria
const openModal_registrar_categoria = document.querySelector('.registrar_categoria');
const modal_registrar_categoria = document.querySelector('.modal_registrar_categoria');
const closeModal_registrar_categoria = document.querySelector('.modal_close_registrar_categoria')

openModal_registrar_categoria.addEventListener('click',(e)=>{
    e.preventDefault();
    modal_registrar_categoria.classList.add('modal--show');
});
closeModal_registrar_categoria.addEventListener('click',(e)=>{
    e.preventDefault();
    modal_registrar_categoria.classList.remove('modal--show');
});


//actualizar categoria
const openModal_actualizar_categoria = document.querySelectorAll('.actualizar_categoria');
const modal_actualizar_categoria = document.querySelector('.modal_actualizar_categoria');
const closeModal_actualizar_categoria = document.querySelector('.modal_close_actualizar_categoria')

openModal_actualizar_categoria.forEach((btn) => {
  btn.addEventListener('click', (e) => {
    e.preventDefault();
    const idCategoria = btn.getAttribute('data-id-categoria'); // Obtener el id de categoria del botón actualizado
    const modal_actualizar_categoria = document.querySelector('.modal_actualizar_categoria');
    const catIdInput = modal_actualizar_categoria.querySelector('#cat_id');
    catIdInput.value = idCategoria; // Asignar el id de categoria al input correspondiente en la ventana modal
         // Obtener el valor de data-descripcion del botón y asignarlo al input correspondiente en la ventana modal
    const descripcion = btn.getAttribute('data-descripcion-categoria');
    const catDescripcionInput = modal_actualizar_categoria.querySelector('#cat_desc');
    catDescripcionInput.value = descripcion;
    modal_actualizar_categoria.classList.add('modal--show');

  });
});
closeModal_actualizar_categoria.addEventListener('click',(e)=>{
    e.preventDefault();
    modal_actualizar_categoria.classList.remove('modal--show');
});

      ejecutado = true;
   }
   // Resto del código
});
                    </script>