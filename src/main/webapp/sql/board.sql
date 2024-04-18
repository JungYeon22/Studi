CREATE TABLE `BOARD` (
                         `BOARDID`	VARCHAR(100),
                         `SUBJECT`	VARCHAR(100),
                         `CONTENT`	VARCHAR(4000), -- mediumblob로 변경
                         `userTotCnt` INT,
                         `userCurCnt` INT,
                         `projectType` VARCHAR(100),
                         `projectField` VARCHAR(100),
                         `UserId`	VARCHAR(100),
                         `DATE`	DATETIME,
                         `FILE`	VARCHAR(100),
                         `HIT`	VARCHAR(100)
);

CREATE TABLE `COMMENT` (
                           `No`	INT auto_increment primary key,
                           `ref` INT,
                           `BOARDID`	VARCHAR(100),
                           `DATE`	DATE,
                           `UserId`	VARCHAR(100),
                           `TEXT`	VARCHAR(100)
);

CREATE TABLE `SCRAP` (
`UserId`	VARCHAR(100),
`BOARDID`	VARCHAR(100)
);

CREATE TABLE `boardtag` (
`CONTENT`	VARCHAR(100),
`BOARDID`	VARCHAR(100)
);
