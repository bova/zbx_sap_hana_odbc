-- Connections
select 'Connections' as METRIC, count(*) as VALUE from "PUBLIC"."M_CONNECTIONS" where connection_type = 'Remote'
UNION
select 'Connections queuing' as METRIC, count(*) as VALUE from "PUBLIC"."M_CONNECTIONS" where connection_type = 'Remote' and connection_status='QUEUING'
UNION
select 'Connections running' as METRIC, count(*) as VALUE from "PUBLIC"."M_CONNECTIONS" where connection_type = 'Remote' and connection_status='RUNNING'
UNION
select 'Connections idle' as METRIC, count(*) as VALUE from "PUBLIC"."M_CONNECTIONS" where connection_type = 'Remote' and connection_status='IDLE'
-- LOCKS
UNION
select 'Object locks' as METRIC, count(*) as VALUE from "PUBLIC"."M_OBJECT_LOCKS"
-- Storage
UNION
SELECT 'DB size column store' as METRIC, round(sum(MEMORY_SIZE_IN_TOTAL)) as VALUE  FROM M_CS_TABLES
UNION
SELECT 'DB size row store' as METRIC, sum(USED_FIXED_PART_SIZE + USED_VARIABLE_PART_SIZE) as VALUE FROM M_RS_TABLES
-- Memory
UNION
select 'Free physical memory' as METRIC, FREE_PHYSICAL_MEMORY as VALUE from M_HOST_RESOURCE_UTILIZATION
UNION
select 'Used physical memory' as METRIC, USED_PHYSICAL_MEMORY as VALUE from M_HOST_RESOURCE_UTILIZATION
