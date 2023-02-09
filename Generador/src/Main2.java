import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Scanner;

public class Main2 {

    public static String nombreDominio = "hotel";

    public static void main(String ars[]){

        try {
            Scanner sc = new Scanner(System.in);
            Generador g = new Generador();
            System.out.println("¿Que extension quieres utilizar?");
            System.out.println("0 - NIVEL BASE");
            System.out.println("1 - EXTENSION 1,3,4");
            System.out.println("2 - EXTENSION 2");
            int extension = sc.nextInt();
            while (extension < 0 || extension > 3) {
                System.out.println("¡No es una extension posible!");
                System.out.println("¿Que extension quieres utilizar?");
                System.out.println("0 - NIVEL BASE");
                System.out.println("1 - EXTENSION 1,3,4");
                System.out.println("2 - EXTENSION 2");
                extension = sc.nextInt();
            }
            for(int i=1;i<=10;i++) {
                String nombreJp = "JDPA" + extension + "_" + i;
                String ruta = nombreJp + ".pddl";
                String contenido = g.generate(nombreJp, nombreDominio, extension, i);
                File file = new File(ruta);
                // Si el archivo no existe es creado
                if (!file.exists()) {
                    file.createNewFile();
                }
                FileWriter fw = new FileWriter(file);
                BufferedWriter bw = new BufferedWriter(fw);
                bw.write(contenido);
                bw.close();
            }
            System.out.println("Gracias por utilizar nuestro generador");
        } catch (Exception e) {
            System.out.println("Algo fue mal...");
            e.printStackTrace();
        }
    }
}
