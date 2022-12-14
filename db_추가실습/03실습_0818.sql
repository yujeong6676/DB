-- SQLite
-- 03실습_0818 

-- 1. 흡연 여부(smoking)로 구분한 각 그룹의 컬렴명과 그룹의 사람의 수를 출력하시오.
select smoking, count(smoking)
from healthcare
group by smoking;

-- smoking	count(smoking)
-- 1	626138
-- 2	189808
-- 3	183711
--    343

--2. 음주 여부(is_drinking)로 구분한 각 그룹의 컬렴명과 그룹의 사람의 수를 출력하시오.
select is_drinking, count(is_drinking)
from healthcare
group by is_drinking;

-- 3. 음주 여부로 구분한 각 그룹에서 혈압(blood_pressure)이 200이상인 사람의 수를 출력하시오.
select is_drinking, count(blood_pressure)
from healthcare
GROUP BY is_drinking
HAVING count(blood_pressure) >= 200;

--4. 시도(sido)에 사는 사람의 수가 50000명 이상인 시도의 코드와 그 시도에 사는 사람의 수를 출력하시오.
select sido, count(sido)
from healthcare
group by sido
HAVING count(sido) >= 50000;

--5. 키(height)를 기준으로 구분하고, 각 키와 사람의 수를 출력하시오.
--> 단, 사람의 수를 기준으로 내림차순으로 5개까지 출력하시오.
select height, count(height)
from healthcare
GROUP BY height
ORDER BY count(height) desc limit 5;

--6. 키(height)와 몸무게(weight)를 기준으로 구분하고, 몸무게와, 키, 해당 그룹의 사람의 수를 출력하시오.
select height, weight, count(*)
from healthcare
GROUP BY height, weight
ORDER BY count(*) desc limit 5;

--7. 음주여부에 따라 평균 허리둘레(waist)와 사람의 수를 출력하시오.
select is_drinking, avg(waist)
from healthcare
GROUP BY is_drinking;

--8. 각 성별(gender)의 평균 왼쪽 시력(va_left)과 평균 오른쪽 시력(va_right)를 출력하시오.
--> 단, 평균 왼쪽 시력과 평균 오른쪽 시력의 컬럼명을 '평균 왼쪽 시력' '평균 오른쪽 시력'로 표시하고, 평균 시력은 소수점 둘째 자리까지 출력하시오.
select gender, round(avg(va_left),2) '평균 왼쪽 시력' , round(avg(va_right),2) '평균 오른쪽 시력'
from healthcare
GROUP BY gender;

-- 9. 각 나이대(age)의 평균 키와 평균 몸무게를 출력하시오.
--> 단, 평균 키와 평균 몸무게의 컬럼명을 '평균 키' '평균 몸무게'로 표시하고, 평균키가 160 이상 평균 몸무게가 60 이상인 데이터만 출력하시오.
select age, avg(height) '평균 키', avg(weight) '평균 몸무게'
from healthcare 
GROUP BY age
HAVING avg(height) >= 160 and avg(weight) >= 60; 

--10. 음주 여부(is_drinking)와 흡연 여부(smoking)에 따른 평균 BMI를 출력하시오.
--> 단, 음주 여부 또는 흡연 여부가 공백이 아닌 행만 사용하세요.
select is_drinking, smoking, avg(weight/(height*height*0.01))
from healthcare
where is_drinking != '' and smoking != ''
GROUP BY is_drinking, smoking;
