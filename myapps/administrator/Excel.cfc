<cfcomponent accessors="true" ExtDirect=true>

	<cffunction name="insertMultipleUser" access="public" ExtDirect=true ExtFormHandler=true returntype="struct">

		<cfset dest = ExpandPath("../../unDB/temp/") />

		<cffile action="upload" accept="application/vnd.ms-excel,application/msexcel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" filefield="multipleuser"
				mode="777" nameconflict="overwrite" destination="#dest#">

		<cfset theFilename = cffile.serverFile />

		<cfif trim(theFilename) neq "" >

			<cfset sourceFile = ExpandPath("../../unDB/temp/#theFilename#") />

			<cfspreadsheet
			    action="read"
			    src = "#sourceFile#"
			    columns = "1-13"
			    excludeHeaderRow = "true"
			    headerrow = "1"
			    query = "nameExl"
			>

			 <cfset requiredColumns = ArrayNew(1) >
			 <cfset requiredColumns[1] = "COMPANYCODE" >
			 <cfset requiredColumns[2] = "SUBCOMPANYCODE" >
			 <cfset requiredColumns[3] = "USERTYPE" >
			 <cfset requiredColumns[4] = "USERID" >
			 <cfset requiredColumns[5] = "GUID" >
			 <cfset requiredColumns[6] = "PERSONNELIDNO" >
			 <cfset requiredColumns[7] = "FIRSTNAME" >
			 <cfset requiredColumns[8] = "LASTNAME" >
			 <cfset requiredColumns[9] = "MIDDLENAME" >
			 <cfset requiredColumns[10] = "NICKNAME" >
			 <cfset requiredColumns[11] = "PAGIBIGNUMBER" >
			 <cfset requiredColumns[12] = "SSSNUMBER" >
			 <cfset requiredColumns[13] = "TIN" >


			 <cfloop array="#requiredColumns#" index="rCol" >
			 	<cfset rex = ArrayFindNoCase(nameExl.getMeta().getColumnLabels(), rCol) >
			 	<cfif rex eq 0 >
			 		<cfthrow message="Missing #rCol#. Excel file header columns does not meet the requirements." >
			 	</cfif>
			 </cfloop>


			<cfloop query="nameExl">

				<cftry>

					 <cfset form["B-COMPANYCODE"] = nameExl.COMPANYCODE />
					 <cfset form["B-SUBCOMPANYCODE"] = nameExl.SUBCOMPANYCODE />
					 <cfset form["A-USERTYPE"] = nameExl.USERTYPE />
					 <cfset form["A-USERID"] = nameExl.USERID />
					 <cfset form["C-PERSONNELIDNO"] = nameExl.PERSONNELIDNO />
					 <cfset form["B-FIRSTNAME"] = nameExl.FIRSTNAME />
					 <cfset form["B-LASTNAME"] = nameExl.LASTNAME />
					 <cfset form["B-MIDDLENAME"] = nameExl.MIDDLENAME />
					 <cfset form["B-NICKNAME"] = nameExl.NICKNAME />
					 <cfset form["B-PAGIBIGNUMBER"] = nameExl.PAGIBIGNUMBER />
					 <cfset form["B-SSSNUMBER"] = nameExl.SSSNUMBER />
					 <cfset form["B-TIN"] = nameExl.TIN />
					 <cfset form['A-GUID'] = nameExl.GUID />

					 	<cfset form.USERACTION = "NEW" />

						<cfset form['A-PASSWORD'] = "#Hash(nameExl.USERID)#" />
						<cfset form['A-DATEPASSWORD'] = "#CreateODBCDateTime(now())#" />
						<cfset form['A-PASSQUESTION'] = "#nameExl.USERID#" />
						<cfset form['A-PASSANSWER'] = "#Hash(nameExl.USERID)#" />
						<cfset form['A-CHANGEPWDNEXTLOGON'] = "false" />
						<cfset form['A-CANNOTCHANGEPWD'] = "false" />
						<cfset form['A-PWDNEVEREXPIRES'] = "false" />
						<cfset form['A-USERCANRESETUSING'] = "" />
						<cfset form['A-MAXPASSWORDAGE'] = "30:00:00:00" />
						<cfset form['A-MINPASSWORDAGE'] = "00:00:30:00" />
						<cfset form['A-MINPASSWORDLENGTH'] = "5" />
						<cfset form['A-PWDMUSTMEETCOMPLEXITY'] = "false" />
						<cfset form['A-ACCOUNTLOCKOUTDURATION'] = "00:00:00:05" />
						<cfset form['A-ACCOUNTLOCKOUTTHRESHHOLD'] = "10" />
						<cfset form['A-RESETACCOUNTLOCKOUTCOUNTERAFTER'] = "00:00:02:00" />
						<cfset form['A-PROFILENAME'] = "#nameExl.USERID#@something.com" />
						<cfset form['A-DISABLEACCOUNT'] = "N" />
						<cfset form['A-PWDCOUNTFAILEDATTEMPT'] = "0" />
						<cfset form['A-DATELASTUPDATE'] = "#CreateODBCDateTime(now())#" />
						<cfset form['A-RECDATECREATED'] = "#CreateODBCDateTime(now())#" />

						<cfset form['A-MAXDRIVESIZE'] = "70000" />
						<cfset form['B-RECDATECREATED'] = "#CreateODBCDateTime(now())#" />
						<cfset form['B-DATELASTUPDATE'] = "#CreateODBCDateTime(now())#" />
						<cfset form['B-ISACTIVE'] = "true" />
						<cfset form['C-AVATAR'] = "noicon.png" />

					 <cfinvoke component="User" method="SubmitUser" returnvariable="x" >

					 <cfcatch type="Any">
						 <cfcontinue />
					 </cfcatch>
				 </cftry>
			 </cfloop>

		 </cfif>

		 <cfset retStruct =StructNew() />
		 <cfset rootstruct["success"] = "true" />
		 <cfreturn retStruct />

	</cffunction>
</cfcomponent>