<cfscript>
	dateNow = dateformat(now(), "YYYY-MM-DD");
	timeNow = timeformat(now(), "HH:MM:SS");
	queryService = new query();

	queryService.addParam(name="cdate",value="#dateNow#",cfsqltype="cf_sql_date");
	queryService.addParam(name="ctime",value="#timeNow#",cfsqltype="cf_sql_varchar");
	queryService.addParam(name="uuid",value="#CreateUUID()#",cfsqltype="cf_sql_varchar");
	queryService.addParam(name="logtype",value="OUT",cfsqltype="cf_sql_varchar");
	queryService.addParam(name="useridd",value="#session.USERID#",cfsqltype="cf_sql_varchar");
	queryService.addParam(name="remoteadd",value="#cgi.REMOTE_ADDR#",cfsqltype="cf_sql_varchar");
	queryService.addParam(name="gguuiidd",value="#session.GUID#",cfsqltype="cf_sql_varchar");
	queryService.addParam(name="ccfid",value="#session.CFID#",cfsqltype="cf_sql_varchar");
	queryService.addParam(name="ccftoken",value="#session.CFTOKEN#",cfsqltype="cf_sql_varchar");

	thesqlI = "INSERT INTO EGRGUSERCONNECTION (CONNECTIONDATE,
											   CONNECTIONTIME,
											   CONNECTIONID,
											   USERACCT,
											   IPADDRESS,
											   GUID,
											   USERID,
											   CFID,
											   CFTOKEN
											)
				VALUES (:cdate,
						:ctime,
						:uuid,
						:logtype,
						:remoteadd,
						:gguuiidd,
						:useridd,
						:ccfid,
						:ccftoken
				 )";
	queryService.setDatasource("#session.global_dsn#");
	queryService.setName("insertConnection");
	queryService.execute(sql=thesqlI);

	if (isDefined("form.bdg")) { // set the last application used by user to be the default app or the app that opens
								// next time the user log on.
			updateAppUserMaster = new query();
			updateAppUserMaster.addParam(name="appid",value="#trim(form.bdg)#",cfsqltype="cf_sql_varchar");
			updateAppUserMaster.addParam(name="duserid",value="#session.userid#",cfsqltype="cf_sql_varchar");
			updateAppUserMaster.addParam(name="dguid",value="#session.guid#",cfsqltype="cf_sql_varchar");
			dsql = "UPDATE EGRGUSERMASTER
					   SET DEFAULTAPPID = :appid
					 WHERE USERID = :duserid AND GUID = :dguid";

			updateAppUserMaster.setDatasource("#session.global_dsn#");
			updateAppUserMaster.setName("updateDefaultApp");
			updateAppUserMaster.execute(sql=dsql);
	}
</cfscript>


<cflogout>

<cfsetting showdebugoutput="false" >