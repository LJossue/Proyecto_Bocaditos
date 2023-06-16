<%@page import="ModeloVO.ClienteVO"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="java.util.Arrays"%>
<%@page import="ModeloVO.ProductoVO"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="ModeloDAO.OrdenDAO"%>
<%@page import="ModeloVO.OrdenVO"%>
<%@include file="Sesiones2.jsp"%> 
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page import="ModeloVO.UsuarioVO"%>
 <section class="modal modal_actualizar_orden">
       <div class="modal_container modal_orden">

            <form method="post" action="Orden">
                <h2 class="modal_title">Actualizar Orden</h2>
                <div class="inputs inputs_orden">
                    <input type="hidden" id="ord_id" name="ordId">
                    <div>
                        
                        <label class="modal_paragraph ">Cliente:<span class="asterisco"> *</span></label>        
                        <select class="select2" required id="ord_cli"  name="cliId_fk">
                            <option value="" selected hidden>Seleccione...</option>
                            <%
                                ClienteDAO cliDAO2 = new ClienteDAO();
                                for (ClienteVO cliVO2 : cliDAO2.listarActivos()) {
                            %>
                            <option value="<%=cliVO2.getCliId()%>" data-direccion="<%=cliVO2.getCliDireccion()%>"><%=cliVO2.getCliNombre()%> <%=cliVO2.getCliApellido()%> <%=cliVO2.getCliTipoDocumento()%> <%=cliVO2.getCliDocumento()%></option> 
                            <% } %>
                        </select>
                    </div>
                    <div>
                        <label class="modal_paragraph">Dirección de envio:</label>
                        <input class="modal_input" type="text" placeholder="Dirección" name="ordDireccion" id="ord_dir" id="direccionInput2" >
                    </div>
                    <div>
                        <label class="modal_paragraph">Precio Domicilio:</label>
                        <input class="modal_input" type="number" placeholder="Precio Domicilio" name="ordPrecioDomicilio" id="ord_dom">
                    </div>
                    <div>
                        <label class="modal_paragraph ">Repostero:<span class="asterisco"> *</span></label>        
                        <select class="select2" name="ordIdRepostero_fk" required id="ord_rep">
                            <option value="" selected hidden>Seleccione...</option>
                            <%
                                UsuarioDAO usuDAO2 = new UsuarioDAO();
                                for (UsuarioVO usuVO2 : usuDAO2.listarReposteros()) {
                            %>
                            <option value="<%=usuVO2.getUsuId()%>"><%=usuVO2.getUsuNombre()%> <%=usuVO2.getUsuApellido()%> <%=usuVO2.getUsuTipoDocumento()%> <%=usuVO2.getUsuDocumento()%></option> 
                            <% } %>
                        </select>
                    </div>
                    <div>
                        <label class="modal_paragraph">Fecha de Orden:<span class="asterisco"> *</span></label>
                        <input type="date" name="ordFechaPedido" id="ord_fecO">
                    </div>
                    <div>
                        <label class="modal_paragraph">Fecha de Entrega:</label>
                        <input type="datetime-local" name="ordFechaEntrega" id="ord_fecE">
                    </div>
                    <div>
                        <label class="modal_paragraph">Abono:</label>
                        <input class="modal_input" type="number" placeholder="Abono" name="ordAbono"  id="ord_abo" id="abono">
                    </div>  
                        <div>
                        <%String[] opcionesestado = {"Realizada", "Pagada", "En camino", "Entregada", "Cancelada"};
                                Arrays.sort(opcionesestado);%>
                        <label class="modal_paragraph ">Estado:</label>        
                        <select class="select2"  name="ordEstado" id="ord_est">
                            <option value=""  selected hidden>Seleccione...</option>
                            <% for (String opcionestado : opcionesestado) {%>
                            <option value="<%= opcionestado%>"><%= opcionestado%></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                         <h3 class="modal_title">Productos</h3>
                
                <div class="swal2-actions">
                    <button type="button" id="botonAgregar2" class="swal2-styled swal2-confirm swal2-confirm2 añadir_productos" >Añadir</button>
                </div>
                <div class="table-data table-data-orden">
                    <div class="order orden">
                        <div class="head">
                            <h3>Productos</h3>
                            <h4>Total: $<span id="total2"></span></h4>
                        </div>
                        <table id="tablaProductos">
                            <thead>
                                <tr>
                                    <th>Producto</th>                             
                                    <th>Sabor</th>
                                    <th>Relleno</th>
                                    <th>Porciones</th>
                                    <th>Cantidad</th>
                                    <th>Subtotal</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="tablaProductosBody2">                              
                            </tbody>
                        </table>
                    </div>
                </div>
                <div>
                    <label class="modal_paragraph">Detalles de la orden:</label>
                    <textarea name="ordDetalles" id="ord_det"></textarea>
                </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_actualizar_orden swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Actualizar</button>
                </div>
                        <input type="hidden" id="productosArray" name="productosArray">
                <input type="hidden" name="opcion" value="2">        
            </form>
        </div>
    </section>

    <section class="modal modal_añadir_productos">
        <div class="modal_container modal_orden">
            <h2 class="modal_title">Productos</h2>
            <form method="post" action="Orden">
                <div class="inputs inputs_orden">
                    <input type="hidden" id="ord_id2" name="ordId_fk">
  <div>
      
                        <label class="modal_paragraph ">Producto:<span class="asterisco"> *</span></label>        
                        <select class="select2"  id="proId_fk3" name="producto2">
                            <option value="" selected hidden>Seleccione...</option>
                            <%
                                ProductoDAO proDAO2 = new ProductoDAO();
                                for (ProductoVO proVO2 : proDAO2.listarActivos()) {
                            %>
                             <option value="<%=proVO2.getProId()%>"><%=proVO2.getCatDescripcion()%> - <%=proVO2.getProNombre()%></option> 
                            <% } %>
                        </select>
                    </div>
                    <div>
                       <%String[] opcionessabor = {"Chocolate", "Vainilla Limon", "Vainilla Naranja", "Red Velvet", "Tradicional Novia",
                                "Vainilla/Oreo", "Vainilla - Amapola", "Vainilla/Limon - Amapola", "Vainilla/Naranja - Amapola", "Marmolado",
                                "Arcoiris", "Funfetti", "Oreo", "Vainilla/Agraz", "Chips de chocolate", "Agraz Amapola", "Vainilla", "Otro"};
                                Arrays.sort(opcionessabor);%>
                        <label class="modal_paragraph ">Sabor:</label>        
                        <select class="select2"  name="sabor2">
                            <option value=""  selected hidden>Seleccione...</option>
                            <% for (String opcionsabor : opcionessabor) {%>
                            <option value="<%= opcionsabor%>"><%= opcionsabor%></option>
                            <% } %>
                        </select>
                    </div>
                    <div>
                       <%String[] opcionesrelleno = {"Nutella", "Frutos Rojos", "Frambuesa", "Chocolate con Chips", "Manteq. Café",
                                    "SIN RELLENO", "Chocolate", "Arequipe", "Chocolate Blanco", "Otro"};
                                Arrays.sort(opcionesrelleno);%>
                        <label class="modal_paragraph ">Relleno:</label>        
                        <select class="select2"   name="relleno2">
                            <option value=""  selected hidden>Seleccione...</option>
                            <% for (String opcionrelleno : opcionesrelleno) {%>
                            <option value="<%= opcionrelleno%>"><%= opcionrelleno%></option>
                            <% } %>
                        </select>

                    </div>
                    <div>
                        <label class="modal_paragraph">Porciones:</label>
                        <input class="modal_input" type="number" placeholder="Porciones" name="porciones2">
                    </div>
                    <div>
                        <label class="modal_paragraph">Cantidad:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="number" placeholder="Cantidad" name="cantidad2">
                    </div>
                    <div>
                        <label class="modal_paragraph">Precio:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="number" placeholder="Precio" name="precio2">
                    </div>
                </div>
                        <div class="swal2-actions">
                    <button type="button" id="botonAgregar" onclick="agregarProducto3()" class="swal2-styled swal2-confirm swal2-confirm2" >Añadir</button>
                </div>
                <div class="table-data table-data-orden">
                    <div class="order orden">
                        <div class="head">
                            <h3>Productos</h3>
                            <h4>Total: $<span id="total3"></span></h4>
                        </div>
                        <table id="tablaProductos">
                            <thead>
                                <tr>
                                    <th>Producto</th>                             
                                    <th>Sabor</th>
                                    <th>Relleno</th>
                                    <th>Porciones</th>
                                    <th>Cantidad</th>
                                    <th>Subtotal</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="tablaProductosBody3">                              
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_añadir_productos swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Añadir</button>

                </div>
                        <input type="hidden" id="productosArrayAñadir" name="productosArrayAñadir">
                <input type="hidden" name="opcion" value="7">       


            </form>

        </div>

    </section>
<center>

        <ul class="box-info box-usu">

            <%
          UsuarioVO usuVO = new UsuarioVO();
                UsuarioDAO usuDAO = new UsuarioDAO();
                UsuarioVO usuVO2 = (UsuarioVO) buscarSesion.getAttribute("datosUsuario");
                String IdUsuario = usuVO2.getUsuId();
                                    ArrayList<UsuarioVO> listaOrdUsuarios = usuDAO.listarNumeroOrdenesSesion(IdUsuario);
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
                    <h2><b>Consultar Mis Ordenes</b></h2>
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
                    <h3>Mis Ordenes a realizar</h3>
                    
         
                </div>
                <table>
                    <thead>
                        <tr>
                            <th style="padding-right: 10px">Id</th>
                            <th>Fecha Pedido</th>
                            <th>Fecha Entrega</th>                   
                            <th>Repostero</th>
                            <th>Cliente</th>
                            <th style="padding-right: 45px">Documento</th>
                            <th>Domicilio</th>    
                            <th>Total</th> 
                            <th>Abono</th>
                          <th>Saldo</th>
                            <th>Estado</th>
                            <th>Opciones</th>
                               
                                
                            
                        </tr>
                    </thead>
                     <%
                                    OrdenVO ordVO5 = new OrdenVO();
                                    OrdenDAO ordDAO4 = new OrdenDAO();
                                    
                                    ArrayList<OrdenVO> listaMisOrdenes = ordDAO4.listarMisOrdenes(IdUsuario);
                                    for (int i = 0; i < listaMisOrdenes.size(); i++) {
                                        ordVO5 = listaMisOrdenes.get(i);%>
                    <tbody>
                        <tr class="registro">
                            <td ><%=ordVO5.getOrdId()%></td>
                            <td ><%=ordVO5.getOrdFechaPedido()%></td>
                            <td ><%=ordVO5.getOrdFechaEntrega()%></td>
                            <td><%=ordVO5.getRepostero()%></td>
                            <td class="dato" ><%=ordVO5.getCliente()%></td>
                            <td><%=ordVO5.getDocumento()%></td>
                            <td>$<%=ordVO5.getOrdPrecioDomicilio()%></td>
                            <td>$<%=ordVO5.getOrdTotal()%></td>
                            <td>$<%=ordVO5.getOrdAbono()%></td>
                            <td>$<%=ordVO5.getOrdSaldo()%></td>
                            <td>
                                <% String estado = "" + ordVO5.getOrdEstado();%>
                                <span<% if (estado.equals("Realizada")) {%> class='status realizado' <%} else if (estado.equals("Pagada")) {%> class='status pagado' <%} else if (estado.equals("En camino")) {%> class='status enCamino'<%} else if (estado.equals("Entregada")) {%> class='status entregado'<%} else if (estado.equals("Cancelada")) {%> class='status cancelado'<%}%>>
                                    <%=ordVO5.getOrdEstado()%>

                                </span>
                            </td>

                            <td>
                               
                                <button onclick="detalles(<%=ordVO5.getOrdId()%>)" class="actualizar_orden btn-table" type="button" name="ordId" data-id-orden="<%=ordVO5.getOrdId()%>" data-cliente="<%=ordVO5.getCliId_fk()%>" data-direccion="<%=ordVO5.getOrdDireccion()%>"
                                        data-domicilio="<%=ordVO5.getOrdPrecioDomicilio()%>" data-repostero="<%=ordVO5.getOrdIdRepostero_fk()%>" data-fecha-orden="<%=ordVO5.getOrdFechaPedido()%>"
                                        data-fecha-entrega="<%=ordVO5.getOrdFechaEntrega()%>" data-abono="<%=ordVO5.getOrdAbono()%>" data-estado="<%=ordVO5.getOrdEstado()%>" data-detalles="<%=ordVO5.getOrdDetalles()%>"><i class='bx bxs-edit'></i></button>
                               

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

            //añadir productos
           const openModal_añadir_productos = document.querySelector('.añadir_productos');
            const modal_añadir_productos = document.querySelector('.modal_añadir_productos');
            const closeModal_añadir_productos = document.querySelector('.modal_close_añadir_productos')

                    openModal_añadir_productos.addEventListener('click', (e) => {
                        // Obtener el valor del campo de entrada
var inputValue = document.getElementById("ord_id").value;

// Obtener referencia al botón
var botonAgregar2 = document.getElementById("botonAgregar2");

// Establecer el atributo data con el valor del campo de entrada
botonAgregar2.setAttribute("data-id-orden-productos", inputValue);
  e.preventDefault();
  const idOrdenProductos = e.target.getAttribute('data-id-orden-productos'); // Obtener el id de orden del botón actualizado
  const ordIdProInput = modal_añadir_productos.querySelector('#ord_id2');
  ordIdProInput.value = idOrdenProductos;

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
    const idOrden = btn.getAttribute('data-id-orden'); // Obtener el id de orden del botón actualizado
    const ordIdInput = modal_actualizar_orden.querySelector('#ord_id');
    const clienteOrden = btn.getAttribute('data-cliente');
    const ordClienteInput = modal_actualizar_orden.querySelector('#ord_cli');
        const direccionOrden = btn.getAttribute('data-direccion');
    const ordDireccionInput = modal_actualizar_orden.querySelector('#ord_dir');
    const domOrden = btn.getAttribute('data-domicilio');
    const ordDomicilioInput = modal_actualizar_orden.querySelector('#ord_dom');
    const repOrden = btn.getAttribute('data-repostero');
    const ordReposteroInput = modal_actualizar_orden.querySelector('#ord_rep');
     const fecOrden = btn.getAttribute('data-fecha-orden');
    const ordFechaOrdenInput = modal_actualizar_orden.querySelector('#ord_fecO');
    const fecEOrden = btn.getAttribute('data-fecha-entrega');
    const ordFechaEntregaInput = modal_actualizar_orden.querySelector('#ord_fecE');
    const aboOrden = btn.getAttribute('data-abono');
    const ordAbonoInput = modal_actualizar_orden.querySelector('#ord_abo');
    const estOrden = btn.getAttribute('data-estado');
    const ordEstadoInput = modal_actualizar_orden.querySelector('#ord_est');
    const detOrden = btn.getAttribute('data-detalles');
    const ordDetallesInput = modal_actualizar_orden.querySelector('#ord_det');
    ordIdInput.value = idOrden;
    ordClienteInput.value = clienteOrden.toString();
    ordDireccionInput.value = direccionOrden;
    ordDomicilioInput.value = domOrden;
    ordReposteroInput.value = repOrden;
     ordFechaOrdenInput.value = fecOrden;
     ordFechaEntregaInput.value = fecEOrden;
     ordAbonoInput.value = aboOrden;
     ordEstadoInput.value = estOrden;
     ordDetallesInput.value = detOrden;
// Actualizar visualmente los elementos select
$(ordClienteInput).trigger('change.select2');
$(ordReposteroInput).trigger('change.select2');
$(ordEstadoInput).trigger('change.select2');

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
            function actualizarDireccion() {
            // Obtener el valor seleccionado del select
            var selectCliente = document.getElementById("selectCliente"); //el select tiene este ID
            var clienteSeleccionado = selectCliente.options[selectCliente.selectedIndex];
            // Obtener la dirección del cliente seleccionado
            var direccion = clienteSeleccionado.getAttribute("data-direccion");
            // Actualizar el valor del campo de entrada de dirección de envío
            document.getElementById("direccionInput").value = direccion;
            }
              
            
                     

function detalles(ord_id) {
  var productosArrayActualizar = [];
  $.ajax({
    url: "/Proyecto/Orden?opcion=5&ord_id=" + ord_id,
    type: "GET",
    dataType: "JSON",
    success: function(data) {
         actualizarTablaProductos2(data);

    }
        });
      }
      function actualizarTablaProductos2(data) {
      var tablaProductosBody = $("#tablaProductosBody2");
      tablaProductosBody.empty();
      productosArrayActualizar = [];
      for (var i = 0; i < data.length; i++) {
        var productoObjeto2 = {
          detoId: data[i].detoId,
          nombre: data[i].producto,
          sabor: data[i].sabor,
          relleno: data[i].relleno,
          porciones: data[i].porciones,
          cantidad: data[i].cantidad,
          subtotal: data[i].subtotal
        };
        productosArrayActualizar.push(productoObjeto2);
      }
      for (var i = 0; i < productosArrayActualizar.length; i++) {
       var producto2 = productosArrayActualizar[i];

    var fila2 = document.createElement("tr");

    var columnaProducto2 = document.createElement("td");
    columnaProducto2.textContent = producto2.nombre;
    fila2.appendChild(columnaProducto2);

    var columnaSabor2 = document.createElement("td");
    columnaSabor2.textContent = producto2.sabor;
    fila2.appendChild(columnaSabor2);

    var columnaRelleno2 = document.createElement("td");
    columnaRelleno2.textContent = producto2.relleno;
    fila2.appendChild(columnaRelleno2);

    var columnaPorciones2 = document.createElement("td");
    columnaPorciones2.textContent = producto2.porciones;
    fila2.appendChild(columnaPorciones2);

    var columnaCantidad2 = document.createElement("td");
    columnaCantidad2.textContent = producto2.cantidad;
    fila2.appendChild(columnaCantidad2);

    var columnaSubtotal2 = document.createElement("td");
    var columnaSubtotalSpan2 = document.createElement("span");
    columnaSubtotal2.classList.add("subtotal2");
        columnaSubtotal2.textContent = producto2.subtotal; // Multiplicar precio y cantidad

    
    fila2.appendChild(columnaSubtotal2);

  var columnaEliminar2 = document.createElement("td");
var botonEliminar2 = document.createElement("button");
botonEliminar2.type = "button"; // Agregar esta línea
botonEliminar2.classList.add("btn-table");
var iconoEliminar2 = document.createElement("i");
iconoEliminar2.className = "bx bxs-trash";
botonEliminar2.appendChild(iconoEliminar2);
botonEliminar2.setAttribute("data-id", producto2.detoId);
columnaEliminar2.appendChild(botonEliminar2);
fila2.appendChild(columnaEliminar2);

tablaProductosBody.append(fila2);
}

tablaProductosBody.on("click", ".btn-table", function() {
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
      
  function mostrarConfirmacionEliminar(detoId) {
  Swal.fire({
    title: '¿Está seguro que desea eliminar este dato?',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Sí, estoy seguro'
  }).then((result) => {
    if (result.isConfirmed) {
       const form = document.createElement('form');
      form.method = 'POST';
      form.action = 'Orden';
      form.style.display = 'none';
      
      const detoIdInput = document.createElement('input');
      detoIdInput.type = 'hidden';
      detoIdInput.name = 'detoId';
      detoIdInput.value = detoId;
      form.appendChild(detoIdInput);
      const opcionInput = document.createElement('input');
      opcionInput.type = 'hidden';
      opcionInput.name = 'opcion';
      opcionInput.value = '6';
      form.appendChild(opcionInput);
      document.body.appendChild(form);
      form.submit();
    }
  });
}


//añadir productos
var productosArrayAñadir = [];
function actualizarTablaProductos3() {
  var tablaBody3 = document.getElementById("tablaProductosBody3");
  tablaBody3.innerHTML = "";

  // Recorrer el array de productos y agregar filas a la tabla
  for (var i = 0; i < productosArrayAñadir.length; i++) {
    var producto3 = productosArrayAñadir[i];

    var fila3 = document.createElement("tr");

    var columnaProducto3 = document.createElement("td");
    columnaProducto3.textContent = producto3.proNombre;
    fila3.appendChild(columnaProducto3);

    var columnaSabor3 = document.createElement("td");
    columnaSabor3.textContent = producto3.sabor;
    fila3.appendChild(columnaSabor3);

    var columnaRelleno3 = document.createElement("td");
    columnaRelleno3.textContent = producto3.relleno;
    fila3.appendChild(columnaRelleno3);

    var columnaPorciones3 = document.createElement("td");
    columnaPorciones3.textContent = producto3.porciones;
    fila3.appendChild(columnaPorciones3);

    var columnaCantidad3 = document.createElement("td");
    columnaCantidad3.textContent = producto3.cantidad;
    fila3.appendChild(columnaCantidad3);

    var columnaSubtotal3 = document.createElement("td");
    var columnaSubtotalSpan3 = document.createElement("span");
    columnaSubtotal3.classList.add("subtotal3");
    columnaSubtotal3.textContent = producto3.cantidad * producto3.precio; // Multiplicar precio y cantidad
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
      productosArrayAñadir.splice(index3, 1);
      actualizarTablaProductos3();
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
  document.getElementById("productosArrayAñadir").value = JSON.stringify(productosArrayAñadir);
}

// Función para eliminar un producto del array
function eliminarProducto3(index) {
  productosArrayAñadir.splice(index3, 1);
  actualizarTablaProductos3();
}

// Event listener para el botón de "Añadir"
function agregarProducto3() {
  // Obtener los valores de los campos de entrada
  var proId3 = document.getElementsByName("producto2")[0].value;
var proNombre3 = document
  .querySelector('select[name="producto2"] option:checked')
  .textContent.trim()
  .split(" - ")[1];
var detoSabor3 = document.getElementsByName("sabor2")[0].value;
var detoRelleno3 = document.getElementsByName("relleno2")[0].value;
var detoPorciones3 = document.getElementsByName("porciones2")[0].value;
var detoCantidad3 = document.getElementsByName("cantidad2")[0].value;
var detoPrecio3 = document.getElementsByName("precio2")[0].value;


  // Validar que los campos no estén vacíos
  if (proId3 === "" || detoCantidad3 === "" || detoPrecio3 === "") {
    alert("Por favor, complete todos los campos antes de agregar un nuevo producto.");
    return;
  }

  // Crear un objeto con los valores del producto
  var productoObjeto3 = {
    proId: proId3,
    proNombre: proNombre3,
    sabor: detoSabor3,
    relleno: detoRelleno3,
    porciones: detoPorciones3,
    cantidad: detoCantidad3,
    precio: detoPrecio3,
  };

  // Agregar el nuevo producto al array
  productosArrayAñadir.push(productoObjeto3);

  // Actualizar la tabla de productos
  actualizarTablaProductos3();

  // Limpiar los campos de entrada
  document.querySelector('select[name="producto2"]').value = "";
  document.querySelector('select[name="producto2"]').dispatchEvent(new Event("change"));
  document.querySelector('select[name="producto2"]').selectedIndex = 0;
  document.querySelector('select[name="sabor2"]').value = "";
  document.querySelector('select[name="sabor2"]').dispatchEvent(new Event("change"));
  document.querySelector('select[name="relleno2"]').value = "";
  document.querySelector('select[name="relleno2"]').dispatchEvent(new Event("change"));
  document.querySelector('input[name="porciones2"]').value = "";
  document.querySelector('input[name="cantidad2"]').value = "";
  document.querySelector('input[name="precio2"]').value = "";


}


</script>