package com.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
public class RentalBookingModel {

	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;
	    
	    @ManyToOne
	    @JoinColumn(name = "product_id", nullable = false)
	    private RentalGalleryModel productid;
	    
	    @Column(nullable = false)
	    private String fullName;
	    
	    @Column(nullable = false)
	    private String email;
	    
	    @Column(nullable = false)
	    private String mobile;
	    
	    @Column(nullable = false)
	    private String address;
	    
	    @Temporal(TemporalType.DATE)
	    @Column(nullable = false)
	    private Date bookingDate;
	    
	    @Column(nullable = false)
	    private String idProofPath;
	    
	    @Column(nullable = false)
	    private String status = "PENDING"; // PENDING, CONFIRMED, CANCELLED
	    
	    @Transient
	    private CommonsMultipartFile multipartFile;
	    
	    @Temporal(TemporalType.TIMESTAMP)
	    @Column(nullable = false, updatable = false)
	    private Date createdAt = new Date();
	    
	   
	    
	    

		

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

		public Date getBookingDate() {
			return bookingDate;
		}

		public void setBookingDate(Date bookingDate) {
			this.bookingDate = bookingDate;
		}

		public String getIdProofPath() {
			return idProofPath;
		}

		public void setIdProofPath(String idProofPath) {
			this.idProofPath = idProofPath;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public Date getCreatedAt() {
			return createdAt;
		}

		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}

		public CommonsMultipartFile getMultipartFile() {
			return multipartFile;
		}

		public void setMultipartFile(CommonsMultipartFile multipartFile) {
			this.multipartFile = multipartFile;
		}
	    
	    
}
