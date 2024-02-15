package vn.hoidanit.laptopshop;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/")
    public String index() {
        return "Hello World from Spring Boot!";
    }

    @GetMapping("/guest")
    public String guest() {
        return "Hello World from Spring Boot! (Guest)";
    }

    @GetMapping("/admin")
    public String admin() {
        return "Hello World from Spring Boot! (Admin)";
    }
}
