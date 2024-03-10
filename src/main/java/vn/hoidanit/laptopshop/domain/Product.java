package vn.hoidanit.laptopshop.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@Entity
@Data
@NoArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private double price;
    private String image;
    private String detailDesc;
    private String shortDesc;
    private long quantity;
    private long sold;
    private String factory;
    private String target;

    @OneToMany(mappedBy = "product")
    private Set<OrderDetail> orderDetails;
}
