package vn.hoidanit.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import vn.hoidanit.laptopshop.model.User;

@Controller
public class UserController {

    @RequestMapping("/")
    public String getHomePage() {
        return "client/signIn";
    }
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUser(Model model ,@ModelAttribute("newUser") User user){
        model.addAttribute("user", new User());
        return "/admin/user/create";
    }
}
