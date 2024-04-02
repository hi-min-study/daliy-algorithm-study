```java
import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int X = Integer.parseInt(br.readLine()); 
        int squareCount = 1; 
        int squareSum =  0; 

        while(true){
            if(X <= squareSum + squareCount){
                if(squareCount % 2 == 1){ 
                    System.out.println((squareCount-(X - squareSum -1) + "/" + (X - squareSum)));
                    break;
                }else{
                    System.out.println((X - squareSum) + "/" + (squareCount-(X - squareSum -1)));
                    break;
                }
            }else{ 
                squareSum += squareCount;
                squareCount++; 
            }
        }

    }
}
```
