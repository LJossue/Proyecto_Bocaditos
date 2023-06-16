<%@include file="Sesiones2.jsp"%>
<%@page import="java.util.Arrays"%>
<%@page import="ModeloVO.MateriaVO"%>
<%@page import="ModeloDAO.MateriaDAO"%>
<%@page import="ModeloVO.ProveedorVO"%>
<%@page import="ModeloDAO.ProveedorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.PedidoDAO"%>
<%@page import="ModeloVO.PedidoVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <%UsuarioVO usuVO2 = (UsuarioVO) buscarSesion.getAttribute("datosUsuario");%>
<%if(usuVO2.getRolId_fk().equals("1") || usuVO2.getRolId_fk().equals("2")){%>
 <section class="modal modal_registrar_orden">
        <div class="modal_container modal_orden">

            <form method="post" action="Pedido">
                <h2 class="modal_title">Registrar Pedido</h2>
                <div class="inputs inputs_orden">
                    <div>
                        <label class="modal_paragraph ">Proveedor:<span class="asterisco"> *</span></label>        
                        <select class="select2" required id="selectProveedor" name="prvId_fk">
                            <option value="" selected hidden>Seleccione...</option>
                            <%
                                ProveedorDAO prvDAO = new ProveedorDAO();
                                for (ProveedorVO prvVO : prvDAO.listarActivos()) {
                            %>
                            <option value="<%=prvVO.getPrvId()%>">Nit: <%=prvVO.getPrvNit()%> | <%=prvVO.getPrvNombre()%></option> 
                            <% } %>
                        </select>
                    </div>
                    <div>
                        <label class="modal_paragraph">Fecha de Pedido:<span class="asterisco"> *</span></label>
                        <input type="date" name="pedFechaPedido">
                    </div>
                    <div>
                        <label class="modal_paragraph">Fecha de Entrega:</label>
                        <input type="datetime-local" name="pedFechaEntrega">
                    </div>              
                </div>
                <h3 class="modal_title">Materia prima</h3>
                <div class="inputs inputs_orden">
                    <div>
                        <label class="modal_paragraph ">Materia prima:<span class="asterisco"> *</span></label>        
                        <select class="select2"  id="matId_fk" onchange="actualizarUnidad()" name="materia">
                            <option value="" selected hidden>Seleccione...</option>
                            <%
                                MateriaDAO matDAO = new MateriaDAO();
                                for (MateriaVO matVO : matDAO.listarActivos()) {
                            %>
                             <option value="<%=matVO.getMatId()%>" data-unidad="<%=matVO.getDetmUnidadDeMedida()%>"><%=matVO.getMatNombre()%></option> 
                            <% } %>
                        </select>
                    </div>
                        <div>
                        <label class="modal_paragraph">Precio:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="number" placeholder="Precio" name="precio">
                    </div>
                    <div>
                        <label class="modal_paragraph">Cantidad:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="text" placeholder="Cantidad" value="0" name="cantidad" pattern="\d+(\.\d{1,2})?" onkeypress="return event.charCode != 101 && event.charCode != 69 && (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 46">
                    </div>
                        <div>
                        <label class="modal_paragraph">Unidad de medida:</label>
                        <input class="modal_input" type="text" placeholder="Unidad de medida" name="UM" id="unidadInput" readonly>
                    </div>
                </div>
                <div class="swal2-actions">
                    <button type="button" id="botonAgregar" onclick="agregarMateria()" class="swal2-styled swal2-confirm swal2-confirm2" >Añadir</button>
                </div>
                <div class="table-data table-data-orden">
                    <div class="order orden">
                        <div class="head">
                            <h3>Materia prima</h3>
                            <h4>Total: $<span id="total"></span></h4>
                        </div>
                        <table id="tablaMateria">
                            <thead>
                                <tr>
                                    <th>Materia prima</th>                             
                                    <th>Cantidad</th>
                                    <th>UM</th>
                                    <th>Subtotal</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="tablaMateriaBody">                              
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_registrar_orden swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Registrar</button>
                </div>
                        <input type="hidden" id="materiaArray" name="materiaArray">
                <input type="hidden" name="opcion" value="5">        
            </form>
        </div>
    </section>
                        
                        
    <section class="modal modal_actualizar_orden">
       <div class="modal_container modal_orden">

            <form method="post" action="Pedido">
                <h2 class="modal_title">Actualizar Pedido</h2>
                <div class="inputs inputs_orden">
                    <input type="hidden" id="ped_id" name="pedId">
                    <div>
                        
                        <label class="modal_paragraph ">Proveedor:<span class="asterisco"> *</span></label>        
                        <select class="select2" required id="ped_prv"  name="prvId_fk">
                            <option value="" selected hidden>Seleccione...</option>
                            <%
                                ProveedorDAO prvDAO2 = new ProveedorDAO();
                                for (ProveedorVO prvVO2 : prvDAO2.listarActivos()) {
                            %>
                            <option value="<%=prvVO2.getPrvId()%>">Nit: <%=prvVO2.getPrvNit()%> | <%=prvVO2.getPrvNombre()%></option> 
                            <% } %>
                        </select>
                    </div>
                    <div>
                        <label class="modal_paragraph">Fecha de Pedido:<span class="asterisco"> *</span></label>
                        <input type="date" name="pedFechaPedido" id="ped_fecO">
                    </div>
                    <div>
                        <label class="modal_paragraph">Fecha de Entrega:</label>
                        <input type="datetime-local" name="pedFechaEntrega" id="ped_fecE">
                    </div>
                        <div>
                        <%String[] opcionesestado = {"Realizado", "Pagado", "En camino", "Recibido", "Cancelado"};
                                Arrays.sort(opcionesestado);%>
                        <label class="modal_paragraph ">Estado:</label>        
                        <select class="select2"  name="pedEstado" id="ped_est">
                            <option value=""  selected hidden>Seleccione...</option>
                            <% for (String opcionestado : opcionesestado) {%>
                            <option value="<%= opcionestado%>"><%= opcionestado%></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                         <h3 class="modal_title">Materia prima</h3>
                
                <div class="swal2-actions">
                    <button type="button" id="botonAgregar2" class="swal2-styled swal2-confirm swal2-confirm2 añadir_productos" >Añadir</button>
                </div>
                <div class="table-data table-data-orden">
                    <div class="order orden">
                        <div class="head">
                            <h3>Materia prima</h3>
                            <h4>Total: $<span id="total2"></span></h4>
                        </div>
                        <table id="tablaMateria">
                            <thead>
                                <tr>
                                    <th>Materia prima</th>                             
                                    <th>Cantidad</th>
                                    
                                    <th>Subtotal</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="tablaMateriaBody2">                              
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_actualizar_orden swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Actualizar</button>
                </div>
                        <input type="hidden" id="materiaArray" name="materiaArray">
                <input type="hidden" name="opcion" value="2">        
            </form>
        </div>
    </section>

    <section class="modal modal_añadir_productos">
        <div class="modal_container modal_orden">
            <h2 class="modal_title">Materia prima</h2>
            <form method="post" action="Pedido">
                <div class="inputs inputs_orden">
                    <input type="hidden" id="ped_id2" name="pedId_fk">
  <div>
      
                        <label class="modal_paragraph ">Materia prima:<span class="asterisco"> *</span></label>        
                        <select class="select2"  id="matId_fk3" onchange="actualizarUnidad2()" name="materia2">
                            <option value="" selected hidden>Seleccione...</option>
                            <%
                                MateriaDAO matDAO2 = new MateriaDAO();
                                for (MateriaVO matVO2 : matDAO2.listarActivos()) {
                            %>
                             <option value="<%=matVO2.getMatId()%>" data-unidad2="<%=matVO2.getDetmUnidadDeMedida()%>"><%=matVO2.getMatNombre()%></option> 
                            <% } %>
                        </select>
                    </div>
                    <div>
                        <label class="modal_paragraph">Precio:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="number" placeholder="Precio" name="precio2">
                    </div>
                        <div>
                        <label class="modal_paragraph">Cantidad:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="text" placeholder="Cantidad" value="0" name="cantidad2" pattern="\d+(\.\d{1,2})?"  onkeypress="return event.charCode != 101 && event.charCode != 69 && (event.charCode >= 48 && event.charCode <= 57) || event.charCode == 46">
                        </div>
                        <div>
                        <label class="modal_paragraph">Unidad de medida:</label>
                        <input class="modal_input" type="text" placeholder="Unidad de medida" name="UM2" id="unidadInput2" readonly>
                    </div>
                </div>
                        <div class="swal2-actions">
                    <button type="button" id="botonAgregar" onclick="agregarMateria3()" class="swal2-styled swal2-confirm swal2-confirm2" >Añadir</button>
                </div>
                <div class="table-data table-data-orden">
                    <div class="order orden">
                        <div class="head">
                            <h3>Materia Prima</h3>
                            <h4>Total: $<span id="total3"></span></h4>
                        </div>
                        <table id="tablaMateria">
                            <thead>
                                <tr>
                                    <th>Materia</th>                             
                                    <th>Cantidad</th>
                                    <th>UM</th>
                                    <th>Subtotal</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="tablaMateriaBody3">                              
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_añadir_productos swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Añadir</button>

                </div>
                        <input type="hidden" id="materiaArrayAñadir" name="materiaArrayAñadir">
                <input type="hidden" name="opcion" value="8">       
            </form>

        </div>

    </section>
    <center>
        <table>
            <tr>
                <th>
                    <h2><b>Consultar Pedido</b></h2>
                    <div >

                        <div class="buscar">
                            <input type="search" class="buscador" id="buscador" placeholder="Search...">
                            <i class='search-btn bx bx-search'></i>
                        </div>

                        <br>
                        <a href="#" class="registrar_orden btn-buscar">Añadir Registro<i class='bx bxs-plus-square'></i></a>

                    </div>


                </th>
            </tr>
        </table><br>



        <% if (request.getAttribute("mensajeError") != null) {%>
        ${mensajeError}
        <%} else { %>
        ${mensajeExito}

        <% } %>

        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Pedidos a Proveedores</h3>
                    <form method="post" action="GeneradorReporte.jsp" target="_blank">
  <button class="registrar_cliente btn-download" type="submit">
    <i class="bx bxs-cloud-download"></i> Generar PDF
  </button>
  <input type="hidden" name="reportName" value="Pedido">
</form>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th style="padding-right: 10px">Id</th>
                            <th>Fecha Pedido</th>
                            <th>Fecha Entrega</th>
                            <th>Proveedor</th>
                            <th>Total</th>
                            <th>Estado</th>   
                            <th>Opciones</th>
                                <%
                                    PedidoVO pedVO = new PedidoVO();
                                    PedidoDAO pedDAO = new PedidoDAO();

                                    ArrayList<PedidoVO> listaPedidos = pedDAO.listar();
                                    for (int i = 0; i < listaPedidos.size(); i++) {
                                        pedVO = listaPedidos.get(i);
                                %>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="registro">
                            <td ><%=pedVO.getPedId()%></td>
                            
                            <td >
                                <%=pedVO.getPedFechaPedido()%>
                            </td>
                            <td >
                                <%=pedVO.getPedFechaEntrega()%>
                            </td>
                            
                             <td class="dato" >
                                <%=pedVO.getPrvNombre()%>
                            </td>
                             <td>
                                <%=pedVO.getPedTotal()%>
                            </td>
                            <td>
  <% String estado = "" + pedVO.getPedEstado();%>
    <span<% if (estado.equals("Realizado")) {%> class='status realizado' <%} else if(estado.equals("Pagado")) {%> class='status pagado' <%} else if(estado.equals("En camino")) {%> class='status enCamino'<%} else if(estado.equals("Recibido")) {%> class='status entregado'<%} else if(estado.equals("Cancelado")) {%> class='status cancelado'<%}%>>
                                    <%=pedVO.getPedEstado()%>

                                </span>
                            </td>
                            
                            <td>
                               
                                <button onclick="detalles(<%=pedVO.getPedId()%>)" class="actualizar_orden btn-table" type="button" name="pedId" data-id-pedido="<%=pedVO.getPedId()%>" data-proveedor="<%=pedVO.getPrvId_fk()%>"
                                        data-fecha-pedido="<%=pedVO.getPedFechaPedido()%>"data-fecha-entrega="<%=pedVO.getPedFechaEntrega()%>" data-estado="<%=pedVO.getPedEstado()%>"><i class='bx bxs-edit'></i></button>
                               
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
//registrar orden
            const openModal_registrar_orden = document.querySelector('.registrar_orden');
            const modal_registrar_orden = document.querySelector('.modal_registrar_orden');
            const closeModal_registrar_orden = document.querySelector('.modal_close_registrar_orden')

                    openModal_registrar_orden.addEventListener('click', (e) => {     
                    e.preventDefault();
                     
                     
                    modal_registrar_orden.classList.add('modal--show');
                    });
            closeModal_registrar_orden.addEventListener('click', (e) => {
            e.preventDefault();
            modal_registrar_orden.classList.remove('modal--show');
            });
            //añadir productos
           const openModal_añadir_productos = document.querySelector('.añadir_productos');
            const modal_añadir_productos = document.querySelector('.modal_añadir_productos');
            const closeModal_añadir_productos = document.querySelector('.modal_close_añadir_productos')

                    openModal_añadir_productos.addEventListener('click', (e) => {
                        // Obtener el valor del campo de entrada
var inputValue = document.getElementById("ped_id").value;



// Obtener referencia al botón
var botonAgregar2 = document.getElementById("botonAgregar2");

// Establecer el atributo data con el valor del campo de entrada
botonAgregar2.setAttribute("data-id-pedido-materia", inputValue);
  e.preventDefault();
  const idPedidoMateria = e.target.getAttribute('data-id-pedido-materia'); // Obtener el id de orden del botón actualizado
  const pedIdMatInput = modal_añadir_productos.querySelector('#ped_id2');
  pedIdMatInput.value = idPedidoMateria;

  modal_añadir_productos.classList.add('modal--show');
});
            closeModal_añadir_productos.addEventListener('click', (e) => {
            e.preventDefault();
            modal_añadir_productos.classList.remove('modal--show');
            });
//actualizar orden
const openModal_actualizar_orden = document.querySelectorAll('.actualizar_orden');
const modal_actualizar_orden = document.querySelector('.modal_actualizar_orden');
const closeModal_actualizar_orden = document.querySelector('.modal_close_actualizar_orden')

openModal_actualizar_orden.forEach((btn) => {
  btn.addEventListener('click', (e) => {
    e.preventDefault();
    const idPedido = btn.getAttribute('data-id-pedido'); // Obtener el id de orden del botón actualizado
    const pedIdInput = modal_actualizar_orden.querySelector('#ped_id');
    const proveedorPedido = btn.getAttribute('data-proveedor');
    const pedProveedorInput = modal_actualizar_orden.querySelector('#ped_prv');
    const fecPedido = btn.getAttribute('data-fecha-pedido');
    const pedFechaPedidoInput = modal_actualizar_orden.querySelector('#ped_fecO');
    const fecEPedido = btn.getAttribute('data-fecha-entrega');
    const pedFechaEntregaInput = modal_actualizar_orden.querySelector('#ped_fecE');
    const estPedido = btn.getAttribute('data-estado');
    const pedEstadoInput = modal_actualizar_orden.querySelector('#ped_est');
    pedIdInput.value = idPedido;
    pedProveedorInput.value = proveedorPedido.toString();
     pedFechaPedidoInput.value = fecPedido;
     pedFechaEntregaInput.value = fecEPedido;
     pedEstadoInput.value = estPedido;
// Actualizar visualmente los elementos select
$(pedProveedorInput).trigger('change.select2');
$(pedEstadoInput).trigger('change.select2');

    modal_actualizar_orden.classList.add('modal--show');

  });
});
closeModal_actualizar_orden.addEventListener('click',(e)=>{
    e.preventDefault();
    modal_actualizar_orden.classList.remove('modal--show');
});
            ejecutado = true;
            }

            });
                 
    //OBTENER DIRECCION EN REGISTRAR ORDEN           
            function actualizarUnidad() {
            // Obtener el valor seleccionado del select
            var selectMateria = document.getElementById("matId_fk"); //el select tiene este ID
            var materiaSeleccionado = selectMateria.options[selectMateria.selectedIndex];
            // Obtener la dirección del cliente seleccionado
            var unidad = materiaSeleccionado.getAttribute("data-unidad");
            // Actualizar el valor del campo de entrada de dirección de envío
            document.getElementById("unidadInput").value = unidad;
            }
            //OBTENER DIRECCION EN REGISTRAR ORDEN           
            function actualizarUnidad2() {
            // Obtener el valor seleccionado del select
            var selectMateria2 = document.getElementById("matId_fk3"); //el select tiene este ID
            var materiaSeleccionado2 = selectMateria2.options[selectMateria2.selectedIndex];
            // Obtener la dirección del cliente seleccionado
            var unidad2 = materiaSeleccionado2.getAttribute("data-unidad2");
            // Actualizar el valor del campo de entrada de dirección de envío
            document.getElementById("unidadInput2").value = unidad2;
            }
    // ARRAY ORDEN TABLA
