
package es.gestocar.models;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author javier
 */
public class Utilidades {
    
    /**
     * Elimina los atributos de sesión
     * @param request Objeto HttpServletRequest necesario para eliminar los atributos
     */
    public static void limpiarSesion(HttpServletRequest request) {
        
        if (request.getSession().getAttribute("usuario") != null) {
            request.getSession().removeAttribute("usuario");
        }
        if (request.getSession().getAttribute("fotosEliminar") != null) {
            request.getSession().removeAttribute("fotosEliminar");
        }
        if (request.getSession().getAttribute("vehiculos") != null) {
            request.getSession().removeAttribute("vehiculos");
        }
    }
    
    /**
     * Convierte un String en un array de bytes necesario para almacenar una imagen en binario
     * @param imageName String que recibe
     * @return Array de bytes que representan la imagen
     * @throws IOException Excepción que puede lanzar
     */
    public static byte[] extractBytes(String imageName) throws IOException {
        
        File imgPath = new File(imageName);

        FileInputStream myStream = new FileInputStream(imgPath);

        return IOUtils.toByteArray(myStream);
    }
    
}
