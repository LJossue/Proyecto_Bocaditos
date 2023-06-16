/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author esteb
 */
public class MateriaVO 
{
    private String matId, matNombre, detmCantidad,detmUnidadDeMedida,matEstado ;

    public MateriaVO() {
    }

    public MateriaVO(String matId, String matNombre, String matEstado, String detmCantidad, String detmUnidadDeMedida) {
        this.matId = matId;
        this.matNombre = matNombre;
        this.matEstado = matEstado;
        this.detmCantidad = detmCantidad;
        this.detmUnidadDeMedida = detmUnidadDeMedida;
        
    }

    public String getMatId() {
        return matId;
    }

    public void setMatId(String matId) {
        this.matId = matId;
    }

    public String getMatNombre() {
        return matNombre;
    }

    public void setMatNombre(String matNombre) {
        this.matNombre = matNombre;
    }

    public String getDetmCantidad() {
        return detmCantidad;
    }

    public void setDetmCantidad(String detmCantidad) {
        this.detmCantidad = detmCantidad;
    }

    public String getDetmUnidadDeMedida() {
        return detmUnidadDeMedida;
    }

    public void setDetmUnidadDeMedida(String detmUnidadDeMedida) {
        this.detmUnidadDeMedida = detmUnidadDeMedida;
    }

    public String getMatEstado() {
        return matEstado;
    }

    public void setMatEstado(String matEstado) {
        this.matEstado = matEstado;
    }


}