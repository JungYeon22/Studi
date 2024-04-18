CREATE TABLE report (
                        reportNum INT auto_increment,
                        userId	VARCHAR(100)	NOT NULL,
                        REPORTDATE	DATE	NOT NULL,
                        TARGETId	VARCHAR(100) NOT NULL,
                        CONTENT	VARCHAR(600)	NOT NULL,
                        STATUS	VARCHAR(6)	NOT NULL default 1
--                     1 ~ 5 단계별로 신고 요청(관리자 확인x), 처리중(관리자가 확인), 게시물 삭제, 회원 경고, 회원 추방
);

CREATE TABLE reportUser (
                        userId	VARCHAR(100)	NOT NULL,
                        reportCnt	VARCHAR(100) NOT NULL
);