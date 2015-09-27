<cfsetting showdebugoutput="false" />


<cfset bd = trim(form.BIRTHDAY) />
<cfset cp = trim(form.CONFIRMPASSWORD) />
<cfset ea = trim(form.EMAILADDRESS) />
<cfset fn = trim(form.FIRSTNAME) />
<cfset ln = trim(form.LASTNAME) />
<cfset mn = trim(form.MOBILENUMBER) />
<cfset pw = trim(form.PASSWORD) />
<cfset sl = trim(form.SUBMITLOGIN) />

<cfif bd eq "" OR cp eq "" OR ea eq "" OR fn eq "" OR ln eq "" OR mn eq "" OR pw eq "" OR sl eq "">
	<cfoutput>All fields are required.</cfoutput>
<cfelseif Not IsDate(bd)>
	<cfoutput>Birth day must be a valid date.</cfoutput>
<cfelseif pw neq cp>
	<cfoutput>Password didn't match.</cfoutput>
<cfelse>
	<cfquery name="IsEmailExist" datasource="IBOSE_GLOBAL">
		SELECT USERFIRSTNAME
		  FROM EGRGTEMPSIGNUP
		 WHERE USEREMAIL = '#ea#'
	</cfquery>
	<cfif IsDefined("IsEmailExist")>
		<cfif IsEmailExist.RecordCount eq 0>
			<cfinvoke method="addTempUser">
		<cfelse>
		    <cfoutput>Email address is already active.</cfoutput>
		</cfif>
	<cfelse>
	    <cfinvoke method="addTempUser">
	</cfif>




</cfif>

</br>
<a href="../signup.html">Back</a>


<cffunction name="addTempUser">
	<cfset uuid = CreateUuid() >
	<cfquery name="InsertTempData" datasource="IBOSE_GLOBAL">
		INSERT INTO EGRGTEMPSIGNUP (USEREMAIL,
									USERFIRSTNAME,
									USERLASTNAME,
									USERCELLPHONENO,
									USERBIRTHDATE,
									USERPASSWORD,
									USERTEMPKEY)
		VALUES (
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#ea#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#fn#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#ln#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#mn#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#bd#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#hash(pw)#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#uuid#">
				)
	</cfquery>
	<cfmail from="leonelllagumbay@gmail.com"
	        to="#ListGetAt(ea,1,',')#"
	        subject="Village sign up confirmation"
	        type="text"
	        >
	        <cfoutput><a href="localhost:8500/form/verify.cfm/?v=#UrlEncodedFormat(Encrypt(uuid, 'D!ginf0'))#">Click to verify...</a></cfoutput>
	</cfmail>
	<cfoutput>A confirmation message was sent to your email.</cfoutput></br>
	<cfoutput>Please verify to continue.</cfoutput>
</cffunction>