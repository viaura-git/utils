-- 기초데이터 등록
-- 1. 권한의 종류 등록
INSERT INTO ROLES (ROLE_NAME) VALUES
          ('ROLE_USER'),('ROLE_ADMIN'), ('ROLE_SITE'), ('ROLE_DIST');
-- 2. 은행과 코드등록
INSERT INTO BANKS (CODE, NAME) VALUES
            ('002', 'KDB산업은행'),
            ('003', 'IBK기업은행'),
            ('004', 'KB국민은행'),
            ('005', 'KEB하나은행'),
            ('007', '수협은행'),
            ('011', 'NH농협은행'),
            ('020', '우리은행'),
            ('023', 'SC제일은행'),
            ('027', '한국씨티은행'),
            ('031', 'DGB대구은행'),
            ('032', 'BNK부산은행'),
            ('034', '광주은행'),
            ('035', '제주은행'),
            ('037', '전북은행'),
            ('039', '경남은행'),
            ('045', 'MG새마을금고'),
            ('048', '신협'),
            ('050', '상호저축은행'),
            ('064', '산림조합중앙회'),
            ('071', '우체국'),
            ('081', '하나은행'),
            ('088', '신한은행'),
            ('089', '케이뱅크'),
            ('090', '카카오뱅크'),
            ('092', '토스뱅크');


-- 2. super admin (developer) 사용자 등록
-- JPA POJO에서 @CreatedDate를 붙여도 data.sql의 초기 데이터 로딩에서는 작동하지 않는다
-- JPA는 JPA로 insert 할때만 동작한다. 그러므로 명시적으로 넣는다
INSERT INTO users (
    user_id, email, user_name, password, phone, bank_name, bank_code, bank_account, bank_account_holder, bank_identifier, enabled, reg_date, password_changed_date
) VALUES (
    'hqadmin',
    'admin@example.com',
    '본사관리자',
    '$2a$10$7OJPaNi1GZmH4j6UT5AOyONuor9HXuaBYj1Ki0Vbpf8tKOJT10i42', -- "1234"
    '000-1111-2222',
          '국민은행',
          '004',
          '329-000001-002',
          '본사홍길동',
          '111-222222-1',
    true,
    now(),
    now()
);

-- 3. admin 권한 연결
-- 초기 데이터이므로 hqadmin의 id는 1 일 것이라 가정하는 것 뿐이다
INSERT INTO user_roles (user_unique_id, role_name)
VALUES (1, 'ROLE_ADMIN');

-- --------------------------------------------------
-- 총판 (DISTRIBUTOR)
-- --------------------------------------------------
-- 4. 총판 2개 등록
insert into dist (email, name, phone, reg_date, comm_rate)
values ('kana@naver.com', '가나총판', '111-2222-3333', now(), 10.0);

insert into dist (email, name, phone, reg_date, comm_rate)
values ('nara@naver.com', '나라총판', '111-3333-4444', now(), 5.0);

-- 5. kana 총판 관리자
INSERT INTO users (
    user_id, email, user_name, password, phone, bank_name, bank_code, bank_account, bank_account_holder, bank_identifier, dist_id, enabled, reg_date, password_changed_date
) VALUES (
             'kana',
             'kana@naver.com',
             '홍길동',
             '$2a$10$7OJPaNi1GZmH4j6UT5AOyONuor9HXuaBYj1Ki0Vbpf8tKOJT10i42', -- "1234"
             '010-2222-3333',
             '신한은행',
             '001',
             '300-222222-001',
             '가나총판',
             '111-33333-1',
             101,
             true,
             now(),
          now()
         );

-- 7. nara 총판 관리자
INSERT INTO users (
    user_id, email, user_name, password, phone, bank_name, bank_code, bank_account, bank_account_holder, bank_identifier, dist_id, enabled, reg_date, password_changed_date
) VALUES (
             'nara',
             'nara@naver.com',
             '김나라',
             '$2a$10$7OJPaNi1GZmH4j6UT5AOyONuor9HXuaBYj1Ki0Vbpf8tKOJT10i42', -- "1234"
             '010-2222-3333',
             '신한은행',
             '001',
             '300-333333-001',
             '나라총판',
             '111-33333-1',
             102,
             true,
             now(),
          now()
         );

INSERT INTO user_roles (user_unique_id, role_name)
VALUES (2, 'ROLE_DIST');

INSERT INTO user_roles (user_unique_id, role_name)
VALUES (3, 'ROLE_DIST');

-- --------------------------------------------------
-- 가맹점 (SITE)
-- --------------------------------------------------
-- 8. site 각 2개씩 등록
insert into site (email, name, phone, reg_date, dist_id, enabled, comm_rate)
values ('a@naver.com', 'a 가맹점', '111-2222-3333', now(), 101, true, 5.0);

insert into site (email, name, phone, reg_date, dist_id, enabled, comm_rate)
values ('b@naver.com', 'b 가맹점', '111-2222-3333', now(), 101, true, 2.5);

insert into site (email, name, phone, reg_date, dist_id, enabled, comm_rate)
values ('c@naver.com', 'c 가맹점', '111-2222-3333', now(),102, true, 6.2);

insert into site (email, name, phone, reg_date, dist_id, enabled, comm_rate)
values ('d@naver.com', 'd 가맹점', '111-2222-3333', now(), 102, true, 4.5);

