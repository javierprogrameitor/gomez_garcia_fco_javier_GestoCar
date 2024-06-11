
package es.gestocar.dao;

import es.gestocar.beans.Gasto;
import es.gestocar.beans.Vehiculo;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author javier
 */
public class GastoDAO implements IGastoDAO {
    
    
    
     private Connection conexion;

    @Override
    public Boolean add(Gasto gasto) {
        Boolean retorno = true;
        String sql = "INSERT INTO gastos (idvehiculo, concepto, fechagasto, descripcion, importe, establecimiento, kilometros)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {

            conexion = ConnectionFactory.getConnection();
            conexion.setAutoCommit(false);
            PreparedStatement preparada = conexion.prepareStatement(sql);
            preparada.setInt(1, gasto.getIdVehiculo());
            preparada.setString(2, gasto.getConcepto());
            preparada.setDate(3, gasto.getFechaGasto()  != null ? new Date(gasto.getFechaGasto().getTime()) : null);
            preparada.setString(4, gasto.getDescripcion());
            preparada.setDouble(5, gasto.getImporte());
            preparada.setString(6, gasto.getEstablecimiento());
            preparada.setString(7, gasto.getKilometros());
          
            preparada.executeUpdate();
            conexion.commit();
        } catch (SQLException ex) {
            try {
                if (conexion != null) {
                    conexion.rollback();
                }
            } catch (SQLException ex1) {
                Logger.getLogger(VehiculoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(VehiculoDAO.class.getName()).log(Level.SEVERE, null, ex);
            retorno = false;
        } finally {
            closeConnection();
        }
        return retorno;
    }
    
    
    
    

    @Override
    public List<Gasto> getGastoByCondicion(String[] registros) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Gasto gasto) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void closeConnection() {
              if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(VehiculoDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    
    
}
