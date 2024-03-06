package vn.hoidanit.laptopshop.domain;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private long id;
    private double totalPrice;
//User id
}
