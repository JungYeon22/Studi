CREATE TABLE `BOARD` (
                         `BOARDID`	VARCHAR(100),
                         `SUBJECT`	VARCHAR(100),
                         `CONTENT`	VARCHAR(4000),
                         `userCnt` INT,
                         `projectType` VARCHAR(100),
                         `projectField` VARCHAR(100),
                         `UserId`	VARCHAR(100),
                         `DATE`	DATE,
                         `FILE`	VARCHAR(100),
                         `HIT`	VARCHAR(100)
);

CREATE TABLE `COMMENT` (
`No`	INT,
`BOARDID`	VARCHAR(100),
`DATE`	DATE,
`UserId`	VARCHAR(100),
`TEXT`	VARCHAR(100)
);

CREATE TABLE `SCRAP` (
`UserId`	VARCHAR(100),
`BOARDID`	VARCHAR(100)
);

CREATE TABLE `TAG` (
`CONTENT`	VARCHAR(100),
`BOARDID`	VARCHAR(100)
);
