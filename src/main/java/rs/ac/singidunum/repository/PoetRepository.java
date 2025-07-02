package rs.ac.singidunum.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import rs.ac.singidunum.entity.Poet;

@Repository
public interface PoetRepository extends JpaRepository<Poet, Integer> {
}
