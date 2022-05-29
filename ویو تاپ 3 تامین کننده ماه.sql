select SupplierID, sum(totalamount) as total into #S from StockDocument
  where DocumentTypeID = '433' and DocumentDate between '2021-12-22 00:00:00.000' and '2022-1-20 23:59:00.000'
  and StatusID = '246'
  group by SupplierID
  select distinct top 3 #S.*, ifmv.SupplierName from #S
  left join ItemForMobileView ifmv
  on #S.SupplierID = ifmv.SupplierID
  where ifmv.LanguageID = '314'
  order by total desc
  drop table #S