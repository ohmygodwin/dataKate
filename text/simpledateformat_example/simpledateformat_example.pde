import java.util.Date;
import java.text.SimpleDateFormat;

SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

try {
  Date d = sdf.parse("11/3/2014");
  println(d);
} catch (Exception e) {
  println("Error parsing date.");
}
