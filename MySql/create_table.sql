-- DB Name : nftDB
	-- DB 생성 / nftDB --
	CREATE SCHEMA IF NOT EXISTS `nftDB` DEFAULT CHARACTER SET utf8;
	CREATE DATABASE nftDB;
	USE nftDB;

	DROP DATABASE nftDB;
-- ---------------------------------------------------------

-- TABLE 생성 --
	-- 카테고리 테이블 nftCategoryTbl --
	CREATE TABLE IF NOT EXISTS nftCategoryTbl(
		cNo int ,
		cName Varchar(10) NOT NULL UNIQUE,
		
		CONSTRAINT nftCategoryTbl_cNo PRIMARY KEY(cNo)
	);
	
	SELECT * FROM nftCategoryTbl;
	
	DROP TABLE nftCategoryTbl;
	
	
	-- 회원 관리 테이블 nftUserTbl -- 
	CREATE TABLE IF NOT EXISTS nftUserTbl(
		uNo int AUTO_INCREMENT ,
		uName varchar(10) NOT NULL ,
		uId varchar(10) NOT NULL ,
		uPw varchar(20) NOT NULL,
		uEmail varchar(50) NULL ,
		uPhONe varchar(11) NULL,
		uSubDate datetime NOT NULL DEFAULT now(),
		uGender varchar(1) NULL,
		uGrade tinyint NOT NULL,
		
		CONSTRAINT nftUserTbl_uNo PRIMARY KEY(uNo),
		CONSTRAINT nftUserTbl_uId_uk UNIQUE(uId),
		CONSTRAINT nftUserTbl_uEmail_uk UNIQUE(uEmail),
		CONSTRAINT nftUserTbl_uGender_ck check(uGender IN ('M','F')),
		CONSTRAINT nftUserTbl_uGrade_ck check(uGrade IN (0,1))
	);
	
	SELECT * FROM nftUserTbl;
	
	DROP TABLE nftUserTbl;
	
	
	-- 상품 관리 테이블 nftProductTbl --
	CREATE TABLE IF NOT EXISTS nftProductTbl(
		pNo int AUTO_INCREMENT,
		uSellerNo int NOT NULL ,
		pName varchar(50) NOT NULL DEFAULT 'NoName',
		pPrice Bigint(20) NOT NULL DEFAULT 0,
		pWidthSize int NOT NULL,
		pHeightSize int NOT NULL,
		pImgUrl text NOT NULL,
		pNft Varchar(50) NOT NULL,
		aReleased datetime NULL DEFAULT now(),
		pStatus Varchar(1) NOT NULL DEFAULT 'N',
		pInfo lONgtext NULL,
		aName Varchar(30) NULL DEFAULT 'NoName',
		cNo int NOT NULL,
		
		CONSTRAINT nftProductTbl_pNo PRIMARY KEY(pNo),
		CONSTRAINT nftProductTbl_pNft_uk UNIQUE(pNft),
		
		CONSTRAINT nftProductTbl_uSellerNo_nftUserTbl_fk FOREIGN KEY (uSellerNo) 
		REFERENCES nftUserTbl(uNo), #판매자 회원번호
		
		CONSTRAINT nftProductTbl_uNo_nftCategoryTbl_fk FOREIGN KEY (cNo) 
		REFERENCES nftCategoryTbl(cNo) #카테고리 번호
	);
	
	SELECT * FROM nftProductTbl;
	
	DROP TABLE nftProductTbl;
	
	
	-- 상품 거래 정보 테이블 nftDealTbl --
	CREATE TABLE IF NOT EXISTS nftDealTbl(
		dealNo int AUTO_INCREMENT ,
		uBuyerNo int NOT NULL ,
		productNo int NOT NULL,
		
		CONSTRAINT nftDealTbl_dealNo PRIMARY KEY(dealNo),
		
		CONSTRAINT nftDealTbl_uBuyerNo_nftUserTbl_fk FOREIGN KEY (uBuyerNo) 
		REFERENCES nftUserTbl(uNo), #구매자 회원 번호
		
		CONSTRAINT nftDealTbl_productNo_nftProductTbl_fk FOREIGN KEY (productNo) 
		REFERENCES nftProductTbl(pNo) #상품 번호
	
	);
	
	SELECT * FROM nftDealTbl;
	
	DROP TABLE nftDealTbl;

