package com.nft.user;
/**
 * @Author : 정승헌
 * @Date : 2021. 12. 20.
 * @Version : 2.0
 * @Description : getUserList 메소드 추가
 * 
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.nft.DbConn.DbUtil;

public class UserDAO {
	public static Connection conn = null;
	public static PreparedStatement pstmt = null;
	public static ResultSet rs = null;
	public static UserDAO dao = new UserDAO();
	
	public UserDAO() {};
	
	public static UserDAO getInstance() {
		return dao;
	}

	// 회원가입 메소드
	public int userRegister(UserBean user) {
		String sqlInsert = "INSERT INTO nftUserTbl VALUES(?,?,?,?,?,?,?,?,?);";
		
		try {
			conn = DbUtil.getConnection();
			pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setNull(1, Types.INTEGER);
			pstmt.setString(2, user.getuName());
			pstmt.setString(3, user.getuId());
			pstmt.setString(4, user.getuPw());
			pstmt.setString(5, user.getuEmail());
			pstmt.setString(6, user.getuPhone());
			pstmt.setString(7, user.getuSubDate());
			pstmt.setString(8, user.getuGender());
			pstmt.setInt(9, user.getuGrade());
			return pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
		}
		return -1;
	}
	
	// 아이디 중복여부 검사 메소드
	public int userIdDuplicateCheck(String uId) {
		String sqlSelect = "SELECT uId FROM nftUserTbl WHERE uId = ?";
		
		try {
			conn = DbUtil.getConnection();
			pstmt = conn.prepareStatement(sqlSelect);
			pstmt.setString(1, uId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 1; // 아이디 존재
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
		}
		return 0; 
		
	}
	
	// 로그인 메소드
	public int userLogin(String uId, String uPw) {
		String sqlSelect = "SELECT uPw FROM nftUserTbl WHERE uId = ?";
		
		try {
			conn = DbUtil.getConnection();
			pstmt = conn.prepareStatement(sqlSelect);
			pstmt.setString(1, uId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(uPw)) {
					return 1; // 로그인 성공
				}
				else {
					return 0; // 비밀번호 틀림
				}
			}
			return -1; // 아이디 없음
		}
		
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
		}
		System.out.println("데이터베이스 오류");
		return -2; // 데이터 베이스 오류
	}
	
	// 유저 삭제기능
	public int userDelete(int uNo) {
	  	String sqlDelete = "DELETE FROM nftUserTbl\n" + 
	  						"WHERE uNo = ?";
	  	try {
			conn = DbUtil.getConnection();
			pstmt = conn.prepareStatement(sqlDelete);
			pstmt.setInt(1, uNo);
			return pstmt.executeUpdate();
	    } catch (Exception e) {
	      	System.out.println("nftUserTbl 테이블 연결 안됨");
	      	e.printStackTrace();
	    } finally {
			try {if(conn != null) { conn.close(); }} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt != null) { pstmt.close(); }} catch(Exception e) {e.printStackTrace();}
			try {if(rs!= null) { rs.close(); }} catch(Exception e) {e.printStackTrace();}
		}
		return 0; //실패
	}
	
	// uId로 uNo 가져오기 메소드
	public int getUserNo(String uId) {
		String sqlSelect = "SELECT uNo FROM nftUserTbl WHERE uId = ?";
		
		try {
			conn = DbUtil.getConnection();
			pstmt = conn.prepareStatement(sqlSelect);
			pstmt.setString(1, uId);
			rs = pstmt.executeQuery();
			if(rs.next()) { return rs.getInt(1);} //uNo
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
			try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
		}
		return 0; //실패
	}
	
	// uId로 uGrade 가져오기 메소드
		public int getUserGrade(String uId) {
			String sqlSelect = "SELECT uGrade FROM nftUserTbl WHERE uId = ?";
			
			try {
				conn = DbUtil.getConnection();
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, uId);
				rs = pstmt.executeQuery();
				if(rs.next()) { return rs.getInt(1);} //uGrade
			}
			catch (Exception e) {
				e.printStackTrace();
			} finally {
				try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
			}
			return 1; //실패
		}
		
		// uId로 uName 가져오기 메소드
		public String getUserName(String uId) {
			String sqlSelect = "SELECT uName FROM nftUserTbl WHERE uId = ?";
			
			try {
				conn = DbUtil.getConnection();
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, uId);
				rs = pstmt.executeQuery();
				if(rs.next()) { return rs.getString(1);} //uName
			}
			catch (Exception e) {
				e.printStackTrace();
			} finally {
				try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
			}
			return "no_name"; //실패
		}
		
		// 유저 정보 리스트 받는 메소드
		public List<UserBean> getUserList() {

			List<UserBean> userList = new ArrayList<UserBean>();
			String selectSql = "select * from nftUserTbl;";

			try {
				conn = DbUtil.getConnection();
				pstmt = conn.prepareStatement(selectSql);
				rs = pstmt.executeQuery();

				while (rs.next()) {

					// 상품 정보를 저장할 빈즈 객체 생성
					UserBean User = new UserBean();

					User.setuNo(rs.getInt("uNo"));
					User.setuName(rs.getString("uName"));
					User.setuId(rs.getString("uId"));
					User.setuPw(rs.getString("uPw"));
					User.setuEmail(rs.getString("uEmail"));
					User.setuPhone(rs.getString("uPhone"));
					User.setuSubDate(rs.getString("uSubDate"));
					User.setuGender(rs.getString("uGender"));
					User.setuGrade(rs.getInt("uGrade"));

					userList.add(User);
				}
			} catch (Exception e) {
				System.out.println("nftUserTbl 테이블 연결 안됨");
				e.printStackTrace();
			} finally {
				try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
			}
			return userList;
		}
		
		//유저가 판매한 제품의 구매자 이름들을 가져오는 메소드
		public List<String> getUserProductPurchaserNames(int uNo) {
			List<String> purchaserNameList = new ArrayList<String>();
			String selectSql = "SELECT nut.uName \n" + 
								"FROM nftProductTbl npt, nftDealTbl ndt, nftUserTbl nut \n" + 
								"WHERE uSellerNo = ?\n" + 
								"AND pStatus = 'Y'\n" + 
								"AND npt.pNo = ndt.productNo\n" + 
								"AND ndt.uBuyerNo = nut.uNo\n" + 
								"ORDER BY pNo;";
			try {
				conn = DbUtil.getConnection();
				pstmt = conn.prepareStatement(selectSql);
				pstmt.setInt(1, uNo);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					purchaserNameList.add(rs.getString(1));
				}
			} catch (Exception e) {
				System.out.println("데이터 베이스 연결 안됨");
				e.printStackTrace();
			} finally {
				try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
			}
			return purchaserNameList;
		}
		
		// 이메일 중복여부 검사 메소드
		public int userEmailDuplicateCheck(String uId) {
			String sqlSelect = "SELECT uEmail FROM nftUserTbl WHERE uId = ?";
			
			try {
				conn = DbUtil.getConnection();
				pstmt = conn.prepareStatement(sqlSelect);
				pstmt.setString(1, uId);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					return 1; // 이메일 존재
				}
				
			}
			catch (Exception e) {
				e.printStackTrace();
			} finally {
				try { if (conn != null) { conn.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (pstmt != null) { pstmt.close(); }} catch (Exception e){e.printStackTrace();}
				try { if (rs!= null) { rs.close(); }} catch (Exception e){e.printStackTrace();}
			}
			return 0; 
			
		}
		
}




