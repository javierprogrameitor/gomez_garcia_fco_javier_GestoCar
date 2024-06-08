
package es.gestocar.dao;

import es.gestocar.beans.Usuario;
import static es.gestocar.dao.ConnectionFactory.conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 *
 * @author javier
 */
public class UsuarioDAO implements IUsuarioDAO {

  
    @Override
    public void add(Usuario usuario) {

        //Método para insertar usuarios en gestocardb
        
        Connection conexion = null;
        String sql = "INSERT INTO usuarios (nombre,apellidos,email,password,dni) VALUES (?,?,?,?,?)";
        try {
            conexion = ConnectionFactory.getConnection();
            conexion.setAutoCommit(false);

            PreparedStatement preparada = conexion.prepareStatement(sql);
            preparada.setString(1, usuario.getNombre());
            preparada.setString(2, usuario.getApellidos());
            preparada.setString(3, usuario.getEmail());
            preparada.setString(4, usuario.getPassword());
            preparada.setString(5, usuario.getDni());

            preparada.executeUpdate();
            conexion.commit();
        } catch (SQLException ex) {
            try {
                conexion.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            this.closeConnection();
        }

    }
    
    
    //Método para combrobar si exite el email en la base de datos gestocardb..
    // en caso de que exista creo el atributo de sesion....
    
      public Usuario authenticate(String nombre, String email) {
        Usuario usuario = null;
        String sql = "SELECT idusuarios FROM usuarios WHERE nombre = ? AND email = ?";

        try {
            Connection conexion = ConnectionFactory.getConnection();
            PreparedStatement preparada = conexion.prepareStatement(sql);
            preparada.setString(1, nombre);
            preparada.setString(2, email);
            ResultSet resultSet = preparada.executeQuery();

        
            if (resultSet.next()) {
            usuario = new Usuario();
            usuario.setIdUsuario(resultSet.getInt("idusuarios"));
            // Puedes establecer otros atributos del usuario aquí si es necesario
        }
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection(); // Asegúrate de tener un método closeConnection adecuado
        }

        return usuario;
    }


    @Override
    public List<Usuario> getUsuarios() {
        return null;
    }

    @Override
    public Usuario getUsuarioById(int id) {

        return null;
    }

    @Override
    public void update(Usuario usuario) {

    }

    @Override
    public List<Usuario> getUsuariosByCondicion(String[] registros) {

        return null;
    }

    @Override
    public void delete(Usuario usuario) {

    }

    @Override
    public void closeConnection() {
        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
