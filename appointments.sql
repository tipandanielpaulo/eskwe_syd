
select
	A.id AS appointment_id,
	A.date,
	A.reason,
	A.status,
	A.patient_id,
	A.start_time,
	A.end_time,
	P.active as patient_active,
	A.practice_id,
	PR.active as practitioner_active,
	C.name as clinic_name
	
from 
    public.appointments A

left join public.patients P 
	on A.patient_id = P.id

left join public.practices PR
    on A.practice_id = PR.id
    
left join public.clinics C
	on A.clinic_id = C.id 	

where 1 = 1 
	and A.status is not null 
	and A.reason not like '%test%' 
	and A.reason not like '%Test%' 
	and A.reason not like '%TEST%'