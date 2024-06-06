
package es.gestocar.dao;

import es.gestocar.beans.Foto;
import es.gestocar.beans.Vehiculo;
import java.util.List;

/**
 *
 * @author javier
 */
public interface IFotoDAO {
    
     /**
     * Obtiene las fotos cuyo id está dentro de un rango de valores
     * @param registros Valores de los diferentes id que se pretenden obtener
     * @return Lista de objetos fotos
     */
    public List<Vehiculo> getFotosByCondicion (String[] registros);
    
    /**
     * Elimina una foto de un vehiculo
     * @param foto Objeto foto que se pretende eliminar
     */
    public void delete(Foto foto);
    
    /**
     * Abandona el hilo de la conexión a la base de datos
     */
    public void closeConnection();
    
    
}
