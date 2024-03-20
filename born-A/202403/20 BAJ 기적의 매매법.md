```java
import java.util.*;
import java.io.*;

public class Main {
    static int origin = 0;
    static int[] ducks;
    static int jR, sR = 0;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        origin = Integer.parseInt(br.readLine());
        StringTokenizer st = new StringTokenizer(br.readLine());

        ducks = new int[14];
        for(int i = 0; i < 14; i++) {
            ducks[i] = Integer.parseInt(st.nextToken());
        }

        calJun(ducks);
        calSung(ducks);

        if(jR > sR) {
            System.out.println("BNP");
        }else if(sR > jR) {
            System.out.println("TIMING");
        }else {
            System.out.println("SAMESAME");
        }
    }

    static void calJun(int[] ducks) {
        int m = origin;
        int h = 0;
        for(int i = 0; i < 14; i++) {
            if(ducks[i] <= m) {
                h += m / ducks[i];
                m %= ducks[i];
            }
        }

        jR = m + ducks[13] * h;
    }

    static void calSung(int[] ducks) {
        int m = origin;
        int h = 0;

        for(int i = 3; i < 14; i++) {
            if(m >= ducks[i]) {
                if(ducks[i-1] < ducks[i-2] && ducks[i-2] < ducks[i-3]) {
                    h += m / ducks[i];
                    m %= ducks[i];
                }
            }

            if(ducks[i-1] > ducks[i-2] && ducks[i-2] > ducks[i-3]) {
                m += ducks[i] * h;
                h = 0;
            }

        }

        sR = m + ducks[13] * h;
    }
}
```
