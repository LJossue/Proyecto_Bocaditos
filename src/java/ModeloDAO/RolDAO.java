/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.RolVO;
import ModeloVO.UsuarioVO;
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
public class RolDAO extends ConexionBd implements Crud {
     //1.- Declarar variables y/u objetos 
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String rolId = "", rolDescripcion = "", rolEstado="";

    public RolDAO() {
    }
    
    
//2 Metodo principal le paso los datos del VO
    public RolDAO(RolVO rolVO) {
        super();
        try {
            //3 conectarse a la BD
            conexion = this.obtenerConexion();
            //4 traer los datos del VO al DAO 
            rolId = rolVO.getRolId();
            rolDescripcion = rolVO.getRolDescripcion();
            rolEstado = rolVO.getRolEstado();
            } catch (Exception e) {
            Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        
}
 @Override
    public boolean agregarRegistro() {
        rolEstado ="Activo";
        try {
            sql = "insert into rol (rolDescripcion, rolEstado) values (?, ?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, rolDescripcion);
            puente.setString(2, rolEstado);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
               // this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;
    }
    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update rol set rolDescripcion = ? where rolId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, rolDescripcion);
            puente.setString(2, rolId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
               // this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }
     @Override
    public boolean eliminarRegistro() { //hacer
        try {
            sql = "update rol set  rolEstado = ? where rolId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, rolEstado);
            puente.setString(2, rolId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }

    
    public ArrayList<RolVO> listar(){
        ArrayList<RolVO> listaRoles = new ArrayList<>(); // Crea una lista para almacenar los roles encontrados
        try { 
            conexion = this.obtenerConexion();
        sql="SELECT * FROM rol ORDER BY rolEstado asc, rolId ASC;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        while(mensajero.next()){
            // Obtiene los valores de las columnas para crear un objeto RolVO
            RolVO rolVO = new RolVO(mensajero.getString("rolId"), mensajero.getString("rolDescripcion"), mensajero.getString("rolEstado"));
            listaRoles.add(rolVO); // Agrega el rol a la lista
        }
        } catch (Exception e) {
        Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        finally{
            try {
                //this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            
        }
    
    return listaRoles;
    
}
  
    public ArrayList<RolVO> listarLogin(String idUsuario)
    {
        ArrayList<RolVO> listaRoles = new ArrayList<>();/*se creo el objeto*/
        
        try {
            conexion = this.obtenerConexion();
            sql = "SELECT * FROM usuario  where usuId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, idUsuario);
            //remplazar los interrogantes
            mensajero = puente.executeQuery();
            while(mensajero.next()){
                
                RolVO rolVO = new RolVO(mensajero.getString(1),mensajero.getString(2),mensajero.getString(3));
                listaRoles.add(rolVO);
            }
        } catch (Exception e) {
            Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(RolDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaRoles;
    }
    
}
