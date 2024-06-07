package javaapplication2;
import java.sql.DriverManager;
import java.sql.Connection;
import javax.swing.JOptionPane;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import javax.swing.DefaultComboBoxModel;

/**
 *
 * @author Luis
 */
public class conexion {
//    Connection conexion = null;
    String usuario = "luis";
    String contrasena = "1234";
    String bd = "DB_MATRICULA";
    String ip = "localhost";
    String puerto = "1433"; 
    String cadena = "jdbc:sqlserver://" +ip+ ":"+puerto+";databaseName=" + bd + ";user=" + usuario + ";password=" + contrasena;
    Connection conectar = null;

    //8.4.1
    
    public Connection establecerConexion(){
        try{
            conectar = DriverManager.getConnection(cadena);
            JOptionPane.showMessageDialog(null, "conectado exitosamente");
        }catch (Exception e){
            JOptionPane.showMessageDialog(null, "error no conectado" + e.toString());
        }
        return conectar;
    }
    
//    public Connection establecerConexion(){
//     try {  
//           conectar= DriverManager.getConnection(cadena);
//           JOptionPane.showMessageDialog(null, "conectado");
//    } catch(SQLException e) {
//           JOptionPane.showMessageDialog(null, "error no conectado" + e.toString());
//            }
//     return conectar;
//    }
}
