-- 2.3
SELECT NOW();
SELECT 'aaa';

-- 4.1
SHOW DATABASES;

-- 4.2
CREATE DATABASE alancong;

-- 4.3
CREATE DATABASE IF NOT EXISTS alancong;
SHOW DATABASES ;
-- 切换默认的数据库
USE alancong;

-- 4.4
DROP DATABASE alancong;
DROP DATABASE IF EXISTS alancong;
SHOW DATABASES ;

-- 5.1
SHOW TABLES;

-- 5.2
CREATE TABLE first_table
(
    first_column  INT,
    second_column VARCHAR(100)
);
SHOW TABLES ;

CREATE TABLE first_table
(
    first_column  INT,
    second_column VARCHAR(100)
)  COMMENT '第一个表';
SHOW TABLES ;

CREATE TABLE student_info (
    NUMBER INT,
    NAME VARCHAR(5),
    SEX ENUM('男', '女'),
    ID_NUMBER CHAR(18),
    DEPARTMENT VARCHAR(30),
    MAJOR VARCHAR(30),
    ENROLLMENT_TIME DATE
) COMMENT '学生基本信息表';

CREATE TABLE student_score (
    NUMBER INT,
    SUBJECT VARCHAR(30),
    SCORE TINYINT
) COMMENT '学生成绩表';

SHOW TABLES ;
DESCRIBE STUDENT_INFO;

-- 5.2.4
CREATE TABLE IF NOT EXISTS first_table
(
    first_column  INT,
    second_column VARCHAR(100)
)  COMMENT '第一个表';
SHOW TABLES ;

CREATE TABLE IF NOT EXISTS student_info (
    NUMBER INT,
    NAME VARCHAR(5),
    SEX ENUM('男', '女'),
    ID_NUMBER CHAR(18),
    DEPARTMENT VARCHAR(30),
    MAJOR VARCHAR(30),
    ENROLLMENT_TIME DATE
) COMMENT '学生基本信息表';

CREATE TABLE IF NOT EXISTS student_score (
    NUMBER INT,
    SUBJECT VARCHAR(30),
    SCORE TINYINT
) COMMENT '学生成绩表';

SHOW TABLES ;
DESCRIBE STUDENT_INFO;

-- 5.3
DROP TABLE first_table;
SHOW TABLES ;

DROP TABLE IF EXISTS first_table;
SHOW TABLES ;

-- 5.4
DESCRIBE student_info;
SHOW TABLES;

-- 5.5
USE alancong;
SHOW CREATE TABLE alancong.first_table;

-- 5.6.1
ALTER TABLE first_table RENAME TO first_table1;

CREATE DATABASE IF NOT EXISTS shuanghui;
ALTER TABLE first_table1 RENAME TO shuanghui.first_table;
SHOW TABLES FROM shuanghui;
RENAME TABLE shuanghui.first_table TO alancong.first_table;

-- 5.6.2
ALTER TABLE first_table ADD COLUMN third_column CHAR(4);
DESCRIBE first_table;

ALTER TABLE first_table ADD COLUMN fourth_column CHAR(4) FIRST;
DESCRIBE first_table;

ALTER TABLE first_table ADD COLUMN fifth_column CHAR(4) AFTER first_column;
DESCRIBE first_table;

-- 5.6.3
ALTER TABLE first_table DROP COLUMN third_column;
ALTER TABLE first_table DROP COLUMN fourth_column;
ALTER TABLE first_table DROP COLUMN fifth_column;

-- 5.6.4
ALTER TABLE first_table MODIFY second_column VARCHAR(2);
SHOW CREATE TABLE first_table;

ALTER TABLE first_table CHANGE second_column second_column1 VARCHAR(2);
DESCRIBE first_table;

ALTER TABLE first_table MODIFY second_column1 VARCHAR(2) FIRST;
DESCRIBE first_table;

ALTER TABLE first_table MODIFY second_column1 VARCHAR(2) AFTER first_column;
DESCRIBE first_table;

-- 5.6.5 注意这样写的时候，需要加上DROP COLUMN操作
ALTER TABLE first_table DROP COLUMN third_column, DROP COLUMN fourth_column, DROP COLUMN fifth_column;

