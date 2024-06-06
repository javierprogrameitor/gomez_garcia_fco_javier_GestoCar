
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
    public Boolean update(Vehiculo vehiculo);
    
    /**
     * Obtiene todos los vehiculos y sus fotos asociadas
     * @return Lista de objetos artículo
     */
    public List<Vehiculo> getArticulos();
    
    /**
     * Obtiene un vehiculo y sus fotos asociadas a partir de un id
     * @param id
     * @return Objeto vehiculo con sus fotos asociadas
     */
    public Vehiculo getVehiculoById(int id);
    
    /**
     * Obtiene los vehiculos cuyo id está dentro de un rango de valores
     * @param registros
     * @return Lista de objetos vehiculos
     */
    public List<Vehiculo> getArticulosByCondicion (String[] registros);
    
    /**
     * Elimina un vehiculo y sus fotos asociadas
     * @param vehiculo
     */
    public void delete(Vehiculo vehiculo);
    
    /**
     * Abandona el hilo de la conexión a la base de datos
     */
    public void closeConnection();
    
    
}
