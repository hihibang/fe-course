use myshop2019;
select database();
show tables;

-- Q11) 포인트가 500,000 이상인 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
select customer_name,
	   customer_id,
       gender,
       city,
       phone,
       point
	from customer
    where point >= 500000;
 
select o.order_id,
	   c.customer_name,
	   e.employee_name,
       o.order_date,
       format(o.total_due, 0) as total_due
	from customer c, order_header o, employee e
    where c.customer_id = o.customer_id
    and e.employee_id = o.employee_id
    and total_due >= 8500000;
    
-- Q07) 주문수량이 30개 이상인 주문의 주문번호, 상품코드, 주문수량, 단가, 지불금액을 조회하세요.
select p.product_name,
	   od.order_id,
	   od.product_id,
       od.order_qty,
       od.unit_price,
       od.line_total,
       c.customer_name
	from order_detail od, product p, order_header oh, customer c
    where oh.order_id = od.order_id
    and oh.customer_id = c.customer_id
    and od.product_id = p.product_id
    and order_qty >= 30;

