<%@include file="Sesiones2.jsp"%>
<%@page import="java.util.Arrays"%>
<%@page import="ModeloVO.ProductoVO"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="ModeloVO.UsuarioVO"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.OrdenDAO"%>
<%@page import="ModeloVO.OrdenVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <section class="modal modal_registrar_orden">
        <div class="modal_container modal_orden">

            <form method="post" action="Orden">
                <h2 class="modal_title">Registrar Orden</h2>
                <div class="inputs inputs_orden">
                    <div>
                        <label class="modal_paragraph ">Cliente:<span class="asterisco"> *</span></label>        
                        <select class="select2" required id="selectCliente" onchange="actualizarDireccion()" name="cliId_fk">
                            <option value="" selected hidden>Seleccione...</option>
                            <%
                                ClienteDAO cliDAO = new ClienteDAO();
                                for (ClienteVO cliVO : cliDAO.listarActivos()) {
                            %>
                            <option value="<%=cliVO.getCliId()%>" data-direccion="<%=cliVO.getCliDireccion()%>"><%=cliVO.getCliNombre()%> <%=cliVO.getCliApellido()%> <%=cliVO.getCliTipoDocumento()%> <%=cliVO.getCliDocumento()%></option> 
                            <% } %>
                        </select>
                    </div>
                    <div>
                        <label class="modal_paragraph">Dirección de envio:</label>
                        <input class="modal_input" type="text" placeholder="Dirección" name="ordDireccion"  id="direccionInput">
                    </div>
                    <div>
                        <label class="modal_paragraph">Precio Domicilio:</label>
                        <input class="modal_input" type="number" placeholder="Precio Domicilio" name="ordPrecioDomicilio">
                    </div>
                    <div>
                        <label class="modal_paragraph ">Repostero:<span class="asterisco"> *</span></label>        
                        <select class="select2" name="ordIdRepostero_fk" required>
                            <option value="" selected hidden>Seleccione...</option>
                            <%
                                UsuarioDAO usuDAO = new UsuarioDAO();
                                for (UsuarioVO usuVO : usuDAO.listarReposteros()) {
                            %>
                            <option value="<%=usuVO.getUsuId()%>"><%=usuVO.getUsuNombre()%> <%=usuVO.getUsuApellido()%> <%=usuVO.getUsuTipoDocumento()%> <%=usuVO.getUsuDocumento()%></option> 
                            <% } %>
                        </select>
                    </div>
                    <div>
                        <label class="modal_paragraph">Fecha de Orden:<span class="asterisco"> *</span></label>
                        <input type="date" name="ordFechaPedido">
                    </div>
                    <div>
                        <label class="modal_paragraph">Fecha de Entrega:</label>
                        <input type="datetime-local" name="ordFechaEntrega">
                    </div>
                    <div>
                        <label class="modal_paragraph">Abono:</label>
                        <input class="modal_input" type="number" placeholder="Abono" name="ordAbono" id="abono">
                    </div>               
                </div>
                <h3 class="modal_title">Productos</h3>
                <div class="inputs inputs_orden">
                    <div>
                        <label class="modal_paragraph ">Producto:<span class="asterisco"> *</span></label>        
                        <select class="select2"  id="proId_fk" name="producto">
                            <option value="" selected hidden>Seleccione...</option>
                            <%
                                ProductoDAO proDAO = new ProductoDAO();
                                for (ProductoVO proVO : proDAO.listarActivos()) {
                            %>
                             <option value="<%=proVO.getProId()%>"><%=proVO.getCatDescripcion()%> - <%=proVO.getProNombre()%></option> 
                            <% } %>
                        </select>
                    </div>
                    <div>
                        <%String[] opcionessabor = {"Chocolate", "Vainilla Limon", "Vainilla Naranja", "Red Velvet", "Tradicional Novia",
                                "Vainilla/Oreo", "Vainilla - Amapola", "Vainilla/Limon - Amapola", "Vainilla/Naranja - Amapola", "Marmolado",
                                "Arcoiris", "Funfetti", "Oreo", "Vainilla/Agraz", "Chips de chocolate", "Agraz Amapola", "Vainilla", "Otro"};
                                Arrays.sort(opcionessabor);%>
                        <label class="modal_paragraph ">Sabor:</label>        
                        <select class="select2"  name="sabor">
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
                        <select class="select2"   name="relleno">
                            <option value=""  selected hidden>Seleccione...</option>
                            <% for (String opcionrelleno : opcionesrelleno) {%>
                            <option value="<%= opcionrelleno%>"><%= opcionrelleno%></option>
                            <% } %>
                        </select>

                    </div>
                    <div>
                        <label class="modal_paragraph">Porciones:</label>
                        <input class="modal_input" type="number" placeholder="Porciones" name="porciones">
                    </div>
                    <div>
                        <label class="modal_paragraph">Cantidad:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="number" placeholder="Cantidad" name="cantidad">
                    </div>
                    <div>
                        <label class="modal_paragraph">Precio:<span class="asterisco"> *</span></label>
                        <input class="modal_input" type="number" placeholder="Precio" name="precio">
                    </div>
                </div>
                <div class="swal2-actions">
                    <button type="button" id="botonAgregar" onclick="agregarProducto()" class="swal2-styled swal2-confirm swal2-confirm2" >Añadir</button>
                </div>
                <div class="table-data table-data-orden">
                    <div class="order orden">
                        <div class="head">
                            <h3>Productos</h3>
                            <h4>Total: $<span id="total"></span></h4>
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
                            <tbody id="tablaProductosBody">                              
                            </tbody>
                        </table>
                    </div>
                </div>
                <div>
                    <label class="modal_paragraph">Detalles de la orden:</label>
                    <textarea name="ordDetalles" ></textarea>
                </div>
                <div class="swal2-actions">
                    <a href="#" class="modal_close_registrar_orden swal2-styled swal2-cancel">Cerrar</a>
                    <button class="swal2-styled swal2-confirm" type="submit">Registrar</button>
                </div>
                        <input type="hidden" id="productosArray" name="productosArray">
                <input type="hidden" name="opcion" value="4">        
            </form>
        </div>
    </section>
                        
                        
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
                        <%
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
                        <%
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


        <table>
            <tr>
                <th>
                    <h2><b>Consultar Orden</b></h2>
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


        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Ordenes de Clientes</h3>
                    <form method="post" action="GeneradorReporte.jsp" target="_blank">
  <button class="registrar_cliente btn-download" type="submit">
    <i class="bx bxs-cloud-download"></i> Generar PDF
  </button>
  <input type="hidden" name="reportName" value="listaOrden">
