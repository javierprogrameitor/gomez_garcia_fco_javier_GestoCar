
package es.gestocar.dao;

import es.gestocar.beans.Usuario;
import java.util.List;

/**
 *
 * @author javier
 */
public interface IUsuarioDAO {
    
    
       /**
     * Añade un nuevo usuario
     * @param usuario Objeto que recibe como parámetro con los valores a añadir
     */
    public void add(Usuario usuario);
    
    /**
     * Obtiene todos los usuarios
     * @return Lista de objetos usuario
     */
    public List<Usuario> getUsuarios();
    
    /**
     * Obtiene un objeto usuario a partir de su id
     * @param id Identificativo del usuario que se pretende obtener
     * @return Objeto usuario
     */
    public Usuario getUsuarioById(int id);
    
    /**
     * Actualiza un usuario
     * @param usuario Objeto que recibe como parámetro con los valores para actualizar
     */
    public void update(Usuario usuario);
    
    /**
     * Obtiene los usuarios cuyo id está dentro de un rango de valores
     * @param registros Valores de los diferentes id que se pretenden obtener
     * @return Lista de objetos usuario
     */
    public List<Usuario> getUsuariosByCondicion (String[] registros);
    
    /**
     * Elimina un usuario
     * @param usuario Objeto usuario que se pretende eliminar
     */
    public void delete(Usuario usuario);
    /**
     * 
     * @param usuarioId
     * @param campoBaja
     * @return 
     */
      public boolean updateUsuarioCampoBaja(int idUsuario, boolean estado);
    /**
     * Abandona el hilo de la conexión a la base de datos
     */
    public void closeConnection();
    
    
}
