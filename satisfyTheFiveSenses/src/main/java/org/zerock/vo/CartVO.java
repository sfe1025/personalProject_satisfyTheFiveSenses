package org.zerock.vo;

import java.io.IOException;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class CartVO {
	
	private int bno;
	private String title;
	private String content;
	private String cp;
	private String mp;
	private String writer;	
	private String userId;
	private String score;
	private Date regdate;
	private Date orderDate;
	private Date compleDate;
	
	private String shopName;
	private String location;
	
	private int cartNo;
	private int pdNo;
	private String pdName;
	private String pdCategory;
	private String pdSimple;
	private String pdDetail;
	private String pdStock;
	private String pdPrice;
	private String pdDetailImg;
	
	private String img;
	
	private MultipartFile imgFile;
	
	private String state;
	
	private int rvNo;
	private int rvScore;
	private String rvContent;
	
	

	/*
	 * public MultipartFile getImgFile() { return imgFile; }
	 * 
	 * public void setImgFile(MultipartFile imgFile) { this.imgFile = imgFile; }
	 */
	
	public int getRvNo() {
		return rvNo;
	}

	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}

	public int getRvScore() {
		return rvScore;
	}

	public void setRvScore(int rvScore) {
		this.rvScore = rvScore;
	}

	public String getRvContent() {
		return rvContent;
	}

	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	
	
	public MultipartFile getImgFile() {
		return imgFile;
	}


	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}
	
	

	/*
	 * public void setImg(byte[] img) { this.img = img; }
	 * 
	 * public byte[] getImg() { return img; }
	 * 
	 * public void setImg(MultipartFile imgFile) throws IOException { this.img =
	 * imgFile.getBytes(); }
	 */

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getCompleDate() {
		return compleDate;
	}

	public void setCompleDate(Date compleDate) {
		this.compleDate = compleDate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	/*
	 * public byte[] getImg() { return img; } public void setImg(MultipartFile
	 * imgFile) throws IOException { this.img = imgFile.getBytes();
	 * 
	 * }
	 */
	
	public String getPdDetailImg() {
		return pdDetailImg;
	}

	public void setPdDetailImg(String pdDetailImg) {
		this.pdDetailImg = pdDetailImg;
	}
	
	public int getPdNo() {
		return pdNo;
	}

	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getPdCategory() {
		return pdCategory;
	}
	public void setPdCategory(String pdCategory) {
		this.pdCategory = pdCategory;
	}
	public String getPdSimple() {
		return pdSimple;
	}
	public void setPdSimple(String pdSimple) {
		this.pdSimple = pdSimple;
	}
	public String getPdDetail() {
		return pdDetail;
	}
	public void setPdDetail(String pdDetail) {
		this.pdDetail = pdDetail;
	}
	public String getPdStock() {
		return pdStock;
	}
	public void setPdStock(String pdStock) {
		this.pdStock = pdStock;
	}
	public String getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(String pdPrice) {
		this.pdPrice = pdPrice;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getCp() {
		return cp;
	}
	public void setCp(String cp) {
		this.cp = cp;
	}
	public String getMp() {
		return mp;
	}
	public void setMp(String mp) {
		this.mp = mp;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	
	
	

}
