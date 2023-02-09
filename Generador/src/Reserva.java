public class Reserva {

    public String name;

    public Reserva (Integer numReserva) {
        this.name = "R";
        if (numReserva <= 9) this.name += "0";
        this.name += numReserva.toString();
    }
}
