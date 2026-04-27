/*
	MySQL 
    - 정형 데이터를 저장하는 데이터베이스 
	- RDBMS(Relational DataBase Management System) 구조
    - SQL(Structured Query Language) 문법을 사용하여 데이터의 CRUD를 구현한다.
    - C(Create) :: Insert
    - R(Read) :: Select
    - U(Update) :: Update
    - D(Delete) :: Delete
    - 개발자는 DML 중심의 SQL 문법을 숙지하는 것을 권장한다.
    - SQL은 대소문자를 구분하지 않음, 대부분 소문자로 작성한다.
    - snake case 방식으로 파일명을 작성한다. 예) sql_
    
    SQL
    - SQL의 종류는 DDL, DML, DCL, DTL로 구분한다.
    1. DDL(Data Definition Language) : 데이터 정의어
		- 데이터를 저장하기 위한 공간을 생성하고 논리적으로 정의하는 언어
        - create, alter, truncate, drop 등
	2. DML(Data Manipulation Language) : 데이터 조작어
		- 데이터를 CRUD하는 명령어
        - insert, select, update, delete
	3. DCL(Data Control Language) : 데이터 제어어
		- 데이터에 대한 권한과 보안을 정의하는 언어
        - grant, revoke
	4. DTL(Data Transaction Language) :  트랜잭션 제어어
		- 데이터베이스의 처리 작업인 트랜잭션을 관리하는 언어
        - commit, save, rollback
*/
/******************************************
	✨ 워크벤치 실행시 필수 명령어 ✨
    1. 데이터베이스 접속 및 초기 작업
    show databases;  -- 데이터베이스 확인
    use 데이터베이스명;  -- 사용할 데이터베이스 오픈
    select database(); -- 데이터베이스 선택
    use tables; -- 데이터베이스의 모든 테이블 조회  
******************************************/
show databases;
use hrdb2019;
select database();
show tables;

/******************************************
	DESC(DESCRIBE) : 테이블 구조 확인
    형식> desc 테이블명
******************************************/
show tables;
desc department;
desc employee;
desc vacation;
desc unit;

/******************************************
	SELECT : 테이블 내용 조회
    형식> select [컬럼리스트] from [테이블명]
******************************************/
show tables;
desc employee;
select emp_id, emp_name, eng_name from employee;
select * from employee;  -- * 전체리스트

-- 사원테이블의 사번, 사원명, 성별, 입사일, 급여를 조회
desc employee;
select emp_id, emp_name, gender, hire_date, salary
	from employee;

-- 부서 테이블의 모든 데이터 조회
show tables;
select * from department;

/******************************************
	AS : 컬럼의 별칭 부여
    형식> select [컬럼명 as 별칭, ...] 
		 from [테이블명]
	✨ 컬럼명에 함수를 적용하여 실행하는 경우에 별칭부여
******************************************/
-- 사원테이블의 emp_id 컬럼명을 '사번' 별칭으로 조회
select emp_id as 사번 from employee;
select emp_id 사번 from employee;
select emp_id '사원 번호' from employee;

-- 사원테이블의 별칭을 사번(emp_id), 사원명(emp_name), 
-- 입사일(hire_date), 급여(salary)로 조회
select emp_id as 사번,
		emp_name as 사원명,
		hire_date as 입사일,
        salary as 급여
from employee;

-- 사원테이블의 사원명, 폰번호, 급여, 보너스(급여의 10%), 입사일 조회
-- 산술연산식이 가능한 컬럼은 Number 타입 가능
desc employee;
select emp_name, phone, salary, salary*0.1 bonus, hire_date
	from employee;

-- 현재 날짜를 조회 : curdate()
select curdate() as today from dual;


/***************************************************
	SELECT ~ FROM ~ WHERE : 테이블 상세 내용 조회
    형식> select [컬럼명 as 별칭, ...] 
		 from [테이블명]
         where [컬럼명] [조건절]
****************************************************/
-- 사원테이블에서 '정주고' 사원의 정보 조회
select *
	from employee
    where emp_name = '정주고';

-- SYS 부서에 속한 모든 사원을 조회
desc department;
select *
	from department
    where dept_id = 'SYS';
 
-- 사번이 S0005인 사원의 사원명, 성별, 입사일, 급여를 조회
select emp_name, gender, hire_date, salary
	from employee
    where emp_id = 'S0005';

-- SYS 부서에 속한 모든 사원들을 조회 
-- 단 출력되는 EMP_ID 컬럼은 '사원번호' 별칭으로 조회
desc employee;
select  emp_id as '사원번호',
		emp_name,
        hire_date,
        salary
	from employee
    where dept_id = 'SYS'; -- 소문자 sys도 가능

-- 🎯 컬럼 별칭을 통해 조건절을 처리할 수 있을까요??
-- emp_name의 별칭인 '사원명'으로 '홍길동'을 조회 불가능!! 출력시에 생성되는 별칭!!
select  emp_id,
		emp_name as '사원명',
        hire_date,
        salary
from employee
where '사원명' = '홍길동';	-- 조건절의 컬럼명은 테이블의 원본 컬럼명만 가능!!	

select  emp_id,
		emp_name as '사원명',
        hire_date,
        salary
from employee
where emp_name = '홍길동';	-- 조건절의 컬럼명은 테이블의 원본 컬럼명만 가능!!	

-- 입사일이 2014년 8월 1일인 사원들을 조회
-- date 타입은 표현은 문자열 처럼, 처리는 숫자 처럼 사용됨
select *
	from employee
    where hire_date = '2014-08-01';

-- 급여가 5000 인 사원들을 조회
select *
	from employee
    where salary = 5000;

-- 성별이 남자인 사원들을 조회
select *
	from employee
    where gender = 'M';

-- 성별이 여자인 사원들을 조회
select *
	from employee
    where gender = 'F';

/***************************************************
	NULL : 아직 정의되지 않은 미지수 
    논리적인 값으로 조건식을 처리 - is null, is not null
****************************************************/
-- 급여가 null인 사원들을 조회
select *
	from employee
    where salary is null;

-- 영어 이름이 정해지지 않은 사원들을 조회
select *
	from employee
    where eng_name is null;

-- 재직중인 사원들을 조회 : 퇴사일자컬럼 - retire_date
select *
	from employee
    where retire_date is null;

-- 퇴사한 사원들을 조회
select *
	from employee
    where retire_date is not null;

-- 재직중인 사원들의 보너스컬럼을 추가하고, 급여의 20%를 설정하여 조회
-- 보너스 컬럼의 컬럼명은 'bonus'
select 	emp_id,
		emp_name,
        hire_date,
        salary,
        salary*0.2 as bonus
	from employee
    where retire_date is null;

/***************************************************
	IFNULL 함수 : NULL을 다른값으로 대체해주는 함수
    형식> IFNULL(NULL 포함 컬럼명, 대체값);
****************************************************/
-- STG 부서에 속한 사원들의 정보 조회
-- 단, 급여가 NULL인 사원은 0값으로 치환
select 	emp_id,
		emp_name,
        eng_name,
        dept_id,
        ifnull(salary, 0) as salary
