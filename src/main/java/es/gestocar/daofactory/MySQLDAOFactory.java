package es.gestocar.daofactory;

import es.gestocar.dao.FotoDAO;
import es.gestocar.dao.IFotoDAO;
import es.gestocar.dao.IUsuarioDAO;
import es.gestocar.dao.IVehiculoDAO;
import es.gestocar.dao.UsuarioDAO;
import es.gestocar.dao.VehiculoDAO;

/**
 *
 * @author javier
 */
public class MySQLDAOFactory extends DAOFactory{

 
    @Override
    public IUsuarioDAO getUsuarioDAO() {
        return new UsuarioDAO();
    }

    @Override
    public IVehiculoDAO getArticuloDAO() {
        return new VehiculoDAO();
    }

    @Override
    public IFotoDAO getFotoDAO() {
        return new FotoDAO();
    }

}
