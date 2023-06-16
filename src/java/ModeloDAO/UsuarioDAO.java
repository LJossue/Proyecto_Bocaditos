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
 * @author APRENDIZ
 */
public class UsuarioDAO extends ConexionBd implements Crud {

    //1.- Declarar variables y/u objetos 
    private Connection conexion;
    private PreparedStatement puente;
    private ResultSet mensajero;
    private boolean operacion = false;
    private String sql;
    private String usuId = "", usuCorreo = "", usuContrasena = "", usuApellido = "", usuNombre = "", usuTipoDocumento = "", usuDocumento = "", usuTelefono = "", usuDireccion = "", usuEstado = "", rolId_fk = "";

    public UsuarioDAO() {
    }

    //2 Metodo principal le paso los datos del VO
    public UsuarioDAO(UsuarioVO usuVO) {
        super();
        try {
            //3 conectarse a la BD
            conexion = this.obtenerConexion();
            //4 traer los datos del VO al DAO 
            usuId = usuVO.getUsuId();
            usuCorreo = usuVO.getUsuCorreo();
            usuContrasena = usuVO.getUsuContrasena();
            usuApellido = usuVO.getUsuApellido();
            usuNombre = usuVO.getUsuNombre();
            usuTipoDocumento = usuVO.getUsuTipoDocumento();
            usuDocumento = usuVO.getUsuDocumento();
            usuTelefono = usuVO.getUsuTelefono();
            usuDireccion = usuVO.getUsuDireccion();
            usuEstado = usuVO.getUsuEstado();
            rolId_fk = usuVO.getRolId_fk();
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public boolean agregarRegistro() {
        usuEstado = "Activo";
        rolId_fk = "4";
        try {
            sql = "insert into usuario (usuCorreo, usuContrasena, usuApellido, usuNombre, usuTipoDocumento, usuDocumento, usuTelefono, usuDireccion, usuEstado, rolId_fk) values (?, SHA2(?, 256), ?, ?, ?, ?, ?, ?, ?, ?);";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuCorreo);
            puente.setString(2, usuContrasena);
            puente.setString(3, usuApellido);
            puente.setString(4, usuNombre);
            puente.setString(5, usuTipoDocumento);
            puente.setString(6, usuDocumento);
            puente.setString(7, usuTelefono);
            puente.setString(8, usuDireccion);
            puente.setString(9, usuEstado);
            puente.setString(10, rolId_fk);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
               // this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;
    }

    @Override
    public boolean actualizarRegistro() { //ESTO ES ACTUALIZAR USUARIOS DESDE EL ADMIN (FALTA ACTUALIZAR USUARIO DESDE EL PERFIL)
        try {
            sql = "update usuario set usuCorreo = ?, usuApellido = ?, usuNombre = ?, usuTipoDocumento = ?, usuDocumento = ?, usuTelefono = ?, usuDireccion = ?, rolId_fk = ? where usuId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuCorreo);

            puente.setString(2, usuApellido);
            puente.setString(3, usuNombre);
            puente.setString(4, usuTipoDocumento);
            puente.setString(5, usuDocumento);
            puente.setString(6, usuTelefono);
            puente.setString(7, usuDireccion);
            puente.setString(8, rolId_fk);
            puente.setString(9, usuId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                //this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }

    @Override
    public boolean eliminarRegistro() { //hacer
        try {
            sql = "update usuario set  usuEstado = ? where usuid = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuEstado);
            puente.setString(2, usuId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
               // this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }

    public boolean iniciarSesion(String usuario, String clave) {
        try {
            
            
            conexion = this.obtenerConexion();
            sql = "SELECT * FROM usuario WHERE usuCorreo = ? AND usuContrasena = SHA2(?, 256)  AND usuEstado = 'activo' AND rolId_fk IN ('1', '2', '3')";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuario);
            puente.setString(2, clave);
            mensajero = puente.executeQuery();
            if (mensajero.next()) {
                operacion = true;
            }

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
               // this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return operacion;
    }
    
    public int obtenerIdRol(String usuario) {
    int idRol = 0;
    try {
        
        conexion = this.obtenerConexion();
        sql = "select rolId_fk from usuario where usuCorreo = ?";
        puente = conexion.prepareStatement(sql);
        puente.setString(1, usuario);
        mensajero = puente.executeQuery();
        if (mensajero.next()) {
            idRol = mensajero.getInt(1);
        }
    } catch (Exception e) {
        Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        try {
            //this.cerrarConexion();
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    return idRol;
}

     public UsuarioVO consultarPorId(String Id) {

        UsuarioVO usuVO = null;

        try {
            conexion = this.obtenerConexion();
            sql = "select * from usuario where usuId=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, Id);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

               usuVO = new UsuarioVO(Id, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11));
            }
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
               // this.cerrarConexion();

            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return usuVO;
    }
    
     public ArrayList<UsuarioVO> listar(){
        ArrayList<UsuarioVO> listaUsuarios = new ArrayList<>(); // Crea una lista para almacenar los Usuarios encontrados
        try { 
            conexion = this.obtenerConexion();
        sql="select * from consulta_usuario order by case usuEstado WHEN 'Activo' THEN 0 ELSE 1 END, usuId asc;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        while(mensajero.next()){
            // Obtiene los valores de las columnas para crear un objeto UsuarioVO
            UsuarioVO usuVO = new UsuarioVO(mensajero.getString("usuId"), mensajero.getString("usuCorreo"), mensajero.getString("usuContrasena"), mensajero.getString("usuApellido"), mensajero.getString("usuNombre"), mensajero.getString("usuTipoDocumento"), mensajero.getString("usuDocumento"), mensajero.getString("usuTelefono"), mensajero.getString("usuDireccion"), mensajero.getString("usuEstado"), mensajero.getString("rolId_fk"), mensajero.getString("rolDescripcion") );
            listaUsuarios.add(usuVO); // Agrega el usuario a la lista
        }
        } catch (Exception e) {
        Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        finally{
            try {
               // this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            
        }
    
    return listaUsuarios;
    
}
     public ArrayList<UsuarioVO> listarReposteros(){
        ArrayList<UsuarioVO> listaReposteros = new ArrayList<>(); // Crea una lista para almacenar los Usuarios encontrados
        try { 
            conexion = this.obtenerConexion();
        sql="select * from consulta_usuario where usuEstado = 'Activo' and rolDescripcion IN ('Propietario', 'Supervisor', 'Repostero');";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        while(mensajero.next()){
            // Obtiene los valores de las columnas para crear un objeto UsuarioVO
            UsuarioVO usuVO = new UsuarioVO(mensajero.getString("usuId"), mensajero.getString("usuCorreo"), mensajero.getString("usuContrasena"), mensajero.getString("usuApellido"), mensajero.getString("usuNombre"), mensajero.getString("usuTipoDocumento"), mensajero.getString("usuDocumento"), mensajero.getString("usuTelefono"), mensajero.getString("usuDireccion"), mensajero.getString("usuEstado"), mensajero.getString("rolId_fk"), mensajero.getString("rolDescripcion") );
            listaReposteros.add(usuVO); // Agrega el usuario a la lista
        }
        } catch (Exception e) {
        Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        finally{
            try {
               // this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            
        }
    
    return listaReposteros;
    
}
 
      public boolean actualizarRegistroRol() {
        try {
            sql = "update usuario set rolId_fk = ? where usuId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, rolId_fk);
            puente.setString(2, usuId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
              //  this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }
       public ArrayList<UsuarioVO> listar(String idUsuario) {
        ArrayList<UsuarioVO> listaRoles = new ArrayList<>();

        try {
            conexion = this.obtenerConexion();
            sql = "select rolId_fk from usuario where usuId=?";
            puente = conexion.prepareStatement(sql);
            puente.setString(1,idUsuario);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {
                UsuarioVO usuVO = new UsuarioVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11));
                listaRoles.add(usuVO);
            }
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                //this.cerrarConexion();

            } catch (Exception e) {
                Logger.getLogger(UsuarioVO.class
                        .getName()).log(Level.SEVERE, null, e);
            }
        }
        return listaRoles;
    }
       public ArrayList<UsuarioVO> listarNumeroOrdenes(){
        ArrayList<UsuarioVO> listaOrdUsuarios = new ArrayList<>(); // Crea una lista para almacenar los Usuarios encontrados
        try { 
            conexion = this.obtenerConexion();
        sql="select * from ordenes_semanales_usuario order by cantidad_ordenes desc;";
        puente = conexion.prepareStatement(sql);
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        while(mensajero.next()){
            // Obtiene los valores de las columnas para crear un objeto UsuarioVO
            UsuarioVO usuVO = new UsuarioVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11), mensajero.getString(12), mensajero.getString(13) );
            listaOrdUsuarios.add(usuVO); // Agrega el usuario a la lista
        }
        } catch (Exception e) {
        Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        finally{
            try {
               // this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            
        }
    
    return listaOrdUsuarios;
    
}
       public ArrayList<UsuarioVO> listarNumeroOrdenesSesion(String Id){
        ArrayList<UsuarioVO> listaOrdUsuarios = new ArrayList<>(); // Crea una lista para almacenar los Usuarios encontrados
        try { 
            conexion = this.obtenerConexion();
        sql="select * from ordenes_semanales_usuario where usuId = ?;";
        puente = conexion.prepareStatement(sql);
         puente.setString(1, Id);
       
        mensajero = puente.executeQuery(); // ejecuta la consulta SQL
        while(mensajero.next()){
            // Obtiene los valores de las columnas para crear un objeto UsuarioVO
            UsuarioVO usuVO = new UsuarioVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11), mensajero.getString(12), mensajero.getString(13) );
            listaOrdUsuarios.add(usuVO); // Agrega el usuario a la lista
        }
        } catch (Exception e) {
        Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        finally{
            try {
               // this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            
        }
    
    return listaOrdUsuarios;
    
}
       public UsuarioVO consultarPorCorreo(String Correo) {

        UsuarioVO usuVO = null;

        try {
            conexion = this.obtenerConexion();
            sql = "select * from usuario where usuCorreo=?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, Correo);
            mensajero = puente.executeQuery();
            while (mensajero.next()) {

               usuVO = new UsuarioVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11));
            }
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
               this.cerrarConexion();

            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return usuVO;
    }
       public boolean actualizarContrasena(String nuevaContrasena, String correo) {

    try {
        conexion = this.obtenerConexion();
        sql="UPDATE usuario SET usuContrasena = SHA2(?, 256) WHERE usuCorreo = ?;";
        puente = conexion.prepareStatement(sql);
        puente.setString(1, nuevaContrasena);
        puente.setString(2, correo);
        puente.executeUpdate();
        operacion = true;
        
    } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
               this.cerrarConexion();

            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    return operacion;
}
       public boolean verificarCorreoExistente(String Correo) {
    boolean correoExistente = false;
    try {
        sql = "SELECT COUNT(*) FROM usuario WHERE usuCorreo = ?";
        puente = conexion.prepareStatement(sql);
        puente.setString(1, Correo);
        mensajero = puente.executeQuery();
        if (mensajero.next()) {
            int count = mensajero.getInt(1);
            correoExistente = (count > 0);
        }
    } catch (Exception e) {
        Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        try {
            // this.cerrarConexion();
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    return correoExistente;
}
       
       public boolean verificarDocumentoExistente(String Documento) {
    boolean documentoExistente = false;
    try {
        sql = "SELECT COUNT(*) FROM usuario WHERE usuDocumento = ?";
        puente = conexion.prepareStatement(sql);
        puente.setString(1, Documento);
        mensajero = puente.executeQuery();
        if (mensajero.next()) {
            int count = mensajero.getInt(1);
            documentoExistente = (count > 0);
        }
    } catch (Exception e) {
        Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
    } finally {
        try {
            // this.cerrarConexion();
        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    return documentoExistente;
}
       
       //ACTUALIZAR DATOS EN EL PERFIL
       public boolean actualizarTelefono() { 
        try {
            sql = "update usuario set usuTelefono = ? where usuId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuTelefono);

            puente.setString(2, usuId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                //this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }
       public boolean actualizarDireccion() {
        try {
            sql = "update usuario set usuDireccion = ? where usuId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuDireccion);

            puente.setString(2, usuId);
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                //this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }
       public boolean actualizarContrasena() { 
        try {
            sql = "update usuario set usuContrasena = SHA2(?, 256) where usuId = ?;";
            puente = conexion.prepareStatement(sql);
            puente.setString(1, usuContrasena);

            puente.setString(2, usuId);
     
            puente.executeUpdate();
            operacion = true;

        } catch (Exception e) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            try {
                //this.cerrarConexion();
            } catch (Exception e) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return operacion;

    }
}