var materiaArray = [];

function actualizarTablaMateria() {
  var tablaBody = document.getElementById("tablaMateriaBody");
  tablaBody.innerHTML = "";

  // Recorrer el array de productos y agregar filas a la tabla
  for (var i = 0; i < materiaArray.length; i++) {
    var materia = materiaArray[i];

    var fila = document.createElement("tr");

    var columnaMateria = document.createElement("td");
    columnaMateria.textContent = materia.matNombre;
    fila.appendChild(columnaMateria);

    var columnaCantidad = document.createElement("td");
    columnaCantidad.textContent = materia.cantidad;
    fila.appendChild(columnaCantidad);
    
    var columnaUM = document.createElement("td");
    columnaUM.textContent = materia.UM;
    fila.appendChild(columnaUM);

    var columnaSubtotal = document.createElement("td");
    var columnaSubtotalSpan = document.createElement("span");
    columnaSubtotal.classList.add("subtotal");
    columnaSubtotal.textContent = materia.cantidad * materia.precio; // Multiplicar precio y cantidad
    fila.appendChild(columnaSubtotal);

    var columnaEliminar = document.createElement("td");
    var botonEliminar = document.createElement("button");
    botonEliminar.classList.add("btn-table");
    var iconoEliminar = document.createElement("i"); // creas el elemento <i>

    iconoEliminar.className = "bx bxs-trash"; // agregas la clase del icono
    botonEliminar.appendChild(iconoEliminar); // agregas el icono al botón
    botonEliminar.setAttribute("data-id", i);

    botonEliminar.addEventListener("click", function() {
      var index = parseInt(this.getAttribute("data-id"));
      materiaArray.splice(index, 1);
      actualizarTablaMateria();
    });

    columnaEliminar.appendChild(botonEliminar);
    fila.appendChild(columnaEliminar);
    tablaBody.appendChild(fila);
  }

  // Seleccionar todos los campos de subtotal y sumarlos
  var subtotales = document.getElementsByClassName("subtotal");
  var total = 0;
  for (var i = 0; i < subtotales.length; i++) {
    var subtotal = parseFloat(subtotales[i].textContent);
    total += subtotal;
  }

  // Actualizar el valor del campo de texto Total
  var totalField = document.getElementById("total");
  totalField.textContent = total.toFixed(2);
  // Actualizar el valor del campo oculto con el array de productos
  document.getElementById("materiaArray").value = JSON.stringify(materiaArray);
}