from employee
where dept_id = 'STG';        

-- 영어이름이 정해지지 않은 사원은 'smith' 이름으로 치환
-- 사원번호, 사원명, 영어이름, 입사일, 부서아이디
select  emp_id,
		emp_name,
        ifnull(eng_name, 'smith') as eng_name,
        hire_date,
        dept_id
from employee;

-- MKT 부서의 사원들을 조회, 재직중인 사원들의 retire_date를 현재 날짜로 치환
select  emp_id,
		emp_name,
        dept_id,
        hire_date,
        ifnull(retire_date, curdate()) as retire_date
from employee
where dept_id = 'MKT';        
        
/***************************************************
	DISTINCT : 중복된 데이터를 배제하고 조회
	형식> SELECT DISTINCT [컬럼 리스트..] 
		 FROM ~
         WHERE ~
****************************************************/
-- 사원테이블에서 부서아이디를 조회
-- 사원테이블의 부서아이디는 부서테이블의 부서아이디를 참조하므로 다중 조회
select distinct dept_id	from employee;

-- unique한 키와 함께 조회하는 경우 distinct가 적용되지 않음
select distinct emp_id, dept_id from employee;
    
/***************************************************
	ORDER BY : 데이터 정렬
	형식> SELECT [컬럼 리스트..] 
		 FROM [테이블명]
         WHERE [조건절]
         ORDER BY [컬럼명] ASC(오름차순)/DESC(내림차순);
****************************************************/
-- 급여를 기준으로 오름차순/내림차순 정렬
select *  
	from employee
    order by salary desc;

-- 모든 사원을 급여, 성별을 기준으로 오름차순 정렬
select *
	from employee
    order by salary, gender asc;

-- eng_name 컬럼이 널인 사원들의 입사일이 가장 최근 순서로 조회
select *
	from employee
    where eng_name is null
    order by hire_date desc;

-- 퇴직한 사원들을 급여기준으로 내림차순 정렬
select *
	from employee
    where retire_date is not null
    order by salary desc;

-- 퇴직한 사원들을 급여기준으로 내림차순 정렬
-- 사번, 사원명, 입사일, 퇴사일, 급여
-- salary 컬럼의 별칭으로 '급여' 사용
select  emp_id,						-- (3)
		emp_name,
        hire_date,
        retire_date,
        salary as '급여'
	from employee					-- (1)
    where retire_date is not null   -- (2) 조건절 컬럼명으로 별칭 사용❌
    order by '급여' desc;			-- (4) 정렬 컬럼명으로 별칭 사용 ⭕

-- 정보시스템(SYS) 부서 사원들 중 입사일이 빠른 순서, 급여를 많이 받는 순서로 정렬
-- HIRE_DATE, SALARY 컬럼은 '입사일','급여' 별칭으로 컬럼리스트 생성 후 정렬
select  emp_id,
		emp_name,
        hire_date as '입사일',
        salary as '급여'
from employee
where dept_id = 'SYS'
order by '입사일' asc, '급여' desc;

/****************
	조건절 + 비교연산자 : 특정 범위 혹은 데이터 검색
    형식 > Select [컬럼]
		  FROM [Table]
		  WHERE [컬럼명] [비교연산자] [값]
          ORDER BY [정렬] ASC/DESC
****************/ 

-- 급여가 5000 이상인 사언들을 조회, 급여를 오름차순으로 정렬
Select *
	from employee
    where salary >= 5000
    order by salary; -- 오름차순은 생략 가능
    
-- 입사일이 '2017-01-01' 이후 입사한 사원들을 조회
Select *
	from employee
    where hire_date > '2017-01-01';

-- 입사일이 '2015-01-01' 이후이거나, 급여가 6000 이상인 사원들을 조회
Select *
from employee
where hire_date > '2015-01-01' or salary >= 6000;

-- 입사일이 '2015-01-01' 이후이고, 급여가 6000 이상인 사원들을 조회
Select *
from employee
where hire_date > '2015-01-01' and salary >= 6000;

-- 특정범위 : '2015-01-01' ~ '2017-12-31'
Select *
from employee
where hire_date >= '2015-01-01' and hire_date <= '2017-12-31';

-- 급여가 6000 이상 8000 이하인 모든 사원들 조회
Select *
from employee
where salary >= 6000 and salary <= 8000;


/****************
	특정 범위 엑세스(논리곱) : BETWEEN ~ AND
    형식 > Select [컬럼]
		  FROM [Table]
		  WHERE [컬럼명] BETWEEN 값1 AND 값2
          ORDER BY [정렬] ASC/DESC
****************/ 

-- 급여가 6000 이상 8000 이하인 모든 사원들 조회
Select *
	from employee
    where salary between 6000 and 8000;
    
-- 특정범위 : '2015-01-01' ~ '2017-12-31'
Select *
	from employee
    where hite_date between '2015-01-01' and '2017-12-31';
    
-- 사원명이 '오삼식', '김삼순', '일지매'
Select *
	from employee
    where emp_name = '오삼식' or emp_name = '김삼순' or emp_name = '일지매';

-- 부서아이디가 'MKT', 'SYS', 'STG'
Select *
	from employee
    where dept_id = 'MKT' or dept_id = 'SYS' or dept_id = 'STG'
    order by dept_id;
    
/****************
	특정 범위 엑세스(논리합): In(값1, 값2, 값3)
    형식 > Select [컬럼]
		  FROM [Table]
		  WHERE [컬럼명] In(값1, 값2, 값3)
          ORDER BY [정렬] ASC/DESC
****************/ 

-- 사원명이 '오삼식', '김삼순', '일지매'
Select *
	from employee
    where emp_name In('오삼식', '김삼순', '일지매');

-- 부서아이디가 'MKT', 'SYS', 'STG'
Select *
	from employee
    where dept_id In('MKT', 'SYS', 'STG');

/****************
	특정 문자열 검색: (%, _) +  LIKE
				  %(전체), _(한글자)
    형식 > Select [컬럼]
		  FROM [Table]
		  WHERE [컬럼명] LIKE '검색 데이터'
          ORDER BY [정렬] ASC/DESC
****************/ 

-- '한'씨 성을 가진 모든 사원을 조회
Select *
	from employee
	where emp_name like '한%';

-- 영어 이름이 f로 시작하는 모든 사원을 조회
Select * from employee
	where eng_name like 'f%';
    
-- 이메일 두번째 자리에 'a'가 들어가는 모든 사원을 조회
Select * from employee
	where email like '_a%';

-- 이메일 아이디가 4자인 모든 사원들을 조회
Select * from employee
	where email like '____@%';
    
-- 부서 아이디에 'A'가 들어가는 모든 사원을 조회
Select * from employee
		where dept_id like '%A%';
        
/****************
	내장함수 : 숫바, 문자, 날짜
    호출되어지는 위치 - [컬럼], [조건절의 컬럼명]
****************/ 

