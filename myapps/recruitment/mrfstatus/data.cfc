<cfcomponent name="data" ExtDirect="true">


<cffunction access="private" name="dateDiffToString" returntype="string">
	<cfargument name="earlyDate">
	<cfargument name="laterDate">
	<cfsavecontent variable="retString">
		<cfif Ucase(session.DBMS) EQ 'MYSQL'>
			<cfoutput>
			(floor( datediff( #laterDate#, #earlyDate# ) /7 ) *5) +
				CASE DAYOFWEEK(#laterDate#)
				WHEN 1 THEN (datediff( #laterDate#, #earlyDate# ) % 7) - 2
				WHEN 7 THEN (datediff( #laterDate#, #earlyDate# ) % 7) - 1
				ELSE
					case
					when (7-DAYOFWEEK(#laterDate# )) < (datediff( #laterDate#, #earlyDate# ) % 7)
					then (7-DAYOFWEEK(#laterDate# ))
					else (datediff( #laterDate#, #earlyDate# ) % 7)
					end
				END
			 </cfoutput>
		<cfelseif Ucase(session.DBMS) EQ 'MSSQL'>
		    <cfoutput>
			(floor( datediff( day, #earlyDate#, #laterDate# ) /7 ) *5) +
				CASE DATEPART(dw, #laterDate#)
				WHEN 1 THEN (datediff( day, #earlyDate#, #laterDate# ) % 7) - 2
				WHEN 7 THEN (datediff( day, #earlyDate#, #laterDate# ) % 7) - 1
				ELSE
					case
					when (7-DATEPART( dw, #laterDate# )) < (datediff( day, #earlyDate#, #laterDate# ) % 7)
					then (7-DATEPART( dw, #laterDate# ))
					else (datediff( day, #earlyDate#, #laterDate# ) % 7)
					end
				END
			</cfoutput>
		</cfif>
	</cfsavecontent>

	<cfreturn retString />
</cffunction>

<cffunction name="GetAll" ExtDirect="true">

	<cfargument name="page" >
	<cfargument name="start" >
	<cfargument name="limit" >
	<cfargument name="sort" >
	<cfargument name="filter" >
	<cfargument name="departmentcode" >


<cftry>


	<cfif departmentcode EQ "__" >
	<cfquery name="getUserDept" datasource="#session.company_dsn#" maxrows="1" >
		SELECT DEPARTMENTCODE
		  FROM #session.maintable#
		 WHERE PERSONNELIDNO = '#session.chapa#'
	</cfquery>
		<cfif isdefined("getUserDept") >
			<cfif getUserDept.recordcount GT 0 >
				<cfset departmentcode = getUserDept.DEPARTMENTCODE />
			</cfif>
		<cfelse>
		</cfif>
	</cfif>



	  <cfset var qryAuthors = "" />
	  <cfif Ucase(session.DBMS) EQ 'MYSQL'>
     	<cfset theif = "if" />
		<cfset now   = "now()" />
		<cfset extraparam = "" >
      <cfelseif Ucase(session.DBMS) EQ 'MSSQL'>
        <cfset theif = "iif" />
		<cfset now   = "getdate()" />
		<cfset extraparam = "day, " >
      </cfif>



	  <cfquery name="qryShortlisted" datasource="#session.company_dsn#">
	    SELECT  A.GUID AS A_GUID,
				A.APPLICANTNUMBER AS A_APPLICANTNUMBER,
	            A.SUFFIX AS A_SUFFIX,
				A.LASTNAME AS A_LASTNAME,
				A.FIRSTNAME AS A_FIRSTNAME,
				A.MIDDLENAME AS A_MIDDLENAME,
				A.APPLICATIONDATE AS A_APPLICATIONDATE,
				A.PAGIBIGNUMBER AS A_PAGIBIGNUMBER,
				A.REFERREDBY AS A_REFERREDBY,
				A.SSSNUMBER AS A_SSSNUMBER,
				A.STARTINGSALARY AS A_STARTINGSALARY,
				A.TIN AS A_TIN,
				A.EMAILADD AS A_EMAILADD,
				Z.DESCRIPTION AS Z_DESCRIPTION,
				A.JOBVACANCYSOURCE AS A_JOBVACANCYSOURCE,
				A.RESERVED AS A_RESERVED,
	            A.RECDATECREATED AS A_RECDATECREATED,
	            <!---TATSOURCING =  Sourcing Date - Date of Application--->
	            #dateDiffToString("A.APPLICATIONDATE", "A.RECDATECREATED")# AS TATSOURCING,
	            A.SOURCE AS A_SOURCE,
	            A.STARTINGSALARY AS A_STARTINGSALARY,
	            X.EXAMTYPE AS X_EXAMTYPE,
	            X.EXAMSCHEDDATE AS X_EXAMSCHEDDATE,
	            X.EXAMSTATUS AS X_EXAMSTATUS,
	            X.EXAMCOMMENTS AS X_EXAMCOMMENTS,
	            X.EXAMATTACHMENT AS X_EXAMATTACHMENT,
	            <!---TATEXAMHRINT = (Actual Interview Date from HR Interview Assessment Slip – Date of Exam) – HRAD Non-Working Days--->
	            #dateDiffToString("X.EXAMSCHEDDATE", "X.HRINTERVIEWDATE")# AS TATEXAMHRINT,
	            <!---TATSUMMARYSC = (Actual Interview Date from HR Interview Assessment Slip – MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.HRINTERVIEWDATE")# AS TATSUMMARYSC,
	            X.HRINTERVIEWDATE AS X_HRINTERVIEWDATE,
	            X.HRINTERVIEWER AS X_HRINTERVIEWER,
	            X.HRSTATUS AS X_HRSTATUS,
	            X.HRCOMMENTS AS X_HRCOMMENTS,
	            X.HRATTACHMENT AS X_HRATTACHMENT,
	            X.HRFEEDBACKDATE AS X_HRFEEDBACKDATE,
	            <!---TATHRFEEDBACK = (Date of Feedback – Date of HR Interview) - HRAD Non-Working Days--->
	            #dateDiffToString("X.HRINTERVIEWDATE", "X.HRFEEDBACKDATE")# AS TATHRFEEDBACK,
	            X.JODATEINVITE AS X_JODATEINVITE,
	            X.JODATEDECISION AS X_JODATEDECISION,
	            X.JOSTATUS AS X_JOSTATUS,
	            X.JOCOMMENTS AS X_JOCOMMENTS,
	            <!---TATJOBOFFER = (Date of Applicant’s Decision – Date Presented Job Offer to Applicant) – HRAD Non-Working Days--->
	            #dateDiffToString("X.JODATEINVITE", "X.JODATEDECISION")# AS TATJOBOFFER,
	            <!---TATSUMMARYJO = (Date Presented Job Offer to Applicant - MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.JODATEINVITE")# AS TATSUMMARYJO,
	            X.PECDATERECEIVED AS X_PECDATERECEIVED,
	            X.PECDATESUBMITTED AS X_PECDATESUBMITTED,
	            X.PECSTATUS AS X_PECSTATUS,
	            X.PECCOMMENTS AS X_PECCOMMENTS,
	            X.PECATTACHMENT AS X_PECATTACHMENT,
	            <!---TATREQ = (Date Accomplished – MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.PECDATESUBMITTED")# AS TATREQ,
	            X.OCNEODATE	AS X_OCNEODATE,
	            X.OCOBDATE AS X_OCOBDATE,
	            X.OCSTATUS AS X_OCSTATUS,
	            X.OCCOMMENTS AS X_OCCOMMENTS,
	            X.OCATTACHMENT AS X_OCATTACHMENT,
	            <!---TATTOTAL = (On-Boarding Date – MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.OCOBDATE")# AS TATTOTAL,
	            G.REQUISITIONNO AS G_REQUISITIONNO,
	            G.DATEPRESCREEN AS G_DATEPRESCREEN,
	            G.DATESENDOUT AS G_DATESENDOUT,
	            <!---TATPRESCREENINVITE = (Date of Invite Send-Out – Date Pre-Screened) – HRAD Non Working Days--->
	            #dateDiffToString("G.DATEPRESCREEN", "G.DATESENDOUT")# AS TATPRESCREENINVITE,
	            H.CONTACTCELLNUMBER AS H_CONTACTCELLNUMBER,
	            H.EMAILADDRESS AS H_EMAILADDRESS,
	            I.DIVISIONCODE AS I_DIVISIONCODE,
	            I.DEPARTMENTCODEFK AS I_DEPARTMENTCODEFK,
	            I.DATEREQUESTED AS I_DATEREQUESTED,
	            I.DATEACTIONWASDONE AS I_DATEACTIONWASDONE,
	            I.DATELASTUPDATE AS I_DATELASTUPDATE,
	            I.REQUISITIONEDBY AS I_REQUISITIONEDBY,
	            <!---TATMRFPOST = MRF POSTED DATE - MRF DATELASTUPDATE--->
	            #dateDiffToString("I.DATELASTUPDATE", "I.DATEACTIONWASDONE")# AS TATMRFPOST,
	            X.CFDATEGIVEN AS X_CFDATEGIVEN,
	            X.CFDATESIGNED AS X_CFDATESIGNED,
	            X.CFSTATUS AS X_CFSTATUS,
	            X.CFCOMMENTS AS X_CFCOMMENTS,
	            X.CFATTACHMENT AS X_CFATTACHMENT,
	            <!---TATCONTRACT = (Date Signed by Applicant – Date Accomplished) – HRAD Non-Working Days--->
	            #dateDiffToString("X.CFDATEGIVEN", "X.CFDATESIGNED")# AS TATCONTRACT,
	            X.FDINTERVIEWDATE AS X_FDINTERVIEWDATE,
	            X.FDDATEACTUALINTERVIEW AS X_FDDATEACTUALINTERVIEW,
	            X.FDINTERVIEWER AS X_FDINTERVIEWER,
	            <!---TATHDFD = (Date of First Department Interview - HR Interview Date of Feedback) – HRAD Non-Working Days.--->
	            #dateDiffToString("X.HRFEEDBACKDATE", "X.FDINTERVIEWDATE")# AS TATHDFD,
	            X.FDSTATUS AS X_FDSTATUS,
	            X.FDCOMMENTS AS X_FDCOMMENTS,
	            X.FDFEEDBACKDATE AS X_FDFEEDBACKDATE,
	            <!---TATFD = (Date of Feedback from Hiring Department – Date of Actual Interview) – HRAD Non-Working Days--->
	            #dateDiffToString("X.FDDATEACTUALINTERVIEW", "X.FDFEEDBACKDATE")# AS TATFD,
	            <!---TATSUMMARYFD = (Actual First Hiring Dept Interview Date – MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.FDDATEACTUALINTERVIEW")# AS TATSUMMARYFD,
	            X.DHINTERVIEWDATE AS X_DHINTERVIEWDATE,
	            X.DHDATEACTUALINTERVIEW AS X_DHDATEACTUALINTERVIEW,
	            X.DHINTERVIEWER AS X_DHINTERVIEWER,
	            <!---TATHDSD = (Date of Second Department Interview – Date of First Department Interview) – HRAD Non-Working Days.--->
	            #dateDiffToString("X.FDINTERVIEWDATE", "X.DHINTERVIEWDATE")# AS TATHDSD,
	            X.DHSTATUS AS X_DHSTATUS,
	            X.DHCOMMENTS AS X_DHCOMMENTS,
	            X.DHATTACHMENT AS X_DHATTACHMENT,
	            X.DHFEEDBACKDATE AS X_DHFEEDBACKDATE,
	            <!---TATSD = (Date of Feedback from Hiring Department – Date of Actual Interview) – HRAD Non-Working Days--->
	            #dateDiffToString("X.DHDATEACTUALINTERVIEW", "X.DHFEEDBACKDATE")# AS TATSD,
	            <!---TATSUMMARYSD = (Actual Second Hiring Dept Interview Date – MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.DHDATEACTUALINTERVIEW")# AS TATSUMMARYSD,
	            X.GMINTERVIEWDATE AS X_GMINTERVIEWDATE,
	            X.GMDATEACTUALINTERVIEW AS X_GMDATEACTUALINTERVIEW,
	            X.GMINTERVIEWER AS X_GMINTERVIEWER,
	            <!---TATHDMD = (Date of Final Interview – Date of Second Department Interview) – HRAD Non-Working Days.--->
	            #dateDiffToString("X.DHINTERVIEWDATE", "X.GMINTERVIEWDATE")# AS TATHDMD,
	            X.GMSTATUS AS X_GMSTATUS,
	            X.GMCOMMENTS AS X_GMCOMMENTS,
	            X.GMFEEDBACKDATE AS X_GMFEEDBACKDATE,
	            X.GMATTACHMENT AS X_GMATTACHMENT,
	            <!---TATMD = (Date of Feedback from Final Interview – Date of Final Interview) – HRAD Non-Working Days--->
	            #dateDiffToString("X.GMINTERVIEWDATE", "X.GMFEEDBACKDATE")# AS TATMD,
	            <!---TATSUMMARYMD = (Actual Final Interview Date – MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.GMDATEACTUALINTERVIEW")# AS TATSUMMARYMD

	     FROM  CMFAP A  LEFT JOIN CMFCANDIDATELISTNG     G ON (A.GUID = G.GUID)
 				LEFT JOIN CRGPERSONELREQUEST     I ON (I.REQUISITIONNO = G.REQUISITIONNO)
 				LEFT JOIN CIN21PERSONALINFO      H ON (A.GUID = H.GUID)
 				LEFT JOIN ECINRECPROCESS         X ON (X.APPLICANTNUMBER = G.APPLICANTNUMBER)
                LEFT JOIN CLKPOSITION            Z ON (Z.POSITIONCODE  = A.POSITIONCODE)

	 <cfset where             = "()" >
	 <cfif isdefined('query')>
	   WHERE A.LASTNAME LIKE '%#query#%' <!--- reserved for grid with search plugin --->
	 <cfelse>
	 	 <cfset where             = " (" >
            <cfset tmpdatafield      = "" >
            <cfset tmpfilteroperator = "0" >

			<cftry>
			<cfset filter = deserializejson(filter) >	<!---Deserialize JSON string coz Router forgets to do the work on filter but not on sort--->
			<cfloop array=#filter# index="filterdata">
            	<cftry>
					<cfset filterdatafield = filterdata.field />
					<cfcatch>
						<cfbreak>
					</cfcatch>
				</cftry>

            	<cfset filterdatafield = filterdata.field />
				<cfset filterdatafield = replace(filterdatafield, "_", ".") >

				<cfset filtervalue     = filterdata.value />
				<cfset filtertype      = filterdata.type />
				<cfif tmpdatafield EQ "" >
                <cfset tmpdatafield = filterdatafield >
                <cfelseif tmpdatafield NEQ filterdatafield >
                	<cfset where = "#where# ) AND ( " >
                <cfelseif tmpdatafield EQ filterdatafield >
                	<cfif tmpfilteroperator EQ 0>
                    	<cfset where = "#where# AND " >
                    <cfelse>
                    	<cfset where = "#where# OR " >
                    </cfif>
				</cfif>

                <cfif ucase(filtertype) EQ "STRING" >
					<cfset where = "#where##filterdatafield#  LIKE '%#filtervalue#%'" >
				<cfelseif  ucase(filtertype) EQ "NUMERIC" >
					<cfset filtercondition = filterdata.comparison >
					<cfset expression = "#Ucase(Trim(filtercondition))#" >
               			<cfif expression  EQ "LT">
						   	<cfset where = "#where##filterdatafield#  < #filtervalue#">
						<cfelseif expression EQ "GT">
							<cfset where = "#where##filterdatafield#  > #filtervalue#">
						<cfelseif expression EQ "EQ">
							<cfset where = "#where##filterdatafield#  = #filtervalue#">
						<cfelse>
					</cfif>
				<cfelseif  ucase(filtertype) EQ "DATE" >
					<cfset filtercondition = filterdata.comparison >
					<cfset expression = "#Ucase(Trim(filtercondition))#" >

						<cfset filtervalue = CreateODBCDateTime(filtervalue) />
               			<cfif expression  EQ "LT">
	               			<cfset where = "#where##filterdatafield#  < #filtervalue#">
						<cfelseif expression EQ "GT">
							<cfset where = "#where##filterdatafield#  > #filtervalue#">
						<cfelseif expression EQ "EQ">
							<cfset where = "#where##filterdatafield#  = #filtervalue#">
						<cfelse>
							<cfset where = "#where##filterdatafield#  = #filtervalue#">
					    </cfif>
				<cfelse>
					<!---boolean--->
					<cfif filtervalue EQ 'true' >
						<cfset filtervalue = 'Yes' >
					<cfelse>
						<cfset filtervalue = 'No' >
					</cfif>
					<cfset where = "#where##filterdatafield#  LIKE '%#filtervalue#%'" >
				</cfif>
                <cfset tmpdatafield      = filterdatafield >
			</cfloop>
            	<cfcatch>
					<!---Do nothing here since filter is not a valid JSON string--->
				</cfcatch>
            </cftry>

            <cfset where = "#where#)" >
			<cfset where = Replace(where, "''", "'" , "all") />

			<cfif trim(where) NEQ "()">
				WHERE #PreserveSingleQuotes(where)#
				      AND G.RESERVED = 'Y'
					  AND I.DEPARTMENTCODEFK = '#departmentcode#'
					  AND (G.HIRED IS NULL OR G.HIRED = 'N')
			<cfelse>
				WHERE G.RESERVED = 'Y'
				      AND I.DEPARTMENTCODEFK = '#departmentcode#'
					  AND (G.HIRED IS NULL OR G.HIRED = 'N')
			</cfif>

     </cfif>

	  ORDER BY
	  <!--- Order By Arguments/Contents --->
	  <cfset thecnt = 1 >
	  <cfloop array=#sort# index="sortdata">
	  	  #replace(sortdata.property, "_", ".")# #sortdata.direction#
	  	  <cfif thecnt EQ ArrayLen(sort) >
		  <cfelse>
	  	  	,
		  </cfif>
		  <cfset thecnt = thecnt + 1 >
	  </cfloop>
	  <!--- End Order By Arguments/Contents --->

	  <cfif Ucase(session.DBMS) EQ 'MYSQL'>
     	LIMIT #start#, #limit#
      <cfelseif Ucase(session.DBMS) EQ 'MSSQL'>
         OFFSET #start# ROWS
         FETCH NEXT #limit# ROWS ONLY
      </cfif>

	  </cfquery>

<cfquery name="countAll" datasource="#session.company_dsn#" >
	SELECT COUNT(*) AS found_rows FROM CMFAP A  LEFT JOIN CMFCANDIDATELISTNG     G ON (A.GUID = G.GUID)
						 				LEFT JOIN CRGPERSONELREQUEST     I ON (I.REQUISITIONNO = G.REQUISITIONNO)
						 				LEFT JOIN CIN21PERSONALINFO      H ON (A.GUID = H.GUID)
						 				LEFT JOIN ECINRECPROCESS         X ON (X.APPLICANTNUMBER = G.APPLICANTNUMBER)
						                LEFT JOIN CLKPOSITION            Z ON (Z.POSITIONCODE  = A.POSITIONCODE)

			<cfif trim(where) NEQ "()">
				WHERE #PreserveSingleQuotes(where)#
				      AND G.RESERVED = 'Y'
					  AND I.DEPARTMENTCODEFK = '#departmentcode#'
					  AND (G.HIRED IS NULL OR G.HIRED = 'N')
			<cfelse>
				WHERE G.RESERVED = 'Y'
				      AND I.DEPARTMENTCODEFK = '#departmentcode#'
					  AND (G.HIRED IS NULL OR G.HIRED = 'N')
			</cfif>
	 ;
</cfquery>

<!--- used in rendering the cells if TAT max is reached --->
<cfquery name="getMRFStatusConfig" datasource="#session.company_dsn#">
	SELECT NAME, CONFIGVALUE
	  FROM ECRGMRFSTATUSCONFIG;
</cfquery>
<cfset TOTALTATSOURCING 		= 0 >
<cfset TOTALTATEXAMHRINT 		= 0 >
<cfset TOTALTATSUMMARYSC 		= 0 >
<cfset TOTALTATHRFEEDBACK		= 0 >
<cfset TOTALTATJOBOFFER 		= 0 >
<cfset TOTALTATSUMMARYJO 		= 0 >
<cfset TOTALTATREQ 				= 0 >
<cfset TOTALTATTOTAL 			= 0 >
<cfset TOTALTATPRESCREENINVITE  = 0 >
<cfset TOTALTATMRFPOST          = 0>
<cfset TOTALTATCONTRACT 		= 0 >
<cfset TOTALTATHDFD 			= 0 >
<cfset TOTALTATFD 				= 0 >
<cfset TOTALTATSUMMARYFD 		= 0 >
<cfset TOTALTATHDSD 			= 0 >
<cfset TOTALTATSD 				= 0 >
<cfset TOTALTATSUMMARYSD 		= 0 >
<cfset TOTALTATHDMD 			= 0 >
<cfset TOTALTATMD 				= 0 >
<cfset TOTALTATSUMMARYMD 		= 0 >

<cfloop query="getMRFStatusConfig" >
	<cfif getMRFStatusConfig.NAME EQ 'TOTALTATSOURCING' >
		<cfset TOTALTATSOURCING 		= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATEXAMHRINT' >
		<cfset TOTALTATEXAMHRINT 		= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATSUMMARYSC' >
		<cfset TOTALTATSUMMARYSC 		= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATHRFEEDBACK' >
		<cfset TOTALTATHRFEEDBACK		= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATJOBOFFER' >
		<cfset TOTALTATJOBOFFER 		= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATSUMMARYJO' >
		<cfset TOTALTATSUMMARYJO 		= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATREQ' >
		<cfset TOTALTATREQ 				= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATTOTAL' >
		<cfset TOTALTATTOTAL 			= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATPRESCREENINVITE' >
		<cfset TOTALTATPRESCREENINVITE  = getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATMRFPOST' >
		<cfset TOTALTATMRFPOST          = getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATCONTRACT' >
		<cfset TOTALTATCONTRACT 		= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATHDFD' >
		<cfset TOTALTATHDFD 			= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATFD' >
		<cfset TOTALTATFD 				= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATSUMMARYFD' >
		<cfset TOTALTATSUMMARYFD 		= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATHDSD' >
		<cfset TOTALTATHDSD 			= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATSD' >
		<cfset TOTALTATSD 				= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATSUMMARYSD' >
		<cfset TOTALTATSUMMARYSD 		= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATHDMD' >
		<cfset TOTALTATHDMD 			= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATMD' >
		<cfset TOTALTATMD 				= getMRFStatusConfig.CONFIGVALUE >
	<cfelseif getMRFStatusConfig.NAME EQ 'TOTALTATSUMMARYMD' >
		<cfset TOTALTATSUMMARYMD 		= getMRFStatusConfig.CONFIGVALUE >
	</cfif>
</cfloop>

	<cfset ecounter = 1 >
	<cfset resultArr = ArrayNew(1) >

	<cfset rootstuct = StructNew() >
	<cfset rootstuct['totalCount'] = countAll.found_rows >

	<!---Creates an array of structure to be converted to JSON using serializeJSON--->
	<cfloop query="qryShortlisted">
		<cfset tmpresult = StructNew() > <!---Creates new structure in every loop to be added to the array--->
		<cfset tmpresult['A_GUID']                  = A_GUID  >
		<cfset tmpresult['A_APPLICANTNUMBER']       = A_APPLICANTNUMBER >
		<cfset tmpresult['A_FIRSTNAME']             = A_FIRSTNAME  >
		<cfset tmpresult['A_LASTNAME']              = A_LASTNAME  >
		<cfset tmpresult['A_SOURCE']                = A_SOURCE  >
		<cfset tmpresult['A_APPLICATIONDATE']       = A_APPLICATIONDATE  >
		<cfset tmpresult['A_RECDATECREATED']        = A_RECDATECREATED  >
		<cfset tmpresult['X_EXAMSCHEDDATE']         = X_EXAMSCHEDDATE  >
		<cfset tmpresult['X_EXAMSTATUS']                = X_EXAMSTATUS  >
		<cfset tmpresult['X_EXAMCOMMENTS']              = X_EXAMCOMMENTS  >
		<cfset tmpresult['X_EXAMATTACHMENT']  		    = X_EXAMATTACHMENT  >
		<cfset tmpresult['X_HRINTERVIEWDATE']  	    = X_HRINTERVIEWDATE  >
		<cfset tmpresult['X_HRINTERVIEWER']  	        = X_HRINTERVIEWER  >
		<cfset tmpresult['X_HRSTATUS']  	            = X_HRSTATUS  >
		<cfset tmpresult['X_HRCOMMENTS']  		    = X_HRCOMMENTS  >
		<cfset tmpresult['X_HRATTACHMENT']  		    = X_HRATTACHMENT  >
		<cfset tmpresult['X_HRFEEDBACKDATE']  		= X_HRFEEDBACKDATE  >
		<cfset tmpresult['X_JODATEINVITE']            = X_JODATEINVITE  >
		<cfset tmpresult['X_JODATEDECISION']          = X_JODATEDECISION  >
		<cfset tmpresult['X_JOSTATUS'] 		        = X_JOSTATUS >
		<cfset tmpresult['X_JOCOMMENTS']              = X_JOCOMMENTS  >
		<cfset tmpresult['X_PECDATERECEIVED']          = X_PECDATERECEIVED  >
		<cfset tmpresult['X_PECDATESUBMITTED']         = X_PECDATESUBMITTED  >
		<cfset tmpresult['X_PECSTATUS']                = X_PECSTATUS  >
		<cfset tmpresult['X_PECCOMMENTS']              = X_PECCOMMENTS  >
		<cfset tmpresult['X_PECATTACHMENT']              = X_PECATTACHMENT  >
		<cfset tmpresult['X_OCNEODATE']               = X_OCNEODATE  >
		<cfset tmpresult['X_OCOBDATE']           = X_OCOBDATE  >
		<cfset tmpresult['X_OCOBDATE']           = X_OCOBDATE  >
		<cfset tmpresult['X_OCSTATUS']           = X_OCSTATUS  >
		<cfset tmpresult['X_OCCOMMENTS']           = X_OCCOMMENTS  >
		<cfset tmpresult['X_OCATTACHMENT']           = X_OCATTACHMENT  >
		<cfset tmpresult['G_REQUISITIONNO']         = G_REQUISITIONNO  >
		<cfset tmpresult['G_DATEPRESCREEN']         = G_DATEPRESCREEN  >
		<cfset tmpresult['G_DATESENDOUT']           = G_DATESENDOUT  >
		<cfset tmpresult['H_CONTACTCELLNUMBER']     = H_CONTACTCELLNUMBER  >
		<cfset tmpresult['H_EMAILADDRESS']          = H_EMAILADDRESS  >
		<cfset tmpresult['I_REQUISITIONEDBY']       = I_REQUISITIONEDBY  >
		<cfset tmpresult['I_DIVISIONCODE']          = I_DIVISIONCODE  >
		<cfset tmpresult['I_DEPARTMENTCODEFK']        = I_DEPARTMENTCODEFK  >
		<cfset tmpresult['I_DATEREQUESTED']         = I_DATEREQUESTED  >
		<cfset tmpresult['I_DATELASTUPDATE']        = I_DATELASTUPDATE  >
		<cfset tmpresult['I_DATEACTIONWASDONE']     = I_DATEACTIONWASDONE  >
		<cfset tmpresult['X_CFDATEGIVEN']        = X_CFDATEGIVEN  >
		<cfset tmpresult['X_CFDATESIGNED']       = X_CFDATESIGNED  >
		<cfset tmpresult['X_CFSTATUS']                = X_CFSTATUS  >
		<cfset tmpresult['X_CFCOMMENTS']              = X_CFCOMMENTS  >
		<cfset tmpresult['X_FDDATEACTUALINTERVIEW']   = X_FDDATEACTUALINTERVIEW  >
		<cfset tmpresult['X_FDINTERVIEWDATE']         = X_FDINTERVIEWDATE  >
		<cfset tmpresult['X_FDINTERVIEWER']           = X_FDINTERVIEWER  >
		<cfset tmpresult['X_FDSTATUS']                = X_FDSTATUS  >
		<cfset tmpresult['X_FDCOMMENTS']              = X_FDCOMMENTS  >
		<cfset tmpresult['X_FDFEEDBACKDATE']          = X_FDFEEDBACKDATE  >
		<cfset tmpresult['X_DHDATEACTUALINTERVIEW']   = X_DHDATEACTUALINTERVIEW  >
		<cfset tmpresult['X_DHINTERVIEWDATE']         = X_DHINTERVIEWDATE  >
		<cfset tmpresult['X_DHINTERVIEWER']           = X_DHINTERVIEWER  >
		<cfset tmpresult['X_DHSTATUS']                = X_DHSTATUS  >
		<cfset tmpresult['X_DHCOMMENTS']              = X_DHCOMMENTS  >
		<cfset tmpresult['X_DHATTACHMENT']              = X_DHATTACHMENT  >
		<cfset tmpresult['X_DHFEEDBACKDATE']          = X_DHFEEDBACKDATE  >
		<cfset tmpresult['X_GMDATEACTUALINTERVIEW']   = X_GMDATEACTUALINTERVIEW  >
		<cfset tmpresult['X_GMINTERVIEWDATE']         = X_GMINTERVIEWDATE  >
		<cfset tmpresult['X_DHINTERVIEWER']           = X_DHINTERVIEWER  >
		<cfset tmpresult['X_GMSTATUS']                = X_GMSTATUS  >
		<cfset tmpresult['X_GMCOMMENTS']              = X_GMCOMMENTS  >
		<cfset tmpresult['X_GMATTACHMENT']              = X_GMATTACHMENT  >
		<cfset tmpresult['X_GMFEEDBACKDATE']          = X_GMFEEDBACKDATE  >
		<cfset tmpresult['Z_DESCRIPTION']           = Z_DESCRIPTION  >
		<cfset tmpresult['TATMRFPOST']              = TATMRFPOST  >
		<cfset tmpresult['TATSOURCING']             = TATSOURCING  >
		<cfset tmpresult['TATPRESCREENINVITE']      = TATPRESCREENINVITE  >
		<cfset tmpresult['TATEXAMHRINT']            = TATEXAMHRINT  >
		<cfset tmpresult['TATSUMMARYSC']            = TATSUMMARYSC  >
		<cfset tmpresult['TATHRFEEDBACK']           = TATHRFEEDBACK  >
		<cfset tmpresult['TATHDFD']     			= TATHDFD  >
		<cfset tmpresult['TATFD']     				= TATFD  >
		<cfset tmpresult['TATSUMMARYFD']     		= TATSUMMARYFD  >
		<cfset tmpresult['TATHDSD']     			= TATHDSD  >
		<cfset tmpresult['TATSD']     				= TATSD  >
		<cfset tmpresult['TATSUMMARYSD']    	 	= TATSUMMARYSD  >
		<cfset tmpresult['TATHDMD']     			= TATHDMD  >
		<cfset tmpresult['TATMD']     				= TATMD  >
		<cfset tmpresult['TATSUMMARYMD']     		= TATSUMMARYMD  >
		<cfset tmpresult['TATJOBOFFER']     		= TATJOBOFFER  >
		<cfset tmpresult['TATSUMMARYJO']     		= TATSUMMARYJO  >
		<cfset tmpresult['TATREQ']     				= TATREQ  >
		<cfset tmpresult['TATTOTAL']    			= TATTOTAL  >
		<cfset tmpresult['TATCONTRACT']     		= TATCONTRACT  >
		<cfset tmpresult['TOTALTATSOURCING'] 		= TOTALTATSOURCING >
		<cfset tmpresult['TOTALTATEXAMHRINT'] 		= TOTALTATEXAMHRINT >
		<cfset tmpresult['TOTALTATSUMMARYSC'] 		= TOTALTATSUMMARYSC >
		<cfset tmpresult['TOTALTATHRFEEDBACK']		= TOTALTATHRFEEDBACK >
		<cfset tmpresult['TOTALTATJOBOFFER'] 		= TOTALTATJOBOFFER >
		<cfset tmpresult['TOTALTATSUMMARYJO'] 		= TOTALTATSUMMARYJO >
		<cfset tmpresult['TOTALTATREQ'] 			= TOTALTATREQ >
		<cfset tmpresult['TOTALTATTOTAL'] 			= TOTALTATTOTAL >
		<cfset tmpresult['TOTALTATPRESCREENINVITE'] = TOTALTATPRESCREENINVITE >
		<cfset tmpresult['TOTALTATMRFPOST']         = TOTALTATMRFPOST >
		<cfset tmpresult['TOTALTATCONTRACT'] 		= TOTALTATCONTRACT >
		<cfset tmpresult['TOTALTATHDFD'] 			= TOTALTATHDFD >
		<cfset tmpresult['TOTALTATFD'] 				= TOTALTATFD >
		<cfset tmpresult['TOTALTATSUMMARYFD'] 		= TOTALTATSUMMARYFD >
		<cfset tmpresult['TOTALTATHDSD'] 			= TOTALTATHDSD >
		<cfset tmpresult['TOTALTATSD'] 				= TOTALTATSD >
		<cfset tmpresult['TOTALTATSUMMARYSD'] 		= TOTALTATSUMMARYSD >
		<cfset tmpresult['TOTALTATHDMD'] 			= TOTALTATHDMD >
		<cfset tmpresult['TOTALTATMD'] 				= TOTALTATMD >
		<cfset tmpresult['TOTALTATSUMMARYMD'] 		= TOTALTATSUMMARYMD >


		<cfset resultArr[ecounter] = tmpresult    >
		<cfset ecounter = ecounter + 1            >

	</cfloop>

	<cfset rootstuct['topics'] = resultArr >

	<cfreturn rootstuct />

	<cfcatch>
	 <cfreturn cfcatch.detail & ' ' & cfcatch.message>
	</cfcatch>
</cftry>

</cffunction>

<cffunction name="sendemail" ExtDirect="true" >
<cfargument name="recipient" >
<cfargument name="subject" >
<cfargument name="body" >
<cftry>


<cfset ans = findnocase("<script>", body) >
<cfif ans NEQ 0 >
	<cfset body = left(body, ans - 1) >
</cfif>

<cfmail
	from="HR"
	to="#recipient#"
	subject="#subject#"
	type="html"

>
<!---server="smtp.gmail.com"
    port="587"
    username="noreply@foodgroup.ph"
    password="n0r3plyp4ss"
    useTLS="yes"--->
<cfoutput>#body#</cfoutput>
</cfmail>
<cfquery name="update_reserve4" datasource="#session.company_dsn#">
    UPDATE CMFCANDIDATELISTNG
       SET DATESENDOUT  = <cfqueryparam cfsqltype="cf_sql_date" value="#dateformat(now(), 'YYYY-MM-DD')#"/>
     WHERE EMAILADDRESS = '#trim(recipient)#';
</cfquery>

<cfreturn "success" >

	<cfcatch>
		<cfreturn cfcatch.Detail & ' ' & cfcatch.Message >
	</cfcatch>
</cftry>



</cffunction>



<cffunction name      ="gridtoexcel"
			returntype="string"
			access    ="remote"
			ExtDirect ="true"
>

    <cftry>

		  <cfif Ucase(session.DBMS) EQ 'MYSQL'>
     	<cfset theif = "if" />
		<cfset now   = "now()" />
		<cfset extraparam = "" >
      <cfelseif Ucase(session.DBMS) EQ 'MSSQL'>
        <cfset theif = "iif" />
		<cfset now   = "getdate()" />
		<cfset extraparam = "day, " >
      </cfif>

	  <cfquery name="qryShortlisted" datasource="#session.company_dsn#">
	    SELECT  G.REQUISITIONNO AS 'Requisition No',
	    		A.FIRSTNAME AS 'First Name',
	    		A.LASTNAME AS 'Last Name',
	    		Z.DESCRIPTION AS 'Position',
	    		I.DEPARTMENTCODEFK AS 'Hiring Department',
	    		I.DIVISIONCODE AS 'Division',
	    		I.DATELASTUPDATE AS 'MRF Date Received',
	    		I.DATEACTIONWASDONE AS 'Posting Date',
	    		I.REQUISITIONEDBY AS 'Requisitioner',
	    		<!---TATMRFPOST = MRF POSTED DATE - MRF DATELASTUPDATE--->
	            #dateDiffToString("I.DATELASTUPDATE", "I.DATEACTIONWASDONE")# AS 'TAT (MRF to Posting)',
	            A.APPLICANTNUMBER AS 'Applicant Number',
	            H.CONTACTCELLNUMBER AS 'Contact No',
	            H.EMAILADDRESS AS 'Email Address',
	            A.SOURCE AS 'Source',
	            A.APPLICATIONDATE AS 'Date of Application',
	            A.RECDATECREATED AS 'Sourcing Date',
	            <!---TATSOURCING =  Sourcing Date - Date of Application--->
	            #dateDiffToString("A.APPLICATIONDATE", "A.RECDATECREATED")# AS 'TAT (Sourcing)',
				G.DATEPRESCREEN AS 'Date Pre-Screened',
	            G.DATESENDOUT AS 'Date of Invite Send-out',
	            <!---TATPRESCREENINVITE = (Date of Invite Send-Out – Date Pre-Screened) – HRAD Non Working Days--->
	            #dateDiffToString("G.DATEPRESCREEN", "G.DATESENDOUT")# AS 'TAT (Pre-screen to Invite)',
	            X.EXAMTYPE AS 'Exam type',
	            X.EXAMSCHEDDATE AS 'Date of Exam',
	            X.EXAMSTATUS AS 'Exam Status',
	            X.EXAMCOMMENTS AS 'Exam Comments',
	            X.EXAMATTACHMENT AS 'Exam Attachment',
	            <!---TATEXAMHRINT = (Actual Interview Date from HR Interview Assessment Slip – Date of Exam) – HRAD Non-Working Days--->
	            #dateDiffToString("X.EXAMSCHEDDATE", "X.HRINTERVIEWDATE")# AS 'TAT (Exam to HR Interview)',
	            <!---TATSUMMARYSC = (Actual Interview Date from HR Interview Assessment Slip – MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.HRINTERVIEWDATE")# AS 'TAT Summary',
	            X.HRINTERVIEWDATE AS 'Date of HR Interview',
	            X.HRINTERVIEWER AS 'HR Interviewer',
	            X.HRSTATUS AS 'HR Status',
	            X.HRCOMMENTS AS 'HR Comments',
	            X.HRATTACHMENT AS 'HR Attachment',
	            X.HRFEEDBACKDATE AS 'HR Date of Feedback',
	            <!---TATHRFEEDBACK = (Date of Feedback – Date of HR Interview) - HRAD Non-Working Days--->
	            #dateDiffToString("X.HRINTERVIEWDATE", "X.HRFEEDBACKDATE")# AS 'TAT (HR Interview to Feedback)',
	            X.FDINTERVIEWDATE AS 'Date of Interview - First Department ',
	            X.FDDATEACTUALINTERVIEW AS 'Date of Actual Interview - First Dept',
	            X.FDINTERVIEWER AS 'Interviewer - First Department',
	            <!---TATHDFD = (Date of First Department Interview - HR Interview Date of Feedback) – HRAD Non-Working Days.--->
	            #dateDiffToString("X.HRFEEDBACKDATE", "X.FDINTERVIEWDATE")# AS 'TAT (Feedback from HR interview to 1st Dept Interview)',
	            X.FDSTATUS AS 'Status - First Dept',
	            X.FDCOMMENTS AS 'Comments - First Dept',
	            X.FDFEEDBACKDATE AS 'Date of Feedback from Hiring Department',
	            <!---TATFD = (Date of Feedback from Hiring Department – Date of Actual Interview) – HRAD Non-Working Days--->
	            #dateDiffToString("X.FDDATEACTUALINTERVIEW", "X.FDFEEDBACKDATE")# AS 'TAT (First Department Interview Feedback)',
	            <!---TATSUMMARYFD = (Actual First Hiring Dept Interview Date – MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.FDDATEACTUALINTERVIEW")# AS 'TAT (First Dept Interview TAT Summary)',
	            X.DHINTERVIEWDATE AS 'Date of Interview - 2nd Dept',
	            X.DHDATEACTUALINTERVIEW AS 'Date of Actual 2nd Dept Interview',
	            X.DHINTERVIEWER AS 'Interviewer - 2nd Dept',
	            <!---TATHDSD = (Date of Second Department Interview – Date of First Department Interview) – HRAD Non-Working Days.--->
	            #dateDiffToString("X.FDINTERVIEWDATE", "X.DHINTERVIEWDATE")# AS 'TAT (Feedback from 1st to 2nd Dept Interview)',
	            X.DHSTATUS AS 'Status - 2nd Dept',
	            X.DHCOMMENTS AS 'Comments - 2nd Dept',
	            X.DHATTACHMENT AS 'Attachment - 2nd Dept',
	            X.DHFEEDBACKDATE AS 'Date of Feedback from Hiring Dept',
	            <!---TATSD = (Date of Feedback from Hiring Department – Date of Actual Interview) – HRAD Non-Working Days--->
	            #dateDiffToString("X.DHDATEACTUALINTERVIEW", "X.DHFEEDBACKDATE")# AS 'TAT (2nd Dept Interview Feedback)',
	            <!---TATSUMMARYSD = (Actual Second Hiring Dept Interview Date – MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.DHDATEACTUALINTERVIEW")# AS 'TAT (2nd Dept Interview TAT Summary)',
	            X.GMINTERVIEWDATE AS 'Date of Final Interview',
	            X.GMDATEACTUALINTERVIEW AS 'Date of Actual Final Interview',
	            X.GMINTERVIEWER AS 'Interviewer - Final Interview',
	            <!---TATHDMD = (Date of Final Interview – Date of Second Department Interview) – HRAD Non-Working Days.--->
	            #dateDiffToString("X.DHINTERVIEWDATE", "X.GMINTERVIEWDATE")# AS 'TAT (2nd Dept Interview to Final)',
	            X.GMSTATUS AS 'Status - Final Interview',
	            X.GMCOMMENTS AS 'Comments - Final Interview',
	            X.GMATTACHMENT AS 'Attachment - Final Interview',
	            X.GMFEEDBACKDATE AS 'Date of Feedback - Final Interview',
	            <!---TATMD = (Date of Feedback from Final Interview – Date of Final Interview) – HRAD Non-Working Days--->
	            #dateDiffToString("X.GMINTERVIEWDATE", "X.GMFEEDBACKDATE")# AS 'TAT (Final Interview Feedback/Hiring Decision)',
	            <!---TATSUMMARYMD = (Actual Final Interview Date – MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.GMDATEACTUALINTERVIEW")# AS 'TAT (Final Interview TAT Summary)',
	            X.JODATEINVITE AS 'Date Presented Job Offer to Applicant',
	            X.JODATEDECISION AS 'Date of Applicants Decision',
	            X.JOSTATUS AS 'Status - Job Offer',
	            X.JOCOMMENTS AS 'Comments - Job Offer',
	            <!---TATJOBOFFER = (Date of Applicant’s Decision – Date Presented Job Offer to Applicant) – HRAD Non-Working Days--->
	            #dateDiffToString("X.JODATEINVITE", "X.JODATEDECISION")# AS 'TAT (Job Offer)',
	            <!---TATSUMMARYJO = (Date Presented Job Offer to Applicant - MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.JODATEINVITE")# AS 'TAT (Job Offer TAT Summary)',
	            X.PECDATERECEIVED AS 'Date Requirements was discussed to applicant',
	            X.PECDATESUBMITTED AS 'Date Accomplished',
	            X.PECSTATUS AS 'Status - Pre-emp Checklist',
	            X.PECCOMMENTS AS 'Comments - Pre-emp Checklist',
	            X.PECATTACHMENT AS 'Attachment - Pre-emp Checklist',
	            <!---TATREQ = (Date Accomplished – MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.PECDATESUBMITTED")# AS 'TAT (Pre-employment TAT Summary)',
	            X.CFDATEGIVEN AS 'Date Given',
	            X.CFDATESIGNED AS 'Date Signed by Applicant',
	            X.CFSTATUS AS 'Status - Contract',
	            X.CFCOMMENTS AS 'Comments - Contract',
	            X.CFATTACHMENT AS 'Attachment - Contract',
	            <!---TATCONTRACT = (Date Signed by Applicant – Date Accomplished) – HRAD Non-Working Days--->
	            #dateDiffToString("X.CFDATEGIVEN", "X.CFDATESIGNED")# AS 'TAT (Contract)',
	            X.OCNEODATE	AS 'NEO DATE',
	            X.OCOBDATE AS 'On-Boarding Date',
	            X.OCSTATUS AS 'Status - Onboarding Checklist',
	            X.OCCOMMENTS AS 'Comments - Onboarding Checklist',
	            X.OCATTACHMENT AS 'Attachment - Onboarding Checklist',

	            <!---TATTOTAL = (On-Boarding Date – MRF Date Received) – HRAD Non-Working Days--->
	            #dateDiffToString("I.DATELASTUPDATE", "X.OCOBDATE")# AS 'TAT (Total)'

	     FROM  CMFAP A  LEFT JOIN CMFCANDIDATELISTNG G ON (A.GUID = G.GUID)
 				LEFT JOIN CRGPERSONELREQUEST     I ON (I.REQUISITIONNO = G.REQUISITIONNO)
 				LEFT JOIN CIN21PERSONALINFO      H ON (A.GUID = H.GUID)
 				LEFT JOIN ECINRECPROCESS         X ON (X.APPLICANTNUMBER = G.APPLICANTNUMBER)
                LEFT JOIN CLKPOSITION            Z ON (Z.POSITIONCODE  = A.POSITIONCODE)
   ORDER BY A.APPLICATIONDATE DESC;
</cfquery>

   		<cfspreadsheet
		    action="write"
		    filename = "#expandpath('./')#MRFStatusData.xls"
		    overwrite = "true"
		    query = "qryShortlisted"
		>
	<cfcatch>
		<cfreturn cfcatch.detail & ' ' & cfcatch.message>
	</cfcatch>

	</cftry>

	<cfreturn "success">

</cffunction>

<cffunction name="getInitForms" ExtDirect="true">
	<cftry>
		<cfset retArr = ArrayNew(1) >
		<cfset retArr[1] = "">
		<cfset retArr[2] = "">
		<cfset retArr[3] = '<img src="' & session.root_undb & 'images/' & lcase(session.companycode) & '/' & session.site_bannerlogo & '" width="290" height="60">' >

		<cfreturn retArr >
	<cfcatch>
		<cfreturn cfcatch.detail & ' ' & cfcatch.message >
	</cfcatch>
	</cftry>
</cffunction>


</cfcomponent>