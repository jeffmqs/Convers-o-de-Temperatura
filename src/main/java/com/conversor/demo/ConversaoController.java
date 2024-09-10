package com.conversor.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ConversaoController {

    @GetMapping("/celsiusParaFahrenheit")
    public String celsiusParaFahrenheit(@RequestParam double grau) {
        double fahrenheit = (grau * 9/5) + 32;
        return String.format("%.2f graus Celsius são %.2f graus Fahrenheit", grau, fahrenheit);
    }

    @GetMapping("/fahrenheitParaCelsius")
    public String fahrenheitParaCelsius(@RequestParam double grau) {
        double celsius = (grau - 32) * 5/9;
        return String.format("%.2f graus Fahrenheit são %.2f graus Celsius", grau, celsius);
    }
}
