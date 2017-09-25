select count(*) as cnt, e.entryId, CUM_GPA from programEntry pe INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
WHERE ne.strm = '1178' and ne.ACAD_LEVEL_BOT NOT IN('01','10')
and CUM_GPA <> '0.00'
group by e.entryId, CUM_GPA
order by count(*)

select * from program where DateStart >= getdate() and DateStart <= getdate()+7
order by DateStart

select count(*),p.Title, p.DateStart from program p inner join programEntry pe on p.ProgramID = pe.ProgramID where DateStart <= getdate() 
group by p.title, p.DateStart
order by DateStart

select count(*) as cnt from (
select count(*) as cnt, e.entryId, CUM_GPA from programEntry pe INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
WHERE ne.strm = '1178' and ne.ACAD_LEVEL_BOT NOT IN('01','10')
and CUM_GPA <> '0.00'
group by e.entryId, CUM_GPA) as q 

select count(*) as cnt, p.ProgramId, p.Title, p.DateStart from programEntry pe INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
INNER JOIN program p on pe.ProgramID = p.ProgramID
WHERE ne.strm = '1178' and ne.ACAD_LEVEL_BOT NOT IN('01','10')
and CUM_GPA <> '0.00'
group by p.ProgramId, p.Title, p.DateStart
order by count(*)