-- [숫자함수]
-- 함수 실습을 위한 테이블: DUAL
-- abs(123): 절대값
Select abs(100), abs(-100), 100, -1000 from dual;

-- 소수점 절삭: floor(123) truncate(숫자, 자릿수)
Select floor(1000.1), truncate(123.45, 1) from dual;   

-- 사원테이블에 sys 부서 사원들의 사번, 아이디, 부서아이디, 폰번호, 급여, 보너스(급여 25%) 추가하여 조회
Select emp_id, emp_name, dept_id, phone, salary, truncate(salary*0.25, 1) as bonus
	from employee
	where dept_id = 'SYS';
    
-- rand(): 임의의 난수를 발생시키는 함수 (0~1)
select rand() from dual;

-- 0~999
select floor(rand()*1000) as num from dual;

select truncate(rand()*10000, 2) as num from dual;

-- mod(123, 나누는 숫자) : 나머지
select mod(2000, 3) as mode from dual;

-- 3자리 수를 랜덤 발생 후 2로 나누어 홀수, 짝수를 구분
select mod(floor((rand()*1000)+1), 2) as mode2 from dual;

-- 문자 함수
-- concat(abc1, abc2, ...)
select concat('abc', 'def') as result from dual;

-- 사원 테이블의 사원번호 사원명, 사원명2 컬럼을 생성하여 조회
-- 사원명2: S0001(홍길동)
select emp_id, emp_name, concat(emp_id, '(', emp_name, ')') as '사원명2' from employee;

select emp_id,
	   emp_name,
       concat(emp_name, '/', ifnull(eng_name, 'smith')) as eng_name,
       hire_date,
       phone,
       salary
       from employee;


-- substring(abc, 위치, 갯수): 문자열 추출, 공백도 문자열
select substring('hamani', 1, 3) as str1,
	   substring(' 햄만이', 2, 1) as str2 
       from dual;

select 	emp_id,
		emp_name,
		substring(hire_date, 1, 4) as year,
        substring(hire_date, 6, 2) as month,
        substring(hire_date, 9, 2) as day,
        salary
        from employee;

-- 2015년도에 입사한 모든 사원을 조회
select * 
	from employee
    where substring(hire_date, 1, 4) = '2015';

select * 
	from employee
    where substring(hire_date, 1, 4) = '2018' and dept_id = 'SYS';
    
-- left, right
select left('2003-09-09', 4) as year,
	   substring('2003-09-09', 6 , 2) as month,
       right('2003-09-09', 2) as day
       from dual;

-- 2015년도에 입사한 모든 사원을 조회
select * 
	from employee
    where left(hire_date, 4) = '2015';

-- 2015~2017
select * 
	from employee
    where left(hire_date, 4) between '2015' and '2017';

select emp_id,
	   emp_name,
       hire_date,
       right(phone, 4) as phone,
       salary
	from employee;
    
-- upper(abc), lower(abc): 대/소문자
select upper('ANNNDnnnnndNN') as up,
	   lower('SJDJIJVFdddd') as low from dual;


select emp_id,
	   emp_name,
       upper(ifnull(eng_name, 'smith')) as eng,
       lower(dept_id) as dept,
       upper(email) as email,
       salary
       from employee;
       
-- trim: 앞 뒤 공백 제거
select trim('          A') as t1,
	   trim('          A.c   ') as t2,
       trim('          A.  ') as t3,
       trim('       A.    ') as t4
       from dual;
    
-- format(문자열, 소수점자리): 문자열 포멧
select format(1233456, 2) as '123',
	   format('1234456', 2) as abc
       from dual;
       
select emp_id,
	   emp_name,
       hire_date,
       phone,
       concat(format(ifnull(salary, 0), 0), '$') as salary,
       concat(format(floor(salary*0.2), 0), '$') as bonus
       from employee
    where hire_date between '2016-01-01' and '2017-12-31'
--  where left(hire_date, 4) between '2016' and '2017'
    order by emp_id desc;
    
-- 날짜 함수
-- curdate(): 년-월-일 현재날짜
-- sysdate(), now(): 년-월-일-시-분-초 현재날짜
select curdate() as today1,
	   sysdate() as today2, 
       now() as today3
       from dual;
       
-- 형변환 함수
-- cast(변환값 as 데이터 타입)
-- convert(as today1) :: MySQL OLD
select 123 as num1,
	   cast(123 as char) as num2,
       '20120101' as str,
       cast('2023-12-31' as date) as date
       from dual;

-- now()
select now() as n1,
	   cast(now() as char) as string,
       cast(now() as datetime) as datetime 
       from dual;

-- signed integer, unsigned integer, decimal
select '1234' as str,
	   cast('1234' as signed integer) as cast_int,
       cast('1234' as unsigned integer) as cast_int,
       cast('1234' as decimal(10, 2)) as cast_decimal
	from dual;
    
-- [문자열 치환 함수]
-- replace(문자열, old, new)
select  '홍-길-동' as old,
		replace('홍-길-동', '-', '/') as new
	from dual;

-- 사원테이블의 사번, 사원명, 입사일, 퇴사일, 부서아이디, 폰번호, 급여를 조회
-- 입사일, 퇴사일 출력은 '-'을 '/'로 치환하여 출력
-- 재직중인 사원은 현재날짜를 출력
-- 급여 출력시 3자리 콤마(,) 구분  
select  emp_id,
		emp_name,
        replace(hire_date, '-', '/') as hire_date,
        replace(ifnull(retire_date, curdate()), '-', '/') as retire_date,
        dept_id,
        phone,
        format(salary, 0) as salary
	from employee;

-- '20150101' 입력된 날짜를 기준으로 해당 날짜 이후에 입사한 사원들을 모두 조회
-- 모든 mysql 데이터베이스에서 적용 가능한 형태로 작성
select *
	from employee
    where hire_date >= cast('20150101' as date);

-- '20150101' ~ '20171231' 사이에 입사한 사원들을 모두 조회
-- 모든 mysql 데이터베이스에서 적용 가능한 형태로 작성
select *
	from employee
    where hire_date between cast('20150101' as date)
						and cast('20171231' as date);

/***************************************************
	집계(그룹) 함수 : sum(), avg(), count(), min(), max().. 
    group by - 그룹함수를 적용하기 위한 그룹핑 컬럼 정의 
    having - 그룹함수에서 사용하는 조건절
    ** 그룹함수는 그룹핑이 가능한 컬럼에 적용하는것이 Good!!
****************************************************/ 
select * from employee;
-- (1) sum(숫자) : 전체 총합을 구하는 함수
-- 사원테이블의 총 급여를 조회, 
-- 2026-04-21 기준 급여가 null이면 0으로 기본값 정의
select concat(format(sum(ifnull(salary,0)), 0), '원') as 총급여 
	from employee;  

