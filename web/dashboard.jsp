<%@include file="Sesiones2.jsp"%>
<%@page import="ModeloDAO.PedidoDAO"%>
<%@page import="ModeloVO.PedidoVO"%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.OrdenDAO"%>
<%@page import="ModeloVO.OrdenVO"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="ModeloVO.ProductoVO"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page import="ModeloVO.ClienteVO"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page import="ModeloVO.UsuarioVO"%>
<!DOCTYPE html>
<html lang="es">
<%UsuarioVO usuVO = (UsuarioVO) buscarSesion.getAttribute("datosUsuario");%>
<div class="head-title">
            <div class="left">
              <h1>Dashboard</h1>
              <ul class="breadcrumb">
                <li>
                  <a href="#">Dashboard</a>
                </li>
                <li><i class='bx bx-chevron-right'></i></li>
                <li>
                  <a class="active" href="#">Home</a>
                </li>
              </ul>
            </div>
           
          </div>

          <ul class="box-info">
                <%
                                    OrdenVO ordVO2 = new OrdenVO();
                                    OrdenDAO ordDAO2 = new OrdenDAO();
                                    int TotalVentas = ordDAO2.obtenerTotalVentasMes();
                                %>
           <%if(usuVO.getRolId_fk().equals("1") || usuVO.getRolId_fk().equals("2")){%>
                <li>
                     <%}else{%>
                <li class="invisible">
                    <%}%>
              <i class='bx bxs-dollar-circle'></i>
          <span class="text">
            <h3>$<%= TotalVentas %></h3>
            <p>Ventas Mes</p>
          </span>
        </li>
       <%if(usuVO.getRolId_fk().equals("1") || usuVO.getRolId_fk().equals("2")){%>
                <li>
                     <%}else{%>
                <li class="invisible">
                    <%}%>
             <%
                                    PedidoVO pedVO = new PedidoVO();
                                    PedidoDAO pedDAO = new PedidoDAO();
                                    int TotalGastos = pedDAO.obtenerTotalGastosMes();
                                %>
          <i class=' bx bxs-dollar-circle'></i>
              <span class="text">
                <h3>$<%= TotalGastos %></h3>
                <p>Gastos Mes</p>
              </span>
            </li>
            <%
                                  PedidoVO pedVO2 = new PedidoVO();
                                    PedidoDAO pedDAO2 = new PedidoDAO();
                                    int TotalGanancias = pedDAO2.obtenerGananciasMes();
                                %>
            <%if(usuVO.getRolId_fk().equals("1") || usuVO.getRolId_fk().equals("2")){%>
                <li>
                     <%}else{%>
                <li class="invisible">
                    <%}%>
              <i class='bx bxs-dollar-circle'></i>
              <span class="text">
                <h3>$<%= TotalGanancias %></h3>
                <p>Ganancias Mes</p>
              </span>
            </li>