-- 5.6.6
ALTER TABLE first_table CHANGE second_column1 second_column VARCHAR(100);
DESCRIBE first_table;

-- 6.1.1
SELECT * FROM first_table;

-- 6.1.2
INSERT INTO first_table(first_column, second_column) VALUES(1, 'aaa');
SELECT * FROM first_table;

INSERT INTO first_table(first_column) VALUE(2);
SELECT * FROM first_table;

-- 6.1.3
INSERT INTO first_table(first_column, second_column) VALUE(4, 'ddd'),
    (5, 'eee'),
    (6, 'fff');
SELECT * FROM first_table;

-- 6.2
DROP TABLE first_table;

-- 6.2.1
CREATE TABLE first_table (
    first_column INT,
    second_column VARCHAR(100) DEFAULT 'abc'
);
INSERT INTO first_table(first_column) VALUE(1);
SELECT * FROM first_table;

-- 6.2.2
ALTER TABLE first_table MODIFY first_column INT NOT NULL;
INSERT INTO first_table(first_column, second_column) VALUES(NULL, 'aaa');
INSERT INTO first_table(second_column) VALUES('aaa');

-- 6.2.3
DROP TABLE IF EXISTS student_info;

CREATE TABLE student_info (
    number INT PRIMARY KEY,
    name VARCHAR(5),
    sex ENUM('男', '女'),
    id_number CHAR(18),
    department VARCHAR(30),
    major VARCHAR(30),
    enrollment_time DATE
);

CREATE TABLE student_info (
    number INT,
    name VARCHAR(5),
    sex ENUM('男', '女'),
    id_number CHAR(18),
    department VARCHAR(30),
    major VARCHAR(30),
    enrollment_time DATE,
    PRIMARY KEY (number)
);

CREATE TABLE student_score (
    number INT,
    subject VARCHAR(30),
    score TINYINT,
    PRIMARY KEY (number, subject)
);

INSERT INTO student_info(number) VALUES(NULL);

-- 6.2.4
CREATE TABLE student_info (
    number INT PRIMARY KEY,
    name VARCHAR(5),
    sex ENUM('男', '女'),
    id_number CHAR(18) UNIQUE,
    department VARCHAR(30),
    major VARCHAR(30),
    enrollment_time DATE
);

CREATE TABLE student_info (
    number INT PRIMARY KEY,
    sex ENUM('男', '女'),
    id_number CHAR(18),
    department VARCHAR(30),
    major VARCHAR(30),
    enrollment_time DATE,
    UNIQUE KEY uk_id_number (id_number)
);

-- 6.2.5
CREATE TABLE first_table (
    first_column INT UNIQUE,
    second_column VARCHAR(100) NOT NULL UNIQUE
);

-- 6.2.6
CREATE TABLE student_score (
    number INT,
    subject VARCHAR(30),
    score TINYINT,
    PRIMARY KEY (number, subject),
    CONSTRAINT FOREIGN KEY(number) REFERENCES student_info(number)
);

-- 6.2.7
DROP TABLE first_table;
CREATE TABLE first_table (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_column INT,
    second_column VARCHAR(100) DEFAULT 'abc'
);
INSERT INTO first_table(first_column, second_column)
    VALUES(1, 'aaa'),
          (1, 'bbb'),
          (1, 'ccc');
SELECT * FROM first_table;

INSERT INTO first_table(id, first_column, second_column)
    VALUES(8, 1, 'ddd');
SELECT * FROM first_table;

INSERT INTO first_table(first_column, second_column)
    VALUES(1, 'eee');
SELECT * FROM first_table;

-- 6.2.8
CREATE TABLE first_table (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '自增主键',
    first_column INT COMMENT '第一列',
    second_column VARCHAR(100) DEFAULT 'abc' COMMENT '第二列'
) COMMENT '第一个表';

-- 6.2.9
-- mysql  Ver 9.4.0 for macos15 on arm64 (MySQL Community Server - GPL)
-- 我使用的数据库版本如果将字段 i2 设置为 UNSIGNED的话会自动这是ZEROFILL
CREATE TABLE zerofill_table (
    i1 INT UNSIGNED ZEROFILL,
    i2 INT /*UNSIGNED*/
);
INSERT INTO zerofill_table(i1, i2) VALUES(1, 1);
SELECT * FROM zerofill_table;
SHOW CREATE TABLE zerofill_table;

