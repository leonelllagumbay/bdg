
		<!--- Configure API Namespace and Description variable names --->
		<cfset args = StructNew() />
		<cfset args['ns'] = 'Ext.LB_47DF26239039470AA25CD1E875045718' />
		<cfset args['desc'] = 'APIDesc' />
		<cfinvoke component='Direct' method='getAPIScript' argumentcollection='#args#' returnVariable='apiScript' />
		<cfcontent reset='true' />
		<cfoutput>#apiScript#</cfoutput>

		<cfsetting showdebugoutput='false' />