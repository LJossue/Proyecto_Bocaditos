/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.ClienteVO;
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
 * @author esteb
 */
public class ClienteDAO extends ConexionBd implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String cliId = "", cliDocumento = "", cliTipoDocumento = "", cliNombre="", cliApellido="", cliCorreo="", cliDireccion="", cliTelefono="", cliEstado="Activo";

    public ClienteDAO() {
    }

    public ClienteDAO(ClienteVO cliVO) {
        super();
        try {
            //3 conectarse a la BD
            conexion = this.obtenerConexion();
            //4 traer los datos del VO al DAO 
            cliId = cliVO.getCliId();
            cliDocumento = cliVO.getCliDocumento();
            cliTipoDocumento = cliVO.getCliTipoDocumento();
            cliNombre = cliVO.getCliNombre();
            cliApellido = cliVO.getCliApellido();
            cliCorreo = cliVO.getCliCorreo();
            cliDireccion = cliVO.getCliDireccion();
            cliTelefono = cliVO.getCliTelefono();
            cliEstado = cliVO.getCliEstado();
        } catch (Exception e) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        cliEstado = "Activo";
        try {
            sql = "insert into cliente ( cliDocumento, cliTipoDocumento, cliNombre, cliApellido,cliCorreo,cliDireccion,cliTelefono,cliEstado) values ( ?, ?, ?, ?, ?, ?, ?,?);";
            puente = conexion.prepareStatement(sql);

            puente.setString(1, cliDocumento);
            puente.setString(2, cliTipoDocumento);
            puente.setString(3, cliNombre);
            puente.setString(4, cliApellido);
            puente.setString(5, cliCorreo);
            puente.setString(6, cliDireccion);
            puente.setString(7, cliTelefono);
            puente.setString(8, cliEstado);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update cliente set cliTipoDocumento=?,cliNombre=?,cliApellido=?,cliCorreo=?, cliDireccion=?,cliTelefono=?, cliDocumento=? where cliId=?";
            puente = conexion.prepareStatement(sql);

            puente.setString(1, cliTipoDocumento);
            puente.setString(2, cliNombre);
            puente.setString(3, cliApellido);
            puente.setString(4, cliCorreo);
            puente.setString(5, cliDireccion);
            puente.setString(6, cliTelefono);
            puente.setString(7, cliDocumento);
puente.setString(8, cliId);
            puente.executeUpdate();
            operacion = true;
        } catch (Exception e) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {

        try {
            sql = "update cliente set cliEstado=? where cliId=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, cliEstado);
             puente.setString(2, cliId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }

   

    public ArrayList<ClienteVO> listar() {
        ArrayList<ClienteVO> listaClientes = new ArrayList<>(); // Crea una lista para almacenar los roles encontrados
        try {
            conexion = this.obtenerConexion();
            sql = "select * from cliente order by case cliEstado WHEN 'Activo' THEN 0 ELSE 1 END";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery(); // ejecuta la consulta SQL
            while (mensajero.next()) {
                // Obtiene los valores de las columnas para crear un objeto proVO
                ClienteVO proVO = new ClienteVO(mensajero.getString("cliId"), mensajero.getString("cliDocumento"), mensajero.getString("cliTipoDocumento"), mensajero.getString("cliNombre"), mensajero.getString("cliApellido"), mensajero.getString("cliCorreo"), mensajero.getString("cliDireccion"), mensajero.getString("cliTelefono"), mensajero.getString("cliEstado"));
                listaClientes.add(proVO); // Agrega el rol a la lista
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

        return listaClientes;

    }
    public ArrayList<ClienteVO> listarActivos() {
        ArrayList<ClienteVO> listaClientesActivos = new ArrayList<>(); // Crea una lista para almacenar los roles encontrados
        try {
            conexion = this.obtenerConexion();
            sql = "select * from cliente where cliEstado = 'Activo'";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery(); // ejecuta la consulta SQL
            while (mensajero.next()) {
                // Obtiene los valores de las columnas para crear un objeto proVO
                ClienteVO proVO = new ClienteVO(mensajero.getString("cliId"), mensajero.getString("cliDocumento"), mensajero.getString("cliTipoDocumento"), mensajero.getString("cliNombre"), mensajero.getString("cliApellido"), mensajero.getString("cliCorreo"), mensajero.getString("cliDireccion"), mensajero.getString("cliTelefono"), mensajero.getString("cliEstado"));
                listaClientesActivos .add(proVO); // Agrega el rol a la lista
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

        return listaClientesActivos;

    }
    
public int obtenerCantidadClientesActivos() {
    int cantidadClientesActivos = 0;
    try {
        conexion = this.obtenerConexion();
        sql = "SELECT * from clientes_activos;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        if (mensajero.next()) {
            cantidadClientesActivos = mensajero.getInt("cantidad_clientes_activos");
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
    return cantidadClientesActivos;
}
    
}
