package com.nft.product;

import com.nft.Util.Util;

/**
 * @Author : 김은옥
 * @Date : 2021. 12. 19.
 * @Version : 1.0
 * @Description : nftDB의 상품 관리 테이블 변수 저장할 필드 선언
 */

public class ProductBean {
	
	public static ProductDAO dDao = new ProductDAO();
	public static Util util = new Util();
	
	private int productNo; // 상품 번호 // SQL 추가될 때 자동 생성
	private int productSellerNo; // 판매자 회원 번호
	private String productName; // 제품명
	private long productPrice; // 가격
	private int productWidthSize; // 가로크기
	private int productHeightSize; // 세로크기
	private String productImgUrl; // 원본파일 Url
	private String productNft; // 상품 정보 token
	private String productReleasedDate; // 상품 released 날짜
	private String productStatus; // 상품 판매 상태 정보
	private String productInfo; // 상품 설명
	private String productAuthorName; // 상품의 작가 번호
	private int productCategoryNo; // 상품의 카테고리 번호

	public ProductBean() {
	}

	public ProductBean(int productSellerNo, String productName, long productPrice, 
			int productWidthSize, int productHeightSize, 
			String productImgUrl, String productNft, 
			String productReleasedDate, String productAuthorName, 
			String productInfo, int productCategoryNo) {
		super();
		this.productSellerNo = productSellerNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productWidthSize = productWidthSize;
		this.productHeightSize = productHeightSize;
		this.productImgUrl = productImgUrl;
		this.productNft = productNft;
		this.productReleasedDate = productReleasedDate;
		this.productInfo = productInfo;
		this.productInfo = productInfo;
		this.productAuthorName = productAuthorName;
		this.productCategoryNo = productCategoryNo;
	}

	// 카테고리 이름 받기
	public String getProductCategoryName() {
		String category = "";
		if (productCategoryNo == 1) {
			category = "gif";
		} else if (productCategoryNo == 2) {
			category = "image";
		} else {
			category = "video";
		}
		return category;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getProductSellerNo() {
		return productSellerNo;
	}

	public void setProductSellerNo(int productSellerNo) {
		this.productSellerNo = productSellerNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public long getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(long productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductWidthSize() {
		return productWidthSize;
	}

	public void setProductWidthSize(int productWidthSize) {
		this.productWidthSize = productWidthSize;
	}

	public int getProductHeightSize() {
		return productHeightSize;
	}

	public void setProductHeightSize(int productHeightSize) {
		this.productHeightSize = productHeightSize;
	}

	public String getProductImgUrl() {
		return productImgUrl;
	}

	public void setProductImgUrl(String productImgUrl) {
		this.productImgUrl = productImgUrl;
	}

	public String getProductNft() {
		return productNft;
	}

	public void setProductNft(String productNft) {
		this.productNft = productNft;
	}

	public String getProductReleasedDate() {
		// 날짜 형식 변환
		return Util.dateFormatHms(productReleasedDate); //2021-02-02
	}

	public void setProductReleasedDate(String productReleasedDate) {
		this.productReleasedDate = productReleasedDate;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public String getProductAuthorName() {
		return productAuthorName;
	}

	public void setProductAuthorName(String productAuthorName) {
		this.productAuthorName = productAuthorName;
	}

	public int getProductCategoryNo() {
		return productCategoryNo;
	}

	public void setProductCategoryNo(int productCategoryNo) {
		this.productCategoryNo = productCategoryNo;
	}

}
