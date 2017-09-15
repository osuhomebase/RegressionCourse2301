
select sum(item_amt), ne.emplID, CUM_GPA from nyu.item_sf sf inner join nyuEnrollment ne on sf.emplID = ne.EmplID 
inner join NYUAdmissionsImport na on ne.emplId = na.EmplID
where ne.STRM = '1178' and na.Admit_Term = '1138' and na.Admit_Type = 'NFR' and cum_gpa <> 0
group by ne.EmplID, CUM_GPA