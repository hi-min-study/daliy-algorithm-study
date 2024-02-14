```java
import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine(), " ");

        int A = Integer.parseInt(st.nextToken());
        int P = Integer.parseInt(st.nextToken());

        ArrayList<Integer> num_arr = new ArrayList<>();
        num_arr.add(A);

        while(true) {
            int new_num = nextNum(A, P);

            if(num_arr.contains(new_num)) {
                System.out.println(num_arr.indexOf(new_num)); 
                break;
            } 

            num_arr.add(new_num);
            A = new_num;
            System.out.println(num_arr);
        }
    }
    

    public static int nextNum(int A, int P) {
        int new_num = 0;
        while(A != 0) {
            new_num += Math.pow(A % 10, (double)P);
            A /= 10;
        }

        return new_num;
    }
}
```
