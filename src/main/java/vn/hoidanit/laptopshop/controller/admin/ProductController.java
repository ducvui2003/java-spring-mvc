package vn.hoidanit.laptopshop.controller.admin;

import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

import java.util.List;
import java.util.Optional;

@Controller
public class ProductController {
    private final ProductService userService;
    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(ProductService userService, UploadService uploadService, ProductService productService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model, @RequestParam(name = "page")Optional<String> pageOptional) {
        int page = pageOptional.map(Integer::parseInt).orElse(1);
        Pageable pageable = PageRequest.of(page - 1, 2);
        Page<Product> products = this.productService.fetchProducts(pageable);
        List<Product> listProducts = products.getContent();
        model.addAttribute("products", listProducts);
        model.addAttribute("totalPages", products.getTotalPages());
        model.addAttribute("currentPage", page);
        return "/admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "/admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(Model model,
                                @ModelAttribute("newProduct") @Valid Product product,
                                BindingResult newProductBindingResult,
                                @RequestParam("file") MultipartFile file) {

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
