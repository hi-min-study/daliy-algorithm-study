```java
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    static String str;
    static String pattern;
    static int cnt;
    
    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        str = br.readLine();
        pattern = br.readLine();
        
        for (int i = 0; i <= str.length() - pattern.length(); i++) {
            boolean check = true;
            
            for (int j = 0; j < pattern.length(); j ++) {
                if (str.charAt(i + j) != pattern.charAt(j)) {
                    check = false;
                    break;
                }
            }
            
            if(check) {
                cnt++;
                i += pattern.length() - 1;
            }
        }
        
        System.out.println(cnt);
    }
}
```
