package com.laptrinhjavaweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "productimage")
public class ProductImageEntity extends BaseEntity{
	
	@Column(name = "caption", columnDefinition = "TEXT")
	private String caption;
	
	@Column(name = "thumbnail")
	private String thumbnail;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "productdetail_id")
    private ProductDetailEntity productdetail;

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public ProductDetailEntity getProductdetail() {
		return productdetail;
	}

	public void setProductdetail(ProductDetailEntity productdetail) {
		this.productdetail = productdetail;
	}

}
