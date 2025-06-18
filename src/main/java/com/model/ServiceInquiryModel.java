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
@Table(name = "tb_service_inquiries")
public class ServiceInquiryModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String fullname;
    private String email;
    private String phone;
    private String address;

    @Column(length = 1000)
    private String message;

    @ManyToOne
    @JoinColumn(name = "service_id", nullable = false)
    private ServiceModel serviceId;

    @Column(nullable = false)
    private String status = "PENDING";

    @Column(name = "inquiry_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date inquiryDate = new Date();



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

	public ServiceModel getServiceId() {
		return serviceId;
	}

	public void setServiceId(ServiceModel serviceId) {
		this.serviceId = serviceId;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}




}
