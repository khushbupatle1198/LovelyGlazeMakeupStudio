package com.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity

@Table(name = "tb_services")
public class ServiceModel {

	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;

	    private String title;
	    private String overview;

	    @Column(length = 1000)
	    private String description;

	    @Transient
	    private List<String> descList;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getOverview() {
			return overview;
		}

		public void setOverview(String overview) {
			this.overview = overview;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public List<String> getDescList() {
			return descList;
		}

		public void setDescList(List<String> descList) {
			this.descList = descList;
		}


}
