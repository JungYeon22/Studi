CREATE TABLE `FREE_BOARD` (
`FBOARD`	INT primary key auto_increment,
`WRITER`	VARCHAR(100),
`WRITER_NAME` VARCHAR(20),
`TITLE`     VARCHAR(100),
`DATE`	DATETIME  default  CURRENT_TIMESTAMP,
`CONTENT`	text,
`LIKES`	INT	NULL default 0,
`COMMENT` INT DEFAULT 0
);


CREATE TABLE `FBOARD_LIKE` (
`FBOARD`	INT,
`UserId`	VARCHAR(100)
);

CREATE TABLE `FBOARD_COMMENT`(
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
