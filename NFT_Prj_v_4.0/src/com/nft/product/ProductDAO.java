package com.nft.product;

/**
 * @Author : 김은옥
 * @Date : 2021. 12. 18.
 * @Version : 1.0
 * @Description : 상품관리에 필요한 메소드 구현
 */

import java.util.List;
import com.nft.DbConn.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;


public class ProductDAO {
	public static Connection conn = null;
	public static PreparedStatement pstmt = null;
	public static ResultSet rs = null;
	public static ProductDAO dao = new ProductDAO();

	public ProductDAO() {};

	public static ProductDAO getInstance() {
		return dao;
	}

	// nftProductTbl에 제품 등록 
	public int productRegister(ProductBean product) {
		String sqlInsert = "insert into nftProductTbl values (?,"
				+ "(select uNo from nftUserTbl where(uNo = ?)),?,?,?,?,?,?,?,default,?,?,?);"; // 13개

		try {
			conn = DbUtil.getConnection();
			pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setNull(1, Types.INTEGER);
			pstmt.setInt(2, product.getProductSellerNo());
			pstmt.setString(3, product.getProductName());
			pstmt.setLong(4, product.getProductPrice());
			pstmt.setInt(5, product.getProductWidthSize());
			pstmt.setInt(6, product.getProductHeightSize());
			pstmt.setString(7, product.getProductImgUrl());
			pstmt.setString(8, product.getProductNft());
			pstmt.setString(9, product.getProductReleasedDate());
			pstmt.setString(10, product.getProductInfo());
			pstmt.setString(11, product.getProductAuthorName());
			pstmt.setInt(12, product.getProductCategoryNo()); 

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
		}
		return -1;
	}

	// 제품 구매 시, productNo로 제품상태(pStatus) 업데이트
	public int productBuy(int productNo) {

		String updateSql = "update nftProductTbl set pStatus = 'Y' where pNo = ?;";
		int resultCnt = 0;

		try {
			conn = DbUtil.getConnection();
			pstmt = conn.prepareStatement(updateSql);
			pstmt.setInt(1, productNo);
			resultCnt = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("연결 안됨");
			e.printStackTrace();
		} finally {
			try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
		}
		return resultCnt;
	}

	// 제품 구매 시 거래 테이블 insert 하는 부분 
	public int insertDealTable(int userNo, int productNo) {

		String insertSql = "insert into nftDealTbl values (null,? ,?)";
		int resultCnt = 0;

		try {
			conn = DbUtil.getConnection();
			pstmt = conn.prepareStatement(insertSql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, productNo);
			resultCnt = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("연결 안됨");
			e.printStackTrace();
		} finally {
			try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
		}
		return resultCnt;
	}

	// 전체 상품 정보 리스트 받는 메소드
	public List<ProductBean> getProductList() {

		List<ProductBean> prodcutList = new ArrayList<ProductBean>();
		String selectSql = "select * from nftProductTbl;";

		try {
			conn = DbUtil.getConnection();
			pstmt = conn.prepareStatement(selectSql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				// 상품 정보를 저장할 빈즈 객체 생성
				ProductBean product = new ProductBean();

				product.setProductNo(rs.getInt("pNo"));
				product.setProductSellerNo(rs.getInt("uSellerNo"));
				product.setProductName(rs.getString("pName"));
				product.setProductPrice(rs.getLong("pPrice"));
				product.setProductWidthSize(rs.getInt("pWidthSize"));
				product.setProductHeightSize(rs.getInt("pHeightSize"));
				product.setProductImgUrl(rs.getString("pImgUrl"));
				product.setProductNft(rs.getString("pNft"));
				product.setProductReleasedDate(rs.getString("aReleased"));
				product.setProductStatus(rs.getString("pStatus"));
				product.setProductInfo(rs.getString("pInfo"));
				product.setProductAuthorName(rs.getString("aName"));
				product.setProductCategoryNo(rs.getInt("cNo"));

				prodcutList.add(product);
			}

		} catch (Exception e) {
			System.out.println("nftProductTbl 테이블 연결 안됨");
			e.printStackTrace();
		} finally {
			try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
		}
		return prodcutList;
	}

