CREATE TABLE USER (
    UserId    VARCHAR(100)    ,
    PWD    VARCHAR(100),
    NAME    VARCHAR(100)    ,
    EMAIL    VARCHAR(100)    ,
    PHONE    VARCHAR(100)    ,
    HIREDATE    DATE     default (CURRENT_DATE)   ,
    LOGIN_TYPE VARCHAR(100)
);

CREATE TABLE USER_Description (
	name	VARCHAR(100),
    UserId	VARCHAR(100),
    Position VARCHAR(100),
	Career	VARCHAR(100),
	SKILL1	VARCHAR(100),
	SKILL2	VARCHAR(100),
	SKILL3	VARCHAR(100),
    Introduce  VARCHAR(100)
);


CREATE TABLE `USERICON` (
                            `UserId`	VARCHAR(100),
                            `iconId`	VARCHAR(100)
);