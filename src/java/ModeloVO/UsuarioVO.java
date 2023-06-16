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
public class UsuarioVO {
   private String usuId, usuCorreo, usuContrasena, usuApellido, usuNombre, usuTipoDocumento, usuDocumento, usuTelefono, usuDireccion, usuEstado, rolId_fk, rolDescripcion, cantidad_ordenes;

    public UsuarioVO() {
    }

    public UsuarioVO(String usuId, String usuCorreo, String usuContrasena, String usuApellido, String usuNombre, String usuTipoDocumento, String usuDocumento, String usuTelefono, String usuDireccion, String usuEstado, String rolId_fk) {
        this.usuId = usuId;
        this.usuCorreo = usuCorreo;
        this.usuContrasena = usuContrasena;
        this.usuApellido = usuApellido;
        this.usuNombre = usuNombre;
        this.usuTipoDocumento = usuTipoDocumento;
        this.usuDocumento = usuDocumento;
        this.usuTelefono = usuTelefono;
        this.usuDireccion = usuDireccion;
        this.usuEstado = usuEstado;
        this.rolId_fk = rolId_fk;
    }

    public UsuarioVO(String usuId, String usuCorreo, String usuContrasena, String usuApellido, String usuNombre, String usuTipoDocumento, String usuDocumento, String usuTelefono, String usuDireccion, String usuEstado, String rolId_fk, String rolDescripcion) {
        this.usuId = usuId;
        this.usuCorreo = usuCorreo;
        this.usuContrasena = usuContrasena;
        this.usuApellido = usuApellido;
        this.usuNombre = usuNombre;
        this.usuTipoDocumento = usuTipoDocumento;
        this.usuDocumento = usuDocumento;
        this.usuTelefono = usuTelefono;
        this.usuDireccion = usuDireccion;
        this.usuEstado = usuEstado;
        this.rolId_fk = rolId_fk;
        this.rolDescripcion = rolDescripcion;
    }

    public UsuarioVO(String usuId, String usuCorreo, String usuContrasena, String usuApellido, String usuNombre, String usuTipoDocumento, String usuDocumento, String usuTelefono, String usuDireccion, String usuEstado, String rolId_fk, String rolDescripcion, String cantidad_ordenes) {
        this.usuId = usuId;
        this.usuCorreo = usuCorreo;
        this.usuContrasena = usuContrasena;
        this.usuApellido = usuApellido;
        this.usuNombre = usuNombre;
        this.usuTipoDocumento = usuTipoDocumento;
        this.usuDocumento = usuDocumento;
        this.usuTelefono = usuTelefono;
        this.usuDireccion = usuDireccion;
        this.usuEstado = usuEstado;
        this.rolId_fk = rolId_fk;
        this.rolDescripcion = rolDescripcion;
        this.cantidad_ordenes = cantidad_ordenes;
    }

    public String getUsuId() {
        return usuId;
    }

    public void setUsuId(String usuId) {
        this.usuId = usuId;
    }

    public String getUsuCorreo() {
        return usuCorreo;
    }

    public void setUsuCorreo(String usuCorreo) {
        this.usuCorreo = usuCorreo;
    }

    public String getUsuContrasena() {
        return usuContrasena;
    }

    public void setUsuContrasena(String usuContrasena) {
        this.usuContrasena = usuContrasena;
    }

    public String getUsuApellido() {
        return usuApellido;
    }

    public void setUsuApellido(String usuApellido) {
        this.usuApellido = usuApellido;
    }

    public String getUsuNombre() {
        return usuNombre;
    }

    public void setUsuNombre(String usuNombre) {
        this.usuNombre = usuNombre;
    }

    public String getUsuTipoDocumento() {
        return usuTipoDocumento;
    }

    public void setUsuTipoDocumento(String usuTipoDocumento) {
        this.usuTipoDocumento = usuTipoDocumento;
    }

    public String getUsuDocumento() {
        return usuDocumento;
    }

    public void setUsuDocumento(String usuDocumento) {
        this.usuDocumento = usuDocumento;
    }

    public String getUsuTelefono() {
        return usuTelefono;
    }

    public void setUsuTelefono(String usuTelefono) {
        this.usuTelefono = usuTelefono;
    }

    public String getUsuDireccion() {
        return usuDireccion;
    }

    public void setUsuDireccion(String usuDireccion) {
        this.usuDireccion = usuDireccion;
    }

    public String getUsuEstado() {
        return usuEstado;
    }

    public void setUsuEstado(String usuEstado) {
        this.usuEstado = usuEstado;
    }

    public String getRolId_fk() {
        return rolId_fk;
    }

    public void setRolId_fk(String rolId_fk) {
        this.rolId_fk = rolId_fk;
    }

    public String getRolDescripcion() {
        return rolDescripcion;
    }

    public void setRolDescripcion(String rolDescripcion) {
        this.rolDescripcion = rolDescripcion;
    }

    public String getCantidad_ordenes() {
        return cantidad_ordenes;
    }

    public void setCantidad_ordenes(String cantidad_ordenes) {
        this.cantidad_ordenes = cantidad_ordenes;
    }

 

    
    
}
