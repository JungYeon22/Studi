create table if not exists board
(
    BOARDID      varchar(100) null,
    SUBJECT      varchar(100) null,
    CONTENT      mediumblob   null,
    userTotCnt   int          null,
    userCurCnt   int          null,
    projectType  varchar(100) null,
    projectField varchar(100) null,
    UserId       varchar(100) null,
    DATE         datetime     null,
    FILE         varchar(100) null,
    HIT          varchar(100) null
);

create table if not exists boardtag
(
    CONTENT varchar(100) null,
    BOARDID varchar(100) null
);

create table if not exists chating
(
    TIME      timestamp    null,
    USERNAME  varchar(100) null,
    MESSAGE   varchar(100) null,
    UserId    varchar(100) null,
    PROJECTID varchar(100) null
);

create table if not exists chatingroom
(
    CHATID      varchar(100) null,
    CHATINGNAME varchar(100) null,
    CURRENTJOIN varchar(100) null,
    MAXJOIN     varchar(100) null,
    Field       varchar(255) null,
    UserId      varchar(100) null,
    PROJECTID   varchar(100) null
);

create table if not exists comment
(
    No      int auto_increment
        primary key,
    ref     int          null,
    BOARDID varchar(100) null,
    DATE    date         null,
    UserId  varchar(100) null,
    TEXT    varchar(100) null
);

create table if not exists fboard_comment
(
    FBOARD  int                                null,
    WRITER  varchar(100)                       null,
    COMMENT text                               null,
    DATE    datetime default CURRENT_TIMESTAMP null
);

create table if not exists fboard_like
(
    FBOARD int          null,
    UserId varchar(100) null
);

create table if not exists free_board
(
    FBOARD      int auto_increment
        primary key,
    WRITER      varchar(100)                       null,
    TITLE       varchar(100)                       null,
    DATE        datetime default CURRENT_TIMESTAMP null,
    CONTENT     text                               null,
    LIKES       int      default 0                 null,
    COMMENT     int      default 0                 null,
    writer_name varchar(20)                        null
);

create table if not exists mail_notification
(
    UserId               varchar(100)                        null,
    NOTIFICATION_TYPE    varchar(50)                         null,
    NOTIFICATION_MESSAGE varchar(50)                         null,
    SENT_TIME            timestamp default CURRENT_TIMESTAMP null comment '전송 시간'
);

create table if not exists notice
(
    noti_id int auto_increment
        primary key,
    title   varchar(100)                       null,
    content text                               null,
    date    datetime default CURRENT_TIMESTAMP null,
    period int null
);

drop table notice;

create table if not exists project
(
    PROJECTID   varchar(100) null,
    PROJECTNAME varchar(100) null,
    CREATEDATE  date         null,
    MAXJOIN     varchar(100) null,
    ENDDATE     date         null,
    LEADER      varchar(100) null
);

create table if not exists project_application
(
    PROJECTID varchar(100) null,
    UserID    varchar(100) null
);

create table if not exists project_member
(
    PROJECTID varchar(100) null,
    UserID    varchar(100) null
);

create table if not exists report
(
    reportNum  int auto_increment
        primary key,
    userId     varchar(100)                   null,
    REPORTDATE date       default (curdate()) null,
    TARGETId   varchar(100)                   null,
    CONTENT    varchar(600)                   null,
    STATUS     varchar(6) default '1'         not null
);

create table if not exists reportuser
(
    userId    varchar(100) not null,
    reportCnt varchar(100) not null
);

create table if not exists scrap
(
    UserId  varchar(100) null,
    BOARDID varchar(100) null
);

create table if not exists user
(
    UserId     varchar(100)             null,
    PWD        varchar(100)             null,
    NAME       varchar(100)             null,
    EMAIL      varchar(100)             null,
    PHONE      varchar(100)             null,
    HIREDATE   date default (curdate()) null,
    LOGIN_TYPE varchar(100)             null
);

create table if not exists user_description
(
    name      varchar(100) null,
    UserId    varchar(100) null,
    Position  varchar(100) null,
    Career    varchar(100) null,
    SKILL1    varchar(100) null,
    SKILL2    varchar(100) null,
    SKILL3    varchar(100) null,
    Introduce varchar(100) null
);

create table if not exists usericon
(
    UserId varchar(100) null,
    iconId varchar(100) null
);

create
    definer = study@`%` procedure LIKE_PROCEDURE(IN fboard_id int, IN user_id varchar(20))
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
END;

create
    definer = study@`%` procedure LOUNGE_PROCEDURE(IN startNum int, IN size int)
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
    order by DATE desc
    limit startNum, size;
end;

