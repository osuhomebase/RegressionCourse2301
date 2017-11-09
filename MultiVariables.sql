update m set m.bedtime = q.bedtime, m.atmosphere = q.atmosphere, m.cleanliness = q.cleanliness  from (
select count(*) as cnt, e.entryId, ne.CUM_GPA,log(ne.cum_GPA) as logGPA,
case 
	when ge.Abbreviation = 'F' then 1
	else 0
end as gender,
ep.ProfileWeightEnum, ea.City, ea.StateProvince, c.Description as country,
ep1.ProfileWeightEnum as bedtime,
ep2.ProfileWeightEnum as atmosphere,
ep3.ProfileWeightEnum as cleanliness
 
 from programEntry pe INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN Program p on pe.ProgramID = p.ProgramId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
INNER JOIN GenderEnum ge ON e.Birth_GenderEnum = ge.GenderEnum
INNER JOIN EntryProfile ep on e.entryID = ep.entryID AND ep.ProfileItemID = 501
INNER JOIN EntryProfile ep1 on e.entryID = ep1.entryID AND ep1.ProfileItemID = 500
INNER JOIN EntryProfile ep2 on e.entryID = ep2.entryID AND ep2.ProfileItemID = 502
INNER JOIN EntryProfile ep3 on e.entryID = ep3.entryID AND ep3.ProfileItemID = 503
INNER JOIN EntryAddress ea on e.entryID = ea.entryId and ea.AddressTypeID = 0
INNER JOIN Country c on ea.CountryID = c.CountryID
INNER JOIN [dbo].[MultiVariateCumGPA] m ON e.EntryID = m.entryID
WHERE ne.strm = '1178' and ne.ACAD_LEVEL_BOT NOT IN('01','10')
and ne.CUM_GPA <> '0.00'
group by e.entryId, ne.CUM_GPA, ne.EmplID, ge.Abbreviation,ep.ProfileWeightEnum, ea.City,ea.StateProvince, c.Description, ep1.ProfileWeightEnum, ep2.ProfileWeightEnum, ep3.ProfileWeightEnum


-- profile item 500 - bed time
-- profile item 501 - wake up
-- profile item 502 - atmosphere
-- profile item 503 - cleanliness


) as q inner join [MultiVariateCumGPA] m on q.entryID = m.entryId

select * from [MultiVariateCumGPA]
