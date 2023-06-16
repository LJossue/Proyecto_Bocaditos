/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.DetallesMateriaVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Util.Crud;
import Util.ConexionBd;

/**
 *
 * @author esteb
 */
public class DetallesMateriaDAO extends ConexionBd implements Crud {
    
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    
    private String detmId="",proId_fk="",matId_fk="",detmCantidad="";

    public DetallesMateriaDAO() {
    }
    
    
    public DetallesMateriaDAO(DetallesMateriaVO detVO){
        super();
        try {
            // Conectarse a la base de datos
           conexion = this.obtenerConexion();
            // Trae los datos del VO al DAO
            detmId = detVO.getDetmId();
            proId_fk=detVO.getProId_fk();
            matId_fk=detVO.getMatId_fk();
            detmCantidad=detVO.getDetmCantidad();
            

        } catch (Exception e) {
            
        }
    }

    @Override
    public boolean agregarRegistro() {
        try {
            sql = "insert into detallesmateriaprima (proId_fk,matId_fk,detmCantidad) values (?,?,?)";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, proId_fk);
            puente.setString(2, matId_fk);
            puente.setString(3, detmCantidad);
            puente.executeUpdate();
            operacion = true ;
        } catch (Exception e) {
            Logger.getLogger(MateriaDAO.class.getName()).log(Level.SEVERE,null,e);
        }finally{
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(MateriaDAO.class.getName()).log(Level.SEVERE,null,e);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarRegistro() {
    try {
            sql = "update detallesmateriaprima set proId_fk=?,matId_fk=?,detmCantidad=? where detmId =?;";
            puente = conexion.prepareStatement(sql);
            
            puente.setString(1, proId_fk);
            puente.setString(2, matId_fk);
            puente.setString(3, detmCantidad);
            puente.setString(4, detmId);
            puente.executeUpdate();
            operacion = true ;
        } catch (Exception e) {
            Logger.getLogger(DetallesMateriaDAO.class.getName()).log(Level.SEVERE,null,e);
        }finally{
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(DetallesMateriaDAO.class.getName()).log(Level.SEVERE,null,e);
            }
        }
        return operacion;
        
    }
    
        public DetallesMateriaVO consultarPorId(String Id) {

        DetallesMateriaVO detVO = null;

        try {
            conexion = this.obtenerConexion();
            sql = "select * from detallesmateriaprima where detmId=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, Id);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

                detVO = new DetallesMateriaVO(Id, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4));
            }
        } catch (Exception e) {
            Logger.getLogger(DetallesMateriaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();

            } catch (Exception e) {
                Logger.getLogger(DetallesMateriaDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return detVO;
    }
    
        public ArrayList<DetallesMateriaVO> listarId() {
        ArrayList<DetallesMateriaVO> listaId = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "select * from detallesmateriaprima;";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                DetallesMateriaVO detVO = new DetallesMateriaVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4));
                listaId.add(detVO);
            }
        } catch (Exception e) {
            Logger.getLogger(DetallesMateriaDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();

            } catch (Exception e) {
                Logger.getLogger(DetallesMateriaDAO.class
                        .getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaId;
    }
}
