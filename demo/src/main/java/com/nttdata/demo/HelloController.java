package com.nttdata.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String sampleFun() {
        return "This is a java app to show certificate renewal";
    }
}
