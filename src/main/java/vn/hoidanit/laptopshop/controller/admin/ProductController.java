package vn.hoidanit.laptopshop.controller.admin;

import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/product")
public class ProductController {
    private final ProductService userService;
    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(ProductService userService, UploadService uploadService, ProductService productService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.productService = productService;
    }

    //Datatable
    @GetMapping()
    public String getProductPage(Model model, @RequestParam(name = "page") Optional<String> pageOptional) {
        int page = pageOptional.map(Integer::parseInt).orElse(1);
        Pageable pageable = PageRequest.of(page - 1, 2);
        Page<Product> products = this.productService.fetchProducts(pageable);
        List<Product> listProducts = products.getContent();
        model.addAttribute("products", listProducts);
        model.addAttribute("totalPages", products.getTotalPages());
        model.addAttribute("currentPage", page);
        return "/admin/product/datatable";
    }

    //  View
    @GetMapping("/{id}")
    public String getViewProductPage(Model model, @PathVariable long id) {
        Product product = this.userService.getProductById(id);
        model.addAttribute("product", product);
        return "/admin/product/view";
    }

    //Create
    @GetMapping("/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "/admin/product/create";
    }

    @PostMapping("/create")
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


    //    Update
    @GetMapping("/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product product = this.userService.getProductById(id);
        model.addAttribute("product", product);
        return "/admin/product/update";
    }

    @PostMapping("/update")
    public String updateProduct(Model model,
                                @ModelAttribute("product") @Valid Product product,
                                BindingResult newProductBindingResult,
                                @RequestParam("file") MultipartFile file) {

        if (newProductBindingResult.hasErrors()) {
            return "/admin/product/update";
        }
        Product productExist = productService.getProductById(product.getId());
        if (!file.isEmpty()) {
            String image = this.uploadService.handleSaveUploadFile(file, "product");
            productExist.setImage(image);
        }
        productExist.setName(product.getName());
        productExist.setPrice(product.getPrice());
        productExist.setDetailDesc(product.getDetailDesc());
        productExist.setShortDesc(product.getShortDesc());
        productExist.setQuantity(product.getQuantity());
        productExist.setTarget(product.getTarget());
        productExist.setFactory(product.getFactory());
        productService.handleSaveProduct(productExist);
        return "redirect:/admin/product";
    }
}
