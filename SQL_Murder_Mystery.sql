
/* The incident report with the Two witnesses of the murder crime */
SELECT * FROM crime_scene_report 
WHERE type = 'murder' AND city LIKE '%sql city'
              
/* 
Witness 1 =  "lives at the last house on "Northwestern Dr"
Witness 2 =  Named Annabel, lives somewhere on "Franklin Ave"
*/                    


SELECT * FROM person 
WHERE address_street_name LIKE '%Northwestern dr'
ORDER  BY address_number DESC 
LIMIT 1

/* 
Witness 1 Identification info:
ID:14887	
Name: Morty Schapiro
License_id = 118009
address number = 4919
addres street name = Northwestern Dr
ssn = 111564949
*/  

SELECT * FROM person 
WHERE address_street_name LIKE '%Franklin Ave%' and name LIKE '%Annabel%'

/* 
Witness 1 Identification info:
ID:16371	
Name: Annabel Miller	
License_id = 490173
address number = 103
addres street name = Franklin Ave	
ssn = 318771143
*/           

SELECT * FROM interview
JOIN person 
ON interview.person_id = person.id
WHERE address_number = '4919' AND address_street_name = 'Northwestern Dr'
              
 /* 
Joined the person database with the interview taken and found the follow interview from witness 1

"I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number 
on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate 
that included "H42W"

*/            

SELECT * FROM interview
JOIN person 
ON interview.person_id = person.id
WHERE name = 'Annabel Miller'

 /* 
 
Joined the person database with the interview taken and found the follow interview from witness 1

"I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th".

*/ 

SELECT * FROM drivers_license 
WHERE plate_number LIKE '%H42W%'
              

SELECT * FROM person 
JOIN get_fit_now_member 
ON person.id = get_fit_now_member.person_id 
WHERE get_fit_now_member.membership_status LIKE '%gold%' AND get_fit_now_member.id LIKE '48Z%'

SELECT * FROM person
JOIN drivers_license ON 
drivers_license.id = person.license_id
WHERE person.name = 'Joe Germuska' or person.name = 'Jeremy Bowers'

              
  /* 
 
Interview of the Murderer and his transcript:
I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.
*/              

SELECT * FROM interview 
JOIN person ON person.id = interview.person_id
WHERE person.name = 'Jeremy Bowers'

Joe Germuska
Jeremy Bowers
              

SELECT * FROM drivers_license 
WHERE car_make LIKE '%tesla%' and car_model like '%model s%' 
and hair_color LIKE 'red'and gender LIKE 'female'

              
SELECT * FROM person 
JOIN facebook_event_checkin 
ON person.id = facebook_event_checkin.person_id
WHERE event_name LIKE '%SQL Symphony Concert%' and date BETWEEN 20171201 and 20180101

SELECT * FROM drivers_license
INNER JOIN person 
ON person.license_id = drivers_license.id
INNER JOIN facebook_event_checkin 
ON facebook_event_checkin.person_id = person.id
WHERE car_make LIKE '%tesla%' and car_model like '%model s%' 
and hair_color LIKE 'red'and gender LIKE 'female'

