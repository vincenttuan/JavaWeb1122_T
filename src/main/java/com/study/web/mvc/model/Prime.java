package com.study.web.mvc.model;

public class Prime {
    public boolean isPrime(int n) {
        if (n <= 1) return false;
        
        // Java 7
        for(int i=2;i<n/2;i++) {
            if(n % i == 0) {
                return false;
            }
        }
        return true;
        
    }
}