-- (2) avg(숫자) : 전체 평균을 구하는 함수
-- 사원들의 전체 급여 평균을 조회, 3자리씩 ','로 구분하고 앞에 '$' 표시
-- 2026-04-21 기준 급여가 null이면 0으로 기본값 정의, 소수점은 절삭
select  concat('$', format(floor(avg(ifnull(salary, 0))), 0)) as avg
	from employee;

-- 정보시스템(sys) 부서 전체의 급여 총액과 평균을 조회
-- 3자리 구분, 마지막 '만원' 표시
select  concat(format(sum(salary), 0), '만원') as sum,
		concat(format(avg(salary), 0), '만원') as avg
	from employee
    where dept_id = 'sys';

-- max(), min()

-- 가장 높은, 낮은 급여 사원 조회
Select concat(format(max(salary), 0), '$') as 최고급여,
	   concat(format(min(salary), 0), '$') as 최소급여
	from employee;
 

Select concat(format(sum(ifnull(salary, 0)), 0), '$') as 총급여,
	   concat(format(avg(ifnull(salary, 0)), 0), '$') as 평균급여,
	   concat(format(max(ifnull(salary, 0)), 0), '$') as 최고급여,
	   concat(format(min(ifnull(salary, 0)), 0), '$') as 최소급여
	from employee;
       
-- count(): 조회, null은 제외
select count(*),
	   count(salary),
       count(emp_id)
       from employee;

select count(*) as 재직중
	from employee
    where retire_date is null;

select count(retire_date) as 퇴사함
	from employee;

select count(*) 
	from employee
    where left(hire_date, 4) = '2015';
    
select count(*) 
	from employee
    where dept_id = 'SYS';

select min(hire_date) as 장기근속자,
	   max(hire_date) as 단기근속자
       from employee;
       

Select left(hire_date, 4) as 입사년도,
	   count(*) as 사원수,
	   concat(format(sum(ifnull(salary, 0)), 0), '$') as 총급여,
	   concat(format(avg(ifnull(salary, 0)), 0), '$') as 평균급여,
	   concat(format(max(ifnull(salary, 0)), 0), '$') as 최고급여,
	   concat(format(min(ifnull(salary, 0)), 0), '$') as 최소급여
	from employee
    group by left(hire_date, 4);
    
select dept_id as Dept_id,
	   ifnull(sum(salary), 0) as 총급여
	from employee
    group by dept_id
    having sum(salary) >= 30000;


Select left(hire_date, 4) as 입사년도,
	   count(*) as 사원수,
	   concat(format(sum(ifnull(salary, 0)), 0), '$') as 총급여,
	   concat(format(avg(ifnull(salary, 0)), 0), '$') as 평균급여,
	   concat(format(max(ifnull(salary, 0)), 0), '$') as 최고급여,
	   concat(format(min(ifnull(salary, 0)), 0), '$') as 최소급여
	from employee
    where salary is not null
    group by left(hire_date, 4)
    having sum(salary) >= 30000;
    
-- rollop 함수: 리포팅을 위한 함수
-- 그룹핑 함수 안에는 함수를 정의할 수 없음
-- select if(grouping(dept_id), 2️⃣'총합계', 1️⃣ifnull(dept_id, '-')) as dept_id,
select if(grouping(dept_id), '총합계', ifnull(dept_id, '-')) as dept_id,
	   count(*) as 사원수,
	   concat(format(sum(ifnull(salary, 0)), 0), '$') as 총급여,
	   concat(format(avg(ifnull(salary, 0)), 0), '$') as 평균급여
       from employee
       group by dept_id with rollup;
    
Select left(hire_date, 4) as 입사년도,
	   count(*) as 사원수,
	   concat(format(sum(ifnull(salary, 0)), 0), '$') as 총급여,
	   concat(format(avg(ifnull(salary, 0)), 0), '$') as 평균급여,
	   concat(format(max(ifnull(salary, 0)), 0), '$') as 최고급여,
	   concat(format(min(ifnull(salary, 0)), 0), '$') as 최소급여
	from employee
    group by left(hire_date, 4) with rollup;
    
select 	if(grouping(year), '총합계', ifnull(year, '-')) as hire_date,
		count(*) as '사원수',
        format(sum(salary), 0) as '총급여',
        format(truncate(avg(salary), 0), 0) as '평균급여',
        format(max(salary), 0) as '최대급여',
        format(min(salary), 0) as '최소급여'
from employee,
	 (select emp_id, left(hire_date, 4) year
		from employee) T1
where employee.emp_id = T1.emp_id and salary is not null
group by year with rollup;
        
select *
	from employee
    order by salary desc
    limit 3;
    
select * from employee where emp_name = '홍길동';
select * from department where dept_id = 'sys';

/*******************************************************
	조인(JOIN) : 두 개이상의 테이블을 연동하여 하나의 데이셋 구성
    ERD(Entity Relationship Diagram): 데이터베이스 설계도(구조도)
    
    ** ANSI SQL : 데이터베이스 시스템들의 표준 SQL **
    ** 조인(JOIN) 종류 **
    (1) CROSS JOIN(CATEISIAN:카테이션) - 합집합
        : 테이블의 데이터 전체를 조인 
        예) 테이블1(10개) * 테이블2(10개) = 100개
	(2) INNER JOIN(EQUI) - 교집합
		: 두 개이상의 테이블들이 조인연결고리를 통해 조인 실행
	(3) OUTER JOIN - INNER JOIN + 조인에서 제외한 ROW 포함
		LEFT OUTER JOIN - 왼쪽의 테이블의 ROW 포함
        RIGHT OUTER JOIN - 오른쪽 테이블의 ROW 포함
	(4) SELF JOIN - 한(자신) 테이블을 두 개(자신, 사본)의 테이블처럼 조인        
********************************************************/ 
-- [CROSS JOIN]
-- 형식1> SELECT [컬럼리스트] 
-- 		FROM  [테이블1] CORSS JOIN [테이블2]
-- 		WHERE [조건절]
-- 형식2> SELECT [컬럼리스트] 
-- 		FROM  [테이블1], [테이블2]
-- 		WHERE [조건절]

-- employee, department cross join
select count(*) from employee;  -- 20
select count(*) from department; -- 7
select count(*) from unit; 		 -- 3

select count(*)  from employee 
					cross join department
                    cross join unit;  -- 420
select count(*) from employee, department, unit; -- 420

-- 사원, 휴가, 부서 테이블을 cross join
select count(*) from employee;  	-- 20
select count(*) from vacation; 		-- 102
select count(*) from department;	-- 7

select count(*) from employee
					cross join vacation
                    cross join department; -- 14280
select count(*) from employee, vacation, department;  -- 14280        

-- [INNER JOIN(EQUI JOIN)] 
-- 형식1> SELECT [컬럼리스트]
-- 		 FROM [테이블1] INNER JOIN [테이블2]   
-- 					   ON [테이블1.조인컬럼] = [테이블2.조인컬럼]  
-- 형식2> SELECT [컬럼리스트]
-- 		 FROM [테이블1],[테이블2]   
-- 		 WHERE [테이블1.조인컬럼] = [테이블2.조인컬럼]  

