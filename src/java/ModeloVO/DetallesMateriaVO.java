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
public class DetallesMateriaVO {
    
    private String detmId, proId_fk,matId_fk,detmCantidad;

    public DetallesMateriaVO() {
        
    }

    public DetallesMateriaVO(String detmId, String proId_fk, String matId_fk, String detmCantidad) {
        this.detmId = detmId;
        this.proId_fk = proId_fk;
        this.matId_fk = matId_fk;
        this.detmCantidad = detmCantidad;
    }
    
    

    public String getDetmId() {
        return detmId;
    }

    public void setDetmId(String detmId) {
        this.detmId = detmId;
    }

    public String getProId_fk() {
        return proId_fk;
    }

    public void setProId_fk(String proId_fk) {
        this.proId_fk = proId_fk;
    }

    public String getMatId_fk() {
        return matId_fk;
    }

    public void setMatId_fk(String matId_fk) {
        this.matId_fk = matId_fk;
    }

    public String getDetmCantidad() {
        return detmCantidad;
    }

    public void setDetmCantidad(String detmCantidad) {
        this.detmCantidad = detmCantidad;
    }
    
    
    
}
