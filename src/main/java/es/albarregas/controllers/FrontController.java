package es.albarregas.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author javier
 */
@WebServlet(name = "FrontController", urlPatterns = {"/FrontController"})
public class FrontController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "index.jsp";
        if (request.getParameter("boton") != null) {

            String invitado = request.getParameter("invitado");
            String administrador = request.getParameter("administrador");
            String logeado = request.getParameter("logeado");
            
             String opcion = request.getParameter("boton");

            switch (opcion) {

                case "invitado":

                    url = "JSP/invitado.jsp";
                    break;

                case "administrador":

                    
                     url = "JSP/administrador.jsp";
                    break;

                case "logeado":
                    
                    
                     url = "JSP/logeado.jsp";
                    break;
            }

        } else {
            url = "index.jsp";
        }
        request.getRequestDispatcher(url).forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