select count(*) from employee inner join department
					on employee.dept_id = department.dept_id;  -- 20

select count(*)
	from employee, department
    where employee.dept_id = department.dept_id; -- 20
    
-- 사원테이블, 부서테이블, 본부테이블 inner join
select *
	from employee e inner join department d
					on e.dept_id = d.dept_id
                    inner join unit u
                    on d.unit_id = u.unit_id;

select * 
	from employee e, department d, unit u
    where e.dept_id = d.dept_id
		and d.unit_id = u.unit_id;
                    
-- 모든 사원들의 사원번호, 사원명, 부서아이디, 부서명, 입사일, 급여를 조회
select e.emp_id, emp_name, d.dept_id, d.dept_name, hire_date, salary
	from employee e, department d
    where e.dept_id = d.dept_id;
                    
-- '영업'에 속한 사원들의 사원명, 입사일, 퇴사일, 급여, 부서아이디, 부서명 조회
-- 재직중인 사원은 현재날짜로 출력						
select  e.emp_name,
		e.hire_date,
        ifnull(e.retire_date, curdate()) as retire_date,
        e.salary,
        d.dept_id,
        d.dept_name
	from employee e, department d
    where e.dept_id = d.dept_id
		and d.dept_name = '영업';

-- '2015'년도에 입사자들의 사번, 사원명, 입사일, 부서명, 본부아이디, 본부명을 조회
select  e.emp_id,
		e.emp_name,
        e.hire_date,
        d.dept_name,
        u.unit_id,
        u.unit_name
	from employee e, department d, unit u
    where e.dept_id = d.dept_id
		and d.unit_id = u.unit_id
        and left(e.hire_date, 4) = '2015';

-- 인사과에 속한 사원중에 휴가를 사용한 사원의 내역 조회
select *
		from employee e, vacation v, department d
        where e.dept_id = d.dept_id
        and e.emp_id = v.emp_id
        and dept_name = '인사';
        
select *
	from employee e inner join department d on e.dept_id = d.dept_id    
				    inner join vacation v on e.emp_id = v.emp_id
	where dept_name = '인사';
    
-- 사원별 휴가사용 일수를 조회, 사원 아이디, 사원명, 휴가일수
select e.emp_id,
	   e.emp_name,
       count(*) as 휴가일수
	from employee e, vacation v
    where e.emp_id = v.emp_id
    group by e.emp_id
    order by 휴가일수 desc
    limit 5;

select e.emp_id,
	   e.emp_name,
       count(*) as 휴가일수
	from employee e inner join vacation v on e.emp_id = v.emp_id
    group by e.emp_id
    order by 휴가일수 desc
    limit 5;
    
select e.emp_name,
	   e.phone,
       d.dept_name,
       v.reason,
       u.unit_name
	from employee e, vacation v, department d, unit u
    where e.dept_id = d.dept_id
        and e.emp_id = v.emp_id
        and u.unit_id = d.unit_id
        and v.reason = '두통'
        and dept_name = '영업';
        
select e.emp_name,
	   e.phone,
       d.dept_name,
       v.reason,
       u.unit_name
	from unit u inner join department d on u.unit_id = d.unit_id
				inner join employee e on d.dept_id = e.dept_id
                inner join vacation v on e.emp_id = v.emp_id
    where v.reason = '두통'
        and dept_name = '영업';
        
select e.emp_id,
	   e.emp_name,
       d.dept_name,
       e.hire_date,
       u.unit_name
	from employee e, department d, unit u
	where e.dept_id = d.dept_id
    and d.unit_id = u.unit_id
    and retire_date is null
    and left(hire_date, 4) between '2014' and '2016';
    
select e.emp_id,
	   e.emp_name,
       d.dept_name,
       e.hire_date,
       u.unit_name
	from unit u inner join department d on u.unit_id = d.unit_id
				inner join employee e on d.dept_id = e.dept_id
	where retire_date is null
    and left(hire_date, 4) between '2014' and '2016';
    
select d.dept_name as 부서명,
	   sum(salary) as 총급여,
       avg(salary) as 평균급여,
       count(*) as 휴가사용일수
	from department d, employee e, vacation v
    where d.dept_id = e.dept_id
    and e.emp_id = v.emp_id
    group by dept_name;
    
select d.dept_name as 부서명,
	   d.dept_id as 부서아이디,
	   concat(format(sum(salary), 0), '$') as 총급여,
       concat(format(avg(salary), 2), '$') as 평균급여,
       concat(count(*), '일') as 휴가사용일수
	from department d inner join employee e on d.dept_id = e.dept_id 
					  inner join vacation v on e.emp_id = v.emp_id
    group by d.dept_id;
    
    -- 본부별 휴가사용 일수를 조회
select  u.unit_id,
		u.unit_name,
        sum(v.duration)  -- 휴가 사용 일수
	from employee e, department d, unit u, vacation v
    where e.dept_id = d.dept_id
		and d.unit_id = u.unit_id
        and e.emp_id = v.emp_id
    group by u.unit_id;

-- 본부별 > 부서별로 그룹핑 한후 부서의 휴가사용 일수를 조회
select  u.unit_id,
		u.unit_name,
        d.dept_name, 
        sum(v.duration)  -- 휴가 사용 일수
	from employee e, department d, unit u, vacation v
    where e.dept_id = d.dept_id
		and d.unit_id = u.unit_id
        and e.emp_id = v.emp_id
    group by u.unit_id, d.dept_id;

-- 본부별 > 부서별 > 사원별로 그룹핑 한후 부서의 휴가사용 일수를 조회
select  u.unit_id,
		u.unit_name,
        d.dept_name, 
        e.emp_name,
        sum(v.duration)  -- 휴가 사용 일수
	from employee e, department d, unit u, vacation v
    where e.dept_id = d.dept_id
		and d.unit_id = u.unit_id
        and e.emp_id = v.emp_id
    group by u.unit_id, d.dept_id, e.emp_id;    

select  u.unit_id,
		u.unit_name,
        d.dept_name, 
        e.emp_name,
        sum(v.duration)  -- 휴가 사용 일수
	from employee e inner join department d on e.dept_id = d.dept_id
					inner join unit u 		on d.unit_id = u.unit_id
                    inner join vacation v	on e.emp_id = v.emp_id
    group by u.unit_id, d.dept_id, e.emp_id;    

-- [OUTER JOIN] 
-- 오라클 INNER JOIN(EQUI JOIN) 문법에 (+) 코드를 추가하여 사용
-- 현재 오라클 문법은 MySQL에서는 사용 불가 
-- 형식1> SELECT [컬럼리스트]
-- 		 FROM [테이블1] LEFT/RIGHT OUTER JOIN [테이블2]   
-- 					   ON [테이블1.조인컬럼] = [테이블2.조인컬럼]  

select count(distinct dept_id) from employee;  -- 6
select count(dept_id) from department; -- 7

