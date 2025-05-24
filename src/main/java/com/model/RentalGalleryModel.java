package com.model;

import javax.persistence.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
@Table(name = "tbl_rental_gallery")
public class RentalGalleryModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "image_name")
    private String imageName;

    @Column(length = 1000)
    private String description;

    private String filename;

    // Many-to-One with GalleryCategory (category_id as FK)
    @ManyToOne
    @JoinColumn(name = "category_id")
    private GalleryCategory category;

    // These are not persisted in the database
    @Transient
    private int categoryId;

    @Transient
    private String newCategory;

    @Transient
    private CommonsMultipartFile multipartFile;

    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getImageName() {
        return imageName;
    }
    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public String getFilename() {
        return filename;
    }
    public void setFilename(String filename) {
        this.filename = filename;
    }

    public GalleryCategory getCategory() {
        return category;
    }
    public void setCategory(GalleryCategory category) {
        this.category = category;
    }

    public int getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getNewCategory() {
        return newCategory;
    }
    public void setNewCategory(String newCategory) {
        this.newCategory = newCategory;
    }

    public CommonsMultipartFile getMultipartFile() {
        return multipartFile;
    }
    public void setMultipartFile(CommonsMultipartFile multipartFile) {
        this.multipartFile = multipartFile;
    }
}

