/* and open the template in the editor.
 */
package ModeloDAO;
import org.json.JSONArray;

import ModeloVO.OrdenVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import Util.ConexionBd;
import Util.Crud;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import org.json.JSONObject;

/**
 *
 * @author APRENDIZ
 */
public class OrdenDAO extends ConexionBd implements Crud {

    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String ordId = "", ordIdRepostero_fk = "", cliId_fk = "", ordFechaPedido = "", ordFechaEntrega = "", ordDireccion = "", ordDetalles = "", ordPrecioDomicilio = "", ordTotal = "", ordAbono = "", ordSaldo = "", ordEstado = "", repostero = "", cliente = "", documento = "", detoId = "", ordId_fk = "", prodId_fk = "", detoSabor = "", detoRelleno = "", detoAdicionales = "", detoPorciones = "", detoImagen = "", detoCantidad = "", detoPrecio = "", detoSubTotal = "";


    public OrdenDAO() {
    }

    public OrdenDAO(OrdenVO ordVO) {
        super();
        try {
            conexion = this.obtenerConexion();

            ordId = ordVO.getOrdId();
            ordIdRepostero_fk = ordVO.getOrdIdRepostero_fk();
            cliId_fk = ordVO.getCliId_fk();
            ordFechaPedido = ordVO.getOrdFechaPedido();
            ordFechaEntrega = ordVO.getOrdFechaEntrega();
            ordDireccion = ordVO.getOrdDireccion();
            ordDetalles = ordVO.getOrdDetalles();
            ordPrecioDomicilio = ordVO.getOrdPrecioDomicilio();
            ordTotal = ordVO.getOrdTotal();
            ordAbono = ordVO.getOrdAbono();
            ordSaldo = ordVO.getOrdSaldo();
            ordEstado = ordVO.getOrdEstado();
            detoId = ordVO.getDetoId();
            ordId_fk = ordVO.getOrdId_fk();
            prodId_fk = ordVO.getProdId_fk();
            detoSabor = ordVO.getDetoSabor();
            detoRelleno = ordVO.getDetoRelleno();
            detoPorciones = ordVO.getDetoPorciones();
            detoCantidad = ordVO.getDetoCantidad();
            detoPrecio = ordVO.getDetoPrecio();
            detoSubTotal = ordVO.getDetoSubTotal();

        } catch (Exception e) {
            Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    @Override
    public boolean agregarRegistro() {

        try {

            sql = "insert into orden(ordId, ordEstado, ordFechaPedido, ordFechaEntrega, ordIdRepostero_fk, cliId_fk) values(?,?,?,?,?,?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, ordId);
            puente.setString(2, ordEstado);
            puente.setString(3, ordFechaPedido);
            puente.setString(4, ordFechaEntrega);
            puente.setString(5, ordIdRepostero_fk);
            puente.setString(6, cliId_fk);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean actualizarRegistro() {

        try {

            sql = "UPDATE orden SET ordIdRepostero_fk = ?, cliId_fk = ?, ordFechaPedido = ?, ordFechaEntrega = ?, ordDireccion = ?, ordDetalles = ?, ordPrecioDomicilio = ?, ordAbono = ?, ordEstado = ? WHERE ordId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, ordIdRepostero_fk);
            puente.setString(2, cliId_fk);
            puente.setString(3, ordFechaPedido);
            puente.setString(4, ordFechaEntrega);
            puente.setString(5, ordDireccion);
            puente.setString(6, ordDetalles);
            puente.setString(7, ordPrecioDomicilio);
            puente.setString(8, ordAbono);
            puente.setString(9, ordEstado);
            puente.setString(10, ordId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    @Override
    public boolean eliminarRegistro() {

        try {
            sql = "UPDATE orden SET  ordEstado = 'Cancelada' WHERE ordId=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, ordId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }

    public ArrayList<OrdenVO> listar() {
        ArrayList<OrdenVO> listaOrdenes = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "select * from consultar_orden order by ordFechaPedido desc";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                OrdenVO ordVO = new OrdenVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11), mensajero.getString(12), mensajero.getString(13), mensajero.getString(14), mensajero.getString(15));
                listaOrdenes.add(ordVO);
            }
        } catch (Exception e) {
            Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaOrdenes;
    }

    public ArrayList<OrdenVO> listarDashboard() {
        ArrayList<OrdenVO> listaOrdenesDashboard = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "select * from consultar_orden order by ordFechaPedido desc limit 6;";
            puente = conexion.prepareStatement(sql);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                OrdenVO ordVO = new OrdenVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11), mensajero.getString(12), mensajero.getString(13), mensajero.getString(14), mensajero.getString(15));
                listaOrdenesDashboard.add(ordVO);
            }
        } catch (Exception e) {
            Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaOrdenesDashboard;
    }
public ArrayList<OrdenVO> listarMisOrdenesDashboard(String Id) {
        ArrayList<OrdenVO> listaMisOrdenesDashboard = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "select * from consultar_orden where ordIdRepostero_fk = ? order by ordFechaPedido desc limit 6;";
            puente = conexion.prepareStatement(sql);
             puente.setString(1, Id);
            
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                OrdenVO ordVO = new OrdenVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11), mensajero.getString(12), mensajero.getString(13), mensajero.getString(14), mensajero.getString(15));
                listaMisOrdenesDashboard.add(ordVO);
            }
        } catch (Exception e) {
            Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaMisOrdenesDashboard;
    }
public ArrayList<OrdenVO> listarMisOrdenes(String Id) {
        ArrayList<OrdenVO> listaMisOrdenes = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "select * from consultar_orden where ordIdRepostero_fk = ? order by ordFechaPedido desc;";
            puente = conexion.prepareStatement(sql);
             puente.setString(1, Id);
            
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                OrdenVO ordVO = new OrdenVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11), mensajero.getString(12), mensajero.getString(13), mensajero.getString(14), mensajero.getString(15));
                listaMisOrdenes.add(ordVO);
            }
        } catch (Exception e) {
            Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaMisOrdenes;
    }
    public boolean agregarAmbosRegistro(String productosJson) {

        try {

            sql = "INSERT INTO orden (ordidRepostero_fk, cliId_fk, ordFechaPedido, ordfechaentrega, orddireccion, orddetalles, ordpreciodomicilio, ordabono) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";

            puente = conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            puente.setString(1, ordIdRepostero_fk);
            puente.setString(2, cliId_fk);
            puente.setString(3, ordFechaPedido);
            puente.setString(4, ordFechaEntrega);
            puente.setString(5, ordDireccion);
            puente.setString(6, ordDetalles);
            puente.setString(7, ordPrecioDomicilio);
            puente.setString(8, ordAbono);
            puente.executeUpdate();
            
            // Obtener el ID generado por la inserción en la tabla "orden"
            ResultSet generatedKeys = puente.getGeneratedKeys();
            String ordenId = null;
            if (generatedKeys.next()) {
                ordenId = generatedKeys.getString(1);
            }
         // Convertir la cadena JSON de productos en un array de objetos JSON
JSONArray productosArray = new JSONArray(productosJson);

// Insertar los detalles de la orden y los productos en la tabla "detallesorden"
sql = "INSERT INTO detallesorden (ordid_fk, prodId_fk, detoSabor, detoRelleno, detoPorciones, detoCantidad, detoPrecio) VALUES (?, ?, ?, ?, ?, ?, ?);";
puente = conexion.prepareStatement(sql);
for (int i = 0; i < productosArray.length(); i++) {
    JSONObject producto = productosArray.getJSONObject(i);

    prodId_fk = producto.getString("proId");
    detoSabor = producto.getString("sabor");
    detoRelleno = producto.getString("relleno");
    detoPorciones = producto.getString("porciones");
    detoCantidad = producto.getString("cantidad");
    detoPrecio = producto.getString("precio");

    puente.setString(1, ordenId);
    puente.setString(2, prodId_fk);
    puente.setString(3, detoSabor);
    puente.setString(4, detoRelleno);
    puente.setString(5, detoPorciones);
    puente.setString(6, detoCantidad);
    puente.setString(7, detoPrecio);

    puente.executeUpdate();
}

            operacion = true;

        } catch (Exception e) {
        // Si ocurre algún error, realizar rollback de la transacción
        
        Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        // Cerrar la conexión y restablecer la configuración de autocommit
        try {
            if (conexion != null) {
                conexion.setAutoCommit(true);
                conexion.close();
            }
        } catch (Exception e) {
            Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    return operacion;
}
    public ArrayList<OrdenVO> listarProductos(String ordId) {
        ArrayList<OrdenVO> listaProductos = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "select * from consulta_detalles_orden where ordId_fk = ?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, ordId);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                OrdenVO ordVO = new OrdenVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10));
                listaProductos.add(ordVO);
            }
        } catch (Exception e) {
            Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaProductos;
    }
    public boolean eliminarProducto(String Id) {

        try {
            sql = "delete from detallesorden where detoId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, Id);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }
    public boolean actualizarProductos(String productosJson, String ordId_fk) {

        try {

           
         // Convertir la cadena JSON de productos en un array de objetos JSON
JSONArray productosArrayAñadir = new JSONArray(productosJson);

// Insertar los detalles de la orden y los productos en la tabla "detallesorden"
sql = "INSERT INTO detallesorden (ordid_fk, prodId_fk, detoSabor, detoRelleno, detoPorciones, detoCantidad, detoPrecio) VALUES (?, ?, ?, ?, ?, ?, ?);";
puente = conexion.prepareStatement(sql);
for (int i = 0; i < productosArrayAñadir.length(); i++) {
    JSONObject producto = productosArrayAñadir.getJSONObject(i);

    prodId_fk = producto.getString("proId");
    detoSabor = producto.getString("sabor");
    detoRelleno = producto.getString("relleno");
    detoPorciones = producto.getString("porciones");
    detoCantidad = producto.getString("cantidad");
    detoPrecio = producto.getString("precio");

    puente.setString(1, ordId_fk);
    puente.setString(2, prodId_fk);
    puente.setString(3, detoSabor);
    puente.setString(4, detoRelleno);
    puente.setString(5, detoPorciones);
    puente.setString(6, detoCantidad);
    puente.setString(7, detoPrecio);
    puente.executeUpdate();
}

            operacion = true;

        } catch (Exception e) {
        // Si ocurre algún error, realizar rollback de la transacción
        
        Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        // Cerrar la conexión y restablecer la configuración de autocommit
        try {
            if (conexion != null) {
                conexion.setAutoCommit(true);
                conexion.close();
            }
        } catch (Exception e) {
            Logger.getLogger(OrdenDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    return operacion;
} 
    public int obtenerTotalVentasMes() {
    int TotalVentas = 0;
    try {
        conexion = this.obtenerConexion();
        sql = "SELECT * from consulta_orden_totales_mensuales;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        if (mensajero.next()) {
            TotalVentas = mensajero.getInt("total_mensual");
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
    return TotalVentas;
}
    public int obtenerCantidadOrdenesMes() {
    int TotalOrdenes = 0;
    try {
        conexion = this.obtenerConexion();
        sql = "SELECT * from consulta_cantidad_ordenes_mes;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        if (mensajero.next()) {
            TotalOrdenes = mensajero.getInt("cantidad_ordenes");
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
    return TotalOrdenes;
}
}
 