-- LEFT OUTER JOIN : LEFT에 부서테이블 위치
-- 부서별 사원수 조회, 전체 부서 출력!!
select  d.dept_id,
		d.dept_name,
		count(emp_id) as '사원수'
	from department d left outer join employee e
					  on d.dept_id = e.dept_id
    group by d.dept_id;

-- RIGHT OUTER JOIN : RIGHT에 부서테이블 위치
-- 부서별 사원수 조회, 전체 부서 출력!!
select  d.dept_id,
		d.dept_name,
		count(emp_id) as '사원수'
	from employee e right outer join department d
					  on d.dept_id = e.dept_id
    group by d.dept_id;

-- 모든 부서의 아이디, 부서명, 본부명을 조회
-- 본부에 속하지 않은 부서는 '준비중'으로 출력
select  d.dept_id,
		d.dept_name,
        ifnull(u.unit_name, '준비중') as unit_name
	from department d left outer join unit u
					  on d.unit_id = u.unit_id;

select u.unit_id,
	   u.unit_name,
       d.dept_id,
       d.dept_name,
       sum(v.duration) as '휴가사용일수'
	from employee e right outer join department d on e.dept_id = d.dept_id
					left outer join unit u on d.unit_id = u.unit_id
                    left outer join vacation v on e.emp_id = v.emp_id
	group by u.unit_id, d.dept_id;
    
select e.emp_name,
	   e.hire_date,
       e.salary,
       d.dept_name,
       u.unit_name
	from employee e right outer join department d on e.dept_id = d.dept_id
				    left outer join unit u on u.unit_id = d.unit_id
    where e.retire_date is null
    and left(hire_date, 4) between '2017' and '2018';
    
-- [self join] 자신의 테이블을 조인
-- 형식: SELECT [컬럼리스트]
-- 		FROM [테이블원본], [테이블사본]
-- 		WHERE [테이블원본.조인칼럼] = [테이블사본.조인칼럼]

select *
	from employee e1, employee e2
    where e1.emp_id = e2.emp_id;
    
/**************************************
	서브쿼리: 메인 쿼리에 다른 쿼리를 추가하여 실행
    -> (쿼리작성) 괄호안에 쿼리를 작성하여 메인쿼리에 추가
    형식 > SELECT [컬럼리스트 추가 > 스칼라 서브쿼리]
		  FROM [테이블명 추가 -> (인라인뷰)]
          WHERE [조건절 -> (서브쿼리)]
**************************************/

-- [서브쿼리: 단일행 = '='로 비교함]
select  emp_id,
		emp_name,
		hire_date,
        dept_id,
        salary
	from employee
    where dept_id=(select dept_id 
	from department where dept_name = '정보시스템');  
    
select  e.emp_id,
		e.emp_name,
		e.hire_date,
        d.dept_id,
        e.salary
	from employee e, department d
    where e.dept_id = d.dept_id
    and d.dept_name = '정보시스템';
    
-- 홍길동 사원이 속한 부서아이디, 부서명, 부서 오픈일 조회
select dept_id
	from employee
    where emp_name = '홍길동';
       
select dept_id,
	   dept_name,
       start_date
	from department
    where dept_id = (select dept_id
	from employee
    where emp_name = '홍길동');
    
select count(*)
	from vacation
    where emp_id = (select emp_id
	from employee
    where emp_name = '홍길동');
    
-- [서브쿼리 : ]
-- 제 3본부에 속한 모든 부서를 조회

select *
	from department
    where unit_id = (select unit_id
	from unit where unit_name = '제3본부');
    
select *
	from employee
    where salary = ( select max(salary) from employee);

select *
	from employee
    where hire_date = ( select max(hire_date) from employee);    
    
select *
	from employee
    where retire_date = ( select min(retire_date) from employee);    
    
    
-- [서브쿼리: 단일행]
-- 가장 많은 휴가를 사용한 사원이 속한 모든 부서 사원들읊 조회
select count(duration)
	from employee e, vacation v
    where e.emp_id = v.emp_id
    group by e.emp_name;
 
select * 
	from employee
    where dept_id = ( select e.dept_id
	from employee e, department d
    where e.dept_id = d.dept_id
    and emp_id = ( select emp_id from vacation order by duration desc limit 1));
    

 select * 
	from employee
    where dept_id = (select e.dept_id
	from employee e inner join department d on e.dept_id = d.dept_id
    and emp_id = ( select emp_id from vacation order by duration desc limit 1));
    

select *
	from employee
    where dept_id in (select dept_id -- dept_id가 두 개 이상임으로 in을 사용(하나는 =을 사용)
	from department d inner join unit u on d.unit_id = u.unit_id
    where d.unit_id = ( select unit_id from unit where unit_name = '제3본부'));

select * from vacation 
	where emp_id in (select emp_id
	from employee
    where dept_id in (select dept_id from department
	where unit_id = (select unit_id from unit where unit_name = '제3본부')));
    
-- 휴가를 한번이라도 사용한 모든 사원들 조회
-- distinct: 중복된 것 하나로
    
select *
	from employee e
	where exists (select 1 -- 1:true
				 from vacation v
				 where e.emp_id = v.emp_id);

-- [인라인뷰: 메인쿼리 테이블 자리에 들어가는 쿼리 형식]

select emp_id,
	   sum(duration) as 휴가사용일수
	from vacation
    group by emp_id;

select e.emp_id, e.emp_name, e.hire_date, e.salary, v.휴가사용일수
	from employee e inner join
		 (select emp_id, sum(duration) as 휴가사용일수 from vacation group by emp_id) v
         on e.emp_id = v.emp_id;

select e.emp_id, e.emp_name, e.hire_date, e.salary, v.휴가사용일수
	from employee e,
		 (select emp_id, sum(duration) as 휴가사용일수 from vacation group by emp_id) v
	where e.emp_id = v.emp_id;
    

select e.emp_id, e.emp_name, e.hire_date, e.salary, ifnull(v.휴가사용일수, 0)
	from employee e left outer join
		 (select emp_id, sum(duration) as 휴가사용일수 from vacation group by emp_id) v
		  on e.emp_id = v.emp_id
	order by v.휴가사용일수 desc;
    
-- '2015' ~ '2017'년도 입사한 사원들의 총휴가사용 일수 조회
-- 1) '2015' ~ '2017'년도 입사자 조회
select *
	from employee
    where left(hire_date, 4) between '2015' and '2017';

-- 2) 사원별 총휴가일수 조회
select emp_id, sum(duration) as count
	from vacation 
    group by emp_id;

-- 3) 1, 2을 조인 => 2015~2017년도 입사자들의 휴가사용 일수 모두 포함
select  t1.emp_id,
		t1.emp_name,
        t1.hire_date,
        ifnull(t2.count, 0) as count
	from (select *
			from employee
			where left(hire_date, 4) between '2015' and '2017') t1
		left outer join
		 (select emp_id, sum(duration) as count
			from vacation 
			group by emp_id) t2
		on t1.emp_id = t2.emp_id
	order by count desc ;
    