// Función para eliminar un producto del array
function eliminarMateria(index) {
  materiaArray.splice(index, 1);
  actualizarTablaMateria();
}

// Event listener para el botón de "Añadir"
function agregarMateria() {
  // Obtener los valores de los campos de entrada
  var matId = document.getElementsByName("materia")[0].value;
  var matNombre = document
    .querySelector('select[name="materia"] option:checked')
    .textContent.trim()
  var detpCantidad = document.getElementsByName("cantidad")[0].value;
  var detpPrecio = document.getElementsByName("precio")[0].value;
 var detpUnidadDeMedida = document.getElementsByName("UM")[0].value;
  // Validar que los campos no estén vacíos
  if (matId === "" || detpCantidad === "" || detpPrecio === "") {
    alert("Por favor, complete todos los campos antes de agregar un nuevo producto.");
    return;
  }

  // Crear un objeto con los valores del producto
  var materiaObjeto = {
    matId: matId,
    matNombre: matNombre,
    cantidad: detpCantidad,
    UM: detpUnidadDeMedida,
    precio: detpPrecio,
  };

  // Agregar el nuevo producto al array
  materiaArray.push(materiaObjeto);

  // Actualizar la tabla de productos
  actualizarTablaMateria();

  // Limpiar los campos de entrada
  document.querySelector('select[name="materia"]').value = "";
  document.querySelector('select[name="materia"]').dispatchEvent(new Event("change"));
  document.querySelector('select[name="materia"]').selectedIndex = 0;
  document.querySelector('input[name="cantidad"]').value = "";
  document.querySelector('input[name="precio"]').value = "";


}
function detalles(ped_id) {
  var materiaArrayActualizar = [];
  $.ajax({
    url: "/Proyecto/Pedido?opcion=6&ped_id=" + ped_id,
    type: "GET",
    dataType: "JSON",
    success: function(data) {
         actualizarTablaMateria2(data);

    }
        });
      }
      function actualizarTablaMateria2(data) {
      var tablaMateriaBody = $("#tablaMateriaBody2");
      tablaMateriaBody.empty();
      materiaArrayActualizar = [];
      for (var i = 0; i < data.length; i++) {
        var materiaObjeto2 = {
          detpId: data[i].detpId,
          nombre: data[i].materia,
          cantidad: data[i].cantidad,
          subtotal: data[i].subtotal
        };
        materiaArrayActualizar.push(materiaObjeto2);
      }
      for (var i = 0; i < materiaArrayActualizar.length; i++) {
       var materia2 = materiaArrayActualizar[i];

    var fila2 = document.createElement("tr");

    var columnaMateria2 = document.createElement("td");
    columnaMateria2.textContent = materia2.nombre;
    fila2.appendChild(columnaMateria2);

    var columnaCantidad2 = document.createElement("td");
    columnaCantidad2.textContent = materia2.cantidad;
    fila2.appendChild(columnaCantidad2);

    var columnaSubtotal2 = document.createElement("td");
    var columnaSubtotalSpan2 = document.createElement("span");
    columnaSubtotal2.classList.add("subtotal2");
        columnaSubtotal2.textContent = materia2.subtotal; // Multiplicar precio y cantidad

    
    fila2.appendChild(columnaSubtotal2);

  var columnaEliminar2 = document.createElement("td");
var botonEliminar2 = document.createElement("button");
botonEliminar2.type = "button"; // Agregar esta línea
botonEliminar2.classList.add("btn-table");
var iconoEliminar2 = document.createElement("i");
iconoEliminar2.className = "bx bxs-trash";
botonEliminar2.appendChild(iconoEliminar2);
botonEliminar2.setAttribute("data-id", materia2.detpId);
columnaEliminar2.appendChild(botonEliminar2);
fila2.appendChild(columnaEliminar2);

tablaMateriaBody.append(fila2);
}

tablaMateriaBody.on("click", ".btn-table", function() {
  var id = $(this).data("id");
  mostrarConfirmacionEliminar(id);
});
  // Seleccionar todos los campos de subtotal y sumarlos
  var subtotales2 = document.getElementsByClassName("subtotal2");
  var total2 = 0;
  for (var i = 0; i < subtotales2.length; i++) {
    var subtotal2 = parseFloat(subtotales2[i].textContent);
    total2 += subtotal2;
  }

  // Actualizar el valor del campo de texto Total
  var totalField2 = document.getElementById("total2");
  totalField2.textContent = total2.toFixed(2);
}
      
  function mostrarConfirmacionEliminar(detpId) {
  Swal.fire({
    title: '¿Está seguro que desea eliminar este dato?',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Sí, estoy seguro'
  }).then((result) => {
    if (result.isConfirmed) {
       const form = document.createElement('form');
      form.method = 'POST';
      form.action = 'Pedido';
      form.style.display = 'none';
      
      const detpIdInput = document.createElement('input');
      detpIdInput.type = 'hidden';
      detpIdInput.name = 'detpId';
      detpIdInput.value = detpId;
      form.appendChild(detpIdInput);
      const opcionInput = document.createElement('input');
      opcionInput.type = 'hidden';
      opcionInput.name = 'opcion';
      opcionInput.value = '7';
      form.appendChild(opcionInput);
      document.body.appendChild(form);
      form.submit();
    }
  });
}


