package com.laptrinhjavaweb.dto;

public class ProductImageDTO extends AbstractDTO<ProductImageDTO>{
	private String caption;
	private String thumbnail;
	private Long productId;
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
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}

}
