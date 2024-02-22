package vn.hoidanit.laptopshop.model;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class User {
    private long id;
    private String email;
    private String password;
    private String fullName;
    private String phone;

}
