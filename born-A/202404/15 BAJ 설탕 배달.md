```java
import java.io.*;

public class Main {
    
    public static void main(String[] args) throws IOEXception {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int sugar = Integer.parseInt(br.readLine());

        int count = 0;

        while(sugar > 0) {
            if(sugar % 5 == 0) {
                count += sugar / 5;
                System.out.println(count);
                return ;
            }
            if(sugar < 3) {
                System.out.println(-1);
                return ;
            }
            sugar-=3;
            count++;
        }

        System.out.println(count);
        
    }
}
```
