package es.gestocar.beans;
/**
 *
 * @author javier
 */
public class Foto {
    
    private Short idFoto;
    private String foto;
    private Vehiculo vehiculo;

    public Short getIdFoto() {
        return idFoto;
    }

    public void setIdFoto(Short idFoto) {
        this.idFoto = idFoto;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public Vehiculo getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(Vehiculo vehiculo) {
        this.vehiculo = vehiculo;
    }
    
    

}
