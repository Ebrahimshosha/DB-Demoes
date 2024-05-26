select ins_name,salary,
			case
			when salary>=3000 then 'high sal'
			when salary<3000 then 'low'
			else 'No value'
			end as Newsal
from Instructor

select ins_name,iif(salary>=3000,'high','low')
from Instructor


update Instructor
	set salary=
		case
		when salary>=3000 then salary*1.10
		else salary*1.20
		end