-- 9. a 사이트 관리자
INSERT INTO users (
    user_id, email, user_name, password, phone, bank_name, bank_code, bank_account, bank_account_holder, bank_identifier, dist_id, site_id, enabled, reg_date, password_changed_date
) VALUES (
             'aaaa',
             'a@naver.com',
             'aaaa',
             '$2a$10$7OJPaNi1GZmH4j6UT5AOyONuor9HXuaBYj1Ki0Vbpf8tKOJT10i42', -- "1234"
             '010-4444-4444',
             '카카오뱅크',
             '011',
             '011-1111111-001',
             'a가맹점',
             '111-444444-001',
             101,
             1001,
             true,
             now(),
          now()
         );
-- b 사이트 관리자
INSERT INTO users (
    user_id, email, user_name, password, phone, bank_name, bank_code, bank_account, bank_account_holder, bank_identifier, dist_id, site_id, enabled, reg_date, password_changed_date
) VALUES (
             'bbbb',
             'b@naver.com',
             'bbbb',
             '$2a$10$7OJPaNi1GZmH4j6UT5AOyONuor9HXuaBYj1Ki0Vbpf8tKOJT10i42', -- "1234"
             '010-4444-4444',
             '카카오뱅크',
             '011',
             '011-222222-001',
             'b가맹점',
             '111-555555-001',
             101,
             1002,
             true,
             now(),
          now()
         );

-- c 사이트 관리자
INSERT INTO users (
    user_id, email, user_name, password, phone, bank_name, bank_code, bank_account, bank_account_holder, bank_identifier, dist_id, site_id, enabled, reg_date, password_changed_date
) VALUES (
             'cccc',
             'c@naver.com',
             'bbbb',
             '$2a$10$7OJPaNi1GZmH4j6UT5AOyONuor9HXuaBYj1Ki0Vbpf8tKOJT10i42', -- "1234"
             '010-4444-4444',
             '토스뱅크',
             '012',
             '012-111111-001',
             'c가맹점',
             '111-666666-001',
             102,
             1003,
             true,
             now(),
          now()
         );

-- d 사이트 관리자
INSERT INTO users (
    user_id, email, user_name, password, phone, bank_name, bank_code, bank_account, bank_account_holder, bank_identifier, dist_id, site_id, enabled, reg_date, password_changed_date
) VALUES (
             'dddd',
             'd@naver.com',
             'dddd',
             '$2a$10$7OJPaNi1GZmH4j6UT5AOyONuor9HXuaBYj1Ki0Vbpf8tKOJT10i42', -- "1234"
             '010-4444-4444',
             '토스뱅크',
             '012',
             '012-222222-001',
             'd가맹점',
             '111-777777-001',
             102,
             1004,
             true,
             now(),
          now()
         );

INSERT INTO user_roles (user_unique_id, role_name)
VALUES (4, 'ROLE_SITE');

INSERT INTO user_roles (user_unique_id, role_name)
VALUES (5, 'ROLE_SITE');

INSERT INTO user_roles (user_unique_id, role_name)
VALUES (6, 'ROLE_SITE');

INSERT INTO user_roles (user_unique_id, role_name)
VALUES (7, 'ROLE_SITE');


-- --------------------------------------------------
-- 총판 관리자 등록테스트를 위해, 관리자가 배정되지 않는 총판을 하나 등록한다
-- --------------------------------------------------
insert into dist (email, name, phone, reg_date, comm_rate)
values ('dari@naver.com', '다리총판', '111-2222-3333', now(), 3.0);


-- --------------------------------------------------
-- a 사이트의 member 1명을 등록한다
-- --------------------------------------------------
INSERT INTO MEMBERS (
MEMBER_ID, PASSWORD, PHONE, BANK_NAME, BANK_CODE,
BANK_ACCOUNT, BANK_ACCOUNT_HOLDER, BANK_IDENTIFIER, DEPOSIT_BANK_NAME, DEPOSIT_BANK_CODE,
DEPOSIT_BANK_ACCOUNT, DEPOSIT_BANK_ACCOUNT_PERIOD_FROM, DEPOSIT_BANK_ACCOUNT_PERIOD_TO, DIST_ID, SITE_ID,
ENABLED, DELETED, REG_DATE, UPD_DATE, DEL_DATE
) VALUES (
'testuser01',                         -- MEMBER_ID
'$2a$10$eW5VQCVTj0e12345678bYd6',     -- 암호화된 PASSWORD (예: bcrypt)
'010-1234-5678',                      -- PHONE
'국민은행',                            -- BANK_NAME
'004',                                -- BANK_CODE
'004-123478-901234',                   -- BANK_ACCOUNT
'홍길동',                              -- BANK_ACCOUNT_HOLDER
'900101',                             -- BANK_IDENTIFIER (예: 생년월일 6자리)
null,                            -- DEPOSIT_BANK_NAME
null,                                -- DEPOSIT_BANK_CODE
null,                      -- DEPOSIT_BANK_ACCOUNT
null,                -- DEPOSIT_BANK_ACCOUNT_PERIOD_FROM
null,                -- DEPOSIT_BANK_ACCOUNT_PERIOD_TO
101,                                    -- DIST_ID
1001,                                  -- SITE_ID
TRUE,                                 -- ENABLED
FALSE,                                -- DELETED
CURRENT_TIMESTAMP,                    -- REG_DATE
CURRENT_TIMESTAMP,                    -- UPD_DATE
NULL                                  -- DEL_DATE
);