public class Dia {

    public String name;
    public int value;

    public Dia(Integer val) {
        this.value = val;
        this.name = ("d" +  val.toString());
    }
}
