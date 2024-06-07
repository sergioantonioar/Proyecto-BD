/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javaapplication2;
import javaapplication2.conexion;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.JComboBox;
/**
 *
 * @author Luis
 */
public class LLenarcajitas {
    public void LLenarCajitas(String tabla, String valor, JComboBox combito){
        String sql = "select * from " + tabla;
        Statement st; 
        conexion con = new conexion();
        Connection conexion = con.establecerConexion();
        try 
        {
            st =  conexion.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next())
            {
                combito.addItem(rs.getString(valor));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "ERROR" + e.toString());
        }
    }
}
