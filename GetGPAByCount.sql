

select count(*) as cnt, e.entryId, CUM_GPA from programEntry pe INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN Program p on pe.ProgramID = p.ProgramId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
WHERE ne.strm = '1178' and ne.ACAD_LEVEL_BOT NOT IN('01','10')
and CUM_GPA <> '0.00'
group by e.entryId, CUM_GPA


select * from program where DateStart >= getdate() and DateStart <= getdate()+7
order by DateStart

select count(*),p.Title, p.DateStart from program p inner join programEntry pe on p.ProgramID = pe.ProgramID where DateStart <= getdate() 
group by p.title, p.DateStart
having count(*) = 1
order by DateStart

select count(*) as cnt from (
select count(*) as cnt, e.entryId, CUM_GPA from programEntry pe INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
INNER JOIN Program p on pe.ProgramID = p.ProgramId 
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

select * from booking b inner join entry e on b.entryId = e.entryId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
WHERE ne.strm = '1178' and ne.ACAD_LEVEL_BOT NOT IN('01','10')
and CUM_GPA <> '0.00'
and b.EntryStatusEnum = 5
and b.TermSessionID = 78
and e.entryID not in (select entryId from ProgramEntry pe inner join Program p on pe.ProgramID = p.ProgramID where p.Title NOT LIKE '%Floor Meeting%')



select count(*), p.Title from NYUProgramSummaryView p INNER JOIN ProgramEntry pe on p.ProgramID = pe.ProgramID 
INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN entry e2 on p.ProposerNetId = e2.id2
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID

where p.programID IN (
select programID from (
select count(*) as cnt, p.ProgramId, p.Title, p.DateStart from programEntry pe INNER JOIN entry e on pe.entryId = e.entryId 
INNER JOIN NYUEnrollment ne on e.id3 = ne.EmplID
INNER JOIN NYUProgramSummaryView p on pe.ProgramID = p.ProgramID
WHERE ne.strm = '1178' and ne.ACAD_LEVEL_BOT NOT IN('01','10')
and CUM_GPA <> '0.00'
group by p.ProgramId, p.Title, p.DateStart
) as q where cnt = 1)
group by p.title
order by count(*)

select * from NYUProgramSummaryView

select * from ProgramEntry where programID = 368

select * from program p inner join programEntry pe on p.ProgramID = pe.ProgramID
where pe.entryID IN (203528,
208159,
178560,
160649,
182276,
173187,
198170,
183895,
96697,
150352,
140592,
184270,
227180,
217163,
216631,
150421,
213037,
134471,
182215,
137313,
231554,
154158,
136616,
138669,
217413,
207430,
210717,
239803,
155237,
211894,
156527,
182257,
155628,
227299,
206133,
184149,
231622,
215423,
216847,
176871,
185821,
217407)
order by pe.entryID

select * from NYUEnrollment where emplid = '13119991'