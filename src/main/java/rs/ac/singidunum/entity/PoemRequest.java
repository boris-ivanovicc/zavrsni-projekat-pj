package rs.ac.singidunum.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table (name = "poem_request")
@NoArgsConstructor
@Getter
@Setter

public class PoemRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column (name ="poem_request_id")
    private Integer id;

    @ManyToOne(optional = false)
    @JoinColumn (name = "customer_id", nullable = false)
    private Customer customer;

    @ManyToOne(optional = false)
    @JoinColumn (name = "poet_id" , nullable = false)
    private Poet poet;

    @Column(nullable = false)
    private String poemTheme;

    @Column(nullable = true)
    private String additionalNote;

    @Column(nullable = false)
    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;

    @JsonIgnore
    private LocalDateTime deletedAt;


}
