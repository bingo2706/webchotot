package com.laptrinhjavaweb.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.dao.INewDAO;
import com.laptrinhjavaweb.dto.ProductDTO;

@Repository
public class NewDAO implements INewDAO{
	public Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/springmvcbasicfree";
			String user= "root";
			String password = "123456";
			return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException |SQLException e) {
			return null;
			
		} 
	}

	@Override
	public List<ProductDTO> findProductByFilter(String address, Float min, Float max) {
		List<ProductDTO> result = new ArrayList<>();
		 Connection connection = getConnection();
		 String sql = "select DISTINCT p.id,p.title, pt.price,pt.originalprice,pt.acreage,pi.thumbnail from product p,productdetail pt,productimage as pi where p.address like ? and p.id = pt.product_id and pt.id = pi.productdetail_id ";
		 if(min!=null && max!=null){
			 sql = sql +"and pt.price between ? and ? ";
		 }
		 if(min!=null && max ==null){
			 sql = sql +"and pt.price between ? and 9999999999999999 ";
		 }
		 if(min==null && max != null){
			 sql = sql +"and pt.price between 0 and ? ";
		 }
		 sql= sql + "group by p.id";
		    PreparedStatement ps = null;
		    
		    ResultSet rs = null;
		    if(connection != null){
		    	try {
					ps = connection.prepareStatement(sql);
					ps.setString(1,'%'+address +'%');
					 if(min!=null && max!=null){
							ps.setFloat(2, min);
							ps.setFloat(3, max);
					 }
					 if(min!=null && max ==null){
						 ps.setFloat(2, min);
					 }
					 if(min==null && max != null){
						 ps.setFloat(2, max);
					 }
				
					rs = ps.executeQuery();
					while(rs.next()){
						ProductDTO dto = new ProductDTO();
						dto.setTitle(rs.getString("title"));
						dto.setPrice(rs.getFloat("price"));
						dto.setOriginalPrice(rs.getFloat("originalprice"));
						dto.setAcreage(rs.getLong("acreage"));
						dto.setThumbnail(rs.getString("thumbnail"));
						dto.setStatus(Long.parseLong("-1"));
						dto.setId(rs.getLong("id"));
						result.add(dto);
					}
					
					return result;
				} catch (SQLException e) {	
					return null;
				} finally{
					try {
						if(connection != null){
							connection.close();
						}
						if(ps != null){
							ps.close();
						}
						if(rs != null){
							rs.close();
						}
					} catch (SQLException e) {
						return null;
					}
					
				}
		    }
		   return null;
	}
}
