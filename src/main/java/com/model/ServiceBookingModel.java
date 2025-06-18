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
import javax.persistence.Transient;

import org.springframework.web.multipart.commons.CommonsMultipartFile;


@Entity
@Table(name = "tb_service_bookings")
public class ServiceBookingModel {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String fullname;
    private String email;
    private String mobile;
    private String address;
    @Column(nullable = false)
    private String status = "PENDING";
    @Temporal(TemporalType.DATE)
    private Date bookingDate;

    private String idProofFile; // This is just the filename saved in DB

    @ManyToOne
    @JoinColumn(name = "service_id", nullable = false)
    private ServiceModel serviceId;

    @Transient
    private CommonsMultipartFile multipartFile; // used for uploading file, not saved in DB

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
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

	public String getIdProofFile() {
		return idProofFile;
	}

	public void setIdProofFile(String idProofFile) {
		this.idProofFile = idProofFile;
	}



	public ServiceModel getServiceId() {
		return serviceId;
	}

	public void setServiceId(ServiceModel serviceId) {
		this.serviceId = serviceId;
	}

	public CommonsMultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(CommonsMultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}




}
