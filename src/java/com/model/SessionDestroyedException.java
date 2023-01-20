package com.model;

import javax.servlet.ServletException;

public class SessionDestroyedException extends ServletException{
    
    public  SessionDestroyedException(){
        super("Invalid Session!");
    }
}