ALTER TABLE zerofill_table MODIFY i1 INT(5) UNSIGNED ZEROFILL;
SELECT * FROM zerofill_table;

DROP TABLE zerofill_table;
CREATE TABLE zerofill_table (
    i1 INT ZEROFILL,
    i2 INT UNSIGNED
);

INSERT INTO zerofill_table(i1, i2) VALUES(123456, 123456);
SELECT * FROM zerofill_table;

-- 6.3
DESC student_info;

CREATE TABLE `first_table` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `first_column` INT,
    `second_column` VARCHAR(100) DEFAULT 'abc'
);

-- 7.1.1
DROP TABLE IF EXISTS student_info, student_score;

CREATE TABLE student_info (
    number INT PRIMARY KEY,
    name VARCHAR(5),
    sex ENUM('男', '女'),
    id_number CHAR(18),
    department VARCHAR(30),
    major VARCHAR(30),
    enrollment_time DATE,
    UNIQUE KEY (id_number)
);

CREATE TABLE student_score (
    number INT,
    subject VARCHAR(30),
    score TINYINT,
    PRIMARY KEY (number, subject),
    CONSTRAINT FOREIGN KEY(number) REFERENCES student_info(number)
);

INSERT INTO student_info(number, name, sex, id_number, department, major, enrollment_time)
    VALUES(20210101, '狗哥', '男', '158177200301044792', '计算机学院', '计算机科学与工程', '2021-09-01'),
          (20210102, '猫爷', '男', '151008200201178529', '计算机学院', '计算机科学与工程', '2021-09-01'),
          (20210103, '艾希', '女', '17156320010116959X', '计算机学院', '软件工程', '2021-09-01'),
          (20210104, '亚索', '男', '141992200201078600', '计算机学院', '软件工程', '2021-09-01'),
          (20210105, '莫甘娜', '女', '181048200008156368', '航天学院', '飞行器设计', '2021-09-01'),
          (20210106, '赵信', '男', '197995200201078445', '航天学院', '电子信息', '2021-09-01');
INSERT INTO student_score(number, subject, score)
    VALUES(20210101, '计算机是怎样运行的', 78),
          (20210101, 'MySQL是怎样运行的', 88),
          (20210102, '计算机是怎样运行的', 100),
          (20210102, 'MySQL是怎样运行的', 98),
          (20210103, '计算机是怎样运行的', 59),
          (20210103, 'MySQL是怎样运行的', 61),
          (20210104, '计算机是怎样运行的', 55),
          (20210104, 'MySQL是怎样运行的', 46);

SELECT * FROM student_info;
SELECT * FROM student_score;

-- 7.2
SELECT number FROM  student_info;
SELECT number AS 学号 FROM student_info;
SELECT number 学号 FROM student_info;
SELECT number xuehao FROM student_info;

-- 7.3
SELECT number, name, id_number, major FROM student_info;
SELECT number AS 学号, name AS 姓名, id_number AS 身份证号, major AS 专业 FROM student_info;
SELECT number, number, number FROM student_info;

-- 7.4
SELECT * FROM student_info;

-- 7.5
SELECT department FROM student_info;
SELECT DISTINCT department FROM student_info;

-- 去重相同的列，列完全相同只保留一个
SELECT department, major FROM student_info;
SELECT DISTINCT department, major FROM student_info;

-- 7.6
SELECT number, name, id_number, major FROM student_info LIMIT 2;
SELECT number, name, id_number, major FROM student_info LIMIT 2, 2;

-- 7.7
SELECT * FROM student_score ORDER BY score;
SELECT * FROM student_score ORDER BY score DESC;

SELECT * FROM student_score ORDER BY subject, score DESC;
SELECT * FROM student_score ORDER BY score LIMIT 1;

-- 8.1
SELECT number, name, id_number, major FROM student_info WHERE name = '狗哥';
SELECT number, name, id_number, major FROM student_info WHERE number > 20210103;
SELECT number, name, id_number, major FROM student_info WHERE major != '计算机科学与工程';
SELECT number, name, id_number, major FROM student_info WHERE number BETWEEN 20210102 AND 20210104;
SELECT number, name, id_number, major FROM student_info WHERE number NOT BETWEEN 20210102 AND 20210104;

