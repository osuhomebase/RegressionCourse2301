select count(*) as cnt, e.entryId, CUM_GPA,log(cum_GPA),
convert(decimal(9,2),(select sum(UNIT_TERM_TOT) from NYUEnrollment neGPA WHERE neGPA.EmplID = ne.EmplID))/(select count(*) from NYUEnrollment neGPA2 WHERE neGPA2.EmplID = ne.EmplID and UNIT_TERM_TOT <> 0) as AvgCredits,
case 
	when ge.Abbreviation = 'F' then 1
	else 0
end as gender,
ep.ProfileWeightEnum,
ea.Street, ea.City, ea.StateProvince, ea.ZipPostcode,
ea.CountryID
 
 from programEntry pe INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN Program p on pe.ProgramID = p.ProgramId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
INNER JOIN GenderEnum ge ON e.Birth_GenderEnum = ge.GenderEnum
INNER JOIN EntryProfile ep on e.entryID = ep.entryID AND ProfileItemID = 503
INNER JOIN EntryAddress ea on e.entryID = ea.entryId and ea.AddressTypeID = 0
WHERE ne.strm = '1178' and ne.ACAD_LEVEL_BOT NOT IN('01','10')
and CUM_GPA <> '0.00'
group by e.entryId, CUM_GPA, ne.EmplID, ge.Abbreviation,ep.ProfileWeightEnum, ea.CountryID,
ea.Street, ea.City, ea.StateProvince, ea.ZipPostcode


-- profile item 500 - bed time
-- profile item 501 - wake up
-- profile item 502 - atmosphere
-- profile item 503 - cleanliness


