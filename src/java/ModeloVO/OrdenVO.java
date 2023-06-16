/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author APRENDIZ
 */
public class OrdenVO {
    
    private String ordId, ordIdRepostero_fk, cliId_fk, ordFechaPedido, ordFechaEntrega, ordDireccion, ordDetalles, ordPrecioDomicilio, ordTotal, ordAbono, ordSaldo, ordEstado, repostero, cliente, documento,detoId, ordId_fk, prodId_fk,detoSabor,detoRelleno,detoPorciones, detoCantidad, detoPrecio,detoSubTotal, proNombre;

    public OrdenVO(String ordId, String ordIdRepostero_fk, String cliId_fk, String ordFechaPedido, String ordFechaEntrega, String ordDireccion, String ordDetalles, String ordPrecioDomicilio, String ordTotal, String ordAbono, String ordSaldo, String ordEstado, String detoId, String ordId_fk, String prodId_fk, String detoSabor, String detoRelleno, String detoPorciones, String detoCantidad, String detoPrecio, String detoSubTotal) {
        this.ordId = ordId;
        this.ordIdRepostero_fk = ordIdRepostero_fk;
        this.cliId_fk = cliId_fk;
        this.ordFechaPedido = ordFechaPedido;
        this.ordFechaEntrega = ordFechaEntrega;
        this.ordDireccion = ordDireccion;
        this.ordDetalles = ordDetalles;
        this.ordPrecioDomicilio = ordPrecioDomicilio;
        this.ordTotal = ordTotal;
        this.ordAbono = ordAbono;
        this.ordSaldo = ordSaldo;
        this.ordEstado = ordEstado;
        this.detoId = detoId;
        this.ordId_fk = ordId_fk;
        this.prodId_fk = prodId_fk;
        this.detoSabor = detoSabor;
        this.detoRelleno = detoRelleno;
        this.detoPorciones = detoPorciones;
        this.detoCantidad = detoCantidad;
        this.detoPrecio = detoPrecio;
        this.detoSubTotal = detoSubTotal;
    }
    
    public OrdenVO(String ordId, String ordIdRepostero_fk, String cliId_fk, String ordFechaPedido, String ordFechaEntrega, String ordDireccion, String ordDetalles, String ordPrecioDomicilio, String ordTotal, String ordAbono, String ordSaldo, String ordEstado) {
        this.ordId = ordId;
        this.ordIdRepostero_fk = ordIdRepostero_fk;
        this.cliId_fk = cliId_fk;
        this.ordFechaPedido = ordFechaPedido;
        this.ordFechaEntrega = ordFechaEntrega;
        this.ordDireccion = ordDireccion;
        this.ordDetalles = ordDetalles;
        this.ordPrecioDomicilio = ordPrecioDomicilio;
        this.ordTotal = ordTotal;
        this.ordAbono = ordAbono;
        this.ordSaldo = ordSaldo;
        this.ordEstado = ordEstado;
    }

    public OrdenVO(String ordId, String ordFechaPedido, String ordFechaEntrega,String ordIdRepostero_fk, String repostero, String cliId_fk, String cliente, String documento, String ordDireccion, String ordDetalles, String ordPrecioDomicilio, String ordTotal, String ordAbono, String ordSaldo, String ordEstado) {
        this.ordId = ordId;
        this.ordFechaPedido = ordFechaPedido;
        this.ordFechaEntrega = ordFechaEntrega;
        this.ordIdRepostero_fk = ordIdRepostero_fk;
        this.repostero = repostero;
        this.cliId_fk = cliId_fk;
        this.cliente = cliente;
        this.documento = documento;
        this.ordDireccion = ordDireccion;
        this.ordDetalles = ordDetalles;
        this.ordPrecioDomicilio = ordPrecioDomicilio;
        this.ordTotal = ordTotal;
        this.ordAbono = ordAbono;
        this.ordSaldo = ordSaldo;
        this.ordEstado = ordEstado;
        
    }
      public OrdenVO(String detoId, String ordId_fk, String prodId_fk, String detoSabor, String detoRelleno, String detoPorciones, String detoCantidad, String detoPrecio, String detoSubTotal) {
        this.detoId = detoId;
        this.ordId_fk = ordId_fk;
        this.prodId_fk = prodId_fk;
        this.detoSabor = detoSabor;
        this.detoRelleno = detoRelleno;
        this.detoPorciones = detoPorciones;
        this.detoCantidad = detoCantidad;
        this.detoPrecio = detoPrecio;
        this.detoSubTotal = detoSubTotal;
    }
      public OrdenVO(String detoId, String ordId_fk, String prodId_fk, String proNombre, String detoSabor, String detoRelleno, String detoPorciones, String detoCantidad, String detoPrecio, String detoSubTotal) {
        this.detoId = detoId;
        this.ordId_fk = ordId_fk;
        this.prodId_fk = prodId_fk;
        this.proNombre = proNombre;
        this.detoSabor = detoSabor;
        this.detoRelleno = detoRelleno;
        this.detoPorciones = detoPorciones;
        this.detoCantidad = detoCantidad;
        this.detoPrecio = detoPrecio;
        this.detoSubTotal = detoSubTotal;
    }

