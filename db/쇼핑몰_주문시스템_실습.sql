-- CREATE DATABASE IF NOT EXISTS `shoppy2026`;
show databases;
use shoppy2026;
select database();
/******************************************************
	Member 		- mid 		- trg_member_mid
    Order 		- orid 		- trg_order_orid
    OrderItem 	- ord_id 	- trg_orderitem_ord_id
    Product 	- pid 		- trg_product_pid
*******************************************************/
create table member(
	mid				char(5)		primary key,
    name			varchar(10)	not null,
    email			varchar(20) not null,
    created_at		datetime	
);

delimiter $$
create trigger trg_member_mid
before insert on member
for each row
begin
declare max_code int;  --  'M0001'

-- 현재 저장된 값 중 가장 큰 값을 가져옴
SELECT IFNULL(MAX(CAST(right(mid, 4) AS UNSIGNED)), 0)
INTO max_code
FROM member; 

-- 'M0001' 형식으로 아이디 생성, LPAD(값, 크기, 채워지는 문자형식) : M0001
SET NEW.mid = concat('M', LPAD((max_code+1), 4, '0'));

end $$
delimiter 	;

desc member;

create table order2(
	orid			char(6)		primary key,
    member_id		char(5),
    order_date		date
);
alter table order2
	add constraint fk_order2_member_id foreign key(member_id)
			references member(mid)
            on delete cascade
            on update cascade;
drop table order2;
desc order2;


delimiter $$
create trigger trg_order_orid
before insert on order2
for each row
begin
declare max_code int;  --  'OR0001'

-- 현재 저장된 값 중 가장 큰 값을 가져옴
SELECT IFNULL(MAX(CAST(right(orid, 4) AS UNSIGNED)), 0)
INTO max_code
FROM order2; 

-- 'M0001' 형식으로 아이디 생성, LPAD(값, 크기, 채워지는 문자형식) : M0001
SET NEW.orid = concat('OR', LPAD((max_code+1), 4, '0'));

end $$
delimiter 	;

create table product(
	pid		char(5)		primary key,
	name	varchar(10)	not null,
    price	int
);

desc product;

delimiter $$
create trigger trg_product_pid
before insert on product
for each row
begin
declare max_code int;  --  'P0001'

-- 현재 저장된 값 중 가장 큰 값을 가져옴
SELECT IFNULL(MAX(CAST(right(pid, 4) AS UNSIGNED)), 0)
INTO max_code
FROM product; 

-- 'M0001' 형식으로 아이디 생성, LPAD(값, 크기, 채워지는 문자형식) : M0001
SET NEW.pid = concat('P', LPAD((max_code+1), 4, '0'));

end $$
delimiter 	;

create table orderitem(
	ord_id			char(7)		primary key,
    order_id		char(6),		
    product_id		char(5),
    quantity		int,
    unit_price		int
);

alter table orderitem
	add constraint fk_orderitem_order_id foreign key(order_id)
			references order2(orid)
            on delete cascade
            on update cascade;
alter table orderitem
	add constraint fk_orderitem_product_id foreign key(product_id)
			references product(pid)
            on delete cascade
            on update cascade;
            
desc orderitem;
delimiter $$
create trigger trg_orderitem_ord_id
before insert on orderitem
for each row
begin
declare max_code int;  --  'ORD0001'

-- 현재 저장된 값 중 가장 큰 값을 가져옴
SELECT IFNULL(MAX(CAST(right(ord_id, 4) AS UNSIGNED)), 0)
INTO max_code
FROM orderitem; 

-- 'M0001' 형식으로 아이디 생성, LPAD(값, 크기, 채워지는 문자형식) : M0001
SET NEW.ord_id = concat('ORD', LPAD((max_code+1), 4, '0'));

end $$
delimiter 	;

select * from information_schema.triggers
		 where trigger_schema = 'shoppy2026';
DROP TRIGGER trg_orderitem_ord_id;

insert into member(name, email, created_at)
	values('홍길동', '0000@naver.com', now());
select * from member;

DESC order2;
insert into order2(member_id, order_date)
	values('M0001', curdate());
select * from order2;

insert into product(name, price)
	values('올데쿠 쿠션', 23000);
select * from product;

insert into orderitem(order_id, product_id)
	values('OR0001', 'P0001');
select * from orderitem;

