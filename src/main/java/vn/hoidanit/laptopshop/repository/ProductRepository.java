package vn.hoidanit.laptopshop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.hoidanit.laptopshop.domain.Product;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product save(Product product);

    void deleteProductById(long id);

    List<Product> findAll();

    Page<Product> findAll(Pageable pageable);
}