//añadir productos
var materiaArrayAñadir = [];
function actualizarTablaMateria3() {
  var tablaBody3 = document.getElementById("tablaMateriaBody3");
  tablaBody3.innerHTML = "";

  // Recorrer el array de productos y agregar filas a la tabla
  for (var i = 0; i < materiaArrayAñadir.length; i++) {
    var materia3 = materiaArrayAñadir[i];

    var fila3 = document.createElement("tr");

    var columnaMateria3 = document.createElement("td");
    columnaMateria3.textContent = materia3.matNombre;
    fila3.appendChild(columnaMateria3);

    var columnaCantidad3 = document.createElement("td");
    columnaCantidad3.textContent = materia3.cantidad;
    fila3.appendChild(columnaCantidad3);
    
    var columnaUM3 = document.createElement("td");
    columnaUM3.textContent = materia3.UM;
    fila3.appendChild(columnaUM3);

    var columnaSubtotal3 = document.createElement("td");
    var columnaSubtotalSpan3 = document.createElement("span");
    columnaSubtotal3.classList.add("subtotal3");
    columnaSubtotal3.textContent = materia3.cantidad * materia3.precio; // Multiplicar precio y cantidad
    fila3.appendChild(columnaSubtotal3);

    var columnaEliminar3 = document.createElement("td");
    var botonEliminar3 = document.createElement("button");
    botonEliminar3.classList.add("btn-table");
    var iconoEliminar3 = document.createElement("i"); // creas el elemento <i>

    iconoEliminar3.className = "bx bxs-trash"; // agregas la clase del icono
    botonEliminar3.appendChild(iconoEliminar3); // agregas el icono al botón
    botonEliminar3.setAttribute("data-id", i);

    botonEliminar3.addEventListener("click", function() {
      var index3 = parseInt(this.getAttribute("data-id"));
      materiaArrayAñadir.splice(index3, 1);
      actualizarTablaMateria3();
    });

    columnaEliminar3.appendChild(botonEliminar3);
    fila3.appendChild(columnaEliminar3);
    tablaBody3.appendChild(fila3);
  }

  // Seleccionar todos los campos de subtotal y sumarlos
  var subtotales3 = document.getElementsByClassName("subtotal3");
  var total3 = 0;
  for (var i = 0; i < subtotales3.length; i++) {
    var subtotal3 = parseFloat(subtotales3[i].textContent);
    total3 += subtotal3;
  }

  // Actualizar el valor del campo de texto Total
  var totalField3 = document.getElementById("total3");
  totalField3.textContent = total3.toFixed(2);
  // Actualizar el valor del campo oculto con el array de productos
  document.getElementById("materiaArrayAñadir").value = JSON.stringify(materiaArrayAñadir);
}

