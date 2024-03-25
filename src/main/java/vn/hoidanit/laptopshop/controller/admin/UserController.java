package vn.hoidanit.laptopshop.controller.admin;

import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

import java.util.List;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder bCryptPasswordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder bCryptPasswordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @RequestMapping(value = "/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "/admin/user/show";
    }

    @GetMapping(value = "/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "/admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String createUser(Model model,
                             @ModelAttribute("newUser") @Valid User user,
                             BindingResult newProductBindingResult,
                             @RequestParam("file") MultipartFile file) {
        model.addAttribute("user", new User());

        if (newProductBindingResult.hasErrors()) {
            return "/admin/user/create";
        }

        String image = this.uploadService.handleSaveUploadFile(file, "user");
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setAvatar(image);
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    @GetMapping(value = "/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        if (user == null) throw new ResponseStatusException(
                HttpStatus.NOT_FOUND, "entity not found"
        );
        model.addAttribute("user", user);
        return "admin/user/show";
    }

    //    Update
    @GetMapping(value = "/admin/user/update/{id}")
    public String getUserUpdatePage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        if (user == null) throw new ResponseStatusException(
                HttpStatus.NOT_FOUND, "entity not found"
        );
        model.addAttribute("userUpdate", user);
        return "admin/user/update";
    }

    @PostMapping(value = "/admin/user/update")
    public String updateUser(Model model, @ModelAttribute("userUpdate") User user) {
        User userCurrent = this.userService.getUserById(user.getId());
        if (userCurrent != null) {
            user.setEmail(userCurrent.getEmail());
            user.setPassword(userCurrent.getPassword());
            this.userService.handleSaveUser(user);
        }
        return "redirect:/admin/user";
    }

    //Delete
    @GetMapping(value = "/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("userDelete", new User());
        return "admin/user/delete";

    }

    @PostMapping(value = "/admin/user/delete")
    public String postDelete(Model model, @ModelAttribute("userDelete") User user) {
        this.userService.deleteUser(user.getId());
        return "redirect:/admin/user";
    }
}
