package com.laptrinhjavaweb.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name="product")
@Table(name = "product")
public class ProductEntity extends BaseEntity {
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "shortdescription", columnDefinition = "TEXT")
	private String shortDescription;
	
	@Column(name = "status")
	private Long status;
	
	@Column(name="view")
	private Long view;
	
	public Long getView() {
		return view;
	}

	public void setView(Long view) {
		this.view = view;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "thumbnail")
	private String thumbnail;
	
	@Column(name = "address", columnDefinition = "TEXT")
	private String address;
	

	
	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public List<CommentEntity> getComments() {
		return comments;
	}

	public void setComments(List<CommentEntity> comments) {
		this.comments = comments;
	}

	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private CategoryEntity category;
	
	@OneToMany(mappedBy = "product")
	private List<CommentEntity> comments = new ArrayList<>();
	
	public List<SlideEntity> getSlide() {
		return slide;
	}

	public void setSlide(List<SlideEntity> slide) {
		this.slide = slide;
	}

	@OneToMany(mappedBy = "product")
	private List<SlideEntity> slide = new ArrayList<>();
	
	@OneToMany(mappedBy = "product")
	private List<ProductDetailEntity> productdetail = new ArrayList<>();
	
	@OneToMany(mappedBy = "product")
	private List<OrderRoomEntity> orderRoom = new ArrayList<>();
	
	public List<OrderRoomEntity> getOrderRoom() {
		return orderRoom;
	}

	public void setOrderRoom(List<OrderRoomEntity> orderRoom) {
		this.orderRoom = orderRoom;
	}

	public CategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CategoryEntity category) {
		this.category = category;
	}

	public List<ProductDetailEntity> getProductdetail() {
		return productdetail;
	}

	public void setProductdetail(List<ProductDetailEntity> productdetail) {
		this.productdetail = productdetail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}



	
}