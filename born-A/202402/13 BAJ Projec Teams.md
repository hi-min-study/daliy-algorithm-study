```java
import java.util.*;
import java.io.*;

public class Main{
    
    public static void main(String [] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();
        static final int NUMBER_OF_TEAM = Integer.parseInt(br.readLine());
        static int member[] = new int [NUMBER_OF_TEAM * 2];
        StringTokenizer st = new StringTokenizer(br.readLine());
        
        for(int i=0;i < NUMBER_OF_TEAM * 2; i++) {
            member[i] = Integer.parseInt(st.nextToken());
        }
        
        Arrays.sort(member);
        int min = 200000;
        
        for(int i=0;i<NUMBER_OF_TEAM;i++) {
            int teamScore = member[i] + member[NUMBER_OF_TEAM*2-1-i];
            
            if(teamScore < min) {
                min = teamScore;
            }
        }
        
        sb.append(min);
        sb.append("\n"); 
        
        bw.write(sb.toString());
        
        bw.flush();
        br.close();
    }
}
```
