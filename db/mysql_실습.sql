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
    

    
    
    
    
    
    
    
    
    
    

   

    