	// 고객이 클릭한 상품 정보 리스트 받는 메소드
		public List<ProductBean> getProductNoProductList(int productNo) {

			List<ProductBean> prodcutList = new ArrayList<ProductBean>();
			String selectSql = "select * from nftProductTbl where pNo = ?;";

			try {
				conn = DbUtil.getConnection();
				pstmt = conn.prepareStatement(selectSql);
				pstmt.setInt(1, productNo);
				rs = pstmt.executeQuery();

				while (rs.next()) {

					// 상품 정보를 저장할 빈즈 객체 생성
					ProductBean product = new ProductBean();

					product.setProductNo(rs.getInt("pNo"));
					product.setProductSellerNo(rs.getInt("uSellerNo"));
					product.setProductName(rs.getString("pName"));
					product.setProductPrice(rs.getLong("pPrice"));
					product.setProductWidthSize(rs.getInt("pWidthSize"));
					product.setProductHeightSize(rs.getInt("pHeightSize"));
					product.setProductImgUrl(rs.getString("pImgUrl"));
					product.setProductNft(rs.getString("pNft"));
					product.setProductReleasedDate(rs.getString("aReleased"));
					product.setProductStatus(rs.getString("pStatus"));
					product.setProductInfo(rs.getString("pInfo"));
					product.setProductAuthorName(rs.getString("aName"));
					product.setProductCategoryNo(rs.getInt("cNo"));

					prodcutList.add(product);
				}

			} catch (Exception e) {
				System.out.println("nftProductTbl 테이블 연결 안됨");
				e.printStackTrace();
			} finally {
				try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
			}
			return prodcutList;
		}
	
	
	// User의 상품 정보만 받는 메소드
	public List<ProductBean> getUserProductList(int uNo) {

		List<ProductBean> productList = new ArrayList<ProductBean>();
		String selectSql = "SELECT * FROM nftProductTbl WHERE(pNo IN (select productNo from nftDealTbl WHERE uBuyerNo = ?));";

		try {
			conn = DbUtil.getConnection();
			pstmt = conn.prepareStatement(selectSql);
			pstmt.setInt(1, uNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				// 상품 정보를 저장할 빈즈 객체 생성
				ProductBean product = new ProductBean();

				product.setProductNo(rs.getInt("pNo"));
				product.setProductSellerNo(rs.getInt("uSellerNo"));
				product.setProductName(rs.getString("pName"));
				product.setProductPrice(rs.getLong("pPrice"));
				product.setProductWidthSize(rs.getInt("pWidthSize"));
				product.setProductHeightSize(rs.getInt("pHeightSize"));
				product.setProductImgUrl(rs.getString("pImgUrl"));
				product.setProductNft(rs.getString("pNft"));
				product.setProductReleasedDate(rs.getString("aReleased"));
				product.setProductStatus(rs.getString("pStatus"));
				product.setProductInfo(rs.getString("pInfo"));
				product.setProductAuthorName(rs.getString("aName"));
				product.setProductCategoryNo(rs.getInt("cNo"));

				productList.add(product);
			}

		} catch (Exception e) {
			System.out.println("nftProductTbl 테이블 연결 안됨");
			e.printStackTrace();
		} finally {
			try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
		}
		return productList;
	}

