/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.ProveedorVO;
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
 * @author APRENDIZ
 */
public class ProveedorDAO extends ConexionBd implements Crud {

    //1.- Declarar variables y/u objetos 
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String prvId = "", prvNit = "", prvNombre = "", prvDireccion = "", prvTelefono = "", prvCorreo = "", prvEstado = "";

    public ProveedorDAO() {
    }

    
    //2 Metodo principal le paso los datos del VO
    public ProveedorDAO(ProveedorVO prvVO) {
        super();
        try {
            //3 conectarse a la BD
            conexion = this.obtenerConexion();
            //4 traer los datos del VO al DAO 
            prvId = prvVO.getPrvId();
            prvNit = prvVO.getPrvNit();
            prvNombre = prvVO.getPrvNombre();
            prvDireccion = prvVO.getPrvDireccion();
            prvTelefono = prvVO.getPrvTelefono();
            prvCorreo = prvVO.getPrvCorreo();
            prvEstado = prvVO.getPrvEstado();
        } catch (Exception e) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        prvEstado = "Activo";
        try {
            sql = "insert into proveedor (prvNit, prvNombre, prvDireccion, prvTelefono, prvCorreo, prvEstado) values (?, ?, ?, ?, ?, ?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, prvNit);
            puente.setString(2, prvNombre);
            puente.setString(3, prvDireccion);
            puente.setString(4, prvTelefono);
            puente.setString(5, prvCorreo);
            puente.setString(6, prvEstado);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update proveedor set prvNit = ?, prvNombre = ?, prvDireccion = ?, prvTelefono = ?, prvCorreo = ? where prvId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, prvNit);
            puente.setString(2, prvNombre);
            puente.setString(3, prvDireccion);
            puente.setString(4, prvTelefono);
            puente.setString(5, prvCorreo);
            puente.setString(6, prvId);
            
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }
    
    

   @Override
    public boolean eliminarRegistro() { //hacer
        try {
            sql = "update proveedor set  prvEstado = ? where prvid = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, prvEstado);
            puente.setString(2, prvId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }


    public ArrayList<ProveedorVO> listar() {
        ArrayList<ProveedorVO> listaProveedores = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "select * from proveedor order by case prvEstado WHEN 'Activo' THEN 0 ELSE 1 END";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                ProveedorVO prvVO = new ProveedorVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5),mensajero.getString(6),mensajero.getString(7));
                listaProveedores.add(prvVO);
            }
        } catch (Exception e) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();

            } catch (Exception e) {
                Logger.getLogger(ProveedorDAO.class
                        .getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaProveedores;
    }
    
    public ArrayList<ProveedorVO> listarActivos() {
        ArrayList<ProveedorVO> listaProveedoresActivos = new ArrayList<>(); // Crea una lista para almacenar los roles encontrados
        try {
            conexion = this.obtenerConexion();
            sql = "select * from proveedor where prvEstado = 'Activo'";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery(); // ejecuta la consulta SQL
            while (mensajero.next()) {
                // Obtiene los valores de las columnas para crear un objeto proVO
                ProveedorVO prvVO = new ProveedorVO(mensajero.getString("prvId"), mensajero.getString("prvNit"), mensajero.getString("prvNombre"), mensajero.getString("prvDireccion"), mensajero.getString("prvTelefono"), mensajero.getString("prvCorreo"), mensajero.getString("prvEstado"));
                listaProveedoresActivos .add(prvVO); // Agrega el rol a la lista
            }
        } catch (Exception e) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, e);
            }

        }

        return listaProveedoresActivos;

    }

}

