package es.gestocar.controllers;

import es.gestocar.beans.Gasto;
import es.gestocar.beans.Vehiculo;

import es.gestocar.dao.IGastoDAO;
import es.gestocar.dao.IVehiculoDAO;

import es.gestocar.daofactory.DAOFactory;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

/**
 *
 * @author javier
 */
@WebServlet(name = "gastoController", urlPatterns = {"/gastoController"})
public class gastoController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "JSP/usuario.jsp";
        HttpSession session = request.getSession();

        int usuarioId = (int) session.getAttribute("usuarioId");
        String action = request.getParameter("boton");

        DAOFactory daof = DAOFactory.getDAOFactory();
        IVehiculoDAO vehiculoDAO = daof.getVehiculoDAO();

        if ("insertarGasto".equals(action)) {
            List<Vehiculo> vehiculos = vehiculoDAO.getVehiculosByUsuarioId(usuarioId);
            request.setAttribute("vehiculos", vehiculos);
            request.getRequestDispatcher("JSP/listarGasto.jsp").forward(request, response);
        } else if ("listarGasto".equals(action)) {
            
           int idvehiculo = Integer.parseInt(request.getParameter("idvehiculo"));
            request.setAttribute("idvehiculo", idvehiculo); // Pasar el id del vehículo a la siguiente página
            request.getRequestDispatcher("JSP/crearGasto.jsp").forward(request, response);
        }else if ("crearGasto".equals(action)) {
            
            Gasto gasto = new Gasto();
            Boolean error = false;

            IGastoDAO adao = daof.getGastoDAO();

            // Registrar un convertidor de fecha para el formato esperado
            DateConverter converter = new DateConverter(null);
            converter.setPattern("yyyy-MM-dd");
            ConvertUtils.register(converter, Date.class);

            try {
                BeanUtils.populate(gasto, request.getParameterMap());
                gasto.setIdVehiculo(Integer.parseInt(request.getParameter("idvehiculo")));

                if (!adao.add(gasto)) {
                    error = true;
                }
            } catch (IllegalAccessException | InvocationTargetException ex) {
                Logger.getLogger(gastoController.class.getName()).log(Level.SEVERE, null, ex);
                error = true;
            }

            if (error) {
                request.setAttribute("errorMessage", "Error al crear el gasto.");
            }

            request.getRequestDispatcher(url).forward(request, response);
        }
    }
}
