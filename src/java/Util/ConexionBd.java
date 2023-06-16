/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author APRENDIZ
 */
public class ConexionBd {
    //1.- Declarar variables y/o objetos
    private String driver, user,password,urlBd, port, nameDB;
    private Connection conexion; 
    public ConexionBd(){
        //2.- Asignar Variables
driver="com.mysql.jdbc.Driver";
user= "root";
password ="";
nameDB ="bocaditos_bd";
port="3307";
urlBd ="jdbc:mysql://localhost:" + port + "/" + nameDB;

try{
    Class.forName(driver).newInstance();
    conexion = DriverManager.getConnection(urlBd, user, password);
    System.out.println("Conexion Correcta");
    
    
    
}catch(Exception e){
    System.out.println("Error de conexion" + e.toString());
}



}
    public Connection obtenerConexion(){
   return conexion;     
}
    public Connection cerrarConexion() throws SQLException{
   conexion.close();
   conexion =null;
   return conexion;
}
    
    public static void main (String[] args) {
        new ConexionBd();
    }
}

