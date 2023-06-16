/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author leand
 */
public class RolVO {
    private String rolId, rolDescripcion, rolEstado;

    public RolVO() {
    }

    public RolVO(String rolId, String rolDescripcion, String rolEstado) {
        this.rolId = rolId;
        this.rolDescripcion = rolDescripcion;
        this.rolEstado = rolEstado;
    }


    public String getRolId() {
        return rolId;
    }

    public void setRolId(String rolId) {
        this.rolId = rolId;
    }

    public String getRolDescripcion() {
        return rolDescripcion;
    }

    public void setRolDescripcion(String rolDescripcion) {
        this.rolDescripcion = rolDescripcion;
    }

    public String getRolEstado() {
        return rolEstado;
    }

    public void setRolEstado(String rolEstado) {
        this.rolEstado = rolEstado;
    }
    
}
