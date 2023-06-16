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
public class CategoriaVO {
    private String catId, catDescripcion, catEstado;

    public CategoriaVO() {
    }

    public CategoriaVO(String catId, String catDescripcion, String catEstado) {
        this.catId = catId;
        this.catDescripcion = catDescripcion;
        this.catEstado = catEstado;
    }

    public String getCatId() {
        return catId;
    }

    public void setCatId(String catId) {
        this.catId = catId;
    }

    public String getCatDescripcion() {
        return catDescripcion;
    }

    public void setCatDescripcion(String catNombre) {
        this.catDescripcion = catNombre;
    }

    public String getCatEstado() {
        return catEstado;
    }

    public void setCatEstado(String catEstado) {
        this.catEstado = catEstado;
    }
}
