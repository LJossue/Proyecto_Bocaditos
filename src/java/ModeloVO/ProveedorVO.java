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
public class ProveedorVO {
    String prvId, prvNit, prvNombre, PrvDireccion, prvTelefono, prvCorreo, prvEstado;

    public ProveedorVO() {
    }
    

    public ProveedorVO(String prvId, String prvNit, String prvNombre, String PrvDireccion, String prvTelefono, String prvCorreo, String prvEstado) {
        this.prvId = prvId;
        this.prvNit = prvNit;
        this.prvNombre = prvNombre;
        this.PrvDireccion = PrvDireccion;
        this.prvTelefono = prvTelefono;
        this.prvCorreo = prvCorreo;
        this.prvEstado = prvEstado;
    }  

    public String getPrvId() {
        return prvId;
    }

    public void setPrvId(String prvId) {
        this.prvId = prvId;
    }

    public String getPrvNit() {
        return prvNit;
    }

    public void setPrvNit(String prvNit) {
        this.prvNit = prvNit;
    }

    public String getPrvNombre() {
        return prvNombre;
    }

    public void setPrvNombre(String prvNombre) {
        this.prvNombre = prvNombre;
    }

    public String getPrvDireccion() {
        return PrvDireccion;
    }

    public void setPrvDireccion(String PrvDireccion) {
        this.PrvDireccion = PrvDireccion;
    }

    public String getPrvTelefono() {
        return prvTelefono;
    }

    public void setPrvTelefono(String prvTelefono) {
        this.prvTelefono = prvTelefono;
    }

    public String getPrvCorreo() {
        return prvCorreo;
    }

    public void setPrvCorreo(String prvCorreo) {
        this.prvCorreo = prvCorreo;
    }

    public String getPrvEstado() {
        return prvEstado;
    }

    public void setPrvEstado(String prvEstado) {
        this.prvEstado = prvEstado;
    }

    
}

