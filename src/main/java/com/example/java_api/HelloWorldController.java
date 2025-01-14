package com.example.java_api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController  // Marks this class as a controller for RESTful APIs
@RequestMapping("/")  // Specifies the base URL for the API
public class HelloWorldController {

    // This is a simple GET endpoint that returns a string
    @GetMapping
    public String sayHello() {
        return "Hello, World!";
    }

    // A POST endpoint that accepts data and returns a message
    @PostMapping("/greet")
    public String greet(@RequestBody String name) {
        return "Hello, " + name + "!";
    }
}
