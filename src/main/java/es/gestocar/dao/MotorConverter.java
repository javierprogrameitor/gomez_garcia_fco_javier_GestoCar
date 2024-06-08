
package es.gestocar.dao;

import es.gestocar.beans.Vehiculo;
import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.beanutils.Converter;

/**
 *
 * @author javier
 */
public class MotorConverter implements Converter {
    
        @Override
    public Object convert(Class type, Object value) {
        if (value == null) {
            throw new ConversionException("No value specified");
        }

        if (type == Vehiculo.Motor.class) {
            return Vehiculo.Motor.valueOf(value.toString().toUpperCase());
        } else {
            throw new ConversionException("Could not convert " + value + " to " + type.getName());
        }
    }
    
}