    public OrdenVO() {
    }

    public String getOrdId() {
        return ordId;
    }

    public void setOrdId(String ordId) {
        this.ordId = ordId;
    }

    public String getOrdIdRepostero_fk() {
        return ordIdRepostero_fk;
    }

    public void setOrdIdRepostero_fk(String ordIdRepostero_fk) {
        this.ordIdRepostero_fk = ordIdRepostero_fk;
    }

    public String getCliId_fk() {
        return cliId_fk;
    }

    public void setCliId_fk(String cliId_fk) {
        this.cliId_fk = cliId_fk;
    }

    public String getOrdFechaPedido() {
        return ordFechaPedido;
    }

    public void setOrdFechaPedido(String ordFechaPedido) {
        this.ordFechaPedido = ordFechaPedido;
    }

    public String getOrdFechaEntrega() {
        return ordFechaEntrega;
    }

    public void setOrdFechaEntrega(String ordFechaEntrega) {
        this.ordFechaEntrega = ordFechaEntrega;
    }

    public String getOrdDireccion() {
        return ordDireccion;
    }

    public void setOrdDireccion(String ordDireccion) {
        this.ordDireccion = ordDireccion;
    }

    public String getOrdDetalles() {
        return ordDetalles;
    }

    public void setOrdDetalles(String ordDetalles) {
        this.ordDetalles = ordDetalles;
    }

    public String getOrdPrecioDomicilio() {
        return ordPrecioDomicilio;
    }

    public void setOrdPrecioDomicilio(String ordPrecioDomicilio) {
        this.ordPrecioDomicilio = ordPrecioDomicilio;
    }

    public String getOrdTotal() {
        return ordTotal;
    }

    public void setOrdTotal(String ordTotal) {
        this.ordTotal = ordTotal;
    }

    public String getOrdAbono() {
        return ordAbono;
    }

    public void setOrdAbono(String ordAbono) {
        this.ordAbono = ordAbono;
    }

    public String getOrdSaldo() {
        return ordSaldo;
    }

    public void setOrdSaldo(String ordSaldo) {
        this.ordSaldo = ordSaldo;
    }

    public String getOrdEstado() {
        return ordEstado;
    }

    public void setOrdEstado(String ordEstado) {
        this.ordEstado = ordEstado;
    }

    public String getRepostero() {
        return repostero;
    }

    public void setRepostero(String repostero) {
        this.repostero = repostero;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getDetoId() {
        return detoId;
    }

    public void setDetoId(String detoId) {
        this.detoId = detoId;
    }

    public String getOrdId_fk() {
        return ordId_fk;
    }

    public void setOrdId_fk(String ordId_fk) {
        this.ordId_fk = ordId_fk;
    }

    public String getProdId_fk() {
        return prodId_fk;
    }

    public void setProdId_fk(String prodId_fk) {
        this.prodId_fk = prodId_fk;
    }

    public String getProNombre() {
        return proNombre;
    }

    public void setProNombre(String proNombre) {
        this.proNombre = proNombre;
    }

    public String getDetoSabor() {
        return detoSabor;
    }

    public void setDetoSabor(String detoSabor) {
        this.detoSabor = detoSabor;
    }

    public String getDetoRelleno() {
        return detoRelleno;
    }

    public void setDetoRelleno(String detoRelleno) {
        this.detoRelleno = detoRelleno;
    }

    public String getDetoPorciones() {
        return detoPorciones;
    }

    public void setDetoPorciones(String detoPorciones) {
        this.detoPorciones = detoPorciones;
    }

    public String getDetoCantidad() {
        return detoCantidad;
    }

    public void setDetoCantidad(String detoCantidad) {
        this.detoCantidad = detoCantidad;
    }

    public String getDetoPrecio() {
        return detoPrecio;
    }

    public void setDetoPrecio(String detoPrecio) {
        this.detoPrecio = detoPrecio;
    }

    public String getDetoSubTotal() {
        return detoSubTotal;
    }

    public void setDetoSubTotal(String detoSubTotal) {
        this.detoSubTotal = detoSubTotal;
    }
    



}