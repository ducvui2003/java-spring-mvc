package vn.hoidanit.laptopshop.domain.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.hoidanit.laptopshop.service.validator.RegisterChecked;

@Data
@NoArgsConstructor
@RegisterChecked
public class RegisterDTO {
    @Size(min=3, message = "First name must be at least 3 characters long")
    private String firstName;
    private String lastName;
    @Email(message = "Invalid email", regexp = "/^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$/")
    private String email;
    @Size(min=8, message = "Password must be at least 8 characters long")
    private String password;
    private String confirmPassword;
}
