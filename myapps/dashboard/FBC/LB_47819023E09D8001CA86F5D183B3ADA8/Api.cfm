
		<!--- Configure API Namespace and Description variable names --->
		<cfset args = StructNew() />
		<cfset args['ns'] = 'Ext.LB_47819023E09D8001CA86F5D183B3ADA8' />
		<cfset args['desc'] = 'APIDesc' />
		<cfinvoke component='Direct' method='getAPIScript' argumentcollection='#args#' returnVariable='apiScript' />
		<cfcontent reset='true' />
		<cfoutput>#apiScript#</cfoutput>

		<cfsetting showdebugoutput='false' />