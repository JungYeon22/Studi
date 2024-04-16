use minidb;

CREATE TABLE user (
    UserId    VARCHAR(100)    ,
    PWD    VARCHAR(100),
    NAME    VARCHAR(100)    ,
    SKILL    VARCHAR(100),
    EMAIL    VARCHAR(100)    ,
    PHONE    VARCHAR(100)    ,
    HIREDATE    DATE     default (CURRENT_DATE),
    LOGIN_TYPE VARCHAR(100)
);


CREATE TABLE user_description (
    name	VARCHAR(100),
    UserId	VARCHAR(100),
    Career	VARCHAR(100),
    SKILL1	VARCHAR(100),
    SKILL2	VARCHAR(100),
    SKILL3	VARCHAR(100),
    Introduce  VARCHAR(100)
);

CREATE TABLE `project` (
    `PROJECTID`	VARCHAR(100),
    `PROJECTNAME`	VARCHAR(100),
    `CREATEDATE`	DATE,
    `MAXJOIN`	VARCHAR(100),
    `ENDDATE`	DATE	NULL,
    `LEADER`	VARCHAR(100)
);


CREATE TABLE `project_member` (
    `PROJECTID`	VARCHAR(100),
    `UserID`	VARCHAR(100)
);

drop table free_board;
CREATE TABLE `free_board` (
    `FBOARD`	INT primary key auto_increment,
    `WRITER`	VARCHAR(100),
    `TITLE`     VARCHAR(100),
    `DATE`	DATETIME  default  CURRENT_TIMESTAMP,
    `CONTENT`	TEXT,
    `LIKES`	INT	NULL default 0,
    `COMMENT` INT DEFAULT 0
);


CREATE TABLE `fboard_like` (
    `FBOARD`	INT,
    `UserId`	VARCHAR(100)
);


CREATE TABLE `fboard_comment`(
    `FBOARD`    INT,
    `WRITER`    VARCHAR(100),
    `COMMENT`   VARCHAR(100),
    `DATE`  DATETIME DEFAULT CURRENT_TIMESTAMP
);

/* 좋아요 기능을 수행하는 프로시저 */
DELIMITER //
CREATE PROCEDURE LIKE_PROCEDURE (
    IN fboard_id INT,
    IN user_id varchar(20)
)
BEGIN
    DECLARE existLike INT;
    -- 해당 사용자가 이미 해당 게시글에 좋아요를 눌렀는지 확인
    SELECT COUNT(*) INTO existLike
    FROM fboard_like
    WHERE FBOARD = fboard_id AND userId = user_id;

    IF existLike > 0  THEN
        -- 이미 좋아요를 눌렀으면 좋아요 취소
        DELETE FROM fboard_like
        WHERE FBOARD = fboard_id AND userId = user_id;
        update free_board set likes=likes-1 where fboard=fboard_id;
    ELSE
        -- 좋아요를 누르지 않았으면 좋아요 추가
        INSERT INTO fboard_like (FBOARD, userId)
        VALUES (fboard_id, user_id);
        update free_board set likes=likes+1 where fboard=fboard_id;
    END IF;
END //
DELIMITER ;


/* 게시글을 가져오기 전에 댓글 수를 update하는 프로시저*/
DELIMITER //
CREATE PROCEDURE LOUNGE_PROCEDURE(
    IN startNum INT,
    IN size INT
)
BEGIN
    -- 게시글 댓글 업데이트
    UPDATE FREE_BOARD AS B
    SET B.COMMENT = (
        SELECT COUNT(*)
        FROM FBOARD_COMMENT AS C
        WHERE C.FBOARD = B.FBOARD
    );

    -- 게시글 목록 가져오기
    SELECT *
    FROM FREE_BOARD
    order by fboard desc
    limit startNum, size;
end //
DELIMITER ;

CREATE TABLE `CHATINGROOM` (
    `CHATID`	VARCHAR(100),
    `CHATINGNAME`	VARCHAR(100),
    `CURRENTJOIN`	VARCHAR(100),
    `MAXJOIN`	VARCHAR(100),
    `Field`	VARCHAR(255),
    `UserId`	VARCHAR(100),
    `PROJECTID`	VARCHAR(100)
);

CREATE TABLE `CHATING` (
    `TIME`	TIMESTAMP,
    `USERNAME`	VARCHAR(100),
    `MESSAGE`	VARCHAR(100),
    `UserId`	VARCHAR(100),
    `PROJECTID`	VARCHAR(100)
);

CREATE TABLE `MAIL_NOTIFICATION` (
    `UserId`	VARCHAR(100),
    `NOTIFICATION_TYPE`	VARCHAR(50),
    `NOTIFICATION_MESSAGE`	VARCHAR(50),
    `SENT_TIME`	TIMESTAMP	NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '전송 시간'
);





