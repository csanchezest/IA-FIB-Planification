import com.sun.source.tree.ReturnTree;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.ThreadLocalRandom;

public class Generador {

    public Integer extension;
    public Scanner sc = new Scanner(System.in);
    public ArrayList<Dia> dias = new ArrayList<>();
    public ArrayList<Habitacion> habitaciones = new ArrayList<>();
    public ArrayList<Reserva> reservas =  new ArrayList<>();


    private String generarDefineModule(String nombreProblema, String nombreDominio) {

        String content = "(define (problem " + nombreProblema + ")\n";
        content += "(:domain " + nombreDominio + ")\n";
        content += "(:objects \n";
        for (Dia d: dias) content += (d.name + " ");
        content += "- dias\n";
        for (Habitacion h: habitaciones) content += (h.name + " ");
        content += "- habitacion\n";
        for (Reserva r: reservas) content += (r.name + " ");
        content += "- reserva\n";
        content += ")\n";
        content += "\n";
        return content;
    }

    private String generarInitModule() {
        String content = "(:init\n";

        for (Dia d: dias) content += ("(= (get-value " + d.name + ") " + d.value + ")");
        content += "\n";
        content += "\n";
        if(extension != 0) content += "(= (total-cost) 0)\n";
        content += "\n";


        for (Reserva r: reservas) {
            int startDay = ThreadLocalRandom.current().nextInt(1, 31);
            int endDay = ThreadLocalRandom.current().nextInt(startDay, 31);
            int capacityR = ThreadLocalRandom.current().nextInt(1, 5);
            int preferenciaR = ThreadLocalRandom.current().nextInt(1, 5)*10;
            content += ("(= (init-day " + r.name + ") " + startDay + ")\n");
            content += ("(= (end-day " + r.name + ") " + endDay + ")\n");
            content += ("(= (capacityR " + r.name + ") " + capacityR + ")\n");
            if (extension == 2) content += ("(= (get-preferencia " + r.name + ") " + preferenciaR + ")\n");
            content += "\n";

        }
        content += "\n";
        for (Habitacion h: habitaciones) {
            int capacityH = ThreadLocalRandom.current().nextInt(1, 5);
            int preferenciaH = ThreadLocalRandom.current().nextInt(1, 5)*10;
            content += ("(= (capacityH " + h.name + ") " + capacityH + ")\n");
            if (extension == 2) content += ("(= (get-orientacion " + h.name + ") " + preferenciaH + ")\n");
            content += "\n";
        }

        content += ")\n";
        content += "\n";

        return content;
    }

    private String generarGoalModule() {
        System.out.println("Generando goal ...");
        String content = "(:goal (forall (?r - reserva) (or (reservado ?r) (incompatible ?r))))\n";
        content += "\n";
        return content;
    }
    private String generarBasicGoalModule() {
        System.out.println("Generando goal ...");
        String content = "(:goal (forall (?r - reserva) (reservado ?r)))\n";
        content += "\n";
        return content;
    }

    private String generarMetricModule() {
        System.out.println("Generando metric ...");
        String content = "(:metric minimize (total-cost))\n";
        content += "\n";
        return content;
    }


    private void generarDias() {
        System.out.println("Generando dias...");
        dias.clear();
        for (int i = 1; i <= 30; ++i) {
            Dia d = new Dia(i);
            dias.add(d);
        }

        System.out.println("Fin de la generación de dias");
    }

    private void generarHabitaciones() {
        System.out.println("¿Cuantas habitaciones quieres generar?");
        int numHab = sc.nextInt();
        while (numHab <= 0) {
            System.out.println("Se tiene que generar mínimo una habitación");
            numHab = sc.nextInt();
        }
        System.out.println("Se van a generar " + numHab + " habitaciones");
        for (int i = 1; i <= numHab; ++i) {
            Habitacion h = new Habitacion(i);
            habitaciones.add(h);
        }
        System.out.println("Fin de la generación de habitaciones");

    }

    private void generarReservas() {
        System.out.println("¿Cuantas reservas quieres generar?");
        int numR = sc.nextInt();
        while (numR <= 0) {
            System.out.println("Se tiene que generar mínimo una reserva");
            numR = sc.nextInt();
        }
        System.out.println("Se van a generar " + numR + " reservas");
        for (int i = 1; i <= numR; ++i) {
            Reserva r = new Reserva(i);
            reservas.add(r);
        }
        System.out.println("Fin de la generación de reservas");

    }

    private void generarHabitacionesAleatorio(int k) {
        habitaciones.clear();
        for (int i = 1; i <= k; ++i) {
            Habitacion h = new Habitacion(i);
            habitaciones.add(h);
        }
    }

    private void generarReservasAleatorio(int k) {
        reservas.clear();
        for (int i = 1; i <= k; ++i) {
            Reserva r = new Reserva(i);
            reservas.add(r);
        }
    }

    public String generate(String nombreJp, String nombreDominio, int extension, int it) {
        this.extension = extension;

        generarDias();
        generarHabitacionesAleatorio(it);
        generarReservasAleatorio(it*2);


        String defineModule = generarDefineModule(nombreJp, nombreDominio);
        String initModule = generarInitModule();
        String goalModule = "";

        if (extension == 0) goalModule = generarBasicGoalModule();
        else goalModule = generarGoalModule();
        String metricModule = "";
        if (extension != 0) metricModule = generarMetricModule();
        String contenido = defineModule + initModule + goalModule + metricModule;
        contenido += ")\n";

        return contenido;
    }

    public String generate(String nombreJp, String nombreDominio, int extension) {
        this.extension = extension;

        generarDias();
        generarHabitaciones();
        generarReservas();


        String defineModule = generarDefineModule(nombreJp, nombreDominio);
        String initModule = generarInitModule();
        String goalModule = "";

        if (extension == 0) goalModule = generarBasicGoalModule();
        else goalModule = generarGoalModule();
        String metricModule = "";
        if (extension != 0) metricModule = generarMetricModule();
        String contenido = defineModule + initModule + goalModule + metricModule;
        contenido += ")\n";

        return contenido;
    }

}