</form>
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
                                <%
                                    OrdenVO ordVO = new OrdenVO();
                                    OrdenDAO ordDAO = new OrdenDAO();

                                    ArrayList<OrdenVO> listaOrdenes = ordDAO.listar();
                                    for (int i = 0; i < listaOrdenes.size(); i++) {
                                        ordVO = listaOrdenes.get(i);
                                %>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="registro">
                            <td ><%=ordVO.getOrdId()%></td>
                            <td ><%=ordVO.getOrdFechaPedido()%></td>
                            <td ><%=ordVO.getOrdFechaEntrega()%></td>
                            <td><%=ordVO.getRepostero()%></td>
                            <td class="dato" ><%=ordVO.getCliente()%></td>
                            <td><%=ordVO.getDocumento()%></td>
                            <td>$<%=ordVO.getOrdPrecioDomicilio()%></td>
                            <td>$<%=ordVO.getOrdTotal()%></td>
                            <td>$<%=ordVO.getOrdAbono()%></td>
                            <td>$<%=ordVO.getOrdSaldo()%></td>
                            <td>
                                <% String estado = "" + ordVO.getOrdEstado();%>
                                <span<% if (estado.equals("Realizada")) {%> class='status realizado' <%} else if (estado.equals("Pagada")) {%> class='status pagado' <%} else if (estado.equals("En camino")) {%> class='status enCamino'<%} else if (estado.equals("Entregada")) {%> class='status entregado'<%} else if (estado.equals("Cancelada")) {%> class='status cancelado'<%}%>>
                                    <%=ordVO.getOrdEstado()%>

                                </span>
                            </td>

                            <td>
                               
                                <button onclick="detalles(<%=ordVO.getOrdId()%>)" class="actualizar_orden btn-table" type="button" name="ordId" data-id-orden="<%=ordVO.getOrdId()%>" data-cliente="<%=ordVO.getCliId_fk()%>" data-direccion="<%=ordVO.getOrdDireccion()%>"
                                        data-domicilio="<%=ordVO.getOrdPrecioDomicilio()%>" data-repostero="<%=ordVO.getOrdIdRepostero_fk()%>" data-fecha-orden="<%=ordVO.getOrdFechaPedido()%>"
                                        data-fecha-entrega="<%=ordVO.getOrdFechaEntrega()%>" data-abono="<%=ordVO.getOrdAbono()%>" data-estado="<%=ordVO.getOrdEstado()%>" data-detalles="<%=ordVO.getOrdDetalles()%>"><i class='bx bxs-edit'></i></button>
                               

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
              
            
                      // ARRAY ORDEN TABLA
var productosArray = [];

function actualizarTablaProductos() {
  var tablaBody = document.getElementById("tablaProductosBody");
  tablaBody.innerHTML = "";

  // Recorrer el array de productos y agregar filas a la tabla
  for (var i = 0; i < productosArray.length; i++) {
    var producto = productosArray[i];

    var fila = document.createElement("tr");

    var columnaProducto = document.createElement("td");
    columnaProducto.textContent = producto.proNombre;
    fila.appendChild(columnaProducto);

    var columnaSabor = document.createElement("td");
    columnaSabor.textContent = producto.sabor;
    fila.appendChild(columnaSabor);

    var columnaRelleno = document.createElement("td");
    columnaRelleno.textContent = producto.relleno;
    fila.appendChild(columnaRelleno);

    var columnaPorciones = document.createElement("td");
    columnaPorciones.textContent = producto.porciones;
    fila.appendChild(columnaPorciones);

    var columnaCantidad = document.createElement("td");
    columnaCantidad.textContent = producto.cantidad;
    fila.appendChild(columnaCantidad);

    var columnaSubtotal = document.createElement("td");
    var columnaSubtotalSpan = document.createElement("span");
    columnaSubtotal.classList.add("subtotal");
    columnaSubtotal.textContent = producto.cantidad * producto.precio; // Multiplicar precio y cantidad
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
      productosArray.splice(index, 1);
      actualizarTablaProductos();
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
  document.getElementById("productosArray").value = JSON.stringify(productosArray);
}

// Función para eliminar un producto del array
function eliminarProducto(index) {
  productosArray.splice(index, 1);
  actualizarTablaProductos();
}

// Event listener para el botón de "Añadir"
function agregarProducto() {
  // Obtener los valores de los campos de entrada
  var proId = document.getElementsByName("producto")[0].value;
  var proNombre = document
    .querySelector('select[name="producto"] option:checked')
    .textContent.trim()
    .split(" - ")[1];
  var detoSabor = document.getElementsByName("sabor")[0].value;
  var detoRelleno = document.getElementsByName("relleno")[0].value;
  var detoPorciones = document.getElementsByName("porciones")[0].value;
  var detoCantidad = document.getElementsByName("cantidad")[0].value;
  var detoPrecio = document.getElementsByName("precio")[0].value;

  // Validar que los campos no estén vacíos
  if (proId === "" || detoCantidad === "" || detoPrecio === "") {
    alert("Por favor, complete todos los campos antes de agregar un nuevo producto.");
    return;
  }

  // Crear un objeto con los valores del producto
  var productoObjeto = {
    proId: proId,
    proNombre: proNombre,
    sabor: detoSabor,
    relleno: detoRelleno,
    porciones: detoPorciones,
    cantidad: detoCantidad,
    precio: detoPrecio,
  };

  // Agregar el nuevo producto al array
  productosArray.push(productoObjeto);

  // Actualizar la tabla de productos
  actualizarTablaProductos();

  // Limpiar los campos de entrada
  document.querySelector('select[name="producto"]').value = "";
  document.querySelector('select[name="producto"]').dispatchEvent(new Event("change"));
  document.querySelector('select[name="producto"]').selectedIndex = 0;
  document.querySelector('select[name="sabor"]').value = "";
  document.querySelector('select[name="sabor"]').dispatchEvent(new Event("change"));
  document.querySelector('select[name="relleno"]').value = "";
  document.querySelector('select[name="relleno"]').dispatchEvent(new Event("change"));
  document.querySelector('input[name="porciones"]').value = "";
  document.querySelector('input[name="cantidad"]').value = "";
  document.querySelector('input[name="precio"]').value = "";


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