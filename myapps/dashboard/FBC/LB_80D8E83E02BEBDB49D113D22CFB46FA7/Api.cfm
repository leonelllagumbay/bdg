
		<!--- Configure API Namespace and Description variable names --->
		<cfset args = StructNew() />
		<cfset args['ns'] = 'Ext.LB_80D8E83E02BEBDB49D113D22CFB46FA7' />
		<cfset args['desc'] = 'APIDesc' />
		<cfinvoke component='Direct' method='getAPIScript' argumentcollection='#args#' returnVariable='apiScript' />
		<cfcontent reset='true' />
		<cfoutput>#apiScript#</cfoutput>

		<cfsetting showdebugoutput='false' />