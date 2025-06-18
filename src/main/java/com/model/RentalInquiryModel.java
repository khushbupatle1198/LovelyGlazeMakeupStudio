package com.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "tb_rental_inquiry")
public class RentalInquiryModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    // Assuming there's a product ID coming as foreign key
    @ManyToOne
    @JoinColumn(name = "productid", nullable = false)
    private RentalGalleryModel productid; // Make sure ProductModel is your product entity

    @Column(name = "full_name", nullable = false)
    private String fullName;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "mobile", nullable = false)
    private String mobile;

    @Column(name = "address", nullable = false, length = 500)
    private String address;

    @Column(name = "message", length = 1000)

    private String message;

    @Column(nullable = false)
    private String status = "PENDING"; // PENDING, CONFIRMED, CANCELLED

    @Column(name = "inquiry_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date inquiryDate = new Date();

    // Getters and Setters

    public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }



    public RentalGalleryModel getProductid() {
		return productid;
	}

	public void setProductid(RentalGalleryModel productid) {
		this.productid = productid;
	}

	public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}




}
