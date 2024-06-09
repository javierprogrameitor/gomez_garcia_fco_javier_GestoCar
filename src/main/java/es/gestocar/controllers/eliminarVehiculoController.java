/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.gestocar.controllers;

import es.gestocar.beans.Vehiculo;
import es.gestocar.dao.IVehiculoDAO;
import es.gestocar.dao.MotorConverter;
import es.gestocar.daofactory.DAOFactory;
import java.io.IOException;

import java.util.Date;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

/**
 *
 * @author javier
 */
@WebServlet(name = "eliminarVehiculoController", urlPatterns = {"/eliminarVehiculoController"})
public class eliminarVehiculoController extends HttpServlet {

    // Registro de convertidores en un bloque estático
    static {
        ConvertUtils.register(new MotorConverter(), Vehiculo.Motor.class);
        DateConverter converter = new DateConverter(null);
        converter.setPattern("yyyy-MM-dd");
        ConvertUtils.register(converter, Date.class);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        int usuarioId = (int) session.getAttribute("usuarioId");
        String action = request.getParameter("boton");
        
        DAOFactory daof = DAOFactory.getDAOFactory();
        IVehiculoDAO vehiculoDAO = daof.getVehiculoDAO();
        
        if ("eliminarVehiculo".equals(action)) {
            List<Vehiculo> vehiculos = vehiculoDAO.getVehiculosByUsuarioId(usuarioId);
            for (Vehiculo vehiculo : vehiculos) {
                System.out.println("Vehiculo ID: " + vehiculo.getIdVehiculo());
            }
            
            request.setAttribute("vehiculos", vehiculos);
            request.getRequestDispatcher("JSP/eliminarVehiculos.jsp").forward(request, response);
            
        } else if ("eliminar".equals(action)) {
            
           String idVehiculoStr = request.getParameter("seleccion");
            if (idVehiculoStr != null && !idVehiculoStr.isEmpty()) {
                int idVehiculo = Integer.parseInt(idVehiculoStr);
                vehiculoDAO.delete(idVehiculo);

                // Refrescar la lista de vehículos y volver a mostrar la página de usuario
                List<Vehiculo> vehiculos = vehiculoDAO.getVehiculosByUsuarioId(usuarioId);
                request.setAttribute("vehiculos", vehiculos);
                request.getRequestDispatcher("JSP/usuario.jsp").forward(request, response);
            } else {
                // Manejar el caso en que no se haya seleccionado ningún vehículo
                List<Vehiculo> vehiculos = vehiculoDAO.getVehiculosByUsuarioId(usuarioId);
                request.setAttribute("vehiculos", vehiculos);
                request.setAttribute("error", "Debe seleccionar un vehículo para eliminar.");
                request.getRequestDispatcher("JSP/eliminarVehiculos.jsp").forward(request, response);
            }
        }
    }
}
