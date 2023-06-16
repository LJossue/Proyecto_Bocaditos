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
public class ClienteVO {
    
    private String cliId,cliDocumento,cliTipoDocumento,cliNombre,cliApellido,cliCorreo,cliDireccion,cliTelefono,cliEstado;

    public ClienteVO() {
    }

    public ClienteVO(String cliId, String cliDocumento, String cliTipoDocumento, String cliNombre, String cliApellido, String cliCorreo, String cliDireccion, String cliTelefono, String cliEstado) {
        this.cliId = cliId;
        this.cliDocumento = cliDocumento;
        this.cliTipoDocumento = cliTipoDocumento;
        this.cliNombre = cliNombre;
        this.cliApellido = cliApellido;
        this.cliCorreo = cliCorreo;
        this.cliDireccion = cliDireccion;
        this.cliTelefono = cliTelefono;
        this.cliEstado = cliEstado;
    }

    public String getCliId() {
        return cliId;
    }

    public void setCliId(String cliId) {
        this.cliId = cliId;
    }

    public String getCliDocumento() {
        return cliDocumento;
    }

    public void setCliDocumento(String cliDocumento) {
        this.cliDocumento = cliDocumento;
    }

    public String getCliTipoDocumento() {
        return cliTipoDocumento;
    }

    public void setCliTipoDocumento(String cliTipoDocumento) {
        this.cliTipoDocumento = cliTipoDocumento;
    }

    public String getCliNombre() {
        return cliNombre;
    }

    public void setCliNombre(String cliNombre) {
        this.cliNombre = cliNombre;
    }

    public String getCliApellido() {
        return cliApellido;
    }

    public void setCliApellido(String cliApellido) {
        this.cliApellido = cliApellido;
    }

    public String getCliCorreo() {
        return cliCorreo;
    }

    public void setCliCorreo(String cliCorreo) {
        this.cliCorreo = cliCorreo;
    }

    public String getCliDireccion() {
        return cliDireccion;
    }

    public void setCliDireccion(String cliDireccion) {
        this.cliDireccion = cliDireccion;
    }

    public String getCliTelefono() {
        return cliTelefono;
    }

    public void setCliTelefono(String cliTelefono) {
        this.cliTelefono = cliTelefono;
    }

    public String getCliEstado() {
        return cliEstado;
    }

    public void setCliEstado(String cliEstado) {
        this.cliEstado = cliEstado;
    }
    
    
}
