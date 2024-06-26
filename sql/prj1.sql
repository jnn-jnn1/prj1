CREATE DATABASE prj1;

USE prj1;

CREATE TABLE board
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(200)  NOT NULL,
    content  VARCHAR(3000) NOT NULL,
    writer   VARCHAR(100)  NOT NULL,
    inserted DATETIME      NOT NULL DEFAULT NOW()
);

SELECT *
FROM board;

USE prj1;

# 회원 테이블
CREATE TABLE member
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    email     VARCHAR(200) NOT NULL UNIQUE,
    password  VARCHAR(200) NOT NULL,
    nick_name VARCHAR(100) NOT NULL UNIQUE,
    inserted  DATETIME     NOT NULL DEFAULT NOW()
);

ALTER TABLE member
    ADD COLUMN inserted DATETIME NOT NULL DEFAULT NOW();

SELECT *
FROM board;

# 페이징용
INSERT INTO board
    (title, content, member_id)
SELECT title, content, member_id
FROM board;

SELECT COUNT(id)
FROM board;

# board 테이블 수정
# writer 컬럼 지우고 member_id 컬럼 추가

ALTER TABLE board
    DROP COLUMN writer;
ALTER TABLE board
    ADD COLUMN member_id INT REFERENCES member (id);

UPDATE board
SET member_id = 12
WHERE id > 0;

SELECT *
FROM board;

SELECT *
FROM member;