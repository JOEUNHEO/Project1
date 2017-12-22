CREATE TABLE users1(
id VARCHAR2(100) PRIMARY KEY,
pwd VARCHAR2(100) NOT NULL,
email VARCHAR2(100),
regdate DATE);

CREATE TABLE board_data1(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
orgFileName VARCHAR2(100) NOT NULL,
saveFileName VARCHAR2(100) NOT NULL,
fileSize NUMBER NOT NULL,
regdate DATE);

CREATE SEQUENCE board_data1_seq;

CREATE TABLE board_guest1
(num NUMBER PRIMARY KEY,
writer VARCHAR2(50),
title VARCHAR2(100),
content CLOB,
regdate DATE);

CREATE SEQUENCE board_guest1_seq;