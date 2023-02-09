public class Habitacion {

    public String name;

    public Habitacion(Integer numHab) {
        this.name = "A";
        if (numHab <= 9) this.name += "0";
        this.name += numHab.toString();
    }
}
