<!---
  --- Util
  --- ----
  ---
  --- author: LEONELL
  --- date:   5/7/15
  --->
<cfcomponent accessors="true" output="false" persistent="false" name="Email" Displayname="Email">

	<cffunction name="setUpMailAttr" access="public" returntype="struct">
		<cfargument name="ms">
		<cfargument name="mu">
		<cfargument name="mp">
		<cfargument name="mt">
		<cfargument name="mpt">
		<cfargument name="mtls">
		<cfargument name="mssl">
		<cfset acoll = StructNew() />
		<cfif trim(ms ) neq "">
			<cfset mailserver = Decrypt(ms, "mailmng") />
			<cfset acoll["server"] = mailserver />

			<cfset mailusername = Decrypt(mu, "mailmng") />
			<cfset acoll["username"] = mailusername />

			<cfset mailpassword = Decrypt(mp, "mailmng") />
			<cfset acoll["password"] = mailpassword />

			<cfif trim(mt) neq "">
				<cfset acoll["timeout"] = mt />
			</cfif>
			<cfif trim(mpt) neq "">
				<cfset acoll["port"] = mpt />
			</cfif>
			<cfif trim(mtls) neq "">
				<cfset acoll["useTLS"] = mtls />
			</cfif>
			<cfif trim(mssl) neq "">
				<cfset acoll["useSSL"] = mssl />
			</cfif>

		<cfelse>
			<cfset acoll["timeout"] = 200 />
		</cfif>

		<cfreturn acoll />
	</cffunction>

</cfcomponent>