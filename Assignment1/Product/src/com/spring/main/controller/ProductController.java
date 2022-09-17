package com.spring.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.main.model.Product;
import com.spring.main.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService; 
	
	@Autowired
	private Product product;
	@RequestMapping("/")
	public String showHome() {
		return "home";
	}
	@RequestMapping("/all-products")
	public String showAllproducts(Model model) {
		//reach out to service class and fetch list having all product objects
		List<Product> list = productService.fetchAllProducts(); 
		Map<String,Object> map =new HashMap<>();
		map.put("name",product.getName());
		map.put("price", product.getPrice());
		map.put("describ",product.getDescrib());
		model.addAttribute("product", product);
		model.addAttribute("list", list);
		return "all-products";
	}
	
	@RequestMapping("/edit")
	public String editproducts(Model model) {
	
	
		return "addedit";
	}
	
	@RequestMapping("/addedit")
	public String addproducts(Model model) {
		List<Product> list = productService.fetchAllProducts();
		model.addAttribute("product", product);
		model.addAttribute("list", list);
	
		return "addedit";
	}
	@RequestMapping("/delete-product")
	public String deleteproductById(@RequestParam("id") Integer id,Model model) {
		productService.deleteProductById(id);
		
		List<Product> list = 
				productService.fetchAllProducts(); 
		model.addAttribute("list", list);
		return "redirect:redirect-product";
	}
	
	@RequestMapping("/insert-product")
	public String insertproduct(@RequestParam("ename") String name, 
							   @RequestParam("eprice") double price, 
							   @RequestParam("describ") String describ ,
							   @RequestParam("category") String category ,
							   Model model) {
		product.setName(name);
		product.setPrice(price);
		product.setDescrib(describ);
		product.setCategory(category);
		
		productService.insertProduct(product);
		
		List<Product> list = 
				productService.fetchAllProducts(); 
		model.addAttribute("list", list);
		
		return "redirect:redirect-product";
	}
	@RequestMapping("/edit-product")
	public String updateProductById(@RequestParam("id") Integer id,Model model) {
		
		List<Product> list = 
				productService.fetchAllProducts(); 
		
		for(Product p : list) {
			if(p.getId() == id) {
				product = p;
				break; 
			}
		}
		
		model.addAttribute("flag", "edit");
		model.addAttribute("product",product);
		model.addAttribute("list", list);
		return "addedit";
		
		
	}
	@RequestMapping("/edit-product-op")
	public String processEdit(@RequestParam("ename") String name, 
			   @RequestParam("eprice") double price, 
			   @RequestParam("describ") String describ,
			   @RequestParam("category") String category ,
							Model model) {
		
		product.setName(name);
		product.setPrice(price);
		product.setDescrib(describ);
		product.setCategory(category);
		
		//go to service and execute edit op.. 
		productService.processEdit(product);
		return "redirect:redirect-product";
	}
	@RequestMapping("/redirect-product")
	public String redirect(Model model) {
		product.setName("");
		product.setPrice(0);
		product.setDescrib("");
		product.setCategory("");
		List<Product> list = 
				productService.fetchAllProducts(); 
		model.addAttribute("list", list);
		return "all-products";
	}
}