-- 8.2
SELECT number, name, id_number, major FROM student_info WHERE major IN ('软件工程', '飞行器设计');
SELECT number, name, id_number, major FROM student_info WHERE major NOT IN ('软件工程', '飞行器设计');

-- 8.3
SELECT number, name, id_number, major FROM student_info WHERE name IS NULL;
SELECT number, name, id_number, major FROM student_info WHERE name IS NOT NULL;

SELECT * FROM student_score WHERE subject = 'MySQL是怎样运行的' AND score > 75;
SELECT * FROM student_score WHERE score > 95 OR score < 55;
SELECT * FROM student_score WHERE score > 95 OR score < 55 AND subject = 'MySQL是怎样运行的';
SELECT * FROM student_score WHERE (score > 95 OR score < 55) AND subject = 'MySQL是怎样运行的';

-- 8.5
SELECT number, name, id_number, major FROM student_info WHERE name LIKE '狗%';
SELECT number, name, id_number, major FROM student_info WHERE name LIKE '%甘%';
SELECT number, name, id_number, major FROM student_info WHERE name LIKE '赵_';
SELECT number, name, id_number, major FROM student_info WHERE name LIKE '莫_';
SELECT number, name, id_number, major FROM student_info WHERE name LIKE '狗\_';

-- 9.1
SELECT number, subject, score + 100 FROM student_score;
SELECT number, subject, score + 100 AS score FROM student_score;
SELECT '1', 'a' FROM student_info;
SELECT 1;
SELECT 5 * 6 - 8 + 25;
SELECT number, name, id_number, major FROM student_info WHERE 2 > 1;
SELECT number, name, id_number, major FROM student_info WHERE NULL;
SELECT number, name, id_number, major FROM student_info WHERE 0;
SELECT number, name, id_number, major FROM student_info WHERE 2;

SELECT 1 + NULL, NULL * 1;
SELECT 1 = NULL, 2 > NULL;
SELECT 1 IS NULL, NULL IS NULL, 1 IS NOT NULL, NULL IS NOT NULL;
SELECT 1 <=> 2, 1 <=> 1, 1 <=> NULL, NULL <=> NULL;

-- 9.2
SELECT SUBSTRING('abc123', 2, 3);
SELECT CONCAT('学号为', number, '的学生在《', subject, '》课程的成绩是：', score) AS 成绩描述 FROM student_score;
SELECT DATE_ADD('2021-05-11 17:10:43', INTERVAL 2 MINUTE);
SELECT DATE_FORMAT('2021-05-11 17:10:43', '%b %d %Y %h:%i %p');

SELECT number, subject, score,
       CASE WHEN score < 60 THEN '不及格'
           WHEN score < 90 THEN '及格'
           ELSE '优秀' END AS level
FROM student_score;

SELECT name, department,
       CASE department WHEN '计算机学院' THEN '1级学科'
           WHEN '航天学院' THEN '2级学科'
           END AS 学院类别
FROM student_info;

SELECT IF(1 > 2, 2, 4);
SELECT IFNULL(NULL, 5);
SELECT IFNULL(3, 5);
SELECT NULLIF(2, 3);
SELECT NULLIF(2, 2);

SELECT MAX(score) FROM student_score WHERE subject = 'MySQL是怎样运行的';
SELECT MIN(score) FROM student_score WHERE subject = 'MySQL是怎样运行的';
SELECT SUM(score) FROM student_score WHERE subject = 'MySQL是怎样运行的';
SELECT AVG(score) FROM student_score WHERE subject = 'MySQL是怎样运行的';

CREATE TABLE count_demo(
    c INT
);
INSERT INTO count_demo(c) VALUES(1), (NULL), (2), (NULL);
SELECT * FROM count_demo;
SELECT COUNT(c) FROM count_demo;
SELECT COUNT(*) FROM count_demo;
SELECT COUNT(1) FROM count_demo;

