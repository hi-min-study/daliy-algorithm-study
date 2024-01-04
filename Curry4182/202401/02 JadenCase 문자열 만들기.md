```java

import java.util.*;

class Solution {
    public String solution(String s) {
        String answer = "";
        
        s = s.toLowerCase(); 
		StringTokenizer st = new StringTokenizer(s, " ", true);
        
		StringBuilder sb = new StringBuilder();
        
		while (st.hasMoreTokens()) {
			String w = st.nextToken();
			if (!w.equals(" "))
                sb.append(w.substring(0, 1).toUpperCase() + w.substring(1));
			else { 
                sb.append(w);
			}
		}
        
		return sb.toString();
    }
}

```