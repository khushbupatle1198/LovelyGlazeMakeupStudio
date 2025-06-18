package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
public class BannerModel {


	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;

	    private String description;
	    private String name;
	    private String fileupload;
	    @Transient
	    private CommonsMultipartFile multipartFile;

		public CommonsMultipartFile getMultipartFile() {
			return multipartFile;
		}
		public void setMultipartFile(CommonsMultipartFile multipartFile) {
			this.multipartFile = multipartFile;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getFileupload() {
			return fileupload;
		}
		public void setFileupload(String fileupload) {
			this.fileupload = fileupload;
		}






}
