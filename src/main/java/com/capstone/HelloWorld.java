/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.capstone;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
        
@RestController
public class HelloWorld {
    @RequestMapping("/hello")
    public String test(){
        return "HelloWorld";
    }
    
}
