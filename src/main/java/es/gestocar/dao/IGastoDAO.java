package es.gestocar.dao;

import es.gestocar.beans.Gasto;
import java.util.List;

/**
 *
 * @author javier
 */
public interface IGastoDAO {

    /**
     *
     * @param gasto
     * @return
     */
    public Boolean add(Gasto gasto);

    /**
     * Obtiene las fotos cuyo id está dentro de un rango de valores
     *
     * @return Lista de objetos fotos
     */
    public List<Gasto> getGastoByCondicion(String[] registros);

    /**
     * Elimina una foto de un vehiculo
     *
     * @param foto Objeto foto que se pretende eliminar
     */
    public void delete(Gasto gasto);

    /**
     * Abandona el hilo de la conexión a la base de datos
     */
    public void closeConnection();

}
