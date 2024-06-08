
package es.gestocar.controllers;

import es.gestocar.beans.Usuario;
import es.gestocar.dao.UsuarioDAO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author javier
 */
@WebServlet(name = "LogeadoController", urlPatterns = {"/LogeadoController"})
public class LogeadoController extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");

        String url = "index.jsp";
         if (request.getParameter("boton").equals("Iniciar")) {
     

            url = "JSP/usuario.jsp";

            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario usuario = usuarioDAO.authenticate(nombre, email);

            if (usuario != null) {
                HttpSession session = request.getSession();
                session.setAttribute("usuarioId", usuario.getIdUsuario());
                response.sendRedirect("JSP/usuario.jsp");
                return;
            } else {
                response.sendRedirect("JSP/logeado.jsp");
                return;
            }
        }

 
        request.getRequestDispatcher(url).forward(request, response);
    }

}
