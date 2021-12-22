SELECT * FROM nftCategoryTbl; # 카테고리
SELECT * FROM nftUserTbl; # 회원 관리
SELECT * FROM nftProductTbl; # 상품 관리 
SELECT * FROM nftDealTbl; #상품 거래 정보
-- ----------------------------------------------------------------------------------------------
DROP TABLE nftCategoryTbl; # 카테고리
DROP TABLE nftUserTbl; # 회원 관리
DROP TABLE nftProductTbl; # 상품 관리 
DROP TABLE nftDealTbl; #상품 거래 정보
-- ----------------------------------------------------------------------------------------------
-- INSERT QUERY --

-- 카테고리 테이블 nftCategoryTbl --
    INSERT INTO nftCategoryTbl VALUES (1,'gif');
    INSERT INTO nftCategoryTbl VALUES (2,'image');
    INSERT INTO nftCategoryTbl VALUES (3,'video');

   -- 회원 관리 테이블 nftUserTbl -- 
    -- 관리자 --
    INSERT INTO nftUserTbl VALUES (NULL, '김은옥','eunok','1234',' eunok@mynft.com','01012341234',DEFAULT,'F', 0);
    INSERT INTO nftUserTbl VALUES (NULL, '박지수','jisu','1234','jisu@mynft.com','01023452345',DEFAULT,'M', 0);
    INSERT INTO nftUserTbl VALUES (NULL, '정승헌','Seungheon','1234','Seungheon@mynft.com','01034563456',DEFAULT,'M', 0);
    INSERT INTO nftUserTbl VALUES (NULL, '한지웅','jiung','1234','jiung@mynft.com','01045674567',DEFAULT,'M', 0);
    -- 일반 회원 --
    INSERT INTO nftUserTbl VALUES (NULL, '홍길동','gildong2 ','1234','gildong2@novel.com','01011111111',DEFAULT,'M', 1);
    INSERT INTO nftUserTbl VALUES (NULL, '왕서방','bigman','1234','bigman@seoul.com','01022222222',DEFAULT,'M', 1);
    INSERT INTO nftUserTbl VALUES (NULL, '유재석','jaesuk','1234','jaesuk@mooohan.com','01055555555',DEFAULT,'M', 1);
    INSERT INTO nftUserTbl VALUES (NULL, '강호동','hodong','1234','hodong@knowingbros.com','01066666666',DEFAULT,'M', 1);
    INSERT INTO nftUserTbl VALUES (NULL, '신동엽','dongyeop','1234','dongyeop@witch.com','01077777777',DEFAULT,'M', 1);
    INSERT INTO nftUserTbl VALUES (NULL, '아이유','iu','1234','iu@boo.com','01088888888',DEFAULT,'F', 1);

   -- 상품 관리 테이블 nftProductTbl --
    INSERT INTO nftProductTbl VALUES (NULL, 5,'DuskBreaker #1342',546,'512','512','https://lh3.googleusercontent.com/c2hX90ig4Bcvi0yDwkgvCn_SKI0P8v2RCxOGRjcoZJpcglOBQEIcS-96x5BI9ia9ovnT3eMLg0gFSk4o8rgyNQv7HEYPQ9GeFmtVPQ','0x0beed7099af7514ccedf642cfea435731176fb02',DEFAULT,DEFAULT,'','DuskBreakers',2);
    INSERT INTO nftProductTbl VALUES (NULL, 6,'Yamashita GAN #60',7395,'512','512','https://lh3.googleusercontent.com/O3cqxvr4hdn8WNT214uSiby0juRJQG4qwcS-ZigMD-0_kHUYBYbD0qbVg66o2Y8I7Q-5wIPce4Ziib39KSmhAXHy1sZvhwqydz_c','0xaa78e67ffd76cddc8b72007dedff2b97c6539d99',DEFAULT,DEFAULT,'','Michael Yamashita',2);
    INSERT INTO nftProductTbl VALUES (NULL, 7,'Jjigae Pool Club',2000,'500','500','https://media.niftygateway.com/image/upload/q_auto:good,w_500/v1639415822/ADaniel/sendnoodz/SENDNOODZ_10_JJIGAEPOOLCLUB_-_Bee_Fee_1_alp5ns.png','0x0ba8d86da99c7d0256e508a1373e3f1b958a02ae',DEFAULT,DEFAULT,'','Blorf',2);
    INSERT INTO nftProductTbl VALUES (NULL, 8,'Wrath (Patience)',1000,'500','500','https://media.niftygateway.com/image/upload/q_auto:good,w_500/v1639149792/Patrick/NateHill_TimMaxwell/Wrath_Patience_jdy2eb.jpg','0x8d48b831330722ed6ee979beac013c2eb0ffa9e0',DEFAULT,DEFAULT,'','Nate Hill X Maxwellinked',2);
    INSERT INTO nftProductTbl VALUES (NULL, 9,'Squish #2114',555.90,'512','512','https://lh3.googleusercontent.com/lriN_e29imfpIFaQGUHwAcSzOpkuEsABJTDpdyxBIKssCh8fryN745QCaAvHE2g1tsqeOeeyHJHe7Si8RgNVc3PPV61GDIq3lF-Cug','0x792496a3f678187e59e1d1d5e075799cd1e124c2',DEFAULT,DEFAULT,'','squishy squad nft',2);
    INSERT INTO nftProductTbl VALUES (NULL, 10,'GalacticApe #32',500,'512','512','https://lh3.googleusercontent.com/eocRtlZUdoR6YscRA_PbLRh_H5PdKb-oGyUFoI6-yEakiDOQFPU2DiV4rfKbZCfIG4L0KdHGl9gT6L0d6t-AUG-bMl21A9a1KMuWFxU','0x12d2d1bed91c24f878f37e66bd829ce7197e4d14',DEFAULT,DEFAULT,'','GalacticApes',2);
    INSERT INTO nftProductTbl VALUES (NULL, 10,'Tell Me About Home',800,'500','500','https://media.niftygateway.com/image/upload/q_auto:good,w_500/v1639762873/Andrea/rek0de/DecDrop/Tell_Me_About_Home_bzribp.jpg','0xfbab6ee0b81be5c85a316e99111d67aaf4458d4f',DEFAULT,DEFAULT,'','rek0de',2);
      
-- 상품 거래 정보 테이블 nftDealTbl --
    INSERT INTO nftDealTbl VALUES (NULL,1,1);
   
   DELETE FROM nftUserTbl WHERE uNo = 10;