SELECT COUNT(DISTINCT major) FROM student_info;
SELECT COUNT(*) AS 成绩记录总数, MAX(score) AS 最高成绩, MIN(score) AS 最低成绩, AVG(score) AS 平均成绩 FROM student_score;

-- 9.3
SELECT 1 + 2, '1' + 2, '1' + '2';
SELECT 1 + '23sfd';
SELECT 1 > 'a', 1 AND 'a', 1 AND '2a';
SELECT CONCAT('1', '2'), CONCAT('1', 2), CONCAT(1, 2);

SELECT 5 WHERE 'a';
SELECT 5 WHERE '2a';

CREATE TABLE type_conversion_demo(
    i1 TINYINT,
    i2 TINYINT,
    s VARCHAR(100)
);
INSERT INTO type_conversion_demo(i1, i2, s) VALUES('100', '100', 200);
SELECT * FROM type_conversion_demo;

INSERT INTO type_conversion_demo(i1, i2, s) VALUES('sfd', 'sfd', 'aaa');

-- 10.1
SELECT AVG(score) FROM student_score WHERE subject = 'MySQL是怎样运行的';
SELECT AVG(score) FROM student_score WHERE subject = '计算机是怎样运行的';

SELECT subject, AVG(score) FROM student_score GROUP BY subject;
SELECT number, subject, AVG(score) FROM student_score GROUP BY subject;

SELECT subject, AVG(score) FROM student_score WHERE score >= 60 GROUP BY subject;
SELECT subject, AVG(score) FROM student_score GROUP BY subject HAVING AVG(score) > 73;
SELECT subject, AVG(score) FROM student_score GROUP BY subject HAVING subject = '计算机是怎样运行的';
SELECT subject, AVG(score) FROM student_score WHERE subject = '计算机是怎样运行的' GROUP BY subject;
SELECT subject, AVG(score) FROM student_score GROUP BY subject HAVING MAX(score) > 98;
SELECT subject, AVG(score) FROM student_score WHERE MAX(score) > 98 GROUP BY subject;
SELECT subject, AVG(score) FROM student_score GROUP BY subject ORDER BY AVG(score) DESC;
SELECT subject, AVG(score) AS avg_score FROM student_score GROUP BY subject ORDER BY avg_score DESC;
SELECT department, major, COUNT(*) FROM student_info GROUP BY department, major;
SELECT CONCAT('专业：', major), COUNT(*) FROM student_info GROUP BY CONCAT('专业：', major);

-- 11.1
SELECT number FROM student_info WHERE name = '狗哥';
SELECT * FROM student_score WHERE number = 20210101;

-- 11.2
SELECT * FROM student_score WHERE number = (SELECT number FROM student_info WHERE name = '狗哥');
SELECT (SELECT number FROM student_info WHERE name = '狗哥') AS 学号;
SELECT * FROM student_score WHERE number > (SELECT number FROM student_info WHERE name = '狗哥');

-- 11.3
SELECT number FROM student_info WHERE major = '计算机科学与工程';
SELECT * FROM student_score WHERE number IN (20210101, 20210102);

SELECT * FROM student_score WHERE number IN (SELECT number FROM student_info WHERE major = '计算机科学与工程');

-- 11.4
SELECT * FROM student_score WHERE (number, subject) = (SELECT number, 'MySQL是怎样运行的' FROM student_info LIMIT 1);

-- 11.5
SELECT * FROM student_score WHERE (number, subject) IN (SELECT number, 'MySQL是怎样运行的' FROM student_info WHERE major = '计算机科学与工程');

-- 11.6
SELECT * FROM student_score WHERE EXISTS (SELECT * FROM student_info WHERE number = 20210108);

-- 11.7
SELECT * FROM student_score WHERE number = (SELECT number FROM student_info WHERE name = '狗哥');

SELECT number, name, id_number, major
FROM student_info WHERE EXISTS (SELECT * FROM student_score WHERE student_info.number = student_score.number);
SELECT * FROM student_score WHERE subject = 'MySQL是怎样运行的' AND score > AVG(score);

SELECT * FROM student_score WHERE subject = 'MySQL是怎样运行的' AND score > (SELECT AVG(score) FROM student_score WHERE subject = 'MySQL是怎样运行的');
