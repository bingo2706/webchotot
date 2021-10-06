package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.ProductConverter;
import com.laptrinhjavaweb.converter.ProductDetailConverter;
import com.laptrinhjavaweb.converter.ProductImageConverter;
import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dao.INewDAO;
import com.laptrinhjavaweb.dto.ProductDTO;
import com.laptrinhjavaweb.dto.ProductDetailDTO;
import com.laptrinhjavaweb.dto.ProductImageDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.ProductDetailEntity;
import com.laptrinhjavaweb.entity.ProductEntity;
import com.laptrinhjavaweb.entity.ProductImageEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.repository.CommentRepository;
import com.laptrinhjavaweb.repository.ProductDetailRepository;
import com.laptrinhjavaweb.repository.ProductImageRepository;
import com.laptrinhjavaweb.repository.ProductRepository;
import com.laptrinhjavaweb.repository.SlideRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.INewService;

@Service
public class NewService implements INewService{
    @Autowired
    private ProductRepository newRepository;
	
    @Autowired
    private ProductConverter newConverter;
    
    @Autowired
    private ProductImageConverter poductImageConverter;
    
    @Autowired
    private CategoryRepository categoryRepository;
    

    @Autowired 
    private ProductDetailRepository productDetailRepository;
    
    @Autowired
    private ProductImageRepository productImageRepository;
    
    @Autowired
    private ProductDetailConverter productDetailConverter;
    
    @Autowired
    private INewDAO newDao;
    
    @Autowired
    private SlideRepository slideRepository;
    
    @Autowired
    private CommentRepository commentRepository;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private UserConverter userConverter;
    
