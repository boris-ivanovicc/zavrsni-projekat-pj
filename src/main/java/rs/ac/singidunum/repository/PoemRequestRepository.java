package rs.ac.singidunum.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import rs.ac.singidunum.entity.PoemRequest;

import java.util.List;

@Repository
public interface PoemRequestRepository  extends JpaRepository<PoemRequest, Integer> {
    List<PoemRequest> findAllByDeletedAtIsNull();
}
