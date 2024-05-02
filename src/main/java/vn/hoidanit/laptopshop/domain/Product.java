package vn.hoidanit.laptopshop.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
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
    @NotBlank
    @Size(min = 8, message = "Name must be at least 8 characters")
    private String name;
    @NotNull
    @DecimalMin(value = "0.0", message = "Price must be greater than 0.0", inclusive = false)
    private double price;
    private String image;
    @NotNull
    @NotEmpty(message = "Detail description is required")
    private String detailDesc;
    @NotNull
    @NotEmpty(message = "Short description is required")
    private String shortDesc;
    private long quantity;
    private long sold;
    private String factory;
    private String target;

    @OneToMany(mappedBy = "product")
    private Set<OrderDetail> orderDetails;
}