// Función para eliminar un producto del array
function eliminarMateria3(index) {
  materiaArrayAñadir.splice(index3, 1);
  actualizarTablaMateria3();
}

// Event listener para el botón de "Añadir"
function agregarMateria3() {
  // Obtener los valores de los campos de entrada
  var matId3 = document.getElementsByName("materia2")[0].value;
var matNombre3 = document
  .querySelector('select[name="materia2"] option:checked')
  .textContent.trim()
var detpCantidad3 = document.getElementsByName("cantidad2")[0].value;
var detpPrecio3 = document.getElementsByName("precio2")[0].value;
var detpUnidadDeMedida3 = document.getElementsByName("UM2")[0].value;


  // Validar que los campos no estén vacíos
  if (matId3 === "" || detpCantidad3 === "" || detpPrecio3 === "") {
    alert("Por favor, complete todos los campos antes de agregar una nueva materia prima.");
    return;
  }

  // Crear un objeto con los valores del producto
  var materiaObjeto3 = {
    matId: matId3,
    matNombre: matNombre3,
    cantidad: detpCantidad3,
    UM: detpUnidadDeMedida3,
    precio: detpPrecio3,
  };

  // Agregar el nuevo producto al array
  materiaArrayAñadir.push(materiaObjeto3);

  // Actualizar la tabla de productos
  actualizarTablaMateria3();

  // Limpiar los campos de entrada
  document.querySelector('select[name="materia2"]').value = "";
  document.querySelector('select[name="materia2"]').dispatchEvent(new Event("change"));
  document.querySelector('select[name="materia2"]').selectedIndex = 0;
  document.querySelector('input[name="cantidad2"]').value = "";
  document.querySelector('input[name="precio2"]').value = "";


}


</script>

<%}%>