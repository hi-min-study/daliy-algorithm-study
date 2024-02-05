```java
import java.io.*
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        StringTokenizer st = new StringTokenizer(br.readLine());
        long x = Long.parseLong(st.nextToken());
        long y = Long.parseLong(st.nextToken());
        long w = Long.parseLong(st.nextToken()); 
        long s = Long.parseLong(st.nextToken());  

        long temp1,temp2,temp3;

        temp1 = (x+y) * w;
        temp2 = 0;

        if((x+y) % 2 == 0){
                temp2 = Math.max(x,y) * s;
        }else{
            temp2 = (Math.max(x,y) - 1) * s + w;
        }

        temp3 = (Math.min(x, y))*s+(Math.abs(x-y))*w;

        System.out.println(Math.min(temp1, Math.min(temp2, temp3)));
    }
}
```
