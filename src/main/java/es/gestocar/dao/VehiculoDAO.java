package es.gestocar.dao;

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
 * @autor javier
 */
public class VehiculoDAO implements IVehiculoDAO {

    private Connection conexion;

    @Override
    public Boolean add(Vehiculo vehiculo) {
        Boolean retorno = true;
        String sql = "INSERT INTO vehiculos (idusuario, marca, modelo, motor, matricula, cilindrada, caballos, color, fechacompra, fechaventa, preciocompra, precioventa)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {

            conexion = ConnectionFactory.getConnection();
            conexion.setAutoCommit(false);
            PreparedStatement preparada = conexion.prepareStatement(sql);
            preparada.setInt(1, vehiculo.getUsuarioId());
            preparada.setString(2, vehiculo.getMarca());
            preparada.setString(3, vehiculo.getModelo());
            preparada.setString(4, vehiculo.getMotor().name()); // Asumiendo que motor es un String
            preparada.setString(5, vehiculo.getMatricula());
            preparada.setString(6, vehiculo.getCilindrada());
            preparada.setString(7, vehiculo.getCaballos());
            preparada.setString(8, vehiculo.getColor());
            preparada.setDate(9, vehiculo.getFechaCompra() != null ? new Date(vehiculo.getFechaCompra().getTime()) : null);
            preparada.setDate(10, vehiculo.getFechaVenta() != null ? new Date(vehiculo.getFechaVenta().getTime()) : null);
            preparada.setDouble(11, vehiculo.getPreciocompra() != null ? vehiculo.getPreciocompra() : 0.0);
            preparada.setDouble(12, vehiculo.getPrecioventa() != null ? vehiculo.getPrecioventa() : 0.0);

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
    public Boolean update(Vehiculo vehiculo) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<Vehiculo> getArticulos() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Vehiculo getVehiculoById(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<Vehiculo> getArticulosByCondicion(String[] registros) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(Vehiculo vehiculo) {
        throw new UnsupportedOperationException("Not supported yet.");
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
