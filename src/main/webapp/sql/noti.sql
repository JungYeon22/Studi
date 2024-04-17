
CREATE TABLE `notice` (
    `noti_id` INT primary key auto_increment,
    `title`	VARCHAR(100),
    `content`	text,
    `date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `period` int
);