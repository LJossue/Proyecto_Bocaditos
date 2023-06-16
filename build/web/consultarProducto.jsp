<%@include file="Sesiones2.jsp"%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="ModeloVO.ProductoVO"%>
<%@page import="ModeloDAO.CategoriaDAO"%>
<%@page import="ModeloVO.CategoriaVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

   <section class="modal modal_registrar_producto">
        <div class="modal_container">
            <h2 class="modal_title">Registrar Producto</h2>
            <form method="post" action="Producto">
                           <div class="inputs">
                                    <div>
                                        <label class="modal_paragraph">Nombre:<span class="asterisco"> *</span></label>
                                        <input class="modal_input" type="text" placeholder="Nombre" name="proNombre" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras" required >            
                                    </div>
                               <div>
                        
                        <label class="modal_paragraph ">Categoría:<span class="asterisco"> *</span></label>
                                        <select class="modal_input select2"  name="catId_fk" required id="cat2">            
                                            <option value="">Seleccione...</option> 
              <%
             CategoriaDAO catDAO = new CategoriaDAO();
              for(CategoriaVO catVO : catDAO.listarActivos()){
                  
              
              %>
              <option value="<%=catVO.getCatId()%>"><%=catVO.getCatDescripcion()%></option> 
              <% } %>
                                        
                                        </select>  
           
                                    </div>
                               </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_registrar_producto swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Registrar</button>
                    
                </div>
                         <input type="hidden" name="opcion" value="1">       
                                
                            
                        </form>

        </div>
        
    </section>
    <section class="modal modal_actualizar_producto">
        <div class="modal_container">
            <h2 class="modal_title">Actualizar Producto</h2>
            <form method="post" action="Producto">
                           
                <div class="inputs">
                    <div>
                           <label class="modal_paragraph" >Id:<span class="asterisco"> *</span></label>
                                         <input class="modal_input" type="number" placeholder="Id" name="proId" required readonly id="pro_id">    
                    </div>
                    <div>
                           <label class="modal_paragraph" >Nombre:<span class="asterisco"> *</span></label>
                                         <input class="modal_input" type="text" placeholder="Nombre" name="proNombre" pattern="[A-Za-zÁÉÍÓÚÑáéíóúñ ]+" title="Ingrese solo letras" required  id="pro_nom">    
                    </div>
                    <div>
                        
                        <label class="modal_paragraph label_select">Categoría:<span class="asterisco"> *</span></label>
                                        <select class="modal_input select2"  name="catId_fk" required id="pro_cat">            
                                            
              <%
                  CategoriaDAO cat2DAO = new CategoriaDAO();
              for(CategoriaVO catVO : cat2DAO.listar()){
                  
              
              %>
              <option value="<%=catVO.getCatId()%>"><%=catVO.getCatDescripcion()%></option> 
              <% } %>
                                        
                                        </select>         
                                    </div>
                                      
                                                
                                    </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_actualizar_producto swal2-styled swal2-cancel">Cerrar</a>
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
                    <h2><b>Consultar Producto</b></h2>
                    <div >

                        <div class="buscar">
                            <input type="search" class="buscador" id="buscador" placeholder="Search...">
                            <i class='search-btn bx bx-search'></i>
                        </div>

                        <br>
                       <a href="#" class="registrar_producto btn-buscar">Añadir Registro<i class='bx bxs-plus-square'></i></a>

                    </div>


                </th>
            </tr>
        </table><br>


        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Productos</h3>
                    <form method="post" action="GeneradorReporte.jsp" target="_blank">
  <button class="registrar_cliente btn-download" type="submit">
    <i class="bx bxs-cloud-download"></i> Generar PDF
  </button>
  <input type="hidden" name="reportName" value="Producto">
