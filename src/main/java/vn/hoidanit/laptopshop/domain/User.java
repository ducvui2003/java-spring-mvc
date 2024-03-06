package vn.hoidanit.laptopshop.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String email;
    private String password;
    @Column(name = "full_name")
    private String fullName;
    private String address;
    private String phone;
    private String avatar;

//    role Id
}
