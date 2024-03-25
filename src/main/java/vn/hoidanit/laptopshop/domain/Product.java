package vn.hoidanit.laptopshop.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
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
    @NotNull
    @Min(value = 8, message = "Name must be at least 8 characters")
    private String name;
    @NotNull
    private double price;
    @NotNull
    private String image;
    @NotNull
    private String detailDesc;
    @NotNull
    private String shortDesc;
    @NotNull
    private long quantity;
    @NotNull
    private long sold;
    @NotNull
    private String factory;
    @NotNull
    private String target;

    @OneToMany(mappedBy = "product")
    private Set<OrderDetail> orderDetails;
}
