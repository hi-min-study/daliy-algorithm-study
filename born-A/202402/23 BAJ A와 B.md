```java
import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder(br.readLine());
        StringBuilder st = new StringBuilder(br.readLine());

        while (sb.length() < st.length()) {
            if (st.charAt(st.length() - 1) == 'A') {
                st.deleteCharAt(st.length() - 1);
            }else if (st.charAt(st.length() - 1) == 'B') {
                st.deleteCharAt(st.length() - 1);
                st.reverse();
            }
        }

        System.out.println(st.toString().equals(s.toString()) ? 1 : 0);
    }
}
```
