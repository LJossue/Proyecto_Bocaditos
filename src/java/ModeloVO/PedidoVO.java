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
public class PedidoVO {
    String pedId, pedFechaPedido, pedFechaEntrega, PedEstado, prvId_fk, pedTotal, prvNombre,detpId, pedId_fk, matId_fk, detpPrecioUnidad, detpCantidad, detpSubTotal, matNombre, prueba;
    

    public PedidoVO() {
    }

    public PedidoVO(String pedId, String pedFechaPedido, String pedFechaEntrega, String PedEstado, String prvId_fk, String pedTotal, String detpId, String pedId_fk, String matId_fk, String detpPrecioUnidad, String detpCantidad, String detpSubTotal) {
        this.pedId = pedId;
        this.pedFechaPedido = pedFechaPedido;
        this.pedFechaEntrega = pedFechaEntrega;
        this.PedEstado = PedEstado;
        this.prvId_fk = prvId_fk;
        this.pedTotal = pedTotal;
        this.detpId = detpId;
        this.pedId_fk = pedId_fk;
        this.matId_fk = matId_fk;
        this.detpPrecioUnidad = detpPrecioUnidad;
        this.detpCantidad = detpCantidad;
        this.detpSubTotal = detpSubTotal;
    }
    
    

    public PedidoVO(String pedId, String pedFechaPedido, String pedFechaEntrega, String PedEstado, String prvId_fk, String pedTotal, String prvNombre, String detpId, String pedId_fk, String matId_fk, String detpPrecioUnidad, String detpCantidad, String detpSubTotal, String matNombre) {
        this.pedId = pedId;
        this.pedFechaPedido = pedFechaPedido;
        this.pedFechaEntrega = pedFechaEntrega;
        this.PedEstado = PedEstado;
        this.prvId_fk = prvId_fk;
        this.pedTotal = pedTotal;
        this.prvNombre = prvNombre;
        this.detpId = detpId;
        this.pedId_fk = pedId_fk;
        this.matId_fk = matId_fk;
        this.detpPrecioUnidad = detpPrecioUnidad;
        this.detpCantidad = detpCantidad;
        this.detpSubTotal = detpSubTotal;
        this.matNombre = matNombre;
    }
    
    

    public PedidoVO(String pedId, String pedFechaPedido, String pedFechaEntrega, String PedEstado, String prvId_fk,String pedTotal) {
        this.pedId = pedId;
        this.pedFechaPedido = pedFechaPedido;
        this.pedFechaEntrega = pedFechaEntrega;
        this.PedEstado = PedEstado;     
        this.prvId_fk = prvId_fk;
        this.pedTotal = pedTotal;
    }

    public PedidoVO(String pedId, String pedFechaPedido, String pedFechaEntrega, String PedEstado, String prvId_fk, String pedTotal, String prvNombre) {
        this.pedId = pedId;
        this.pedFechaPedido = pedFechaPedido;
        this.pedFechaEntrega = pedFechaEntrega;
        this.PedEstado = PedEstado;
        this.prvId_fk = prvId_fk;
        this.pedTotal = pedTotal;
        this.prvNombre = prvNombre;
                
    }
    
    public PedidoVO(String detpId, String pedId_fk, String matNombre, String detpCantidad, String detpSubTotal) {
        this.detpId = detpId;
        this.pedId_fk = pedId_fk;
        this.matNombre = matNombre;
        this.detpCantidad = detpCantidad;
        this.detpSubTotal = detpSubTotal;
                
    }
    
    

    public String getPedId() {
        return pedId;
    }

    public void setPedId(String pedId) {
        this.pedId = pedId;
    }

    public String getPedFechaPedido() {
        return pedFechaPedido;
    }

    public void setPedFechaPedido(String pedFechaPedido) {
        this.pedFechaPedido = pedFechaPedido;
    }

    public String getPedFechaEntrega() {
        return pedFechaEntrega;
    }

    public void setPedFechaEntrega(String pedFechaEntrega) {
        this.pedFechaEntrega = pedFechaEntrega;
    }


    public String getPrvId_fk() {
        return prvId_fk;
    }

    public void setPrvId_fk(String prvId_fk) {
        this.prvId_fk = prvId_fk;
    }

    public String getPedTotal() {
        return pedTotal;
    }

    public void setPedTotal(String pedTotal) {
        this.pedTotal = pedTotal;
    }

    public String getPrvNombre() {
        return prvNombre;
    }

    public void setPrvNombre(String prvNombre) {
        this.prvNombre = prvNombre;
    }

        public String getPedEstado() {
        return PedEstado;
    }

    public void setPedEstado(String PedEstado) {
        this.PedEstado = PedEstado;
    }  

    public String getDetpId() {
        return detpId;
    }

    public void setDetpId(String detpId) {
        this.detpId = detpId;
    }

    public String getPedId_fk() {
        return pedId_fk;
    }

    public void setPedId_fk(String pedId_fk) {
        this.pedId_fk = pedId_fk;
    }

    public String getMatId_fk() {
        return matId_fk;
    }

    public void setMatId_fk(String matId_fk) {
        this.matId_fk = matId_fk;
    }

    public String getDetpPrecioUnidad() {
        return detpPrecioUnidad;
    }

    public void setDetpPrecioUnidad(String detpPrecioUnidad) {
        this.detpPrecioUnidad = detpPrecioUnidad;
    }

    public String getDetpCantidad() {
        return detpCantidad;
    }

    public void setDetpCantidad(String detpCantidad) {
        this.detpCantidad = detpCantidad;
    }

    public String getDetpSubTotal() {
        return detpSubTotal;
    }

    public void setDetpSubTotal(String detpSubTotal) {
        this.detpSubTotal = detpSubTotal;
    }

    public String getMatNombre() {
        return matNombre;
    }

    public void setMatNombre(String matNombre) {
        this.matNombre = matNombre;
    }
    
}
