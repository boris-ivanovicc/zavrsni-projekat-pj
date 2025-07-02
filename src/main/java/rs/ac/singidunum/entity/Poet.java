package rs.ac.singidunum.entity;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Entity
@Table(name = "poet")
@NoArgsConstructor
@Getter
@Setter

public class Poet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column (name ="poet_id")
    private Integer id;

    @Column(nullable = false)
    private String poetName;


}
