<cfcomponent name="QueryManager" ExtDirect="true">

<cffunction name="ReadNow" ExtDirect="true">

	<cfargument name="page" >
	<cfargument name="start" >
	<cfargument name="limit" >
	<cfargument name="sort" >
	<cfargument name="filter" >
    <cfset theargs = StructNew() >
	<cfset theargs["page"] = page >
	<cfset theargs["start"] = start >
	<cfset theargs["limit"] = limit >
	<cfset theargs["sort"] = sort >
	<cfset theargs["filter"] = filter >
 	<cfinvoke component="IBOSE.application.GridQuery"
				method="buildCondition"
				argumentcollection="#theargs#" returnvariable="dresult">

	<cfset WHERE = dresult['where']>
	<cfset ORDERBY = dresult['orderby']>

<cfset processData = ORMExecuteQuery("FROM EGRGQUERY #PreserveSingleQuotes(WHERE)# ORDER BY #ORDERBY#", false, {offset=#start#, maxResults=#limit#, timeout=150} ) >

<cfset countAll = ORMExecuteQuery("SELECT COUNT(*) AS TOTALREC FROM EGRGQUERY #PreserveSingleQuotes(WHERE)#", true )>

	<cfset resultArr = ArrayNew(1) >
	<cfset rootstuct = StructNew() >
	<cfset rootstuct['totalCount'] = countAll >

	<!---Creates an array of structure to be converted to JSON using serializeJSON--->
	<cfloop array="#processData#" index="calIndex" >
		<cfset tmpresult = StructNew() > <!---Creates new structure in every loop to be added to the array--->
		<cfset tmpresult['EQRYCODE']        	= calIndex.getEQRYCODE()  >
		<cfset tmpresult['EQRYNAME']      	= calIndex.getEQRYNAME() >
		<cfset tmpresult['EQRYDESCRIPTION']    	= calIndex.getEQRYDESCRIPTION()  >
		<cfset tmpresult['EQRYAUTHOR']    	= calIndex.getEQRYAUTHOR()  >
		<cfset tmpresult['RECDATECREATED']     = calIndex.getRECDATECREATED()  >
		<cfset tmpresult['DATELASTUPDATE'] 			= calIndex.getDATELASTUPDATE()  >

		<cfset ArrayAppend(resultArr, tmpresult) />
	</cfloop>
	<cfset rootstuct['topics'] = resultArr >
	<cfreturn rootstuct />
</cffunction>


<cffunction name="CreateNow" ExtDirect="true">
<cfargument name="datatocreate" >
<cftry>
	<cfset EQRYCODE = createUuid() >
	<cfset EQRYAUTHOR = "" >

	<cfif isArray(datatocreate) >
	    <cfset datatocreate = datatocreate[1] >
	</cfif>

    <cfif trim(datatocreate.EQRYCODE) neq "">
		<cfloop list="#datatocreate.EQRYCODE#" index="qryC" delimiters="," >
			<cfif trim(qryC) neq ""> <!--- The action is copy --->

			<!--- (16) Tables to copy:
				EGRGQUERY - EQRYCODE
				EGRGQRYGRID - EQRYCODE
				EGRGQRYCHART - EQRYCODE
				EGRGQRYCHARTAXIS - EQRYCODEFK
				EGRGQRYCHARTSERIES - EQRYCODEFK
				EGRGQRYFEATURE - EQRYCODE
				EGRGQRYPLUGIN - EQRYCODE
				EGRGQRYCOLUMN - EVIEWFIELDCODE

				EGRGEVIEWDATASOURCE - EQRYCODEFK
				EGRGEVIEWTABLES - EQRYCODEFK
				EGRGEVIEWJOINEDTABLES - EQRYCODEFK
				EGRGEVIEWCONDITION - EQRYCODEFK
				EGRGEVIEWGROUPBY - EQRYCODEFK
				EGRGEVIEWHAVING - EQRYCODEFK
				EGRGEVIEWORDERBY - EQRYCODEFK
				EGRGEVIEWFIELDS - EQRYCODEFK - EVIEWFIELDCODE
				EGRGQRYCOLUMN - EVIEWFIELDCODE
				--->

				<cfset TEQRYCODE = createUuid() >

				<cfset copyEGRGQUERY(qryC,TEQRYCODE) />
				<cfset copyEGRGQRYGRID(qryC,TEQRYCODE) />
				<cfset copyEGRGQRYCHART(qryC,TEQRYCODE) />
				<cfset copyEGRGQRYCHARTAXIS(qryC,TEQRYCODE) />
				<cfset copyEGRGQRYCHARTSERIES(qryC,TEQRYCODE) />
				<cfset copyEGRGQRYFEATURE(qryC,TEQRYCODE) />
				<cfset copyEGRGQRYPLUGIN(qryC,TEQRYCODE) />
				<cfset copyEGRGEVIEWDATASOURCE(qryC,TEQRYCODE) />
				<cfset copyEGRGEVIEWTABLES(qryC,TEQRYCODE) />
				<cfset copyEGRGEVIEWJOINEDTABLES(qryC,TEQRYCODE) />
				<cfset copyEGRGEVIEWFIELDS(qryC,TEQRYCODE) />
				<cfset copyEGRGEVIEWCONDITION(qryC,TEQRYCODE) />
				<cfset copyEGRGEVIEWGROUPBY(qryC,TEQRYCODE) />
				<cfset copyEGRGEVIEWHAVING(qryC,TEQRYCODE) />
				<cfset copyEGRGEVIEWORDERBY(qryC,TEQRYCODE) />

			</cfif>
		</cfloop>
		<cfset ormflush()>
	<cfelse>
		<cfset EQRYCODE = createUuid() >
		<cfset EQRYAUTHOR = session.chapa >

		<cfset processData = EntityNew("EGRGQUERY") >
		<cfset processData.setEQRYCODE("#EQRYCODE#") >
		<cfset processData.setEQRYNAME("#datatocreate.EQRYNAME#") >
		<cfset processData.setEQRYDESCRIPTION("#datatocreate.EQRYDESCRIPTION#") >
		<cfset processData.setEQRYAUTHOR("#EQRYAUTHOR#") >
		<cfset processData.setEQRYBODY("SELECT") >
		<cfset processData.setCOMPANYCODE("#ucase(session.companycode)#") >
		<cfset processData.setRECDATECREATED("#CreateODBCDateTime(now())#") >

		<cfset EntitySave(processData) >
		<cfset ormflush()>
	</cfif>

	<cfset retstruct = StructNew() >
	<cfset retstruct["EQRYCODE"] = EQRYCODE>
	<cfset retstruct["EQRYAUTHOR"] = EQRYAUTHOR>
	<cfreturn retstruct >
<cfcatch>
	<cfreturn cfcatch.detail & ' ' & cfcatch.message >
</cfcatch>
</cftry>
</cffunction>



<cffunction name="UpdateNow" ExtDirect="true">
<cfargument name="datatoupdate" >
<cftry>

	<cfif isArray(datatoupdate) >
		<cfset datatoupdate = datatoupdate[1] >
	</cfif>

	<cfset processData = EntityLoad("EGRGQUERY", datatoupdate.EQRYCODE, true ) >
	<cfset processData.setEQRYNAME("#datatoupdate.EQRYNAME#") >
	<cfset processData.setEQRYDESCRIPTION("#datatoupdate.EQRYDESCRIPTION#") >
	<cfset processData.setDATELASTUPDATE("#CreateODBCDateTime(now())#") >
	<cfset EntitySave(processData) >
	<cfset ormflush()>

	<cfreturn datatoupdate.EQRYCODE >

<cfcatch>
	<cfreturn cfcatch.detail & ' ' & cfcatch.message >
</cfcatch>
</cftry>
</cffunction>


<cffunction name="DestroyNow" ExtDirect="true">
<cfargument name="datatodestroy" type="any" >
<cftry>
	<cfif isArray(datatodestroy) >
		<cfset arrayLen = ArrayLen(datatodestroy) >
		<cfloop from="1" to="#arrayLen#" index="dataIdx" step="1"  >
		    <cfset dqrycode = trim(datatodestroy[dataIdx].EQRYCODE) />
		    <cfset processData = EntityLoad("EGRGQUERY", dqrycode, true ) >
		    <cfinvoke method="deleteQuery">
		</cfloop>
	<cfelse>
		<cfset processData = EntityLoad("EGRGQUERY", datatodestroy.EQRYCODE, true ) >
		<cfset dqrycode = trim(datatodestroy.EQRYCODE) />
		<cfinvoke method="deleteQuery">
	</cfif>
	<cfset OrmFlush()>
	<cfreturn "success" >
<cfcatch>
	<cfreturn cfcatch.detail & ' ' & cfcatch.message >
</cfcatch>
</cftry>
</cffunction>

<cffunction name="deleteQuery" returntype="void">
	<cfif IsDefined("processData") >
	    <!--- Check if member in an active liveboard. If a member, do not delete --->
	    <cfset res = IsMemberInAnActiveLiveboard(dqrycode) />
	    <cfif res eq "false"> <!--- remove query codes --->
	    	<cfset removeQueryCodesGenerated(dqrycode) />
		    <cfquery name="de" datasource="#session.global_dsn#">
				DELETE FROM EGRGLIVEBOARDITEM
			     WHERE XTYPE = <cfqueryparam value="#dqrycode#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfset EntityDelete(processData) >
			<cfset removeQueryCodesGenerated(dqrycode) />
		<cfelse>
			<cfthrow message="This query is a member of an active liveboard.">
		</cfif>
	</cfif>
</cffunction>

<cffunction name="IsMemberInAnActiveLiveboard" access="public" returntype="boolean" >
	<cfargument name="dqrycode">
	<cfset lbitem = EntityLoad("EGRGLIVEBOARDITEM", {XTYPE=#trim(dqrycode)#}, false) />
	<cfif IsDefined("lbitem")>
		<cfloop array="#lbitem#" index="a">
			<cfset lb = EntityLoad("EGRGLIVEBOARD", a.getLIVEBOARDCODE() , true) />
			<cfif IsDefined("lb")>
				<cfif lb.getLBSTATUS() eq "ACTIVE">
					<cfreturn "true">
				</cfif>
			</cfif>
		</cfloop>
	</cfif>
	<cfreturn "false">
</cffunction>

<cffunction name="removeQueryCodesGenerated" access="public" returntype="void" >
	<cfargument name="dqrycode">
	<cfset querycodeNS = "NS_" & rereplace(dqrycode, "\W", "", "all") />
	<cfinvoke component="myapps.liveboard.Helper" method="removeLiveboardCode">
		<cfinvokeargument name="liveboardcode" value="#dqrycode#" />
		<cfinvokeargument name="liveboardcodeNS" value="#querycodeNS#" />
		<cfinvokeargument name="backpath" value="../../../" />
		<cfinvokeargument name="dfolder" value="queryoutput" />
	</cfinvoke>
</cffunction>


<cffunction name="InsertQueryItems" ExtDirect="true" returntype="Any">
	<cfargument name="bdata" type="struct" >

    <cfset returnStruct = StructNew()>

	<!--- Delete first selected tables --->
	<cftry>

		<cfquery name="qryTruncateTables" datasource="#session.global_dsn#">
			DELETE FROM EGRGEVIEWDATASOURCE
			 WHERE EQRYCODEFK = <cfqueryparam value="#bdata['querycode']#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfquery name="qryTruncateTables" datasource="#session.global_dsn#">
			DELETE FROM EGRGEVIEWTABLES
			 WHERE EQRYCODEFK = <cfqueryparam value="#bdata['querycode']#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfquery name="qryTruncateField" datasource="#session.global_dsn#">
			SELECT EVIEWFIELDCODE FROM EGRGEVIEWFIELDS
			 WHERE EQRYCODEFK = <cfqueryparam value="#bdata['querycode']#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfloop query="qryTruncateField">
			<cfquery name="qryTruncateColumn" datasource="#session.global_dsn#">
				DELETE FROM EGRGQRYCOLUMN
				 WHERE EVIEWFIELDCODE = <cfqueryparam value="#qryTruncateField.EVIEWFIELDCODE#" cfsqltype="cf_sql_varchar">
			</cfquery>
		</cfloop>
		<cfquery name="qryTruncateTables" datasource="#session.global_dsn#">
			DELETE FROM EGRGEVIEWFIELDS
			 WHERE EQRYCODEFK = <cfqueryparam value="#bdata['querycode']#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfquery name="qryTruncateTables" datasource="#session.global_dsn#">
			DELETE FROM EGRGEVIEWCONDITION
			 WHERE EQRYCODEFK = <cfqueryparam value="#bdata['querycode']#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfquery name="qryTruncateTables" datasource="#session.global_dsn#">
			DELETE FROM EGRGEVIEWGROUPBY
			 WHERE EQRYCODEFK = <cfqueryparam value="#bdata['querycode']#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfquery name="qryTruncateTables" datasource="#session.global_dsn#">
			DELETE FROM EGRGEVIEWHAVING
			 WHERE EQRYCODEFK = <cfqueryparam value="#bdata['querycode']#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfquery name="qryTruncateTables" datasource="#session.global_dsn#">
			DELETE FROM EGRGEVIEWJOINEDTABLES
			 WHERE EQRYCODEFK = <cfqueryparam value="#bdata['querycode']#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfquery name="qryTruncateTables" datasource="#session.global_dsn#">
			DELETE FROM EGRGEVIEWORDERBY
			 WHERE EQRYCODEFK = <cfqueryparam value="#bdata['querycode']#" cfsqltype="cf_sql_varchar">
		</cfquery>

		<!--- Insert new values to selected tables --->
		<cfloop from="1" to="#ArrayLen(bdata['selecteddatasource'])#" index="d">
			<cfset osrc = EntityNew("EGRGEVIEWDATASOURCE")>
			<cfset dscode = Createuuid() >
			<cfset osrc.setDATASOURCECODE(dscode)>
			<cfset osrc.setEQRYCODEFK(bdata["querycode"])>
			<cfset osrc.setCOLUMNORDER(d)>
			<cfset osrc.setDATASOURCETYPE(bdata['selecteddatasource'][d]['DATASOURCETYPE'])>
			<cfset osrc.setDATASOURCENAME(bdata['selecteddatasource'][d]['DATASOURCENAME'])>
			<cfset EntitySave(osrc) >
		</cfloop>
		<cfloop from="1" to="#ArrayLen(bdata['selectedtable'])#" index="f">
			<cfset fosrc = EntityNew("EGRGEVIEWTABLES")>
			<cfset tablecode = Createuuid()>
			<cfset fosrc.setEVIEWTABLECODE(tablecode)>
			<cfset fosrc.setEQRYCODEFK(bdata["querycode"])>
			<cfset fosrc.setCOLUMNORDER(f)>
			<cfset fosrc.setDATASOURCECODEFK(bdata['selectedtable'][f]['DATASOURCE'])>
			<cfset fosrc.setTABLENAME(bdata['selectedtable'][f]['TABLENAME'])>
			<cfset fosrc.setTEMPTABLE(bdata['selectedtable'][f]['TEMPTABLE'])>
			<cfset fosrc.setTABLEALIAS(bdata['selectedtable'][f]['TABLEALIAS'])>
			<cfset EntitySave(fosrc) >
		</cfloop>
		<cfloop from="1" to="#ArrayLen(bdata['selectedfield'])#" index="g">
			<cfset gosrc = EntityNew("EGRGEVIEWFIELDS")>
			<cfset dcolumn = EntityNew("EGRGQRYCOLUMN") >
			<cfset fieldcode = Createuuid()>
			<cfset gosrc.setEVIEWFIELDCODE(fieldcode)>
			<cfset dcolumn.setEVIEWFIELDCODE(fieldcode)>
			<!--- set output type --->
			<cfset dt = ucase(bdata['selectedfield'][g]['TYPE_NAME'])>
			<cfif dt eq "INTEGER" or dt eq "INT" or dt eq "SMALLINT" or dt eq "TINYINT" or dt eq "MEDIUMINT" or dt eq "BIGINT" or dt eq "BIT" or dt eq "DECIMAL" or dt eq "NUMERIC" or dt eq "MONEY" or dt eq "SMALLMONEY">
				<cfset dcolumn.setOUTPUTTYPE("int")>
			<cfelseif dt eq "FLOAT" or dt eq "DOUBLE" or dt eq "BINARY_FLOAT" or dt eq "BINARY_DOUBLE">
				<cfset dcolumn.setOUTPUTTYPE("float")>
			<cfelseif dt eq "DATE" or dt eq "DATETIME" or dt eq "TIMESTAMP" or dt eq "TIME" or dt eq "DATETIME2" or dt eq "DATETIMEOFFSET" or dt eq "SMALLDATETIME">
				<cfset dcolumn.setOUTPUTTYPE("date")>
			<cfelseif dt eq "BOOLEAN" or dt eq "BOOL">
				<cfset dcolumn.setOUTPUTTYPE("boolean")>
			<cfelse>
				<cfset dcolumn.setOUTPUTTYPE("string")>
			</cfif>

			<cfset gosrc.setEQRYCODEFK(bdata["querycode"])>
			<cfset gosrc.setCOLUMNORDER(g)>
			<cfset gosrc.setTABLENAME(bdata['selectedfield'][g]['TABLENAME'])>
			<cfset gosrc.setFIELDNAME(bdata['selectedfield'][g]['FIELDNAME'])>
			<cfset gosrc.setDISPLAY(bdata['selectedfield'][g]['DISPLAY'])>
			<cfset gosrc.setFIELDALIAS(bdata['selectedfield'][g]['FIELDALIAS'])>
			<cfset gosrc.setPRIORITYNO(g)>
			<cfset gosrc.setAGGREGATEFUNC(bdata['selectedfield'][g]['AGGREGATEFUNC'])>
			<cfset gosrc.setDATEANDSTRINGFUNC(bdata['selectedfield'][g]['DATEANDSTRINGFUNC'])>
			<cfset gosrc.setNUMBERFORMAT(bdata['selectedfield'][g]['NUMBERFORMAT'])>
			<cfset gosrc.setISDISTINCT(bdata['selectedfield'][g]['ISDISTINCT'])>
			<cfset gosrc.setWRAPON(bdata['selectedfield'][g]['WRAPON'])>
			<cfset gosrc.setSUPPRESSZERO(bdata['selectedfield'][g]['SUPPRESSZERO'])>
			<cfset gosrc.setOVERRIDESTATEMENT(bdata['selectedfield'][g]['OVERRIDESTATEMENT'])>
			<cfset gosrc.setIS_PRIMARYKEY(bdata['selectedfield'][g]['IS_PRIMARYKEY'])>
			<cfset gosrc.setORDINAL_POSITION(bdata['selectedfield'][g]['ORDINAL_POSITION'])>
			<cfset gosrc.setTYPE_NAME(bdata['selectedfield'][g]['TYPE_NAME'])>
			<cfset gosrc.setDECIMAL_DIGITS(bdata['selectedfield'][g]['DECIMAL_DIGITS'])>
			<cfset gosrc.setIS_NULLABLE(bdata['selectedfield'][g]['IS_NULLABLE'])>
			<cfset gosrc.setCOLUMN_DEFAULT_VALUE(bdata['selectedfield'][g]['COLUMN_DEFAULT_VALUE'])>
			<cfset gosrc.setCHAR_OCTET_LENGTH(bdata['selectedfield'][g]['CHAR_OCTET_LENGTH'])>
			<cfset gosrc.setIS_FOREIGNKEY(bdata['selectedfield'][g]['IS_FOREIGNKEY'])>
			<cfset gosrc.setREFERENCED_PRIMARYKEY(bdata['selectedfield'][g]['REFERENCED_PRIMARYKEY'])>
			<cfset gosrc.setREFERENCED_PRIMARYKEY_TABLE(bdata['selectedfield'][g]['REFERENCED_PRIMARYKEY_TABLE'])>
			<cfset dcolumn.setEGRGEVIEWFIELDS(gosrc)>
			<cfset EntitySave(gosrc) >
			<cfset EntitySave(dcolumn) >
		</cfloop>
		<cfloop from="1" to="#ArrayLen(bdata['selectedjoin'])#" index="h">
			<cfset hosrc = EntityNew("EGRGEVIEWJOINEDTABLES")>
			<cfset fieldcode = Createuuid()>
			<cfset hosrc.setEVIEWJOINEDTABLECODE(fieldcode)>
			<cfset hosrc.setEQRYCODEFK(bdata["querycode"])>
			<cfset hosrc.setCOLUMNORDER(h)>
			<cfset hosrc.setPRIORITYNO(h)>
			<cfset hosrc.setJOINOPERATOR(bdata['selectedjoin'][h]['JOINOPERATOR'])>
			<cfset hosrc.setTABLENAME(bdata['selectedjoin'][h]['TABLENAME'])>
			<cfset hosrc.setONCOLUMN(bdata['selectedjoin'][h]['ONCOLUMN'])>
			<cfset hosrc.setEQUALTOCOLUMN(bdata['selectedjoin'][h]['EQUALTOCOLUMN'])>
			<cfset hosrc.setDISPLAY(bdata['selectedjoin'][h]['DISPLAY'])>
			<cfset EntitySave(hosrc) >
		</cfloop>
		<cfloop from="1" to="#ArrayLen(bdata['selectedcondition'])#" index="m">
			<cfset mosrc = EntityNew("EGRGEVIEWCONDITION")>
			<cfset fieldcode = Createuuid()>
			<cfset mosrc.setEVIEWCONDITIONCODE(fieldcode)>
			<cfset mosrc.setEQRYCODEFK(bdata["querycode"])>
			<cfset mosrc.setCOLUMNORDER(m)>
			<cfset mosrc.setPRIORITYNO(m)>
			<cfset mosrc.setCONJUNCTIVEOPERATOR(bdata['selectedcondition'][m]['CONJUNCTIVEOPERATOR'])>
			<cfset mosrc.setONCOLUMN(bdata['selectedcondition'][m]['ONCOLUMN'])>
			<cfset mosrc.setCONDITIONOPERATOR(bdata['selectedcondition'][m]['CONDITIONOPERATOR'])>
			<cfset mosrc.setCOLUMNVALUE(bdata['selectedcondition'][m]['COLUMNVALUE'])>
			<cfset EntitySave(mosrc) >
		</cfloop>
		<cfloop from="1" to="#ArrayLen(bdata['selectedgroupby'])#" index="n">
			<cfset nosrc = EntityNew("EGRGEVIEWGROUPBY")>
			<cfset fieldcode = Createuuid()>
			<cfset nosrc.setEVIEWGROUPBYCODE(fieldcode)>
			<cfset nosrc.setEQRYCODEFK(bdata["querycode"])>
			<cfset nosrc.setCOLUMNORDER(n)>
			<cfset nosrc.setPRIORITYNO(n)>
			<cfset nosrc.setGROUPBYCOLUMN(bdata['selectedgroupby'][n]['GROUPBYCOLUMN'])>
			<cfset EntitySave(nosrc) >
		</cfloop>
		<cfloop from="1" to="#ArrayLen(bdata['selectedhaving'])#" index="o">
			<cfset oosrc = EntityNew("EGRGEVIEWHAVING")>
			<cfset fieldcode = Createuuid()>
			<cfset oosrc.setEVIEWHAVINGCODE(fieldcode)>
			<cfset oosrc.setEQRYCODEFK(bdata["querycode"])>
			<cfset oosrc.setCOLUMNORDER(o)>
			<cfset oosrc.setPRIORITYNO(o)>
			<cfset oosrc.setCONJUNCTIVEOPERATOR(bdata['selectedhaving'][o]['CONJUNCTIVEOPERATOR'])>
			<cfset oosrc.setAGGREGATECOLUMN(bdata['selectedhaving'][o]['AGGREGATECOLUMN'])>
			<cfset oosrc.setCONDITIONOPERATOR(bdata['selectedhaving'][o]['CONDITIONOPERATOR'])>
			<cfset oosrc.setAGGREGATEVALUE(bdata['selectedhaving'][o]['AGGREGATEVALUE'])>
			<cfset oosrc.setDISPLAY(bdata['selectedhaving'][o]['DISPLAY'])>
			<cfset EntitySave(oosrc) >
		</cfloop>
		<cfloop from="1" to="#ArrayLen(bdata['selectedorderby'])#" index="p">
			<cfset posrc = EntityNew("EGRGEVIEWORDERBY")>
			<cfset fieldcode = Createuuid()>
			<cfset posrc.setEVIEWORDERBYCODE(fieldcode)>
			<cfset posrc.setEQRYCODEFK(bdata["querycode"])>
			<cfset posrc.setCOLUMNORDER(p)>
			<cfset posrc.setPRIORITYNO(p)>
			<cfset posrc.setFIELDNAME(bdata['selectedorderby'][p]['FIELDNAME'])>
			<cfset posrc.setDISPLAY(bdata['selectedorderby'][p]['DISPLAY'])>
			<cfset posrc.setASCORDESC(bdata['selectedorderby'][p]['ASCORDESC'])>
			<cfset EntitySave(posrc) >
		</cfloop>

		<cfset qry = EntityLoad("EGRGQUERY", bdata["querycode"], true) >

		<cfset qry.setEQRYBODY(bdata["cuteQuery"])>
		<cfset qry.setDATELASTUPDATE("#CreateODBCDateTime(now())#")>
		<cfset EntitySave(qry) >
		<cfset ormflush()>

		 <cfset returnStruct = bdata["querycode"]>
		 <cfreturn returnStruct >

		 <cfcatch Type="Any">
		 	<cfset returnStruct = StructNew() />
		 	<cfset returnStruct["result"] = cfcatch.message & " - " & cfcatch.detail />
		 	<cfreturn returnStruct >
		 </cfcatch>
	 </cftry>

</cffunction>

<cffunction name="copyEGRGQUERY" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refQuery = EntityLoad("EGRGQUERY", qryC, true) >
	<cfset processData = EntityNew("EGRGQUERY") >
	<cfset processData.setEQRYCODE("#TEQRYCODE#") >
	<cfset processData.setEQRYNAME("#refQuery.getEQRYNAME()# #DateFormat(now(),'YYYY-MM-DD')# #TimeFormat(now(),'HH:MM:SS')#") >
	<cfset processData.setEQRYDESCRIPTION("#refQuery.getEQRYDESCRIPTION()#") >
	<cfset processData.setEQRYAUTHOR("#refQuery.getEQRYAUTHOR()#") >
	<cfset processData.setEQRYBODY("#refQuery.getEQRYBODY()#") >
	<cfset processData.setCOMPANYCODE("#ucase(refQuery.getCOMPANYCODE())#") >
	<cfset processData.setRECDATECREATED("#CreateODBCDateTime(now())#") >
	<cfset processData.setDATELASTUPDATE("#CreateODBCDateTime(now())#") >
	<cfset EntitySave(processData) >
</cffunction>

<cffunction name="copyEGRGQRYGRID" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqca = EntityLoad("EGRGQRYGRID", {EQRYCODE=#qryC#}, false) >
	<cfif IsDefined("refqca")>
		<cfloop from="1" to="#ArrayLen(refqca)#" index="a">
			<cfset processqca = EntityNew("EGRGQRYGRID") />
			<cfset processqca.setEQRYCODE('#TEQRYCODE#') />
			<cfset colList = "OUTPUTTYPE,ACTIVEITEM,ALLOWDESELECT,ANCHORSIZE,ANIMCOLLAPSE,AUTODESTROY,AUTORENDER,AUTOSCROLL,AUTOSHOW,BASECLS,BBAR,GVIEWBLOCKREFRESH,BODYBORDER,BODYCLS,BODYPADDING,BODYSTYLE,BORDER,BUBBLEEVENTS,BUTTONALIGN,BUTTONS,CHILDELS,CLS,CLOSABLE,CLOSEACTION,COLLAPSEDIRECTION,COLLAPSEDFIRST,COLLAPSEMODE,COLLAPSED,COLLAPSEDCLS,COLLAPSIBLE,COLUMNLINES,COLUMNWIDTH,COMPONENTCLS,COMPONENTLAYOUT,QRYCONSTRAIN,CONSTRAINHEADER,QRYCONSTRAINTO,CONSTRAINTINSETS,CONTENTEL,QRYDATA,DEFAULTALIGN,DEFAULTDOCKWEIGHTS,DEFAULTTYPE,DEFAULTS,GVIEWDEFEREMPTYTEXT,GVIEWDEFERINITIALREFRESH,DEFERROWRENDER,DETACHONREMOVE,DISABLED,DISABLESELECTION,DISABLEDCLS,DOCKEDITEMS,DRAGGABLE,EMPTYTEXT,GVIEWENABLETEXTSELECTION,ENABLECOLUMNHIDE,ENABLECOLUMNMOVE,ENABLECOLUMNRESIZE,ENABLELOCKING,FBAR,FEATURES,GVIEWFIRSTCLS,FIXED,FLOATABLE,FLOATING,FOCUSONTOFRONT,FORCEFIT,FORMBIND,FRAME,FRAMEHEADER,GLYPH,HEADER,HEADEROVERCLS,HEADERPOSITION,HEIGHT,HIDDEN,HIDECOLLAPSETOOL,HIDEHEADER,HIDEMODE,HTML,ICON,ICONCLS,QRYID,ITEMID,GVIEWITEMCLS,GVIEWITEMTPL,ITEMS,GVIEWLASTCLS,LAYOUT,LBAR,LISTENERS,GVIEWLOADMASK,LOADER,GVIEWLOADINGCLS,GVIEWLOADINGHEIGHT,GVIEWLOADINGTEXT,LOCKEDGRIDCONFIG,LOCKEDVIEWCONFIG,MANAGEHEIGHT,MARGIN,GVIEWMARKDIRTY,MAXHEIGHT,MAXWIDTH,MINBUTTONWIDTH,MINHEIGHT,MINWIDTH,GVIEWMOUSEOVEROUTBUFFER,NORMALGRIDCONFIG,NORMALVIEWCONFIG,OVERCLS,OVERFLOWX,OVERFLOWY,GVIEWOVERITEMCLS,OVERLAPHEADER,PADDING,PLACEHOLDER,PLACEHOLDERCOLLAPSEHIDEMODE,PLUGINS,GVIEWPRESERVESCROLLONREFRESH,RBAR,REGION,RENDERDATA,RENDERSELECTORS,RENDERTO,RESIZABLE,RESIZEHANDLES,ROWLINES,RTL,SAVEDELAY,GVIEWSELECTEDITEMCLS,SCROLL,SCROLLDELTA,SEALEDCOLUMNS,SELMODEL,SELTYPE,SHADOW,SHADOWOFFSET,SHRINKWRAP,SHRINKWRAPDOCK,SIMPLEDRAG,SORTABLECOLUMNS,STATEEVENTS,STATEID,STATEFUL,GVIEWSTRIPEROWS,STYLE,SUBGRIDXTYPE,SUSPENDLAYOUT,SYNCROWHEIGHT,TBAR,QRYTITLE,TITLEALIGN,TITLECOLLAPSE,TOFRONTONSHOW,TOOLS,TPL,TPLWRITEMODE,GVIEWTRACKOVER,QRYUI,VERTICALSCROLLER,QRYVIEW,VIEWCONFIG,WIDTH,XTYPE,GRIDEXTRA,STORESORTERS,SORTERSDIRECTION,STOREFILTERS,FILTERTYPE,STOREPAGESIZE,STORETIMEOUT,STOREEXTRA,STOREPROXYEXTRA,GROUPFIELD,PROXYTYPE,PROXYREADER,PROXYWRITER,PROXYURL,STOREFIELDS" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqca[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqca.set#b#(#dval#)") />
				</cfif>
			</cfloop>
			<cfset EntitySave(processqca) >
		</cfloop>
	</cfif>
</cffunction>

<cffunction name="copyEGRGQRYCHART" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqc = EntityLoad("EGRGQRYCHART", {EQRYCODE=#qryC#}, false) >
	<cfif IsDefined("refqc")>
		<cfloop from="1" to="#ArrayLen(refqc)#" index="a">
			<cfset processqc = EntityNew("EGRGQRYCHART") />
			<cfset processqc.setEQRYCODE("#TEQRYCODE#") />
			<cfset colList = "CHARTLABEL,BOXFILL,BOXSTROKE,BOXSTROKEWIDTH,BOXZINDEX,ITEMSPACING,LABELCOLOR,LABELFONT,LEGENDPOSITION,CHARTUPDATE,VISIBLE,X,Y,ALLOWFUNCTIONS,DEFAULTSORTDIRECTION,LEGENDITEMLISTENERS,SORTROOT,SORTERS,MASK,CHARTEXTRA" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqc[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqc.set#b#(#dval#)") />
				</cfif>
			</cfloop>
			<cfset EntitySave(processqc) >
		</cfloop>
	</cfif>
</cffunction>

<cffunction name="copyEGRGQRYCHARTAXIS" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqca = EntityLoad("EGRGQRYCHARTAXIS", {EQRYCODEFK=#qryC#}, false) >
	<cfif IsDefined("refqca")>
		<cfloop from="1" to="#ArrayLen(refqca)#" index="a">
			<cfset processqca = EntityNew("EGRGQRYCHARTAXIS") />
			<cfset processqca.setEQRYCODEFK('#TEQRYCODE#') />
			<cfset processqca.setCHARTAXISCODE('#CreateUuid()#') />
			<cfset colList = "AXISTYPE,ADJUSTEND,DASHSIZE,FIELDS,GRID,HIDDEN,LABEL,LENGTH,MAJORTICKSTEPS,MINORTICKSTEPS,POSITION,TITLE,WIDTH,CALCULATECATEGORYCOUNT,CATEGORYNAMES,MARGIN,MAXIMUM,MINIMUM,STEPS,ADJUSTMAXIMUMBYMAJORUNIT,ADJUSTMINIMUMBYMAJORUNIT,CONSTRAIN,DECIMALS,FROMDATE,TODATE,DATEFORMAT,AXISEXTRA" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqca[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqca.set#b#(#dval#)") />
				</cfif>
			</cfloop>
			<cfset EntitySave(processqca) >
		</cfloop>
	</cfif>
</cffunction>

<cffunction name="copyEGRGQRYCHARTSERIES" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqca = EntityLoad("EGRGQRYCHARTSERIES", {EQRYCODEFK=#qryC#}, false) >
	<cfif IsDefined("refqca")>
		<cfloop from="1" to="#ArrayLen(refqca)#" index="a">
			<cfset processqca = EntityNew("EGRGQRYCHARTSERIES") />
			<cfset processqca.setEQRYCODEFK('#TEQRYCODE#') />
			<cfset processqca.setCHARTSERIESCODE('#CreateUuid()#') />
			<cfset colList = "HIGHLIGHT,LABEL,LISTENERS,RENDERER,SHADOWATTRIBUTES,SHOWINLEGEND,TIPS,TITLE,TYPE,AXIS,XFIELD,YFIELD,COLUMN,GROUPGUTTER,GUTTER,STACKED,STYLE,XPADDING,YPADDING,ANGLEFIELD,DONUT,NEEDLE,FILL,MARKERCONFIG,SELECTIONTOLERANCE,SHOWMARKERS,SMOOTH,COLORSET,FIELD,HIGHLIGHTDURATION,LENGTHFIELD,SERIESEXTRA" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqca[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqca.set#b#(#dval#)") />
				</cfif>
			</cfloop>
			<cfset EntitySave(processqca) >
		</cfloop>
	</cfif>
</cffunction>

<cffunction name="copyEGRGQRYFEATURE" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqca = EntityLoad("EGRGQRYFEATURE", {EQRYCODE=#qryC#}, false) >
	<cfif IsDefined("refqca")>
		<cfloop from="1" to="#ArrayLen(refqca)#" index="a">
			<cfset processqca = EntityNew("EGRGQRYFEATURE") />
			<cfset processqca.setEQRYCODE('#TEQRYCODE#') />
			<cfset colList = "GROUPINGLISTENERS,REMOTEROOT,SHOWSUMMARYROW,FCOLLAPSIBLE,DEPTHTOINDENT,ENABLEGROUPINGMENU,ENABLENOGROUPS,GROUPBYTEXT,GROUPHEADERTPL,HIDEGROUPEDHEADER,SHOWGROUPSTEXT,STARTCOLLAPSED,FEATUREEXTRA" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqca[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqca.set#b#(#dval#)") />
				</cfif>
			</cfloop>
			<cfset EntitySave(processqca) >
		</cfloop>
	</cfif>
</cffunction>

<cffunction name="copyEGRGQRYPLUGIN" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqca = EntityLoad("EGRGQRYPLUGIN", {EQRYCODE=#qryC#}, false) >
	<cfif IsDefined("refqca")>
		<cfloop from="1" to="#ArrayLen(refqca)#" index="a">
			<cfset processqca = EntityNew("EGRGQRYPLUGIN") />
			<cfset processqca.setEQRYCODE('#TEQRYCODE#') />
			<cfset colList = "BLEADINGBUFFERZONE,BNUMFROMEDGE,BPLUGINID,BSCROLLTOLOADBUFFER,BSYNCHRONOUSRENDER,BTRAILINGBUFFERZONE,BVARIABLEROWHEIGHT,CELLEDITINGCLICKSTOEDIT,CELLEDITINGLISTENER,TRIGGEREVENT,DDCONTAINERSCROLL,DDGROUP,DDDRAGGROUP,DDDRAGTEXT,DDDROPGROUP,DDENABLEDRAG,DDENABLEDROP,HEADERRESIZER,ROWAUTOCANCEL,ROWCLICKSTOMOVEEDITOR,ROWERRORSUMMARY,ROWEXPANDONDBLCLICK,ROWEXPANDONENTER,ROWSELECTROWONEXPAND,PLUGINEXTRA" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqca[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqca.set#b#(#dval#)") />
				</cfif>
			</cfloop>
			<cfset EntitySave(processqca) >
		</cfloop>
	</cfif>
</cffunction>

<cffunction name="copyEGRGEVIEWDATASOURCE" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqca = EntityLoad("EGRGEVIEWDATASOURCE", {EQRYCODEFK=#qryC#}, false) >
	<cfif IsDefined("refqca")>
		<cfloop from="1" to="#ArrayLen(refqca)#" index="a">
			<cfset processqca = EntityNew("EGRGEVIEWDATASOURCE") />
			<cfset processqca.setEQRYCODEFK('#TEQRYCODE#') />
			<cfset processqca.setDATASOURCECODE('#CreateUuid()#') />
			<cfset colList = "DATASOURCENAME,COLUMNORDER,DATASOURCETYPE" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqca[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqca.set#b#(#dval#)") />
				</cfif>
			</cfloop>
			<cfset EntitySave(processqca) >
		</cfloop>
	</cfif>
</cffunction>

<cffunction name="copyEGRGEVIEWTABLES" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqca = EntityLoad("EGRGEVIEWTABLES", {EQRYCODEFK=#qryC#}, false) >
	<cfif IsDefined("refqca")>
		<cfloop from="1" to="#ArrayLen(refqca)#" index="a">
			<cfset processqca = EntityNew("EGRGEVIEWTABLES") />
			<cfset processqca.setEQRYCODEFK('#TEQRYCODE#') />
			<cfset processqca.setEVIEWTABLECODE('#CreateUuid()#') />
			<cfset colList = "DATASOURCECODEFK,COLUMNORDER,TABLENAME,TEMPTABLE,TABLEALIAS" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqca[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqca.set#b#(#dval#)") />
				</cfif>
			</cfloop>
			<cfset EntitySave(processqca) >
		</cfloop>
	</cfif>
</cffunction>

<cffunction name="copyEGRGEVIEWJOINEDTABLES" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqca = EntityLoad("EGRGEVIEWJOINEDTABLES", {EQRYCODEFK=#qryC#}, false) >
	<cfif IsDefined("refqca")>
		<cfloop from="1" to="#ArrayLen(refqca)#" index="a">
			<cfset processqca = EntityNew("EGRGEVIEWJOINEDTABLES") />
			<cfset processqca.setEQRYCODEFK('#TEQRYCODE#') />
			<cfset processqca.setEVIEWJOINEDTABLECODE('#CreateUuid()#') />
			<cfset colList = "JOINOPERATOR,PRIORITYNO,TABLENAME,ONCOLUMN,EQUALTOCOLUMN,DISPLAY,COLUMNORDER" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqca[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqca.set#b#(#dval#)") />
				</cfif>
			</cfloop>
			<cfset EntitySave(processqca) >
		</cfloop>
	</cfif>
</cffunction>

<cffunction name="copyEGRGEVIEWFIELDS" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqca = EntityLoad("EGRGEVIEWFIELDS", {EQRYCODEFK=#qryC#}, false) >
	<cfif IsDefined("refqca")>
		<cfloop from="1" to="#ArrayLen(refqca)#" index="a">
			<cfset fieldcode = CreateUuid() />
			<cfset processqca = EntityNew("EGRGEVIEWFIELDS") />

			<cfset processqcolo = EntityNew("EGRGQRYCOLUMN") />
			<cfset processqcolo.setEVIEWFIELDCODE(fieldcode) />
			<cfset processqca.setEVIEWFIELDCODE(fieldcode) />
			<cfset processqca.setEQRYCODEFK('#TEQRYCODE#') />

			<cfset colList = "TABLENAME,FIELDNAME,DISPLAY,FIELDALIAS,PRIORITYNO,AGGREGATEFUNC,DATEANDSTRINGFUNC,NUMBERFORMAT,ISDISTINCT,WRAPON,SUPPRESSZERO,OVERRIDESTATEMENT,COLUMNORDER,IS_PRIMARYKEY,ORDINAL_POSITION,TYPE_NAME,DECIMAL_DIGITS,IS_NULLABLE,COLUMN_DEFAULT_VALUE,CHAR_OCTET_LENGTH,IS_FOREIGNKEY,REFERENCED_PRIMARYKEY,REFERENCED_PRIMARYKEY_TABLE" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqca[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqca.set#b#(#dval#)") />
				</cfif>
			</cfloop>

			<cfset refqcol = EntityLoad("EGRGQRYCOLUMN", refqca[a].getEVIEWFIELDCODE(), true) >

			<cfif IsDefined("refqcol")>
				<cfset colList = "OUTPUTTYPE,COLUMNGROUP,ENABLEGROUPHEADER,COLUMNACTIVEITEM,COLUMNALIGN,CACTIONALTTEXT,COLUMNANCHORSIZE,COLUMNAUTODESTROY,COLUMNAUTORENDER,COLUMNAUTOSCROLL,COLUMNAUTOSHOW,COLUMNBASECLS,COLUMNBORDER,COLUMNBUBBLEEVENTS,COLUMNCHILDELS,COLUMNCLS,COLUMNWIDTH,COLUMNCOLUMNS,COLUMNCOMPONENTCLS,COLUMNCONSTRAIN,COLUMNCONSTRAINTO,COLUMNCONSTRAINTINSETS,COLUMNCONTENTEL,COLUMNDATA,COLUMNDATAINDEX,COLUMNDEFAULTALIGN,COLUMNDEFAULTTYPE,COLUMNDEFAULTWIDTH,COLUMNDEFAULTS,COLUMNDETACHONREMOVE,COLUMNDISABLED,COLUMNDISABLEDCLS,COLUMNDRAGGABLE,COLUMNEDITRENDERER,COLUMNEDITOR,COLUMNEMPTYCELLTEXT,COLUMNENABLECOLUMNHIDE,COLUMNFLOATING,COLUMNFOCUSONTOFRONT,COLUMNFORMBIND,COLUMNFRAME,COLUMNGROUPABLE,COLUMNHANDLER,COLUMNHEIGHT,COLUMNHIDDEN,COLUMNHIDEMODE,COLUMNHIDEABLE,COLUMNHTML,COLUMNICON,COLUMNICONCLS,COLUMNID,COLUMNITEMID,COLUMNITEMS,COLUMNLAYOUT,COLUMNLISTENERS,COLUMNLOADER,COLUMNLOCKABLE,COLUMNLOCKED,COLUMNMARGIN,COLUMNMAXHEIGHT,COLUMNMAXWIDTH,COLUMNMENUTEXT,CACTIONMENUDISABLED,COLUMNMINHEIGHT,COLUMNMINWIDTH,COLUMNOVERCLS,COLUMNOVERFLOWX,COLUMNOVERFLOWY,COLUMNPADDING,COLUMNPLUGINS,COLUMNREGION,COLUMNRENDERDATA,COLUMNRENDERSELECTORS,COLUMNRENDERTO,COLUMNRENDERER,COLUMNRESIZABLE,COLUMNRESIZEHANDLES,COLUMNRTL,COLUMNSAVEDELAY,CACTIONSCOPE,COLUMNSEALED,COLUMNSHADOW,COLUMNSHADOWOFFSET,COLUMNSHRINKWRAP,COLUMNSORTABLE,COLUMNSTATEEVENTS,COLUMNSTATEID,COLUMNSTATEFUL,CACTIONSTOPSELECTION,COLUMNSTYLE,COLUMNSUSPENDLAYOUT,COLUMNTDCLS,COLUMNTEXT,COLUMNTOFRONTONSHOW,COLUMNTOOLTIP,COLUMNTOOLTIPTYPE,COLUMNTPL,COLUMNTPLWRITEMODE,COLUMNUI,CBOOLEANUNDEFINEDTEXT,COLUMNWEIGHT,COLUMNXTYPE,COLUMNEXTRA,COLUMNFORMAT,SUMMARYTYPE,SUMMARYRENDERER" />
				<cfloop list="#colList#" delimiters="," index="c">
					<cfset dval = "refqcol.get#c#()" />
					<cfset dval = Evaluate("dval") />
					<cfif IsDefined("dval") >
						<cfset Evaluate("processqcolo.set#c#(#dval#)") />
					</cfif>
				</cfloop>

			</cfif>
			<cfset processqca.setEGRGQRYCOLUMN(processqcolo) />

			<cfset EntitySave(processqca) />
			<cfset EntitySave(processqcolo) />
		</cfloop>
	</cfif>
</cffunction>

<cffunction name="copyEGRGEVIEWCONDITION" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqca = EntityLoad("EGRGEVIEWCONDITION", {EQRYCODEFK=#qryC#}, false) >
	<cfif IsDefined("refqca")>
		<cfloop from="1" to="#ArrayLen(refqca)#" index="a">
			<cfset processqca = EntityNew("EGRGEVIEWCONDITION") />
			<cfset processqca.setEQRYCODEFK('#TEQRYCODE#') />
			<cfset processqca.setEVIEWCONDITIONCODE('#CreateUuid()#') />
			<cfset colList = "PRIORITYNO,CONJUNCTIVEOPERATOR,ONCOLUMN,CONDITIONOPERATOR,COLUMNVALUE,COLUMNORDER" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqca[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqca.set#b#(#dval#)") />
				</cfif>
			</cfloop>
			<cfset EntitySave(processqca) >
		</cfloop>
	</cfif>
</cffunction>

<cffunction name="copyEGRGEVIEWGROUPBY" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqca = EntityLoad("EGRGEVIEWGROUPBY", {EQRYCODEFK=#qryC#}, false) >
	<cfif IsDefined("refqca")>
		<cfloop from="1" to="#ArrayLen(refqca)#" index="a">
			<cfset processqca = EntityNew("EGRGEVIEWGROUPBY") />
			<cfset processqca.setEQRYCODEFK('#TEQRYCODE#') />
			<cfset processqca.setEVIEWGROUPBYCODE('#CreateUuid()#') />
			<cfset colList = "GROUPBYCOLUMN,PRIORITYNO,COLUMNORDER" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqca[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqca.set#b#(#dval#)") />
				</cfif>
			</cfloop>
			<cfset EntitySave(processqca) >
		</cfloop>
	</cfif>
</cffunction>

<cffunction name="copyEGRGEVIEWHAVING" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqca = EntityLoad("EGRGEVIEWHAVING", {EQRYCODEFK=#qryC#}, false) >
	<cfif IsDefined("refqca")>
		<cfloop from="1" to="#ArrayLen(refqca)#" index="a">
			<cfset processqca = EntityNew("EGRGEVIEWHAVING") />
			<cfset processqca.setEQRYCODEFK('#TEQRYCODE#') />
			<cfset processqca.setEVIEWHAVINGCODE('#CreateUuid()#') />
			<cfset colList = "PRIORITYNO,CONJUNCTIVEOPERATOR,AGGREGATECOLUMN,CONDITIONOPERATOR,AGGREGATEVALUE,DISPLAY,COLUMNORDER" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqca[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqca.set#b#(#dval#)") />
				</cfif>
			</cfloop>
			<cfset EntitySave(processqca) >
		</cfloop>
	</cfif>
</cffunction>

<cffunction name="copyEGRGEVIEWORDERBY" returntype="void" access="private">
	<cfargument name="qryC">
	<cfargument name="TEQRYCODE">

	<cfset refqca = EntityLoad("EGRGEVIEWORDERBY", {EQRYCODEFK=#qryC#}, false) >
	<cfif IsDefined("refqca")>
		<cfloop from="1" to="#ArrayLen(refqca)#" index="a">
			<cfset processqca = EntityNew("EGRGEVIEWORDERBY") />
			<cfset processqca.setEQRYCODEFK('#TEQRYCODE#') />
			<cfset processqca.setEVIEWORDERBYCODE('#CreateUuid()#') />
			<cfset colList = "PRIORITYNO,FIELDNAME,DISPLAY,ASCORDESC,COLUMNORDER" />
			<cfloop list="#colList#" delimiters="," index="b">
				<cfset dval = "refqca[#a#].get#b#()" />
				<cfset dval = Evaluate("dval") />
				<cfif IsDefined("dval") >
					<cfset Evaluate("processqca.set#b#(#dval#)") />
				</cfif>
			</cfloop>
			<cfset EntitySave(processqca) >
		</cfloop>
	</cfif>
</cffunction>

</cfcomponent>