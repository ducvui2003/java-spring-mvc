package vn.hoidanit.laptopshop.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@Entity
@Data
@NoArgsConstructor
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id ;
    private String name;
    private String description;

    @OneToMany(mappedBy = "role")
    private Set<User> users;
}
