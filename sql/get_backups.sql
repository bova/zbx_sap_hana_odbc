-- BACKUP
-- Full/Incr backup
select
	 'Full/Incr backup status' as METRIC, state_name  as VALUE
from ( select
	 ROW_NUMBER() over( 
		ORDER BY id) as ROW_NUM,
	 state_name 
	from ( select
	 1 as id,
	 state_name 
		from "PUBLIC"."M_BACKUP_CATALOG" 
		where entry_type_name in ('complete data backup',
	 'differential',
	 'incremental backups', 'incremental data backup') 
		and entry_id=(select
	 max(entry_id) 
			from m_backup_catalog 
			where entry_type_name in ('complete data backup',
	 'differential',
	 'incremental backups','incremental data backup')) 
		and sys_start_time>add_days(current_date,
	 -2) 
		union all select
	 2 as id,
	 'no_backups' as state_name 
		from dummy) ) 
where row_num=1
UNION
-- LOG backup
select
	 'Log backup status' as METRIC, state_name as VALUE
from "PUBLIC"."M_BACKUP_CATALOG" 
where entry_type_name in ('log backup') 
and entry_id=(select
	 max(entry_id) 
	from m_backup_catalog 
	where entry_type_name in ('log backup'))