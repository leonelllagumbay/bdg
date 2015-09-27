
		<!--- Configure API Namespace and Description variable names --->
		<cfset args = StructNew() />
		<cfset args['ns'] = 'Ext.LB_53DBEE0CBC597220C154F82F3569438E' />
		<cfset args['desc'] = 'APIDesc' />
		<cfinvoke component='Direct' method='getAPIScript' argumentcollection='#args#' returnVariable='apiScript' />
		<cfcontent reset='true' />
		<cfoutput>#apiScript#</cfoutput>

		<cfsetting showdebugoutput='false' />