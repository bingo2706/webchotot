package com.laptrinhjavaweb.dto;

import java.util.List;

public class ProductDetailDTO extends AbstractDTO<ProductDetailDTO>{
	private String content;
	private Float price;
	private Float originalPrice;
	private Long acreage;
	private Long stock;
	private String name;
	private Long productId;
	private List<ProductImageDTO> listImg;
	public String getContent() {
		return content;
	}
	private String thumbnail;
	public void setContent(String content) {
		this.content = content;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getOriginalPrice() {
		return originalPrice;
	}

	public void setOriginalPrice(Float originalPrice) {
		this.originalPrice = originalPrice;
	}

	public Long getAcreage() {
		return acreage;
	}
	public void setAcreage(Long acreage) {
		this.acreage = acreage;
	}
	public Long getStock() {
		return stock;
	}
	public void setStock(Long stock) {
		this.stock = stock;
	}
	public List<ProductImageDTO> getListImg() {
		return listImg;
	}
	public void setListImg(List<ProductImageDTO> listImg) {
		this.listImg = listImg;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
}
