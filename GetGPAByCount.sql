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

-- events by day
select count(*) as cnt, convert(date,DateStart) as DateStart from (
select count(*) as cnt, p.ProgramId, p.Title, p.DateStart from programEntry pe INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
INNER JOIN program p on pe.ProgramID = p.ProgramID
WHERE ne.strm = '1178' and ne.ACAD_LEVEL_BOT NOT IN('01','10')
and CUM_GPA <> '0.00'
group by p.ProgramId, p.Title, p.DateStart
) as q 
group by convert(date,DateStart)
order by convert(date,DateStart)


-- counts per event by day
select count(*) as cnt, cnt as EventCount from (
select count(*) as cnt, p.ProgramId, p.Title, p.DateStart from programEntry pe INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
INNER JOIN program p on pe.ProgramID = p.ProgramID
WHERE ne.strm = '1178' and ne.ACAD_LEVEL_BOT NOT IN('01','10')
and CUM_GPA <> '0.00'
group by p.ProgramId, p.Title, p.DateStart
) as q 
group by cnt


-- counts per day
select sum(cnt) as TotalCount, convert(date,DateStart) as DateStart from (
select count(*) as cnt, p.ProgramId, p.Title, p.DateStart from programEntry pe INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
INNER JOIN program p on pe.ProgramID = p.ProgramID
WHERE ne.strm = '1178' and ne.ACAD_LEVEL_BOT NOT IN('01','10')
and CUM_GPA <> '0.00'
group by p.ProgramId, p.Title, p.DateStart
) as q 
group by convert(date,DateStart)
order by convert(date,DateStart)


-- events per day
select count(*) as TotalCount, convert(date,DateStart) as DateStart from (
select distinct p.ProgramID, p.Title, p.DateStart from programEntry pe INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
INNER JOIN program p on pe.ProgramID = p.ProgramID
WHERE ne.strm = '1178' and ne.ACAD_LEVEL_BOT NOT IN('01','10')
and CUM_GPA <> '0.00'
) as q 
group by convert(date,DateStart)
order by convert(date,DateStart)

select * from Program where DateStart >= '9/4/2017' and DateStart < '9/6/2017'

