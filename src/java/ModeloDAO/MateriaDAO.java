/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Util.ConexionBd;
import ModeloVO.MateriaVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Util.Crud;
import java.sql.Statement;

/**
 *
 * @author esteb
 */
public class MateriaDAO extends ConexionBd implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;

    private String matId = "", matNombre = "", detmCantidad = "", detmUnidadDeMedida = "",matEstado = "", matId_fk = "" ;

    public MateriaDAO() {
    }

    public MateriaDAO(MateriaVO matVO) {
        super();
        try {
            // Conectarse a la base de datos
            conexion = this.obtenerConexion();
            // Trae los datos del VO al DAO
            matId = matVO.getMatId();
            matNombre = matVO.getMatNombre();
            detmCantidad = matVO.getDetmCantidad();
            matEstado = matVO.getMatEstado();
            detmUnidadDeMedida = matVO.getDetmUnidadDeMedida();

        } catch (Exception e) {

        }

    }

    @Override
    public boolean agregarRegistro() {
        matEstado = "Activo";
        try {
            
            sql = "insert into materiaprima (matNombre, matEstado) values (?,?)";
            puente = conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            puente.setString(1, matNombre);
            puente.setString(2, matEstado);
            puente.executeUpdate();
             // Obtener el ID generado por la inserción en la tabla "orden"
            ResultSet generatedKeys = puente.getGeneratedKeys();
            String materiaId = null;
            if (generatedKeys.next()) {
                materiaId = generatedKeys.getString(1);
            }
             sql = "INSERT INTO detallesmateriaprima (matid_fk, detmCantidad, detmUnidadDeMedida) values (?,?,?)";
 puente = conexion.prepareStatement(sql);
  puente.setString(1, materiaId);
            puente.setString(2, detmCantidad);
            puente.setString(3, detmUnidadDeMedida);
            puente.executeUpdate();
            operacion = true;
            
            
        } catch (Exception e) {
            Logger.getLogger(MateriaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(MateriaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {
        try {
            sql = "update materiaprima set matNombre=? where matId=?";
            puente = conexion.prepareStatement(sql);

            puente.setString(1, matNombre);
            puente.setString(2, matId);
            puente.executeUpdate();
            operacion = true;
            
     
         // Convertir la cadena JSON de productos en un array de objetos JSON

// Insertar los detalles de la orden y los productos en la tabla "detallesorden"
sql = "update detallesmateriaprima set detmcantidad=?,detmUnidadDeMedida=? where matId_fk=?";
puente = conexion.prepareStatement(sql);

    puente.setString(1, detmCantidad);
    puente.setString(2, detmUnidadDeMedida);
    puente.setString(3, matId);


    puente.executeUpdate();

        } catch (Exception e) {
            Logger.getLogger(MateriaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(MateriaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        try {
            sql = "update materiaprima set matEstado = ? where matId = ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, matEstado);
             puente.setString(2, matId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(MateriaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(MateriaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }


    public ArrayList<MateriaVO> listar() {
        ArrayList<MateriaVO> listaMateriaPrima = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "select * from consulta_materia_prima order by case matEstado WHEN 'Activo' THEN 0 ELSE 1 END, matId asc";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                MateriaVO matVO = new MateriaVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5));
                listaMateriaPrima.add(matVO);
            }
        } catch (Exception e) {
            Logger.getLogger(MateriaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();

            } catch (Exception e) {
                Logger.getLogger(MateriaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaMateriaPrima;
    }
    
    public ArrayList<MateriaVO> listarActivos(){
        ArrayList<MateriaVO> listaMateriaprimaActiva = new ArrayList<>(); // Crea una lista para almacenar los roles encontrados
        try { 
            conexion = this.obtenerConexion();
        sql="select * from consulta_materia_prima where matEstado='Activo';";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        while(mensajero.next()){
            // Obtiene los valores de las columnas para crear un objeto proVO
           MateriaVO matVO = new MateriaVO(mensajero.getString(1), mensajero.getString(2),  mensajero.getString(3), mensajero.getString(4), mensajero.getString(5));
            listaMateriaprimaActiva.add(matVO); // Agrega el rol a la lista
        }
        } catch (Exception e) {
        Logger.getLogger(MateriaDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        finally{
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(MateriaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            
        }
    
    return listaMateriaprimaActiva;
    
    
}
    public boolean restarMateria() { //hacer
        try {
            sql = "UPDATE detallesmateriaprima SET detmCantidad = detmCantidad - ? WHERE matId_fk = ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, detmCantidad);
            puente.setString(2, matId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }
}