
		<!--- Configure API Namespace and Description variable names --->
		<cfset args = StructNew() />
		<cfset args['ns'] = 'Ext.LB_47DA4C60E21E2EC6D1E8FC3FE8DABBE1' />
		<cfset args['desc'] = 'APIDesc' />
		<cfinvoke component='Direct' method='getAPIScript' argumentcollection='#args#' returnVariable='apiScript' />
		<cfcontent reset='true' />
		<cfoutput>#apiScript#</cfoutput>

		<cfsetting showdebugoutput='false' />