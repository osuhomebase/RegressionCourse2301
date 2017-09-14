select count(*), e.entryId, CUM_GPA from programEntry pe INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
WHERE ne.strm = '1178' and ne.ACAD_LEVEL_BOT NOT IN('01','10')
group by e.entryId, CUM_GPA