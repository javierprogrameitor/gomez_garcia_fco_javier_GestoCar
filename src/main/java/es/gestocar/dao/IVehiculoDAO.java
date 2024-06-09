
package es.gestocar.dao;

import es.gestocar.beans.Vehiculo;
import java.util.List;

/**
 *
 * @author javier
 */
public interface IVehiculoDAO {
    
       /**
     * Añade un vehiculo
     * @param vehiculo
     * @return Objeto Boolean, TRUE si todo ha ido bien y FALSE en caso contrario
     */
    public Boolean add(Vehiculo vehiculo);
    
    /**
     * Actualiza un vehiculo
     * @param vehiculo
     * @return Objeto Boolean, TRUE si todo ha ido bien y FALSE en caso contrario
     */
    public void update(Vehiculo vehiculo);
    
    /**
     * 
     * @param usuarioId
     * @return 
     */
    List<Vehiculo> getVehiculosByUsuarioId(int usuarioId);
    
    /**
     * Obtiene un vehiculo y sus fotos asociadas a partir de un id
     * @param id
     * @return Objeto vehiculo con sus fotos asociadas
     */
    public Vehiculo getVehiculoById(int id);
  
    /**
     * Elimina un vehiculo y sus fotos asociadas
     * @param vehiculo
     */
    public void delete(int idVehiculo);
    
    /**
     * Abandona el hilo de la conexión a la base de datos
     */
    public void closeConnection();
    
    
}