-- 모든 부서별 총급여, 평균급여 조회
select d.dept_name as 부서이름,
	   sum(ifnull(e.salary, 0)) as 총급여,
	   floor(avg(ifnull(e.salary, 0))) as 평균급여
       from employee e right outer join
       (select dept_id, dept_name from department) d
       on e.dept_id = d.dept_id
       group by dept_name;

select  e.emp_name,
		e.salary,
        s.dept_id,
        s.dept_name,
        s.sum,
        s.avg
	from employee e,
		(select  d.dept_id,
				d.dept_name, 
				d.unit_id,
				d.start_date,
				ifnull(t1.sum, 0) sum,
				ifnull(t1.avg, 0) avg
			from department d left outer join
							(select  dept_id,
									sum(ifnull(salary, 0)) sum, 
									floor(avg(ifnull(salary, 0))) avg
								from employee
								group by dept_id) t1
							on d.dept_id = t1.dept_id) s
	where e.dept_id = s.dept_id;
       
	
select emp_id,
	   emp_name,
       dept_id,
       salary,
       (select sum(salary) from employee where dept_id = 'SYS') as 평균급여, 
       (select floor(avg(salary)) from employee where dept_id = 'SYS') as 총급여
       from employee
       where dept_id = 'SYS';    
       
/*****************************************
	테이블 결과 합치기: union, union all
    쿼리 1
    union < 중복 ❌
    쿼리 2
    --
    쿼리 1
    union all < 중복 🅾️
    쿼리 2
    쿼리1, 쿼리2의 실행 컬럼 타입과 이름이 동일해야 함
*****************************************/   

select emp_id, emp_name, salary, dept_id
		from employee
        where dept_id = 'sys'
union
select emp_id, emp_name, salary, dept_id
		from employee
        where dept_id = 'mkt'
union all
select emp_id, emp_name, salary, dept_id
		from employee
        where dept_id = 'sys';

	-- 논리적인 테이블: 뷰 
--     - sql을 실행하여 생성된 결과를 가상테이블로 정의
--     - 생성 > create view [view table]
-- 			as [sql 정의]
-- 	- 삭제 > drop view [view table]
--    🌟 뷰 생성시 권한 할당 받기


-- 시스템에 생성된 뷰 정보 확인
-- information_schma.views
select *
	from information_schma.views
    where table_schma = 'hrdb2019';    

create view sum_salary
as select dept_id,
		  ifnull(sum(salary), 0) as sum
	from employee
	group by dept_id
	having ifnull(sum(salary), 0) >= 30000;

select dept_id from sum_salary;

drop view sum_salary;

create view emp_dept_sum
as select  e.emp_name,
		e.salary,
        s.dept_id,
        s.dept_name,
        s.sum,
        s.avg
	from employee e,
		(select  d.dept_id,
				d.dept_name, 
				d.unit_id,
				d.start_date,
				ifnull(t1.sum, 0) sum,
				ifnull(t1.avg, 0) avg
			from department d left outer join
							(select  dept_id,
									sum(ifnull(salary, 0)) sum, 
									floor(avg(ifnull(salary, 0))) avg
								from employee
								group by dept_id) t1
							on d.dept_id = t1.dept_id) s
	where e.dept_id = s.dept_id;
    
select * from emp_dept_sum;

select * from information_schema.views
	where table_schema = 'hrdb2019';

select *
	from emp_dept_sum
    where emp_name = '홍길동';


create view v_emp_dept
as
select 	e.emp_id,
		e.emp_name,
        e.hire_date,
        e.salary,
        ifnull(v.duration, 0) as duration,
        d.dept_id,
        d.dept_name,
        d.unit_id
	from ( select emp_id, sum(duration) as duration
			from vacation
			group by emp_id ) v right outer join employee e
		 on v.emp_id = e.emp_id
         right outer join department d
         on e.dept_id = d.dept_id;
            
select * from information_schema.views
	where table_schema = 'hrdb2019';

-- 
select * from v_emp_dept;

select * 
	from v_emp_dept ve, unit u 
    where ve.unit_id = u.unit_id
    and u.unit_name = '제3본부';

-- 휴가사용일수가 15일 이상되는 사원들의 사원명, 부서아이디, 부서명, 본부 아이디, 본부명

select ve.duration,
	   ve.emp_name,
	   ve.dept_id,
       ve.dept_name,
       ve.unit_id,
       u.unit_name
	from v_emp_dept ve inner join unit u
    where ve.unit_id = u.unit_id
    and duration >= 15;
    
-- DDL: 생성 수정 삭제 > 테이블 기준
-- DML: 생성 읽기 수정 삭제 > 데이터 기준

