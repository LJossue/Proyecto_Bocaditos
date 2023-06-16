/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.CategoriaVO;
import ModeloVO.ProductoVO;
import ModeloVO.ProductoVO;
import Util.ConexionBd;
import Util.Crud;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leand
 */
public class ProductoDAO extends ConexionBd implements Crud{
  private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String proId = "", proNombre = "", proEstado="", catId_fk="";

    public ProductoDAO() {
    }
   
    
//2 Metodo principal le paso los datos del VO
    public ProductoDAO(ProductoVO proVO) {
        super();
        try {
            //3 conectarse a la BD
            conexion = this.obtenerConexion();
            //4 traer los datos del VO al DAO 
            proId = proVO.getProId();
            proNombre = proVO.getProNombre();
           
            proEstado = proVO.getProEstado();
         catId_fk = proVO.getCatId_fk();
            } catch (Exception e) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        
}
 @Override
    public boolean agregarRegistro() {
        proEstado ="Activo";

                
        try {
            sql = "insert into producto (proNombre, proEstado, catId_fk) values (?, ?, ?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, proNombre);
            puente.setString(2, proEstado);
            puente.setString(3, catId_fk);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;
    }
    @Override
    public boolean actualizarRegistro() {
        
        try {
            sql = "update producto set proNombre = ?, catId_fk = ? where proId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, proNombre);
            puente.setString(2, catId_fk);
            puente.setString(3, proId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }
     @Override
    public boolean eliminarRegistro() { //hacer
        try {
            sql = "update producto set  proEstado = ? where proId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, proEstado);
            puente.setString(2, proId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }
    
    
     public ArrayList<ProductoVO> listar(){
        ArrayList<ProductoVO> listaProductos = new ArrayList<>(); // Crea una lista para almacenar los roles encontrados
        try { 
            conexion = this.obtenerConexion();
        sql="select * from consulta_producto order by case proEstado WHEN 'Activo' THEN 0 ELSE 1 END, proId asc;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        while(mensajero.next()){
            // Obtiene los valores de las columnas para crear un objeto proVO
           ProductoVO proVO = new ProductoVO(mensajero.getString("proId"), mensajero.getString("proNombre"),  mensajero.getString("proEstado"), mensajero.getString("catId_fk"), mensajero.getString("catDescripcion"));
            listaProductos.add(proVO); // Agrega el rol a la lista
        }
        } catch (Exception e) {
        Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        finally{
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            
        }
    
    return listaProductos;
    
}
        public ArrayList<ProductoVO> listarActivos(){
        ArrayList<ProductoVO> listaProductosActivos = new ArrayList<>(); // Crea una lista para almacenar los roles encontrados
        try { 
            conexion = this.obtenerConexion();
        sql="select * from consulta_producto where proEstado='Activo' order by catId_fk desc;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        while(mensajero.next()){
            // Obtiene los valores de las columnas para crear un objeto proVO
           ProductoVO proVO = new ProductoVO(mensajero.getString("proId"), mensajero.getString("proNombre"),  mensajero.getString("proEstado"), mensajero.getString("catId_fk"), mensajero.getString("catDescripcion"));
            listaProductosActivos.add(proVO); // Agrega el rol a la lista
        }
        } catch (Exception e) {
        Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        finally{
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            
        }
    
    return listaProductosActivos;
    
}
public int obtenerCantidadProductosActivos() {
    int cantidadProductosActivos = 0;
    try {
        conexion = this.obtenerConexion();
        sql = "SELECT * from productos_activos;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        if (mensajero.next()) {
            cantidadProductosActivos = mensajero.getInt("cantidad_productos_activos");
        }
    } catch (Exception e) {
        Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        try {
            this.cerrarConexion();
        } catch (Exception e) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    return cantidadProductosActivos;
}
public ArrayList<ProductoVO> listarCategoria(String idCategoria) {

        ArrayList<ProductoVO> listarCategoria = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "select * from consulta_producto where proEstado = 'Activo' and catId_fk = ?;";
//puedes poner la vista si quieres, solo que estaba haciendo pruebas
            puente = conexion.prepareStatement(sql);
            puente.setString(1, idCategoria);
            mensajero = puente.executeQuery();

            while (mensajero.next()) {

                ProductoVO proVO = new ProductoVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4),
                        mensajero.getString(5));

                listarCategoria.add(proVO);

            }
        } catch (Exception e) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listarCategoria;
    }
}