	// User가 구매한 상품 정보만 받는 메소드(쿼리문만 다름)
	public List<ProductBean> getUserBoughtProductList(int uNo) {

		List<ProductBean> prodcutList = new ArrayList<ProductBean>();
		String selectSql = "SELECT * FROM nftProductTbl WHERE(pNo IN (select productNo from nftDealTbl WHERE uBuyerNo = ?));";

		try {
			conn = DbUtil.getConnection();
			pstmt = conn.prepareStatement(selectSql);
			pstmt.setInt(1, uNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				// 상품 정보를 저장할 빈즈 객체 생성
				ProductBean product = new ProductBean();

				product.setProductNo(rs.getInt("pNo"));
				product.setProductSellerNo(rs.getInt("uSellerNo"));
				product.setProductName(rs.getString("pName"));
				product.setProductPrice(rs.getLong("pPrice"));
				product.setProductWidthSize(rs.getInt("pWidthSize"));
				product.setProductHeightSize(rs.getInt("pHeightSize"));
				product.setProductImgUrl(rs.getString("pImgUrl"));
				product.setProductNft(rs.getString("pNft"));
				product.setProductReleasedDate(rs.getString("aReleased"));
				product.setProductStatus(rs.getString("pStatus"));
				product.setProductInfo(rs.getString("pInfo"));
				product.setProductAuthorName(rs.getString("aName"));
				product.setProductCategoryNo(rs.getInt("cNo"));

				prodcutList.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
		}
		return prodcutList;
	}

	// 판매 리스트
	public List<ProductBean> getUserSoldProductList(int uNo) {
		

		List<ProductBean> productList = new ArrayList<ProductBean>();
		String selectSql = "SELECT * FROM nftProductTbl WHERE uSellerNo = ? AND pStatus = 'Y' ORDER BY pNo";

		try {
			conn = DbUtil.getConnection();
			pstmt = conn.prepareStatement(selectSql);
			pstmt.setInt(1, uNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				// 상품 정보를 저장할 빈즈 객체 생성
				ProductBean product = new ProductBean();

				product.setProductNo(rs.getInt("pNo"));
				product.setProductSellerNo(rs.getInt("uSellerNo"));
				product.setProductName(rs.getString("pName"));
				product.setProductPrice(rs.getLong("pPrice"));
				product.setProductWidthSize(rs.getInt("pWidthSize"));
				product.setProductHeightSize(rs.getInt("pHeightSize"));
				product.setProductImgUrl(rs.getString("pImgUrl"));
				product.setProductNft(rs.getString("pNft"));
				product.setProductReleasedDate(rs.getString("aReleased"));
				product.setProductStatus(rs.getString("pStatus"));
				product.setProductInfo(rs.getString("pInfo"));
				product.setProductAuthorName(rs.getString("aName"));
				product.setProductCategoryNo(rs.getInt("cNo"));

				productList.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
		}
		return productList;
	}

	// 검색 키워드가 포함된 작품 정보를 받는 메소드
		public List<ProductBean> searchProductList(String keyword) {
			

			List<ProductBean> productList = new ArrayList<ProductBean>();
			String searchSql = "SELECT * FROM nftProductTbl WHERE pName LIKE ?";

			try {
				conn = DbUtil.getConnection();
				pstmt = conn.prepareStatement(searchSql);
				pstmt.setString(1, "%" + keyword + "%");
				rs = pstmt.executeQuery();

				while (rs.next()) {

					// 상품 정보를 저장할 빈즈 객체 생성
					ProductBean product = new ProductBean();

					product.setProductNo(rs.getInt("pNo"));
					product.setProductSellerNo(rs.getInt("uSellerNo"));
					product.setProductName(rs.getString("pName"));
					product.setProductPrice(rs.getLong("pPrice"));
					product.setProductWidthSize(rs.getInt("pWidthSize"));
					product.setProductHeightSize(rs.getInt("pHeightSize"));
					product.setProductImgUrl(rs.getString("pImgUrl"));
					product.setProductNft(rs.getString("pNft"));
					product.setProductReleasedDate(rs.getString("aReleased"));
					product.setProductStatus(rs.getString("pStatus"));
					product.setProductInfo(rs.getString("pInfo"));
					product.setProductAuthorName(rs.getString("aName"));
					product.setProductCategoryNo(rs.getInt("cNo"));

					productList.add(product);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
			}
			return productList;
		}
	
}