<%
                                    OrdenVO ordVO3 = new OrdenVO();
                                    OrdenDAO ordDAO3 = new OrdenDAO();
                                    int TotalOrdenes = ordDAO3.obtenerCantidadOrdenesMes();
                                %>
            <li>
              <i class='bx bxs-calendar-check'></i>
              <span class="text">
                <h3><%= TotalOrdenes %></h3>
                <p>Ordenes Mes</p>
              </span>
            </li>
             <%
                                    ClienteVO cliVO = new ClienteVO();
                                    ClienteDAO cliDAO = new ClienteDAO();
                                    int cantidadClientesActivos = cliDAO.obtenerCantidadClientesActivos();
                                %>
            <li>
              <i class='bx bxs-group'></i>
              <span class="text">
                <h3><%= cantidadClientesActivos %></h3>
                <p>Clientes Activos</p>
              </span>
            </li>
            <%
                                    ProductoVO proVO = new ProductoVO();
                                    ProductoDAO proDAO = new ProductoDAO();
                                    int cantidadProductosActivos = proDAO.obtenerCantidadProductosActivos();
                                %>
            <li>
              <i class='bx bxs-cake'></i>
              <span class="text">
                <h3><%= cantidadProductosActivos %></h3>
                <p>Productos Totales</p>
              </span>
            </li>
          </ul>

          <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Ultimas Ordenes de Clientes</h3>
                    
         
                </div>
                <table>
                    <thead>
                        <tr>
                            <th style="padding-right: 10px">Id</th>
                            <th>Fecha Pedido</th>
                            <th>Fecha Entrega</th>                   
                            <th>Repostero</th>
                            <th>Cliente</th>
                            <th>Documento</th>
                            <th>Total</th>             
                            <th>Estado</th>
                                <%
                                    OrdenVO ordVO = new OrdenVO();
                                    OrdenDAO ordDAO = new OrdenDAO();

                                    ArrayList<OrdenVO> listaOrdenesDashboard = ordDAO.listarDashboard();
                                    for (int i = 0; i < listaOrdenesDashboard.size(); i++) {
                                        ordVO = listaOrdenesDashboard.get(i);
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
                            <td>$<%=ordVO.getOrdTotal()%></td>
                                                          <td>
  <% String estado = "" + ordVO.getOrdEstado();%>
    <span<% if (estado.equals("Realizada")) {%> class='status realizado' <%} else if(estado.equals("Pagada")) {%> class='status pagado' <%} else if(estado.equals("En camino")) {%> class='status enCamino'<%} else if(estado.equals("Entregada")) {%> class='status entregado'<%} else if(estado.equals("Cancelada")) {%> class='status cancelado'<%}%>>
                                    <%=ordVO.getOrdEstado()%>

                                </span>
                            </td>

                          

                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
           <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Mis Ordenes mas recientes</h3>
                    
         
                </div>
                <table>
                    <thead>
                        <tr>
                            <th style="padding-right: 10px">Id</th>
                            <th>Fecha Pedido</th>
                            <th>Fecha Entrega</th>                   
                            <th>Repostero</th>
                            <th>Cliente</th>
                            <th>Documento</th>
                            <th>Total</th>             
                            <th>Estado</th>
                               
                                
                            
                        </tr>
                    </thead>
                     <%
                                    OrdenVO ordVO5 = new OrdenVO();
                                    OrdenDAO ordDAO4 = new OrdenDAO();%>
                                    
                                  
                                    <% String Id2 = usuVO.getUsuId();
                                    
                                    ArrayList<OrdenVO> listaMisOrdenesDashboard = ordDAO4.listarMisOrdenesDashboard(Id2);
                                    for (int i = 0; i < listaMisOrdenesDashboard.size(); i++) {
                                        ordVO5 = listaMisOrdenesDashboard.get(i);%>
                    <tbody>
                        <tr class="registro">
                            <td ><%=ordVO5.getOrdId()%></td>
                            <td ><%=ordVO5.getOrdFechaPedido()%></td>
                            <td ><%=ordVO5.getOrdFechaEntrega()%></td>
                            <td><%=ordVO5.getRepostero()%></td>
                            <td class="dato" ><%=ordVO5.getCliente()%></td>
                            <td><%=ordVO5.getDocumento()%></td>
                            <td>$<%=ordVO5.getOrdTotal()%></td>
                                                          <td>
  <% String estado = "" + ordVO5.getOrdEstado();%>
    <span<% if (estado.equals("Realizada")) {%> class='status realizado' <%} else if(estado.equals("Pagada")) {%> class='status pagado' <%} else if(estado.equals("En camino")) {%> class='status enCamino'<%} else if(estado.equals("Entregada")) {%> class='status entregado'<%} else if(estado.equals("Cancelada")) {%> class='status cancelado'<%}%>>
                                    <%=ordVO5.getOrdEstado()%>

                                </span>
                            </td>

                          

                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
                  