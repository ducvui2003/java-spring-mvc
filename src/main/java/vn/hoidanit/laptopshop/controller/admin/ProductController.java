package vn.hoidanit.laptopshop.controller.admin;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.ProductService;

import java.util.List;

//@Controller
public class ProductController {
    private final ProductService userService;
    private final UploadService uploadService;

    public ProductController(ProductService userService, UploadService uploadService) {
        this.userService = userService;
        this.uploadService = uploadService;
    }
    @GetMapping("/admin/product")
    public String getProduct() {
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @GetMapping("/admin/product/create")
    public String createProduct(Model model,
                                @ModelAttribute("newProduct") @Valid Product product,
                                BindingResult newProductBindingResult,
                                @RequestParam("file") MultipartFile file) {
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
//    return validate error
        if (newProductBindingResult.hasErrors()) {
            return "/admin/product/create";
        }
        String image = this.uploadService.handleSaveUploadFile(file, "product");
        product.setImage(image);
        this.userService.handleSaveProduct(product);
        model.addAttribute("product", new User());

        return "redirect:/admin/product";
    }
}
