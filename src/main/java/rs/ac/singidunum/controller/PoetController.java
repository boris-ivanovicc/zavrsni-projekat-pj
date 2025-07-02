package rs.ac.singidunum.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import rs.ac.singidunum.entity.Poet;
import rs.ac.singidunum.repository.PoetRepository;

import java.util.List;

@RestController
@RequestMapping("/api/poet")
@CrossOrigin
@RequiredArgsConstructor
public class PoetController {
    private final PoetRepository repository;

    @GetMapping
    public List<Poet> getAllPoets()
    {
        return repository.findAll();
    }

}
