<cfcomponent name="Complements" ExtDirect="true">

	<cffunction name="getQuickFormStatus" ExtDirect="true" returntype="Array" >
		<cfargument name="theFormID" type="array" >
		<cfargument name="theProcessID" type="array" >

		<cfset returnArr = ArrayNew(1) >
		<cfset breakOuter = "yes" >

		<cfloop array="#theProcessID#" index="processID" >
			<cfset theStatus = "N" >

			<cfset formRouterData = EntityLoad("EGINROUTERDETAILS", {PROCESSIDFK = #processID#}, "ROUTERORDER ASC") >

			<cfloop array="#formRouterData#" index="routerIndex" >

				<cfset formApproversData = EntityLoad("EGINAPPROVERDETAILS", {ROUTERIDFK =#routerIndex.getROUTERDETAILSID()#}, "APPROVERORDER ASC" ) >

				<cfloop array="#formApproversData#" index="approverIndex" >

					<cfset APPROVERORDER = approverIndex.getAPPROVERORDER() >
					<cfset PERSONNELIDNO = approverIndex.getPERSONNELIDNO() >
					<cfset ACTION = approverIndex.getACTION() >

					<cfif ACTION eq "CURRENT" AND ucase(PERSONNELIDNO) neq "#ucase(session.chapa)#">
						<cfquery name="getPersonalOrig" datasource="#session.company_dsn#" maxrows="1" >
							SELECT A.FIRSTNAME AS FIRSTNAME
							  FROM #session.maintable# A
							 WHERE A.#session.mainpk# = '#PERSONNELIDNO#'
						</cfquery>
						<cfset theStatus = "PENDING TO #getPersonalOrig.FIRSTNAME#" >
						<cfset breakOuter = "yes" >

					<cfelseif ACTION eq "CURRENT" AND ucase(PERSONNELIDNO) eq "#ucase(session.chapa)#">
						<cfset theStatus = "S" >
						<cfset breakOuter = "yes" >
						<cfbreak>
				    <cfelse>
				    	<cfset breakOuter = "no" >
					</cfif>

				</cfloop> <!---end formApproversData--->

				<cfif breakOuter eq "yes" >
					<cfbreak>
				</cfif>

			</cfloop> <!---end formRouterData--->

			<cfset ArrayAppend(returnArr, theStatus) >

		</cfloop> <!---end process id's--->

		<cfreturn returnArr >

	</cffunction>


	<cffunction name="saveSignature" ExtDirect="true" >
		<cfargument name="sigData" >
		<cfargument name="processid" >
		<cfargument name="actionref" >
		<cftry>
			<cfquery name="qrySignature" datasource="#session.global_dsn#" >
				SELECT PROCESSID
				  FROM EGINSIGNATURE
				 WHERE PROCESSID = '#trim(processid)#' AND ACTIONREFERENCE = '#trim(actionref)#'
			</cfquery>

			<cfif qrySignature.recordcount gt 0 >
				<cfquery name="qrySignature" datasource="#session.global_dsn#" >
					UPDATE EGINSIGNATURE
					   SET BASE64SIGNATURE = <cfqueryparam cfsqltype="cf_sql_varchar" value="#sigData#">
					 WHERE PROCESSID = '#trim(processid)#' AND ACTIONREFERENCE = '#trim(actionref)#'
				</cfquery>
			<cfelse>
				<cfquery name="qrySignature" datasource="#session.global_dsn#" >
					INSERT INTO EGINSIGNATURE (PROCESSID,ACTIONREFERENCE,BASE64SIGNATURE)
					   VALUES (
					   		<cfqueryparam cfsqltype="cf_sql_varchar" value="#processid#">,
					   		<cfqueryparam cfsqltype="cf_sql_varchar" value="#actionref#">,
					   		<cfqueryparam cfsqltype="cf_sql_varchar" value="#sigData#">
					   );
				</cfquery>
			</cfif>

			<cfreturn "true" >
        <cfcatch type="Any" >
        	<cfreturn cfcatch.message & " _ " & cfcatch.detail >
        </cfcatch>
        </cftry>

	</cffunction>




	<cffunction name="getSignature" ExtDirect="true" >
		<cfargument name="processid" >
		<cfargument name="actionref" >
		<cftry>
			<cfquery name="qrySignature" datasource="#session.global_dsn#" maxrows="1">
				SELECT BASE64SIGNATURE
				  FROM EGINSIGNATURE
				 WHERE PROCESSID = '#trim(processid)#' AND ACTIONREFERENCE = '#trim(actionref)#'
			</cfquery>
			<cfif qrySignature.recordcount gt 0 >
				<cfreturn qrySignature.BASE64SIGNATURE >
			<cfelse>
			    <cfreturn "data:image/png;base64" >
			</cfif>

        <cfcatch type="Any" >
        	<cfreturn cfcatch.message & " _ " & cfcatch.detail >
        </cfcatch>
        </cftry>
	</cffunction>

	<cffunction name="loadMyComments" ExtDirect="true" >
		<cfargument name="eformid" >
		<cfargument name="ownerpid" >
		<cfargument name="start" >

		<cfset outputStruct = StructNew() >
		<cfset outputArr = ArrayNew(1) >

		<cfif session.dbms eq "MSSQL" >
			<cfset tbn = session.company_dsn & ".dbo" >
		<cfelse>
		 	<cfset tbn = session.company_dsn >
		</cfif>

		<cfquery name="qryComment" datasource="#session.global_dsn#" >
			SELECT A.COMMENT, A.PERSONNELIDNO,A.COMMENTERPID,A.RECDATECREATED, B.FIRSTNAME, B.LASTNAME, C.AVATAR
			  FROM EGINCOMMENT A LEFT JOIN #tbn#.#session.maintable# B ON (A.COMMENTERPID=B.#session.mainpk#)
			       LEFT JOIN #tbn#.ECRGMYIBOSE C ON (A.COMMENTERPID = C.PERSONNELIDNO)
			 WHERE A.EFORMID = <cfqueryparam cfsqltype="cf_sql_varchar" value="#eformid#">
			       AND A.PERSONNELIDNO = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ownerpid#">
			 ORDER BY A.RECDATECREATED DESC
			 <cfif Ucase(session.DBMS) EQ 'MSSQL'>
			  	 OFFSET #start# ROWS
		         FETCH NEXT 30 ROWS ONLY
		     <cfelse>
		         LIMIT #start#, 30
		     </cfif>
			 ;
		</cfquery>
		<cfloop query="qryComment" >
			<cfset inputItems = StructNew() >
			<cfset inputItemsArr = ArrayNew(1) >

			<cfset inputItems['xtype'] = "displayfield" >
			<cfset inputItems['padding'] = 2 >
			<cfset inputItems['width'] = 50 >
			<cfset inputItems['height'] = 50 >


			<cfset inputItems['value'] = "<img title='#qryComment.FIRSTNAME# #qryComment.LASTNAME#' src='./resource/image/pics201/#lcase(session.companycode)#/#qryComment.AVATAR#' height='50px' width='50px'></img>" >
			<cfset ArrayAppend(inputItemsArr, inputItems) >


			<cfset inputItems = StructNew() >
			<cfset inputItems['xtype'] = "displayfield" >
			<cfset inputItems['padding'] = 7 >
			<cfset inputItems['flex'] = 1 >
			<cfset inputItems['width'] = "90%" >

			<cfinvoke component="IBOSE.time.Time"
					method="convertTimeToWords"
					returnvariable="timeinwords"
					theTime="#qryComment.RECDATECREATED#" >

			<cfset inputItems['value'] = "#qryComment.COMMENT# <p title='#qryComment.RECDATECREATED#' style='font-size: .9em;'>#timeinwords#</p>" >
			<cfset ArrayAppend(inputItemsArr, inputItems) >

			<cfset outputStruct = StructNew() >
			<cfset outputStruct['xtype'] = "container" >
			<cfset outputStruct['padding'] = 7 >
			<cfset outputStruct['flex'] = 1 >
			<cfset outputStruct['layout'] = "hbox" >
			<cfset outputStruct['items'] = inputItemsArr >
			<cfset ArrayAppend(outputArr, outputStruct) >

		</cfloop>

		<cfreturn outputArr >

	</cffunction>

	<cffunction name="saveMyComment" ExtDirect="true">
		<cfargument name="eformid" >
		<cfargument name="ownerpid" >
		<cfargument name="commentval" >

		<cftry>
	    	<cfset outStruct = StructNew() >

			<cfquery name="qryComment" datasource="#session.global_dsn#" >
				INSERT INTO EGINCOMMENT ( EFORMID,PERSONNELIDNO,COMMENTERPID,COMMENT,RECDATECREATED )
				  VALUES (
				  	<cfqueryparam cfsqltype="cf_sql_varchar"   value="#eformid#">,
				  	<cfqueryparam cfsqltype="cf_sql_varchar"   value="#ownerpid#">,
					<cfqueryparam cfsqltype="cf_sql_varchar"   value="#session.chapa#">,
				  	<cfqueryparam cfsqltype="cf_sql_varchar"   value="#commentval#">,
				  	<cfqueryparam cfsqltype="cf_sql_timestamp" value="#CreateODBCDateTime(now())#">
				  )
			</cfquery>

			<cfset outStruct['issuccess'] = "true" >
			<cfreturn outStruct >
	    <cfcatch type="Any" >
	    	<cfset outStruct = StructNew() >
	    	<cfset outStruct['issuccess'] = "false" >
			<cfreturn outStruct >
	    </cfcatch>
	    </cftry>
	</cffunction>

</cfcomponent>