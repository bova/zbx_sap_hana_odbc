# Zabbix SAP HANA by ODBC

Zabbix template for SAP HANA monitoring by ODBC

## Setup SAP HANA client

* Download latest SAPCAR and IMDB_CLIENT20 from https://launchpad.support.sap.com/

* Setup 

```
chmod a+x SAPCAR_1324-80000935.EXE
./SAPCAR_1324-80000935.EXE -xvf IMDB_CLIENT20_015_19-80002082.SAR
cd SAP_HANA_CLIENT
./hdbinst
Enter Installation Path [/usr/sap/hdbclient]
```
		

* Result

```
/usr/sap/hdbclient/libodbcHDB.so
```

## Edit /etc/odbcinst.ini

```
[HDBDriver]
Description=SAP HANA ODBC Driver
Driver=/usr/sap/hdbclient/libodbcHDB.so
```

## Create user

Create user ZABBIX and grant MONITORING role