package rs.ac.singidunum.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import rs.ac.singidunum.entity.PoemRequest;
import rs.ac.singidunum.repository.PoemRequestRepository;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping(path ="/api/poemRequest")
@CrossOrigin
@RequiredArgsConstructor

public class PoemRequestController {

    private final PoemRequestRepository repository;

    @GetMapping
    public List<PoemRequest> getPoemRequest()
    {
        return repository.findAllByDeletedAtIsNull();
    }


    @GetMapping(path = "/{id}")
    public ResponseEntity<PoemRequest> getPoemRequestById(@PathVariable Integer id)
    {
        return ResponseEntity.of(repository.findById(id));
    }

    @PostMapping
    public PoemRequest savePoemRequest(@RequestBody PoemRequest model)
    {
        PoemRequest poemRequest = new PoemRequest();
        poemRequest.setPoemTheme(model.getPoemTheme());
        poemRequest.setAdditionalNote(model.getAdditionalNote());
        poemRequest.setCustomer(model.getCustomer());
        poemRequest.setPoet(model.getPoet());
        poemRequest.setCreatedAt(LocalDateTime.now());

        return repository.save(poemRequest);
    }

    @PutMapping(path = "/{id}")
    public PoemRequest updatePoemRequest(@PathVariable Integer id,@RequestBody PoemRequest model)
    {
        PoemRequest poemRequest = repository.findById(id).orElseThrow();
        poemRequest.setPoemTheme(model.getPoemTheme());
        poemRequest.setAdditionalNote(model.getAdditionalNote());
        poemRequest.setUpdatedAt(LocalDateTime.now());
        return repository.save(poemRequest);
    }

    @DeleteMapping(path = "/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deletePoemRequest(@PathVariable Integer id)
    {
        PoemRequest poemRequest = repository.findById(id).orElseThrow();
        poemRequest.setDeletedAt(LocalDateTime.now());
        repository.save(poemRequest);

    }


}
