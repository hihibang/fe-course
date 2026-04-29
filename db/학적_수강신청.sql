/********************************
	학적과 수강신청 실습 데이터베이스
********************************/
-- 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS `enroll2026`;
show databases;
use enroll2026;
select database();

show tables;
create table subject(
	subject_no		int			auto_increment,
    subject_name 	varchar(20)	not null,
    class_room		varchar(13) not null,
    instructor_no	int,
    constraint pk_subject_no primary key(subject_no)
);
select * from instructor;
drop table instructor;
delete from instructor;
DROP DATABASE enroll2026;
-- 예: DROP DATABASE hrdb_2019;

create table instructor(
	instructor_no		int			auto_increment,
    instructor_name 	varchar(5)	not null,
    age					int not null,
    gender				char(1)	not null,
    constraint pk_instructor_no primary key(instructor_no)
);
select * from instructor;

alter table subject
	add constraint fk_subject_instructor_no foreign key(instructor_no)
			references instructor(instructor_no)
            on delete cascade
            on update cascade;
desc subject;

create table class_time(
	time_id		int auto_increment,
    subject_no	int,
    class_time 	varchar(20)	not null,
    constraint pk_instructor_no primary key(time_id)
);

alter table class_time
	add constraint fk_class_time_subject_no foreign key(subject_no)
			references subject(subject_no)
            on delete cascade
            on update cascade;


create table student(
	student_id		int			auto_increment,
    student_name	varchar(5) not null,
    address 		varchar(20)	not null,
    constraint pk_instructor_no primary key(student_id)
);

create table enrollment(
	student_id	int,
    subject_no	int,
    grade		varchar(10)
);

alter table enrollment
	add constraint fk_enrollment_subject_no foreign key(subject_no)
			references subject(subject_no)
            on delete cascade
            on update cascade;

alter table enrollment
	add constraint fk_enrollment_student_id foreign key(student_id)
			references student(student_id)
            on delete cascade
            on update cascade;
            
ALTER TABLE instructor DROP PRIMARY KEY;
alter table instructor
	modify column instructor_no int auto_increment primary key;
select * from instructor;    
insert into instructor(instructor_name, age, gender)
		values('스미스', 35, 'M');
insert into instructor(instructor_name, age, gender)
		values('유성', 20, 'M');
insert into instructor(instructor_name, age, gender)
		values('강지혜', 21, 'F');
insert into instructor(instructor_name, age, gender)
		values('고용', 30, 'M');
insert into instructor(instructor_name, age, gender)
		values('김영희', 27, 'F');
        

alter table student
	modify column address varchar(50) default '서울시 강남구';
    
insert into student(student_name) values('오감자');
insert into student(student_name) values('감자연');
insert into student(student_name) values('공소');
insert into student(student_name) values('윤태현');
insert into student(student_name) values('박종식');
select * from student;

insert into subject(subject_name, class_room, instructor_no)
			values('MySql', '101호', '1');
insert into subject(subject_name, class_room, instructor_no)
			values('HTML', '103호', '2');
insert into subject(subject_name, class_room, instructor_no)
			values('Python', '201호', '1');
	insert into subject(subject_name, class_room, instructor_no)
			values('Java', '301호', '3');
insert into subject(subject_name, class_room, instructor_no)
			values('React', '302호', '3');
select * from subject;

-- [class_time : 강의시간] 테이블 데이터 입력
desc class_time;
select * from subject;
select * from class_time;
insert into class_time(class_time, subject_no) values('120분', 1);
insert into class_time(class_time, subject_no) values('160분', 2);
insert into class_time(class_time, subject_no) values('200분', 3);
insert into class_time(class_time, subject_no) values('120분', 4);
insert into class_time(class_time, subject_no) values('100분', 5);

-- [enrollment : 등록] 테이블 데이터 입력
desc enrollment;
select * from student; 
select * from subject;
select * from enrollment;
insert into enrollment(student_id, subject_no, grade)  values(1, 1, 'A');
insert into enrollment(student_id, subject_no, grade)  values(1, 2, 'B');
insert into enrollment(student_id, subject_no, grade)  values(2, 1, 'C');
insert into enrollment(student_id, subject_no, grade)  values(3, 1, 'A');
insert into enrollment(student_id, subject_no, grade)  values(3, 3, 'A');
insert into enrollment(student_id, subject_no, grade)  values(4, 2, 'D');
insert into enrollment(student_id, subject_no, grade)  values(4, 1, 'A');
insert into enrollment(student_id, subject_no, grade)  values(1, 5, 'C');
insert into enrollment(student_id, subject_no, grade)  values(2, 3, 'A');

-- A학점을 받은 학생의 정보를 조회
select * from student
	where student_id in (select student_id from enrollment where grade='A');
    
select * from student st inner join enrollment e on st.student_id = e.student_id
		 where grade='A';


-- C학점을 받은 학생의 정보와 과목명을 조회
    
select * from student st, subject s, enrollment e
	where st.student_id = e.student_id
    and s.subject_no = e.subject_no
    and grade = 'C';

select * from student st inner join enrollment e on  st.student_id = e.student_id
						 inner join subject s on s.subject_no = e.subject_no
	where grade = 'C';
    

-- 100분 강의하는 과목과 강사정보
select sb.subject_name, sb.class_room, c.class_time, i.instructor_name, i.age, i.gender from class_time c, subject sb, instructor i
		where c.subject_no = sb.subject_no
        and i.instructor_no = sb.instructor_no
        and class_time = '100분';

select instructor_name,
	   age,
       gender
       from instructor
       where instructor_no = (select instructor_no from subject
			  where subject_no = (select subject_no from class_time where class_time = '100분'));

select * from subject 
 where instructor_no = (select instructor_no
		from instructor
        where instructor_name = '강지혜');
        
select * from subject sb, instructor i
		where sb.instructor_no = i.instructor_no
        and i.instructor_name = '강지혜';
        
        
-- 홍길동 강사가 강의하는 과목과 과목을 수강한 학생정보와 성적을 조회
select  i.instructor_name,
		su.subject_name, 
        su.class_room,
        st.student_name,
        e.grade
	from instructor i, subject su, student st, enrollment e
    where i.instructor_no = su.instructor_no
		and su.subject_no = e.subject_no
        and e.student_id = st.student_id
        and i.instructor_name = '유성';

-- ANSI SQL        

-- 모든 강사가 강의하는 과목과 성적 조회 (모든 강사 포함)
select count(*) from instructor;  -- 4
select count(distinct instructor_no) from subject; -- 3
select * 
	from instructor i left outer join	subject su
					  on i.instructor_no = su.instructor_no;
                      



        
        
        
        
        
	