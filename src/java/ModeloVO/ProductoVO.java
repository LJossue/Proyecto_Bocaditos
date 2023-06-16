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
public class ProductoVO {
    private String proId, proNombre, proEstado, catId_fk, catDescripcion;

    public ProductoVO() {
    }

    public ProductoVO(String proId, String proNombre, String proEstado, String catId_fk) {
        this.proId = proId;
        this.proNombre = proNombre;
        this.proEstado = proEstado;
        this.catId_fk = catId_fk;
        
    }

    public ProductoVO(String proId, String proNombre, String proEstado, String catId_fk, String catDescripcion) {
        this.proId = proId;
        this.proNombre = proNombre;
        this.proEstado = proEstado;
        this.catId_fk = catId_fk;
        this.catDescripcion = catDescripcion;
    }

  

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public String getProNombre() {
        return proNombre;
    }

    public void setProNombre(String proNombre) {
        this.proNombre = proNombre;
    }



    public String getProEstado() {
        return proEstado;
    }

    public void setProEstado(String proEstado) {
        this.proEstado = proEstado;
    }

    public String getCatId_fk() {
        return catId_fk;
    }

    public void setCatId_fk(String catId_fk) {
        this.catId_fk = catId_fk;
    }

    public String getCatDescripcion() {
        return catDescripcion;
    }

    public void setCatDescripcion(String catDescripcion) {
        this.catDescripcion = catDescripcion;
    }

   

   
}