	@Override
	public List<ProductDTO> findAll(Pageable pageable) {
		List<ProductDTO> models = new ArrayList<>();
		List<ProductEntity> entities = newRepository.findAll(pageable).getContent();
		for(ProductEntity item: entities){
			ProductDTO newDTO = newConverter.toDto(item);
				models.add(newDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) newRepository.count();
	}

	@Override
	public ProductDTO findById(long id) {
		ProductEntity entity = newRepository.findOne(id);	
		return newConverter.toDto(entity);
	}

	@Override
	@Transactional
	public ProductDTO save(ProductDTO dto) {
		CategoryEntity categoryEntity = categoryRepository.findOneByCode(dto.getCategoryCode());
		ProductDetailEntity detailEnity = new ProductDetailEntity();
		ProductImageEntity productImgEntity = new ProductImageEntity();
		
		// set productDetail
		detailEnity.setAcreage(dto.getAcreage());
		detailEnity.setContent(dto.getContent());
		detailEnity.setOriginalPrice(dto.getOriginalPrice());
		detailEnity.setPrice(dto.getPrice());
		detailEnity.setStock(dto.getStock());
		detailEnity.setName(dto.getName());	
		productImgEntity.setThumbnail(dto.getThumbnail());
		ProductEntity newEntity = new ProductEntity();
		if(dto.getId() != null){
			ProductEntity oldNew = newRepository.findOne(dto.getId());
			if(dto.getType().equals("addview")){
				oldNew.setView(oldNew.getView()+1);
			}
			oldNew.setCategory(categoryEntity);
			newEntity = newConverter.toEntity(oldNew, dto);
		}else{
			newEntity = newConverter.toEntity(dto);
			newEntity.setCategory(categoryEntity);	
			detailEnity.setProduct(newEntity);
			productImgEntity.setProductdetail(detailEnity);
			productDetailRepository.save(detailEnity);
			productImageRepository.save(productImgEntity);
		}
		
		return newConverter.toDto(newRepository.save(newEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		
		
		
		
		try {
			for(long id : ids){
				List<ProductDetailEntity> productDetailEnity = productDetailRepository.findOneByProduct_id(id);
				for(ProductDetailEntity item : productDetailEnity ){
					List<ProductImageEntity> entity = productImageRepository.findOneByProductdetail_id(item.getId());
					productImageRepository.deleteByProductdetail_id(item.getId());
					productDetailRepository.delete(item.getId());
					slideRepository.deleteByProduct_id(id);
					commentRepository.deleteByProduct_id(id);
				}		
				newRepository.delete(id);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	


	@Override
	public List<ProductImageDTO> findListImgageByProduct(Long id) {
		List<ProductImageEntity> entity = productImageRepository.findOneByProductdetail_id(id);
		List<ProductImageDTO> models = new ArrayList<>();
		for(ProductImageEntity item: entity){
			ProductImageDTO DTO = poductImageConverter.toDto(item);
			models.add(DTO);
		}
		return models;
	}

	@Override
	public ProductImageDTO saveImg(ProductImageDTO dto) {
		ProductImageEntity entity = new ProductImageEntity();
		entity.setCaption(dto.getCaption());
		entity.setThumbnail(dto.getThumbnail());
		ProductDetailEntity detailentity = productDetailRepository.findOne(dto.getProductId());
		entity.setProductdetail(detailentity);
		return poductImageConverter.toDto(productImageRepository.save(entity));
	}

	@Override
	public List<ProductDetailDTO> findListProductDetailByProduct(Long id) {
		List<ProductDetailEntity> entity = productDetailRepository.findOneByProduct_id(id);
		List<ProductDetailDTO> models = new ArrayList<>();
		for(ProductDetailEntity item: entity){
			ProductDetailDTO DTO = productDetailConverter.toDto(item);
			models.add(DTO);
		}
		return models;
	}

	@Override
	public ProductDetailDTO saveDetail(ProductDetailDTO dto) {
		ProductDetailEntity entity = new ProductDetailEntity();
		ProductImageEntity productImgEntity = new ProductImageEntity();
		productImgEntity.setThumbnail(dto.getThumbnail());
		if(dto.getId()!=null){
			ProductDetailEntity oldEntity = productDetailRepository.findOne(dto.getId());
			
		    entity = productDetailConverter.toEntity(oldEntity, dto);
		    entity.setProduct(oldEntity.getProduct());
			entity = productDetailRepository.save(entity);
			
		}else{
			entity = productDetailConverter.toEntity(dto);
			ProductEntity productEntity = newRepository.findOne(dto.getProductId());
			entity.setProduct(productEntity);
			entity = productDetailRepository.save(entity);
			productImgEntity.setProductdetail(entity);
			productImageRepository.save(productImgEntity);
		}
		
		
		return productDetailConverter.toDto(entity);
	}

	@Override
	public List<ProductDTO> findAllByFilter(Long categoryid, String title,String address,Float min,Float max) {
		List<ProductDTO> models = new ArrayList<>();
		List<ProductEntity> entities = new ArrayList<>();
		if(categoryid !=null && title != null){
			 entities = newRepository.findOneByCategory_idAndTitleContaining(categoryid, title);
		}
		else if(categoryid !=null && title ==null){
			 entities = newRepository.findOneByCategory_id(categoryid);
		}
		else if(categoryid ==null && title != null){
			entities = newRepository.findOneByTitleContaining(title);
			
		}
		
		else{
			 models = newDao.findProductByFilter(address, min, max);
		}	
		if(address ==null && min ==null && max ==null){
			for(ProductEntity item: entities){
				ProductDTO newDTO = newConverter.toDto(item);
				models.add(newDTO);
			}
		}
		
		return models;
	}

	@Override
	public void deleteDetail(long[] ids) {
		try {
			for(long id : ids){
				List<ProductImageEntity> entity = productImageRepository.findOneByProductdetail_id(id);
				for(ProductImageEntity item : entity){
					productImageRepository.delete(item.getId());
				}
				
				productDetailRepository.delete(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public ProductDetailDTO findDetailByID(Long id) {
		ProductDetailEntity entity = productDetailRepository.findOne(id);
		return productDetailConverter.toDto(entity);
	}

	@Override
	public void deleteImg(long[] ids) {
		try {
			for(long id : ids){
				productImageRepository.delete(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<ProductDTO> findListProductByUserID(Long id) {
		
			UserEntity userEntity = userRepository.findOne(id);
			List<ProductDTO> listProduct = new ArrayList<>();
			List<ProductEntity> entity = newRepository.findOneByCreatedBy(userEntity.getUserName());
			for(ProductEntity item : entity){
				ProductDTO dto = newConverter.toDto(item);
				listProduct.add(dto);	
			}
			return listProduct;
	}

	@Override
	public List<ProductDTO> findProductPopulator() {
		List<ProductDTO> models = new ArrayList<>();
		List<ProductEntity> entities = newRepository.findProductPopulator();
		for(ProductEntity item: entities){
			ProductDTO dto = newConverter.toDto(item);
			models.add(dto);
		}
		return models;
	}

	
	
}
