-- Q1
-- From the column mixed_value, extract the numeric characters
-- that appear at the very beginning of the value.

SELECT mixed_value,
CASE
WHEN mixed_value REGEXP '^[0-9]'
THEN SUBSTRING(mixed_value,1,
LOCATE(
SUBSTRING(mixed_value,
LENGTH(SUBSTRING_INDEX(mixed_value,'0',1))+1,1),
mixed_value)-1)
ELSE NULL
END AS beginning_numbers
FROM regex_practice;



-- Q2
-- From the column mixed_value, extract the numeric characters
-- that appear at the very end of the value.

SELECT mixed_value,
RIGHT(mixed_value,
LENGTH(mixed_value) -
LENGTH(TRIM(TRAILING '0123456789' FROM mixed_value))
) AS ending_numbers
FROM regex_practice;



-- Q3
-- From the column mixed_value, extract only the first single character.

SELECT mixed_value,
LEFT(mixed_value,1) AS first_character
FROM regex_practice;



-- Q4
-- From the column mixed_value, extract only the last single character.

SELECT mixed_value,
RIGHT(mixed_value,1) AS last_character
FROM regex_practice;



-- Q5
-- From the column mixed_value, extract exactly two consecutive numeric characters.

SELECT mixed_value,
SUBSTRING(mixed_value,
LOCATE('1',mixed_value),2) AS two_digits
FROM regex_practice;



-- Q6
-- From the column mixed_value, extract exactly one numeric character.

SELECT mixed_value,
SUBSTRING(mixed_value,
LENGTH(SUBSTRING_INDEX(mixed_value,'1',1))+1,1) AS one_digit
FROM regex_practice;



-- Q7
-- From the column phone, extract the country code present
-- at the beginning of the phone number.

SELECT phone,
SUBSTRING_INDEX(REPLACE(phone,'+',''),'-',1) AS country_code
FROM regex_practice;



-- Q8
-- From the column mixed_value, extract the numeric portion
-- present between alphabetic characters.

SELECT mixed_value,
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(mixed_value,
'a',''),'b',''),'c',''),'d',''),'e',''),
'f',''),'g',''),'h',''),'i',''),'j','')
AS middle_numbers
FROM regex_practice;



-- Q9
-- From the column email, extract the text before the @ symbol.

SELECT email,
SUBSTRING_INDEX(email,'@',1) AS username
FROM regex_practice;



-- Q10
-- From the column email, extract the text after the @ symbol
-- including the domain name.

SELECT email,
SUBSTRING_INDEX(email,'@',-1) AS domain_text
FROM regex_practice;



-- Q11
-- From the column email, extract only the domain name
-- without including the @ symbol.

SELECT email,
SUBSTRING_INDEX(email,'@',-1) AS domain_name
FROM regex_practice;



-- Q12
-- From the column email, extract only the text that appears
-- after the last dot in the email address.

SELECT email,
SUBSTRING_INDEX(email,'.',-1) AS extension
FROM regex_practice;



-- Q13
-- From the column mixed_value, extract only alphabetic characters
-- that appear together as a continuous sequence.

SELECT mixed_value,
TRIM('0123456789' FROM mixed_value) AS alphabets
FROM regex_practice;



-- Q14
-- From the column mixed_value, extract only numeric characters
-- that appear together as a continuous sequence.

SELECT mixed_value,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
REPLACE(mixed_value,
'a',''),'b',''),'c',''),'d',''),'e',''),
'f',''),'g',''),'h',''),'i',''),'j',''),
'k',''),'l',''),'m',''),'n',''),'o',''),
'p',''),'q',''),'r',''),'s',''),'t',''),
'u',''),'v',''),'w',''),'x',''),'y',''),
'z','') AS numbers
FROM regex_practice;



-- Q15
-- From the column full_text, extract exactly the first three characters.

SELECT full_text,
LEFT(full_text,3) AS first_three_characters
FROM regex_practice;



-- Q16
-- From the column full_text, extract exactly the last two characters.

SELECT full_text,
RIGHT(full_text,2) AS last_two_characters
FROM regex_practice;



-- Q17
-- From the column full_text, extract the employee number portion
-- that appears between the alphabetic prefix and the first underscore.

SELECT full_text,
SUBSTRING_INDEX(
SUBSTRING_INDEX(full_text,'_',1),
'P',-1) AS employee_number
FROM regex_practice;



-- Q18
-- From the column full_text, extract the country code
-- that appears at the end of the value.

SELECT full_text,
RIGHT(full_text,2) AS ending_country_code
FROM regex_practice;



-- Q19
-- From the column full_text, extract the alphabetic text
-- that appears between two underscore characters.

SELECT full_text,
SUBSTRING_INDEX(
SUBSTRING_INDEX(full_text,'_',2),
'_',-1) AS middle_text
FROM regex_practice;



-- Q20
-- From the column phone, extract the numeric characters
-- immediately after the plus sign.

SELECT phone,
SUBSTRING_INDEX(
SUBSTRING_INDEX(phone,'-',1),
'+',-1) AS plus_country_code
FROM regex_practice;