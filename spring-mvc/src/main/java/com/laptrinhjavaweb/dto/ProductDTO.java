package com.laptrinhjavaweb.dto;

import java.util.List;

public class ProductDTO extends AbstractDTO<ProductDTO> {
	
	private String title;
	private String thumbnail;
	private String shortDescription;
	private String content;
	private Float price;
	private Float originalPrice;
	private Long acreage;
	private Long stock;
	private Long categoryId;
	private String categoryCode;
	private String categoryName;
	private String address;
	private Long status;
	private String name;
	private Long view;
	public Long getView() {
		return view;
	}
	public void setView(Long view) {
		this.view = view;
	}
	private List<ProductDetailDTO> listDetail;
	private List<OrderRoomDTO> listOrder;
	public List<OrderRoomDTO> getListOrder() {
		return listOrder;
	}
	public void setListOrder(List<OrderRoomDTO> listOrder) {
		this.listOrder = listOrder;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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

	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getShortDescription() {
		return shortDescription;
	}
	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
	public List<ProductDetailDTO> getListDetail() {
		return listDetail;
	}
	public void setListDetail(List<ProductDetailDTO> listDetail) {
		this.listDetail = listDetail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
}