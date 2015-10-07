<!---<cfset groupStruct = structnew() >


<cfset abc = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P" >


<cfloop from="1" to="10" index="me" >


	<cftry>
		<cfset isArray = evaluate("thiss#me#") >
		<cfif isarray(isArray) >

		<cfelse>
			<cfset "thiss#me#"  = arraynew(1) >
		</cfif>
	<cfcatch>
		<cfset "thiss#me#"  = arraynew(1) >
	</cfcatch>
	</cftry>


	<cfset arrayappend(evaluate("thiss#me#"), "Items #me#") >
	<cfset "groupStruct.__#me#" =  evaluate("thiss#me#") >

</cfloop>--->

<!---<cfset str = "time: function() {} timeFormat: function() {} timeMask: sadfsdf" >
<cfset res = find(":", str) >
<cfif res GT 0 >
<cfset out = left(str, res-1) >
</cfif>


<cfdump var="#out#" >--->

<!---<cfset groupArray = Arraynew(1) >

<cfset groupArray[5] = "Hi" >

<cfif arrayisdefined(groupArray, 2) >
	<cfdump var="#groupArray[5]#" >
<cfelse>
<cfdump var="#groupArray#" >
</cfif>

<cfif find("forfileonlyaaazzzs", "forfileonlyaaazzzCMFPA") >
	<cfoutput>Yes</cfoutput>
<cfelse>
	<cfoutput>No</cfoutput>
</cfif>
--->


<!--- <cfset approverslist = "'B_504_P','C_503_P','T_500_P','Y_500_P'" >

<cfif session.dbms eq "MSSQL" >
	<cfset dbsourceg = "#session.global_dsn#.dbo" >
	<cfset dbsourcec = "#session.company_dsn#.dbo" >
<cfelse>
	<cfset dbsourceg = "#session.global_dsn#" >
	<cfset dbsourcec = "#session.company_dsn#" >
</cfif>

<cfquery name="getPersonalEmail" datasource="#session.global_dsn#" >
	SELECT DISTINCT
		   A.FIRSTNAME AS FIRSTNAME,
		   A.LASTNAME AS LASTNAME,
		   A.MIDDLENAME AS MIDDLENAME,
		   B.AVATAR AS AVATAR,
		   E.PROFILENAME AS PROFILENAME,
		   C.DESCRIPTION AS POSITION,
		   D.DESCRIPTION AS DEPARTMENT
	  FROM #dbsourcec#.#session.maintable# A LEFT JOIN #dbsourcec#.ECRGMYIBOSE B ON (A.#session.mainpk#=B.PERSONNELIDNO)
	               LEFT JOIN #dbsourcec#.CLKPOSITION C  ON (A.POSITIONCODE=C.POSITIONCODE)
	               LEFT JOIN #dbsourcec#.CLKDEPARTMENT D ON (A.DEPARTMENTCODE=D.DEPARTMENTCODE)
	               LEFT JOIN #dbsourceg#.EGRGUSERMASTER E ON (A.GUID=E.GUID)
	 WHERE A.#session.mainpk# IN (#preservesinglequotes(approverslist)#)
</cfquery>

<cfset emailArr = ArrayNew(1) >

<cfloop query="getPersonalEmail" >
	<cfset ArrayAppend(emailArr, getPersonalEmail.PROFILENAME) >
</cfloop>
list of
<cfoutput>#dbsourceg# #dbsourcec#</cfoutput>
<cfdump var="#getPersonalEmail#" > --->



<!--- <cfset ltest = 201509031011521100 >
<cfoutput>#len(ltest)#</cfoutput> --->

<!--- <cfhttp url="http://www.dolephilippines.com/products/pineapple-juice" result="res">
<cfdump var="#res#"> --->

<li class="col-sm-2s">
					<a href="#" onClick="var pwin = Ext.widget('littleloginform'); pwin.show();" class="">Sign In</a>
				</li>
				<li class="col-sm-2s">{login}
				</li>
<li class="col-sm-2s" name="right"  onclick="(function() { document.getElementById('applicationcontainer').innerHTML = '<iframe src=\\'../templates/application/careers/infinitecareers.html\\' width=\\'750\\' height=\\'100%\\' frameborder=\\'0\\' style=\\'padding-left: 50px; padding-top: 5px;\\'></iframe>'; })();">{careers}</li>
