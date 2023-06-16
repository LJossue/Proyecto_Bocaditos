/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.CategoriaVO;
import ModeloVO.RolVO;
import Util.ConexionBd;
import Util.Crud;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leand
 */
public class CategoriaDAO extends ConexionBd implements Crud {
    //1.- Declarar variables y/u objetos 
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String catId = "", catDescripcion = "", catEstado = "";

    public CategoriaDAO() {
    }
    
   //2 Metodo principal le paso los datos del VO
    public CategoriaDAO(CategoriaVO catVO) {
        super();
        try {
            //3 conectarse a la BD
            conexion = this.obtenerConexion();
            //4 traer los datos del VO al DAO 
            catId = catVO.getCatId();
            catDescripcion = catVO.getCatDescripcion();
            catEstado = catVO.getCatEstado();
            } catch (Exception e) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        
}
 @Override
    public boolean agregarRegistro() {
        catEstado ="Activo";
        try {
            sql = "insert into categoria (catDescripcion, catEstado) values (?, ?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, catDescripcion);
            puente.setString(2, catEstado);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;
    }
    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update categoria set catDescripcion = ? where catId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, catDescripcion);
            puente.setString(2, catId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }
     @Override
    public boolean eliminarRegistro() { //hacer
        try {
            sql = "update categoria set  catEstado = ? where catId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, catEstado);
            puente.setString(2, catId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }
    
    
    
    
    
    
     public ArrayList<CategoriaVO> listar(){
        ArrayList<CategoriaVO> listaCategorias = new ArrayList<>(); // Crea una lista para almacenar los roles encontrados
        try { 
            conexion = this.obtenerConexion();
        sql="SELECT * FROM categoria ORDER BY catEstado asc, catId ASC;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        while(mensajero.next()){
            // Obtiene los valores de las columnas para crear un objeto catVO
           CategoriaVO catVO = new CategoriaVO(mensajero.getString("catId"), mensajero.getString("catDescripcion"), mensajero.getString("catEstado"));
            listaCategorias.add(catVO); // Agrega el rol a la lista
        }
        } catch (Exception e) {
        Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        finally{
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            
        }
    
    return listaCategorias;
    
}
public ArrayList<CategoriaVO> listarActivos(){
        ArrayList<CategoriaVO> listaCategoriasActivas = new ArrayList<>(); // Crea una lista para almacenar los roles encontrados
        try { 
            conexion = this.obtenerConexion();
        sql="SELECT * FROM categoria where catEstado = 'Activo';";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        while(mensajero.next()){
            // Obtiene los valores de las columnas para crear un objeto catVO
           CategoriaVO catVO = new CategoriaVO(mensajero.getString("catId"), mensajero.getString("catDescripcion"), mensajero.getString("catEstado"));
            listaCategoriasActivas.add(catVO); // Agrega el rol a la lista
        }
        } catch (Exception e) {
        Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        finally{
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(CategoriaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            
        }
    
    return listaCategoriasActivas;
    
}
}