</form>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th style="padding-right: 10px">Id</th>
                            <th>Nombre</th>
                            <th>Categoría</th>
                            <th>Estado</th>
                            <th>Opciones</th>
                                <%
                                    ProductoVO proVO = new ProductoVO();
                                    ProductoDAO proDAO = new ProductoDAO();

                                    ArrayList<ProductoVO> listaProductos = proDAO.listar();
                                    for (int i = 0; i < listaProductos.size(); i++) {
                                        proVO = listaProductos.get(i);
                                %>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="registro">
                            <td ><%=proVO.getProId()%></td>

                            <td class="dato" >
                                <%=proVO.getProNombre()%></td>


                            <td ><%=proVO.getCatDescripcion()%></td>

                                                          <td>
  <% String estado = "" + proVO.getProEstado();%>
    <span<% if (estado.equals("Activo")) {%> class='status activo' <%} else {%> class='status inactivo' <%}%>>
                                    <%=proVO.getProEstado()%>

                                </span>
                            </td>



                            <td>
                                 <button class="actualizar_producto btn-table" type="button" name="proId" data-id-producto="<%=proVO.getProId()%>" data-categoria-producto="<%=proVO.getCatId_fk()%>" data-nombre-producto="<%=proVO.getProNombre()%>"><i class='bx bxs-edit'></i></button>
                                   
                                  
                               
<button class="btn-table" onclick="mostrarSweetAlert('<%=estado%>', <%=proVO.getProId()%>)"  type="button">
  <%if (estado.equals("Activo")){%>
    <i class='bx bxs-hide'></i>
  <%}else{%>
    <i class='bx bxs-show'></i>
  <%}%>
</button>
<input type="hidden" name="proEstado" value="<%= estado.equals("Activo") ? "Inactivo" : "Activo" %>">
<input type="hidden" name="proId" value="<%= proVO.getProId() %>">
<input type="hidden" name="opcion" value="3">

<script>
function mostrarSweetAlert(estado, proId) {
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
      form.action = 'Producto';
      form.style.display = 'none';
      const proEstadoInput = document.createElement('input');
      proEstadoInput.type = 'hidden';
      proEstadoInput.name = 'proEstado';
      proEstadoInput.value = nuevoEstado;
      form.appendChild(proEstadoInput);
      const proIdInput = document.createElement('input');
      proIdInput.type = 'hidden';
      proIdInput.name = 'proId';
      proIdInput.value = proId;
      form.appendChild(proIdInput);
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
//registrar producto
const openModal_registrar_producto = document.querySelector('.registrar_producto');
const modal_registrar_producto = document.querySelector('.modal_registrar_producto');
const closeModal_registrar_producto = document.querySelector('.modal_close_registrar_producto')

openModal_registrar_producto.addEventListener('click',(e)=>{
    e.preventDefault();
    modal_registrar_producto.classList.add('modal--show');
});
closeModal_registrar_producto.addEventListener('click',(e)=>{
    e.preventDefault();
    modal_registrar_producto.classList.remove('modal--show');
});


//actualizar producto
const openModal_actualizar_producto = document.querySelectorAll('.actualizar_producto');
const modal_actualizar_producto = document.querySelector('.modal_actualizar_producto');
const closeModal_actualizar_producto = document.querySelector('.modal_close_actualizar_producto')

openModal_actualizar_producto.forEach((btn) => {
  btn.addEventListener('click', (e) => {
    e.preventDefault();
    const idProducto = btn.getAttribute('data-id-producto'); // Obtener el id de producto del botón actualizado
    const modal_actualizar_producto = document.querySelector('.modal_actualizar_producto');
    const proIdInput = modal_actualizar_producto.querySelector('#pro_id');
    proIdInput.value = idProducto; // Asignar el id de producto al input correspondiente en la ventana modal
         // Obtener el valor de data-descripcion del botón y asignarlo al input correspondiente en la ventana modal
    const catProducto = btn.getAttribute('data-categoria-producto');
    const  proCategoriaInput = modal_actualizar_producto.querySelector('#pro_cat');
    proCategoriaInput.value = catProducto;
    
    // Seleccionar el valor del select en Select2
proCategoriaInput.dispatchEvent(new Event('change'));

     const catNombre = btn.getAttribute('data-nombre-producto');
    const  proNombreInput = modal_actualizar_producto.querySelector('#pro_nom');
    proNombreInput.value = catNombre;
    modal_actualizar_producto.classList.add('modal--show');

  });
});
closeModal_actualizar_producto.addEventListener('click',(e)=>{
    e.preventDefault();
    modal_actualizar_producto.classList.remove('modal--show');
});

  

      ejecutado = true;
   }
   // Resto del código
});
                    </script>