-- CREATE TABLE [테이블명] ( 컬럼명 데이터타입(크기) 		옵션(제약사항, 널 포함)
/************************************************************
	데이터 타입 정리
	분류			타입 		크기/형식		설명			사용
	---------------------------------------------------------
	정수형 		tinyint		1byte		작은 정수 값	상태값(0/1)
				smallint	2byte	 				카운트
				int			4byte		default		일반정수값
				bigint		8byte		큰 정수값		PK, 주문번호
	실수형 		float		4byte		부동소수점		거의 사용안함
				double		8byte 		default		통계수치
	문자형(고정)	char		고정길이		빠른공간확보	코드 값
										공간낭비	 
    문자형(가변)	varchar		가변길이		가장 많이 사용 이름, 주소 ...
    텍스트		text		~64kb		긴 문자 저장	게시글
				longtext	~ 4gb		초대형 텍스트	로그
	바이너리		blob		~64, ~4gb	이미지 파일	파일 저장
    날짜			date		yyyy-mm-dd	날짜			생일
				datetime	date+ 시간	날짜, 시간..	작업완료
	JSON		JSON		JSON 구조				API 응답
				
************************************************************/
desc employee;
 
-- emp table create
-- emp_id: 4, ename: 5, hire_date: date
-- salary: 4
create table emp(
	emp_id		char(4),
	ename		varchar(5),
    hire_date	date,
    salary		int(4)
);

desc emp;

-- 테이블 삭제:
-- DROP TABLE 테이블명;

select * from information_schema.tables
	where table_name = 'emp';
drop table emp;

-- 테이블 복제
-- create table 테이블 명 as 서브쿼리;

-- 2016년도에 입사한 사원 정보를 조회후 EMP_2016 테이블 생성

create table EMP_2016
	as (select *
	from employee
    where left(hire_date, 4) = '2016');

select * from EMP_2016;

desc EMP_2016; -- 🧭 원본의 제약사항은 복제되지 않음
desc employee;

create table employee_department
	as (select e.emp_id, e.emp_name, e.eng_name, e.gender, e.hire_date, e.retire_date, d.dept_id, e.phone, e.email, e.salary, d.unit_id, d.start_date
	from employee e, department d
    where e.dept_id = d.dept_id);
    
select * from employee_department;
select * from information_schema.tables
	where table_name = 'employee_department';
desc employee_department;

create table emp
as select * from employee where 1=0;

show tables;
desc emp;

-- 데이터 생성
-- INSERT INTO	테이븖명(컬럼리스트) -- 컬럼리스트 생략 가능 
-- 		VALUES (data1, data2)
desc emp;
insert into emp(emp_id, emp_name, eng_name, gender, hire_date, retire_date, dept_id, phone, email, salary)
	values(
		'S0001', '홍길동', 'hong', 'M', curdate(), null, 'SYS', '01010102020', 'hong@naver.com', null
    );
insert into emp(emp_id, emp_name, eng_name, gender, hire_date, retire_date, dept_id, phone, email, salary)
	values(
		'S0002', '홍길순', 'hong', 'F', curdate(), null, 'SYS', '01010102020', 'hong@naver.com', null
    );

insert into emp
	values(
		'S0003', '홍길순', 'hong', 'F', curdate(), null, 'SYS', '01010102020', 'hong@naver.com', null
    );
    
-- null이 허용되는 속성과 값은 생략 가능
insert into emp(emp_id, emp_name, eng_name, gender, hire_date, dept_id, phone, email)
	values(
		'S0004', '홍길순', 'hong', 'F', curdate(), 'SYS', '01010102020', 'hong@naver.com'
    );

select * from emp;

-- DDL 테이블 데이터 절삭 DELETE :: Truncate 데이터 영구 삭제(복구 ❌)

truncate table emp;
drop table emp;
show tables;

-- emp 생성 : eid(char, 4) ename(varchar, 5) gender(char, 1) hire_date(datetime), salary(int)
create table emp(
	eid		char(4) 	not null,
	ename	varchar(5) 	not null,
    gender 	char(1)		not null,
    hire_date	datetime,
    salary	int
);

insert into emp
	value('S001', '홍길동', 'M', now(), 8000);
insert into emp
	value('S002', '홍길순', 'F', now(), 7500);
insert into emp
	value('S003', '김홍동', 'M', null, 8000);
insert into emp(eid, ename, gender)
	value('S004', '김홍순', 'F');
insert into emp(eid, ename, gender, hire_date)
	value('S005', '김사잔', 'M', curdate());
-- insert into emp
-- 	value('S001', null, 'M', now(), 8000);

select * from emp;

-- 자동 번호 생선기: auto_increment primary key
-- - 테이블 생성 시 옵션 자리에 기술, 주로 pk 컬럼에 사용
-- create table 테이블명 (
-- 	컬럼명	데이터타입		auto_increment
-- )

-- emp2 생성 : eid(int, 자동번호생성기) ename(varchar, 5) gender(char, 1) hire_date(datetime), salary(int)

create table emp2(
	eid		int 	auto_increment primary key,
	ename	varchar(5) 	not null,
    gender 	char(1)		not null,
    hire_date	datetime,
    salary	int
);

show tables;

insert into emp2(ename, gender)
	value('홍길동', 'M');
insert into emp2(ename, gender)
	value('홍길순', 'F');
insert into emp2(ename, gender, hire_date)
	value('김홍동', 'M', now());
insert into emp2(ename, gender)
	value('김홍순', 'F');
insert into emp2(ename, gender)
	value('김사잔', 'M');

select * from emp2;
	
/**************************************************************
	DDL 테이블 변경: ALTER TABLE
    형식 ALTER TABLE 테이블명
		ADD COLUMN [New COULMN, 데이터 타입] -- NULL 허용
        MODIFY COLUMN [MODIFY COLUMN], 데이터 타입 -- 크기고정
        DROP COLUMN [DROP COLUMN]
***************************************************************/

alter table emp
	add column phone	char(13);
alter table emp
	modify column phone varchar(20);

desc emp;

-- ename에 데이터가 존재하는 경우 데이터가 유실이 발생함으로 ERROR가 발생
alter table emp
	modify column ename varchar(2);

/***************************************************************
	데이터 수정 : UPDATE
    형식> UPDATE [테이블명]
		 SET [컬럼명 = NEW데이터, ... ]
         WHERE [조건절]
	‼ MySQL은 Update 권한 변경 후 진행
    => SET SQL_SAFE_UPDATES = 0(허용) / 1(불가);
***************************************************************/ 
select * from emp;

-- S001 사번의 폰번호 업데이트, 업데이트 모드 허용으로 수정
set sql_safe_updates = 0;
update emp
	set phone = '010-1234-4567'
    where eid = 'S001';

-- 모든 사원의 폰번호를 '010-1111-1234' 수정
update emp
	set phone = '010-1111-1234';
select * from emp;
desc emp;

-- phone 컬럼에 not null 제약 추가
alter table emp
	modify phone char(20) not null;
desc emp;

-- emp 테이블에 email 컬럼 추가 후 not null 제약 정의
-- 1) 컬럼 추가 시 null 허용
-- 2) update 명령으로 기존 데이터 추가
-- 3) not null 제약 정의
alter table emp	add email varchar(20);
desc emp;
select * from emp;
update emp set email = 'test@naver.com';
alter table emp modify email varchar(20) not null;
desc emp;

show tables;

create table copy_emp
as select * from employee;

show tables;

select * from copy_emp;
desc copy_emp;

update copy_emp
	set salary = 6000
    where emp_name = '홍길동';
    
update copy_emp
	set hire_date = cast('20210705' as date)
    where emp_name = '안경태';
    
-- emp2 테이블에 retrie_date 칼럼 추가: date, null 허용
alter table emp2 add retrie_date date;
desc emp2;

update emp2 set retrie_date = now();
select * from emp2;
alter table emp2 modify retrie_date date not null;

update copy_emp
	set salary = salary*1.2
    where dept_id = (select dept_id from department where dept_name = '정보시스템');

select * from employee;
select * from copy_emp;

update copy_emp
	set eng_name = 'kang',
		hire_date = curdate(),
        dept_id = 'MKT'
	where emp_id = 'S0003';

select * from copy_emp;

-- 트랜잭션별 업데이트 정의
-- 트랜잭션 관리 명령어 DTL : commit rollback
-- 현재 트랜잭션 방식 확인 1, 시스템에서 자동 트랜잭션 관리
-- DML 명령어에 영향을 줌 DDL은 관리방식에 상관없이 무조건 autocommit
select @@autocommit; -- 1 ,바로바로 반영
set autocommit = 0;


select * from emp;
update emp
	set salary = null;

commit; -- 새로운 트랜잭션 시작, 이 전 명령어는 물리적 DB에 반영

select * from emp;
update emp set salary = 3000 where eid = 'S001'; -- 물리적 DB에 반영되기 전
rollback;
select * from emp;

update emp set salary = 3000 where eid = 'S002';
select * from emp;

commit;

-- 데이터 삭제: DELETE
-- DELETE FROM 테이블명 
-- WHERE 조건절

select @@sql_safe_updates;
select @@autocommit;
rollback;
commit;

select * from emp;

delete from emp
	where ename in ('홍길순', '홍길동');
    
truncate table emp; -- truncate 명령어는 ddl이므로 autocommit이 됨, rollback 불가
drop table emp;
show tables;

set autocommit =1;

