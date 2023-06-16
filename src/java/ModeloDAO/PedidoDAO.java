/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.PedidoVO;
import Util.ConexionBd;
import Util.Crud;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author APRENDIZ
 */
public class PedidoDAO extends ConexionBd implements Crud {

    //1.- Declarar variables y/u objetos 
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String pedId = "", pedFechaPedido = "", pedFechaEntrega = "", pedEstado = "",prvId_fk = "", pedTotal = "",detpId = "", pedId_fk = "", matId_fk = "", detpPrecioUnidad = "", detpCantidad = "", detpSubTotal = "";

    public PedidoDAO() {
    }

    //2 Metodo principal le paso los datos del VO
    public PedidoDAO(PedidoVO pedVO) {
        super();
        try {
            //3 conectarse a la BD
            conexion = this.obtenerConexion();
            //4 traer los datos del VO al DAO 
            pedId = pedVO.getPedId();
            pedFechaPedido = pedVO.getPedFechaPedido();
            pedFechaEntrega = pedVO.getPedFechaEntrega();
            pedEstado = pedVO.getPedEstado();
            prvId_fk = pedVO.getPrvId_fk();
            pedTotal = pedVO.getPedTotal();
        } catch (Exception e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        pedEstado = "Realizado";

        try {
            sql = "insert into pedido (pedFechaPedido, pedFechaEntrega, pedEstado, prvId_fk) values (?,?, ?, ?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, pedFechaPedido);
            puente.setString(2, pedFechaEntrega);
            puente.setString(3, pedEstado);
            puente.setString(4, prvId_fk);
          
            
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

    
    @Override
    public boolean actualizarRegistro() {
        try {

            sql = "update pedido set pedFechaPedido = ?, pedFechaEntrega = ?, pedEstado = ?, prvId_fk = ? where pedid = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, pedFechaPedido);
            puente.setString(2, pedFechaEntrega);
            puente.setString(3, pedEstado);
            puente.setString(4, prvId_fk);
            puente.setString(5, pedId);
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

    @Override
    public boolean eliminarRegistro() { //hacer
        try {
            sql = "update pedido set  pedEstado = 'Cancelado' where pedid = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, pedId);
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

    public PedidoVO consultarPorId(String Id) {

        PedidoVO pedVO = null;

        try {
            conexion = this.obtenerConexion();
            sql = "select * from pedido where pedId=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, Id);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

                pedVO = new PedidoVO(Id, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6));
            }
        } catch (Exception e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();

            } catch (Exception e) {
                Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return pedVO;
    }

    public ArrayList<PedidoVO> listar() {
        ArrayList<PedidoVO> listaPedidos = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "select * from consulta_pedido order by pedFechaPedido desc";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                PedidoVO pedVO = new PedidoVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7));
                listaPedidos.add(pedVO);
            }
        } catch (Exception e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();

            } catch (Exception e) {
                Logger.getLogger(PedidoDAO.class
                        .getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaPedidos;
    }
    
        public boolean agregarAmbosRegistro(String materiaJson) {

        try {

            sql = "INSERT INTO pedido (pedFechaPedido, pedfechaentrega, prvId_fk) VALUES (?, ?, ?);";

            puente = conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            puente.setString(1, pedFechaPedido);
            puente.setString(2, pedFechaEntrega);
            puente.setString(3, prvId_fk);
            puente.executeUpdate();
            
            // Obtener el ID generado por la inserción en la tabla "orden"
            ResultSet generatedKeys = puente.getGeneratedKeys();
            String pedidoId = null;
            if (generatedKeys.next()) {
                pedidoId = generatedKeys.getString(1);
            }
         // Convertir la cadena JSON de materia prima en un array de objetos JSON
JSONArray materiaArray = new JSONArray(materiaJson);

// Insertar los detalles de la orden y los productos en la tabla "detallesorden"
sql = "INSERT INTO detallespedido (pedid_fk, matId_fk, detpPrecioUnidad, detpCantidad) VALUES (?, ?, ?, ?);";
puente = conexion.prepareStatement(sql);
for (int i = 0; i < materiaArray.length(); i++) {
    JSONObject materia = materiaArray.getJSONObject(i);

    matId_fk = materia.getString("matId");
    detpPrecioUnidad = materia.getString("precio");
    detpCantidad = materia.getString("cantidad");

    puente.setString(1, pedidoId);
    puente.setString(2, matId_fk);
    puente.setString(3, detpPrecioUnidad);
    puente.setString(4, detpCantidad);

    puente.executeUpdate();
}
            operacion = true;

        } catch (Exception e) {
        // Si ocurre algún error, realizar rollback de la transacción
        
        Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        // Cerrar la conexión y restablecer la configuración de autocommit
        try {
            if (conexion != null) {
                conexion.setAutoCommit(true);
                conexion.close();
            }
        } catch (Exception e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    return operacion;
}
    public ArrayList<PedidoVO> listarMateria(String pedId) {
        ArrayList<PedidoVO> listaMateria = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "select * from consulta_detalles_pedido where pedId_fk = ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, pedId);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                PedidoVO pedVO = new PedidoVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5));
                listaMateria.add(pedVO);
            }
        } catch (Exception e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaMateria;
    }
    public boolean eliminarMateria(String Id) {

        try {
            sql = "delete from detallespedido where detpId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, Id);
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
    public boolean actualizarMateria(String materiaJson, String pedId_fk) {

        try {

           
         // Convertir la cadena JSON de productos en un array de objetos JSON
JSONArray materiaArrayAñadir = new JSONArray(materiaJson);

// Insertar los detalles de la orden y los productos en la tabla "detallesorden"
sql = "INSERT INTO detallespedido (pedid_fk, matId_fk, detpPrecioUnidad, detpCantidad) VALUES (?, ?, ?, ?);";
puente = conexion.prepareStatement(sql);
for (int i = 0; i < materiaArrayAñadir.length(); i++) {
    JSONObject materia = materiaArrayAñadir.getJSONObject(i);

    matId_fk = materia.getString("matId");
    detpPrecioUnidad = materia.getString("precio");
    detpCantidad = materia.getString("cantidad");

    puente.setString(1, pedId_fk);
    puente.setString(2, matId_fk);
    puente.setString(3, detpPrecioUnidad);
    puente.setString(4, detpCantidad);
    puente.executeUpdate();
}

            operacion = true;

        } catch (Exception e) {
        // Si ocurre algún error, realizar rollback de la transacción
        
        Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        // Cerrar la conexión y restablecer la configuración de autocommit
        try {
            if (conexion != null) {
                conexion.setAutoCommit(true);
                conexion.close();
            }
        } catch (Exception e) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    return operacion;
} 
 public int obtenerTotalGastosMes() {
    int TotalGastos = 0;
    try {
        conexion = this.obtenerConexion();
        sql = "SELECT * from consulta_pedido_total_mes;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        if (mensajero.next()) {
            TotalGastos = mensajero.getInt("total_pedidos_mes");
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
    return TotalGastos;
}
 public int obtenerGananciasMes() {
    int TotalGanancias = 0;
    try {
        conexion = this.obtenerConexion();
        sql = "SELECT * from consulta_ganancias;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        if (mensajero.next()) {
            TotalGanancias = mensajero.getInt("ganancias");
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
    return TotalGanancias;
}
}
